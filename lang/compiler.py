import os
from lang.utils import take_while_in, ALPHA, SIGIL, DIGIT, IDENT
import lang.sound
import lang.draw

#DEBUG = False
DEBUG = True

DEFAULT_SAMPLES_PER_SECOND = 8000

def eat_whitespace(string, i):
    while i < len(string) and string[i] in ' \t\r':
        i += 1
    return i

def initial_value_for(var):
    if var[-1] == '$':
        return ''
    else:
        return 0

def escape_string(string):
    res = ''
    for c in string:
        if c == '\\':
            res += '\\\\'
        elif 32 <= ord(c) <= 127:
            res += c
        else:
            res += '\\x%.2x' % (ord(c),)
    return res

class Token(object):

    def __init__(self, type, val):
        self.type = type
        self.val = val
        self.type_val = type, val

    def __repr__(self):
        return '<token %s %s>' % (self.type, self.val)

    def is_label(self):
        return self.type == 'num' or self.type == 'label'

def normalize_identifier(identifier):
    for i in range(len(identifier)):
        if identifier[i] in SIGIL and i != len(identifier) - 1:
            raise Exception('Malformed identifier: %s' % (identifier,))
    if identifier[-1] == '!':
        identifier = identifier[:-1]
    return identifier.lower()

def has_offending_if(line):
    line = line.strip(' \t\r\n').lower()
    return line.startswith('if ') and \
           'then' in line and \
           not line.endswith('then')

def preprocess(string):
    new_lines = []
    for line in string.split('\n'):
        new_lines.append(line)
        if has_offending_if(line):
            new_lines.append('END IF')
    return '\n'.join(new_lines)

def tokenize(string):
    curline = 1
    i = 0
    keywords = [
        'if', 'then', 'elseif', 'else', 'end',
        'sub', 'function', 'do', 'loop', 'while',
        'until', 'wend', 'exit', 'call',
    ]
    while i < len(string):
        i = eat_whitespace(string, i)

        if string[i] in '\n':
            yield Token('EOL', 'EOL')
            i += 1
            curline += 1
            continue

        if string[i] == "'":
            # eat comments
            while i < len(string) and string[i] != '\n':
                i += 1
        elif string[i] in ALPHA:
            i, identifier = take_while_in(string, i, IDENT)
            identifier = normalize_identifier(identifier)
            if identifier == 'rem':
                # eat comments
                while i < len(string) and string[i] != '\n':
                    i += 1
            elif identifier in ['mod', 'not', 'and', 'or', 'xor', 'eqv', 'imp']:
                yield Token(identifier, identifier)
            elif identifier[-1] == ':':
                if identifier[:-1] in keywords:
                    yield Token('id', identifier[:-1])
                    yield Token('EOL', 'EOL')
                else:
                    yield Token('label', identifier)
            else:
                yield Token('id', identifier)
        elif string[i] == '"':
            i += 1
            took = ''
            while i < len(string) and string[i] != '"':
                took += string[i]
                i += 1
            i += 1
            yield Token('string', took)
        elif string[i] in DIGIT + '.':
            i, number = take_while_in(string, i, DIGIT + '.')
            yield Token('num', number)
        elif string[i] == ':':
            yield Token('EOL', 'EOL')
            i += 1
        else:
            kws = ['>=', '<=', '<>', '<', '>', '=',
                   '(', ')', '+', '-', '*', '/', '\\', '^', ',', ';', ':', '#']
            for kw in kws:
                if string[i:i + len(kw)] == kw:
                    yield Token(kw, kw)
                    i += len(kw)
                    break
            else:
                raise Exception('Unrecognized token: %s' % (string[i:i+10],))
                break
    yield Token('EOF', 'EOF')

def fix_token_stream(stream):
    pre_label_tokens = [
        ('EOL', 'EOL'),
        ('id', 'gosub'),
        ('id', 'goto'),
    ]
    previous = Token('EOL', 'EOL') 
    for tok in stream:
        if tok.type == 'label' and previous.type_val not in pre_label_tokens:
            yield Token('id', tok.val[:-1])
            yield Token('EOL', 'EOL')
            previous = Token('EOL', 'EOL')
        else:
            yield tok 
            previous = tok

def is_terminator(tok):
    return tok.type == 'EOL' or tok.type_val == ('id', 'else')

class TokenStream(object):

    def __init__(self, string):
        self._tokens = fix_token_stream(tokenize(preprocess(string)))
        self._current = None

    def peek(self):
        if self._current is None:
            self._current = self._tokens.next()
        return self._current

    def next(self):
        if self._current is None:
            tok = self._tokens.next()
        else:
            tok = self._current
            self._current = None
        print tok
        return tok

    def __repr__(self):
        return 'near %s' % (self.peek(),)

class CodeGenerator(object):

    def __init__(self):
        self._code = []

        self._routines = {}
        self._routines['sub'] = {}
        self._routines['function'] = {}
        self._shared = set()

        self._last_label = 0
        self._labels = {}

        self._used_screens = set([0])

        self._var_names = {}
        self._last_var = 0

        self._soundgen = lang.sound.SoundGenerator(DEFAULT_SAMPLES_PER_SECOND)

    def declare_routine(self, kind, name, params):
        self._routines[kind][name] = params

    def declare_shared(self, var):
        self._shared.add(var)

    def exists_function(self, func_name):
        return func_name in self._routines['function']

    def make_label(self):
        self._last_label += 1
        last = self._last_label
        self._labels[last] = None
        return last

    def mangle(self, var):
        if DEBUG:
            return '"%s"' % (var,)
        else:
            if var in self._var_names:
                return self._var_names[var]
            else:
                self._last_var += 1
                self._var_names[var] = self._last_var
                return self._last_var

    def set_label_at_current_position(self, label):
        if label not in self._labels:
            raise Exception('Undeclared label "L%s".' % (label,))
        if self._labels[label] is not None:
            raise Exception('Label "L%s" was already previously set.' % (label,))
        self._labels[label] = len(self._code)

    def produce_op(self, op):
        if DEBUG:
            lineno = ' /* :%u */' % (len(self._code),)
        else:
            lineno = ''
        self._code.append(op + lineno)

    def call_primitive_statement(self, stmt, nargs=0):
        self.produce_op("new OpCallPrimitiveStatement('%s', %u)" % (stmt.upper(), nargs))

    def call_primitive_function(self, func, nargs=0):
        self.produce_op("new OpCallPrimitiveFunction('%s', %u)" % (func.upper().replace('\\', '\\\\'), nargs))

    def jump(self, label):
        self.produce_op("new OpJump(L%u)" % (label,))

    def jump_if_false(self, label):
        self.produce_op("new OpJumpIfFalse(L%u)" % (label,))

    def jump_gosub(self, label):
        self.produce_op("new OpGosub(L%u)" % (label,))

    def jump_return(self):
        self.produce_op("new OpReturn()")

    def push_constant(self, value):
        if isinstance(value, str):
            self.produce_op("new OpPushConstant(\"%s\")" % (escape_string(value),))
        else:
            self.produce_op("new OpPushConstant(%s)" % (value,))

    def push_label(self, label):
        self.produce_op("new OpPushConstant(L%u)" % (label,))

    def push_sound_constant(self, sound_id):
        self.produce_op("new OpPushConstant(SND_%u)" % (sound_id,))

    def push_draw_command(self, cmds):
        self.produce_op("new OpPushConstant([%s])" % (
            ', '.join([
                '["%s", %s]' % (cmd_args[0], ', '.join(map(str, cmd_args[1:])))
                for cmd_args in cmds
            ]),)
        )

    def set_array_ref(self, var):
        self.produce_op("new OpSetArrayRef(%s)" % (self.mangle(var),))

    def set_ref(self, var):
        self.produce_op("new OpSetRef(%s)" % (self.mangle(var),))

    def get_ref(self, var):
        self.produce_op("new OpGetRef(%s)" % (self.mangle(var),))

    def get_array_ref(self, var, nargs):
        self.produce_op("new OpGetArrayRef(%s, %u)" % (self.mangle(var), nargs))

    def mid_assign(self, var, right_index):
        self.produce_op("new OpMidAssign(%s, %s)" % (self.mangle(var), 'true' if right_index else 'false'))

    def mid_array_assign(self, var, right_index):
        self.produce_op("new OpMidArrayAssign(%s, %s)" % (self.mangle(var), 'true' if right_index else 'false'))

    def enter_routine(self, params):
        self.produce_op("new OpEnter([%s])" % (','.join([str(self.mangle(param)) for param in params]),))

    def leave_routine(self):
        self.produce_op("new OpLeave()")

    def push_retval(self, function_name):
        # note: we consider the function_name as a variable
        self.produce_op("new OpPushRetval(%s)" % (self.mangle(function_name),))

    def for_start(self, index):
        self.produce_op("new OpForStart(%s, %s, %s)" % (
                self.mangle(index),
                self.mangle(index + ':upper'),
                self.mangle(index + ':step'),
            )
        )

    def for_check(self, index, address):
        self.produce_op("new OpForCheck(%s, %s, %s, L%s)" % (
                self.mangle(index),
                self.mangle(index + ':upper'),
                self.mangle(index + ':step'),
                address
            )
        )

    def for_next(self, index, address):
        self.produce_op("new OpForNext(%s, %s, L%s)" % (
                self.mangle(index),
                self.mangle(index + ':step'),
                address
            )
        )

    def stack_dup(self):
        self.call_primitive_statement('_stack_dup')

    def stack_pop(self):
        self.call_primitive_statement('_stack_pop')

    def use_screen(self, screen_number):
        self._used_screens.add(screen_number)
        self.push_constant(screen_number)
        self.call_primitive_statement('_screen', 1)

    def play_sound(self, dur_s, freq_hz):
        sound_id = self._soundgen.compile_sound((.2, 2000))
        self.push_sound_constant(sound_id)
        self.call_primitive_statement('_PLAY_SOUND', 1)

    def play_melody(self, melody):
        sound_id = self._soundgen.compile_sound(melody)
        self.push_sound_constant(sound_id)
        self.call_primitive_statement('_PLAY_SOUND', 1)

    def write_output(self, out_fn, original_names={}):
        f = open('lang/template.html', 'r')
        template = f.read()
        f.close()
        
        label_decls = []
        for label_name, target in self._labels.items():
            orig = original_names.get(label_name, '<internal label>')
            if target is None:
                raise Exception('label "L%u" ("%s") has no target' % (label_name, orig))
            if DEBUG and orig != '<internal label>':
                detail = ' /* %s */' % (orig,)
            else:
                detail = ''
            label_decls.append('var L%u = %u;%s' % (label_name, target, detail))

        shared = 'var shared = {' + ','.join(['%s: 1' % (self.mangle(var),) for var in self._shared]) + '};'
        labels = '\n'.join([2 * '\t' + decl for decl in label_decls])
        opcodes = ',\n'.join([3 * '\t' + op for op in self._code])

        contents = template

        screens = '\n'.join([
            "\t<script type='text/javascript' src='../runtime/fonts/screen%u.js'></script>" % (screen,)
            for screen in self._used_screens
        ])

        available_screens = '[\n' + \
            ',\n'.join([
                "\t\t\t{'number': %u, 'data': SCREEN%u_DATA}" % (screen, screen)
                for screen in self._used_screens
            ]) + \
            '\n\t\t]'

        sounds = '\n'.join([
            '\t\tvar SND_%u = %s;' % (sound_id, definition)
            for (sound_id, definition) in self._soundgen.sounds()
        ])

        contents = contents.replace('/*$SCREENS*/', '\n' + screens)
        contents = contents.replace('/*$AVAILABLE_SCREENS*/', available_screens)
        contents = contents.replace('/*$SHARED*/', shared)
        contents = contents.replace('/*$LABELS*/', '\n' + labels)
        contents = contents.replace('/*$SOUNDS*/', '\n' + sounds)
        contents = contents.replace('/*$OPCODES*/', '\n' + opcodes + '\n\t\t')

        f = open(out_fn, 'w')
        f.write(contents)
        f.close()

class Block(object):

    def __init__(self, kind, labels):
        self.kind = kind
        self.labels = labels

    def __repr__(self):
        return self.kind

class Parser(object):

    def __init__(self):
        self._codegen = CodeGenerator()
        self._operators = [
            ('binary', ['imp']),
            ('binary', ['eqv']),
            ('binary', ['xor']),
            ('binary', ['or']),
            ('binary', ['and']),
            ('unary', ['not']),
            ('binary', ['=', '>', '<', '<>', '<=', '>=']),
            ('binary', ['+', '-']),
            ('binary', ['mod']),
            ('binary', ['\\']),
            ('binary', ['*', '/']),
            ('unary', ['-']),
            ('binary', ['^']),
        ]
        self._builtin_subs = [
            'cls',
            'color',
            'draw',
            'locate',
            'randomize',
            'screen',
            'sleep',
            'sound',
            'system',
        ]
        self._builtin_functions = [
            'abs',
            'asc',
            'chr$',
            'date$',
            'inkey$',
            'int',
            'lcase$',
            'len',
            'left$',
            'ltrim$',
            'mid$',
            'right$',
            'rnd',
            'rtrim$',
            'screen',
            'space$',
            'str$',
            'string$',
            'time$',
            'timer',
            'ucase$',
            'val',
        ]
        self._label_names = {}
        self._original_label_names = {}
        self._current_routine = '_main'
        self._blocks = []

        self._current_module = None
        self._already_parsed_modules = set([])
        self._pending_modules = set([])

    def peek(self):
        return self._stream.peek()

    def next(self):
        return self._stream.next()

    def label_for(self, name, module=None):
        if module is None:
            module = self._current_module
        full_name = module + ':' + name
        if full_name in self._label_names:
            return self._label_names[full_name]
        else:
            label = self._codegen.make_label()
            self._label_names[full_name] = label
            self._original_label_names[label] = full_name
            return label

    def make_unique_label(self, detail):
        label = self._codegen.make_label()
        self._original_label_names[label] = detail
        return label

    def label_for_routine(self, rtn_name, section):
        return self.label_for(rtn_name + ':' + section) 

    def parse_token_of_type(self, type):
        tok = self.next()
        if tok.type != type:
            raise Exception('Expected %s but got: %s' % (type, tok,)) 
        return tok

    def parse_identifier(self):
        return self.parse_token_of_type('id')

    def parse_string(self):
        return self.parse_token_of_type('string').val

    def parse_number(self):
        tok = self.parse_token_of_type('num')
        if '.' in tok.val:
            value = float(tok.val)
        else:
            value = int(tok.val)
        return value

    def parse_any_keyword(self, kws):
        tok = self.parse_token_of_type('id')
        if tok.val not in kws:
            raise Exception('Expected keyword %s but got: %s' % ('/'.join(kws), tok,))
        return tok

    def parse_keyword(self, kw):
        return self.parse_any_keyword([kw])

    def parse_symbol(self, symbol):
        tok = self.next()
        if tok.type_val != (symbol, symbol):
            raise Exception('Expected symbol %s but got: %s' % (symbol, tok,))
        return tok

    def parse_eol(self):
        if self.peek().type_val == ('EOL', 'EOL'):
            self.parse_token_of_type('EOL')

    def parse_nonempty_identifier_list(self):
        # id [, id]*
        lst = []
        lst.append(self.parse_identifier().val)
        while self.peek().type == ',':
            self.next()
            lst.append(self.parse_identifier().val)
        return lst

    def parse_parameter_declaration(self):
        # <EOL>
        # ( ) <EOL>
        # ( id [, id]* ) <EOL>
        if self.peek().type == 'EOL':
            #self.parse_eol()
            return []
        elif self.peek().type == '(':

            self.next() 
            if self.peek().type == ')':
                self.next()
                #self.parse_eol()
                return []

            params = self.parse_nonempty_identifier_list()
            self.parse_token_of_type(')')
            #self.parse_eol()
            return params
        else:
            raise Exception('Invalid parameter declaration: %s' % (self._stream,))

    def parse_variable_declaration(self, shared=False):
        # id {|(expr1)|(expr1 TO expr2)}
        var = self.parse_identifier().val
        if shared:
            self._codegen.declare_shared(var)

        initial_value = initial_value_for(var)

        if self.peek().type == '(':
            self.parse_symbol('(')
            self._codegen.push_constant(initial_value)
            self.parse_expression()
            if self.peek().type_val == ('id', 'to'):
                self.parse_keyword('to')
                self.parse_expression()
                self._codegen.call_primitive_function('_mkarray', 3)
            else:
                self._codegen.call_primitive_function('_mkarray', 2)
            self._codegen.set_ref(var)
            self.parse_symbol(')')
        else:
            self._codegen.push_constant(initial_value)
            self._codegen.set_ref(var)

    def parse_variable_declaration_list(self, shared=False):
        # variable_declaration [, variable_declaration]*
        self.parse_variable_declaration(shared)
        while self.peek().type == ',':
            self.next()
            self.parse_variable_declaration(shared)

    def parse_routine_declaration(self):
        self.parse_keyword('declare')
        routine = self.next()
        if routine.type_val not in [('id', 'sub'), ('id', 'function')]:
            raise Exception('DECLARE should be followed by FUNCTION/SUB.')

        identifier = self.parse_identifier()
        params = self.parse_parameter_declaration()
        self._codegen.declare_routine(routine.val, identifier.val, params)

    def parse_dim_declaration(self):
        self.parse_any_keyword(['dim', 'common'])
        if self.peek().type_val == ('id', 'shared'):
            self.next()
            shared = True
        else:
            shared = False
        self.parse_variable_declaration_list(shared)
        #self.parse_eol()

    def parse_atomic_expression(self):
        if self.peek().type == 'string':
            self._codegen.push_constant(self.parse_string())
        elif self.peek().type == 'id':
            var = self.next().val
            subindex = False
            nargs = 0
            if self.peek().type == '(':
                # an array or a function
                subindex = True
                self.next()
                nargs = 1
                self.parse_expression()
                while self.peek().type == ',':
                    self.next()
                    self.parse_expression()
                    nargs += 1
                if self.next().type != ')':
                    raise Exception('Expected ")".')
            if var in self._builtin_functions:
                self._codegen.call_primitive_function(var, nargs)
            elif self._codegen.exists_function(var):
                self.call(var, nargs)
            elif not subindex:
                self._codegen.get_ref(var)
            else:
                self._codegen.get_array_ref(var, nargs)
        elif self.peek().type == '(':
            self.next()
            self.parse_expression()
            if self.next().type != ')':
                raise Exception('Expected closing paren.')
        else:
            self._codegen.push_constant(self.parse_number())

    def parse_expression(self, level=0):
        if level == len(self._operators):
            self.parse_atomic_expression()
        else:
            fixity, ops = self._operators[level]
            if fixity == 'unary':
                self.parse_expression_unary_op(ops, level)
            else:
                self.parse_expression_binary_op(ops, level)

    def parse_expression_binary_op(self, ops, level):
        self.parse_expression(level=level + 1)
        while self.peek().type in ops:
            opr = self.next().type
            self.parse_expression(level=level + 1)
            self._codegen.call_primitive_function(opr, 2)

    def parse_expression_unary_op(self, ops, level):
        if self.peek().type in ops:
            opr = self.next().type
            self.parse_expression(level=level + 1)
            self._codegen.call_primitive_function(opr, 1)
        else:
            self.parse_expression(level=level + 1)

    def parse_print(self):
        self.parse_keyword('print')
        if is_terminator(self.peek()):
            self._codegen.push_constant('')
            self._codegen.call_primitive_statement('print', 1)
        else:
            while True:
                self.parse_expression()
                if is_terminator(self.peek()):
                    self._codegen.call_primitive_statement('print', 1)
                    break
                else:
                    if self.peek().type not in ',;':
                        raise Exception('PRINT expects "," or ";" separator')
                    sep = self.next().type
                    self._codegen.call_primitive_statement('print' + sep, 1)
                    if is_terminator(self.peek()):
                        break

    def parse_label(self):
        tok = self.next()
        if not tok.is_label() and tok.type != 'id':
            raise Exception('Expected a label name')
        if tok.type == 'id':
            return tok.val + ':'
        else:
            return tok.val

    def parse_goto(self):
        self.parse_keyword('goto')
        name = self.parse_label()
        self._codegen.jump(self.label_for(name))
        #self.parse_eol()

    def parse_gosub(self):
        self.parse_keyword('gosub')
        name = self.parse_label()
        self._codegen.jump_gosub(self.label_for(name))
        #self.parse_eol()

    def parse_return(self):
        self.parse_keyword('return')
        self._codegen.jump_return()
        #self.parse_eol()

    def parse_end(self):
        self.parse_keyword('end')
        if self.peek().type_val in [('id', 'sub'), ('id', 'function')]:
            if self._current_routine == '_main':
                raise Exception('END SUB/FUNCTION outside a SUB/FUNCTION declaration.')
            kind = self.next().val
            #self.parse_eol()
            self._codegen.set_label_at_current_position(self.label_for_routine(self._current_routine, 'exit'))
            if kind == 'function':
                self._codegen.push_retval(self._current_routine)
            self._codegen.leave_routine()
            self._codegen.jump_return()
            self._codegen.set_label_at_current_position(self.label_for_routine(self._current_routine, 'end'))
            self._current_routine = '_main'
        elif self.peek().type_val in [('id', 'if')]:
            self.parse_keyword('if')
            self.produce_end_if()
            #self.parse_eol()
        elif self.peek().type_val in [('id', 'select')]:
            self.parse_keyword('select')
            self.produce_end_select()
        else:
            #self.parse_eol()
            self._codegen.call_primitive_statement('system')

    def parse_maybe_label(self):
        if self.peek().is_label():
            label_name = self.parse_label()
            self._codegen.set_label_at_current_position(self.label_for(label_name))

    def call(self, name, nargs):
        if name in self._builtin_subs:
            self._codegen.call_primitive_statement(name, nargs)
        else:
            self._codegen.jump_gosub(self.label_for_routine(name, 'start'))

    def parse_maybe_mid_lvalue(self):
        if self.peek().type_val != ('id', 'mid$'):
            return False

        is_array = False
        self.parse_keyword('mid$')
        self.parse_symbol('(')

        var = self.parse_identifier().val
        if self.peek().type == '(':
            self.parse_symbol('(')
            self.parse_expression()
            self.parse_symbol(')')
            is_array = True

        self.parse_symbol(',')
        self.parse_expression()
        right_index = False
        if self.peek().type == ',':
            self.parse_symbol(',')
            self.parse_expression()
            right_index = True

        self.parse_symbol(')')
        self.parse_symbol('=')
        self.parse_expression()

        if is_array:
            self._codegen.mid_array_assign(var, right_index)
        else:
            self._codegen.mid_assign(var, right_index)
        return True

    def parse_assignment_or_call(self):

        if self.peek().type_val == ('id', 'let'):
            self.next()

        if self.parse_maybe_mid_lvalue():
            return

        identifier = self.parse_identifier().val

        if is_terminator(self.peek()):
            self.call(identifier, 0)
            return

        if self.peek().type == '=':
            # simple assignment
            self.next()
            self.parse_expression()
            #self.parse_eol()
            self._codegen.set_ref(identifier)
            return

        nargs = 1

        array = False
        if self.peek().type == '(':
            array = True
            self.next()
            self.parse_expression()
            if self.next().type != ')':
                raise Exception('Expected ")".')
        else:
            self.parse_expression()

        if self.peek().type == '=':
            # array assignment
            if array == False:
                raise Exception('Malformed assignment.')
            self.next()
            self.parse_expression()
            #self.parse_eol()
            self._codegen.set_array_ref(identifier)
            return

        while not is_terminator(self.peek()):
            if self.next().type != ',':
                raise Exception('Malformed sub call')
            self.parse_expression()
            nargs += 1

        #self.parse_eol()
        self.call(identifier, nargs)

    def parse_call(self):
        self.parse_keyword('call')
        name = self.parse_identifier().val
        if is_terminator(self.peek()):
            self.call(name, 0)
            return
        nargs = 1
        self.parse_expression()
        while self.peek().type == ',':
            self.next()
            self.parse_expression()
            nargs += 1
        #self.parse_eol()
        self.call(name, nargs)

    def parse_routine_definition(self):
        kind = self.parse_any_keyword(['sub', 'function']).val
        name = self.parse_identifier().val
        params = self.parse_parameter_declaration()
        self._codegen.declare_routine(kind, name, params)
        if len(self._blocks) > 0:
            raise Exception('Cannot define a routine in the middle of a block. Stack of blocks: %s' % (self._blocks,))
        if self._current_routine != '_main':
            raise Exception('Cannot define nested routines')
        self._current_routine = name
        self._codegen.jump(self.label_for_routine(name, 'end')) # skip it
        self._codegen.set_label_at_current_position(self.label_for_routine(name, 'start'))
        self._codegen.enter_routine(params)

    def parse_if(self):
        self.parse_keyword('if')
        self.parse_expression()
        if self.peek().type_val == ('id', 'then'):
            self.parse_keyword('then')
            block = Block('if', {})
            block.current_branch = 0
            block.labels[block.current_branch + 1] = self.make_unique_label('$IF:%u' % (block.current_branch + 1,))
            block.labels['end'] = self.make_unique_label('$IF:END')
            self._blocks.append(block)
            self._codegen.jump_if_false(block.labels[block.current_branch + 1])
            if self.peek().type == 'num':
                label_name = self.parse_label()
                self._codegen.jump(self.label_for(label_name))
        else:
            label_end = self.make_unique_label('$IF:END')
            self._codegen.jump_if_false(label_end)
            self.parse_statement()
            self._codegen.set_label_at_current_position(label_end)

    def parse_elseif(self):
        self.parse_keyword('elseif')
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'if':
            raise Exception('ELSEIF without IF')
        block = self._blocks[-1]
        block.current_branch += 1
        block.labels[block.current_branch + 1] = self.make_unique_label('$IF:%u' % (block.current_branch + 1,))
        self._codegen.jump(block.labels['end'])
        self._codegen.set_label_at_current_position(block.labels[block.current_branch])
        self.parse_expression()
        self.parse_keyword('then')
        self._codegen.jump_if_false(block.labels[block.current_branch + 1])
        if self.peek().type == 'num':
            label_name = self.parse_label()
            self._codegen.jump(self.label_for(label_name))

    def parse_else(self):
        self.parse_keyword('else')
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'if':
            raise Exception('ELSE without IF')
        block = self._blocks[-1]
        block.current_branch += 1
        block.labels[block.current_branch + 1] = self.make_unique_label('$IF:%u' % (block.current_branch + 1,))
        self._codegen.jump(block.labels['end'])
        self._codegen.set_label_at_current_position(block.labels[block.current_branch])
        if self.peek().type == 'num':
            label_name = self.parse_label()
            self._codegen.jump(self.label_for(label_name))

    def produce_end_if(self):
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'if':
            raise Exception('END IF without IF')
        block = self._blocks.pop()
        block.current_branch += 1
        self._codegen.set_label_at_current_position(block.labels[block.current_branch])
        self._codegen.set_label_at_current_position(block.labels['end'])

    def parse_do(self): 
        self.parse_keyword('do')

        block = Block('do', {})
        block.labels['start'] = self._codegen.make_label()
        block.labels['end'] = self._codegen.make_label()
        self._blocks.append(block)

        self._codegen.set_label_at_current_position(block.labels['start'])

        block.already_has_condition = False
        if self.peek().type_val in [('id', 'while'), ('id', 'until')]:
            while_until = self.next().val
            self.parse_expression()
            if while_until == 'until':
                self._codegen.call_primitive_function('not', 1)
            self._codegen.jump_if_false(block.labels['end'])
            block.already_has_condition = True

    def parse_loop(self): 
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'do':
            raise Exception('LOOP without DO')
        self.parse_keyword('loop')
        block = self._blocks.pop()

        if self.peek().type_val in [('id', 'while'), ('id', 'until')]:
            if block.already_has_condition:
                raise Exception('DO/LOOP can only have one condition.')
            while_until = self.next().val
            self.parse_expression()
            if while_until == 'while':
                self._codegen.call_primitive_function('not', 1)
            self._codegen.jump_if_false(block.labels['start'])
            self._codegen.set_label_at_current_position(block.labels['end'])
        else:
            self._codegen.jump(block.labels['start'])
            self._codegen.set_label_at_current_position(block.labels['end'])

    def parse_while(self): 
        self.parse_keyword('while')
        block = Block('while', {})
        block.labels['start'] = self._codegen.make_label()
        block.labels['end'] = self._codegen.make_label()
        self._blocks.append(block)
        self._codegen.set_label_at_current_position(block.labels['start'])
        self.parse_expression()
        self._codegen.jump_if_false(block.labels['end'])

    def parse_wend(self): 
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'while':
            raise Exception('WEND without WHILE')
        self.parse_keyword('wend')
        block = self._blocks.pop()
        self._codegen.jump(block.labels['start'])
        self._codegen.set_label_at_current_position(block.labels['end'])

    def parse_for(self):
        self.parse_keyword('for')
        index = self.parse_identifier().val
        if self.next().type != '=':
            raise Exception('FOR expected "=".')
        self.parse_expression() # from
        self.parse_keyword('to')
        self.parse_expression() # to
        if self.peek().type_val == ('id', 'step'):
            self.parse_keyword('step')
            self.parse_expression()
        else:
            self._codegen.push_constant(1)
        block = Block('for', {})
        block.labels['start'] = self._codegen.make_label()
        block.labels['end'] = self._codegen.make_label()
        block.index = index
        self._blocks.append(block)
        self._codegen.for_start(index)
        self._codegen.set_label_at_current_position(block.labels['start'])
        self._codegen.for_check(index, block.labels['end'])

    def parse_next(self):
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'for':
            raise Exception('NEXT without FOR. Stack of blocks: %s' % (self._blocks,))
        self.parse_keyword('next')
        index = self.parse_identifier().val
        block = self._blocks.pop()
        if block.index != index:
            raise Exception('Wrong index in NEXT statement.')
        self._codegen.for_next(index, block.labels['start'])
        self._codegen.set_label_at_current_position(block.labels['end'])

    def parse_select(self):
        self.parse_keyword('select')
        self.parse_keyword('case')
        self.parse_expression()

        block = Block('select', {})
        block.labels['end'] = self._codegen.make_label()
        block.current_branch = 0
        block.labels[block.current_branch + 1] = self._codegen.make_label()
        self._blocks.append(block)

    def parse_case(self):
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'select':
            raise Exception('CASE without SELECT CASE')

        self.parse_keyword('case')

        condition = '='
        if self.peek().type_val == ('id', 'else'):
            self.parse_keyword('else')
            condition = None
        elif self.peek().type_val == ('id', 'is'):
            self.parse_keyword('is')
            condition = self.next().type
            if condition not in ['=', '<', '>', '<>', '<=', '>=']:
                raise Exception('Unsupported condition in SELECT CASE: "%s".' % (condition,))

        block = self._blocks[-1]

        if block.current_branch > 0: 
            self._codegen.jump(block.labels['end'])

        block.current_branch += 1
        block.labels[block.current_branch + 1] = self._codegen.make_label()
        self._codegen.set_label_at_current_position(block.labels[block.current_branch])
        if condition is not None:
            self._codegen.stack_dup()
            self.parse_expression()
            self._codegen.call_primitive_function(condition, 2)
            self._codegen.jump_if_false(block.labels[block.current_branch + 1])

    def produce_end_select(self):
        if len(self._blocks) == 0 or self._blocks[-1].kind != 'select':
            raise Exception('END SELECT without SELECT CASE')
        block = self._blocks.pop()
        block.current_branch += 1
        self._codegen.set_label_at_current_position(block.labels[block.current_branch])
        self._codegen.set_label_at_current_position(block.labels['end'])
        self._codegen.stack_pop()

    def parse_exit(self):
        self.parse_keyword('exit')
        if self.peek().type_val in [('id', 'do'), ('id', 'for')]:
            what = self.next().val
            exit_from = None
            for block in reversed(self._blocks):
                if block.kind == what:
                    exit_from = block
                    break
            if exit_from is None:
                raise Exception('There is no %s to exit from.' % (what.upper(),))
            self._codegen.jump(exit_from.labels['end'])
        elif self.peek().type_val in [('id', 'function'), ('id', 'sub')]:
            what = self.next().val
            if self._current_routine == '_main':
                raise Exception('There is no %s to exit from.' % (what.upper(),))
            self._codegen.jump(self.label_for_routine(self._current_routine, 'exit'))
        else:
            raise Exception('EXIT expected DO/FOR/FUNCTION/SUB.')

    def parse_open(self):
        self.parse_keyword('open')
        self.parse_expression()
        self.parse_keyword('for')
        self.parse_any_keyword(['input', 'output', 'append', 'random'])
        self.parse_keyword('as')
        self.parse_symbol('#')
        self.parse_expression()
        raise Exception('OPEN file not implemented.')

    def parse_input(self):
        self.parse_keyword('input')
        sep = ';'
        if self.peek().type in ['string']:
            self.parse_expression()
            self._codegen.call_primitive_statement('PRINT;', 1)
            sep = self.next().type
            if sep not in [',', ';']:
                raise Exception('INPUT expected , or ;')
        if sep == ';':
            self._codegen.push_constant('? ')
            self._codegen.call_primitive_statement('PRINT;', 1)
        var = self.parse_identifier().val
        self._codegen.call_primitive_statement('_INPUT')
        if var[-1] != '$':
            self._codegen.call_primitive_function('VAL', 1)
        self._codegen.set_ref(var)
        # TODO: if var is an lvalue but not a variable

    def parse_screen(self):
        self.parse_keyword('screen')
        num = self.parse_number()
        if num not in [0, 1, 2, 7, 8, 9, 10, 11, 12, 13]:
            raise Exception('Unsupported SCREEN.')
        self._codegen.use_screen(num)

    def parse_run(self):
        self.parse_keyword('run')
        fn = self.parse_string()
        self._codegen.call_primitive_function('_RESET')
        self._codegen.jump(self.label_for('_main', module=fn))
        if fn not in self._already_parsed_modules:
            self._pending_modules.add(fn)

    def parse_on(self):
        self.parse_keyword('on')
        if self.peek().type_val == ('id', 'timer'):
            self.parse_keyword('timer')
            self.parse_symbol('(')
            self.parse_expression()
            self.parse_symbol(')')

            if self.peek().type_val == ('id', 'gosub'):
                gosub = True
                self.parse_keyword('gosub')
            elif self.peek().type_val == ('id', 'goto'):
                gosub = False
                self.parse_keyword('goto')
            else:
                raise Exception('Expected GOTO or GOSUB')
            label = self.parse_label()
            self._codegen.push_label(self.label_for(label))
            if gosub:
                self._codegen.call_primitive_statement('_ON_TIMER_GOSUB', 2)
            else:
                self._codegen.call_primitive_statement('_ON_TIMER_GOTO', 2)
        else:
            raise Exception('Unsupported ON handler "%s".' % (self.peek(),))

    def parse_timer(self):
        self.parse_keyword('timer')
        if self.peek().type_val == ('id', 'on'):
            self.parse_keyword('on')
            self._codegen.call_primitive_statement('_TIMER_ON')
        else:
            self.parse_keyword('off')
            self._codegen.call_primitive_statement('_TIMER_OFF')

    def parse_line(self):
        self.parse_keyword('line')
        self.parse_symbol('(')
        self.parse_expression()
        self.parse_symbol(',')
        self.parse_expression()
        self.parse_symbol(')')
        self.parse_symbol('-')
        self.parse_symbol('(')
        self.parse_expression()
        self.parse_symbol(',')
        self.parse_expression()
        self.parse_symbol(')')
        nargs = 4
        if self.peek().type == ',':
            self.parse_symbol(',')
            self.parse_expression()
            nargs += 1
            if self.peek().type == ',':
                self.parse_symbol(',')
                option = self.parse_any_keyword(['b', 'bf']).val
                self._codegen.push_constant(option.upper())
                nargs += 1
        self._codegen.call_primitive_statement('line', nargs)

    def parse_circle(self): 
        self.parse_keyword('circle')
        self.parse_symbol('(')
        self.parse_expression()
        self.parse_symbol(',')
        self.parse_expression()
        self.parse_symbol(')')
        self.parse_symbol(',')
        self.parse_expression()
        nargs = 3
        for i in range(4):
            if self.peek().type == ',':
                self.parse_symbol(',')
                self.parse_expression()
                nargs += 1
        self._codegen.call_primitive_statement('circle', nargs)

    def parse_beep(self): 
        self.parse_keyword('beep')
        self._codegen.play_sound(.1, 2000)

    def parse_play(self): 
        self.parse_keyword('play')
        melody = self.parse_string()
        self._codegen.play_melody(melody)

    def parse_preset(self): 
        self.parse_keyword('preset')
        self.parse_symbol('(')
        self.parse_expression()
        self.parse_symbol(',')
        self.parse_expression()
        self.parse_symbol(')')
        nargs = 2
        if self.peek().type == ',':
            self.parse_symbol(',')
            self.parse_expression()
            nargs += 1
        self._codegen.call_primitive_statement('preset', nargs)

    def parse_paint(self): 
        self.parse_keyword('paint')
        self.parse_symbol('(')
        self.parse_expression()
        self.parse_symbol(',')
        self.parse_expression()
        self.parse_symbol(')')
        nargs = 2
        while self.peek().type == ',':
            self.parse_symbol(',')
            self.parse_expression()
            nargs += 1
        self._codegen.call_primitive_statement('paint', nargs)

    def parse_draw(self): 
        self.parse_keyword('draw')
        string = self.parse_string()
        self._codegen.push_draw_command(lang.draw.parse_draw_commands(string))
        self._codegen.call_primitive_statement('_draw', 1)

    def parse_statement(self):
        self.parse_maybe_label()
        if self.peek().type_val == ('id', 'declare'):
            self.parse_routine_declaration()
        elif self.peek().type_val in [('id', 'common'), ('id', 'dim')]:
            self.parse_dim_declaration()
        elif self.peek().type_val == ('id', 'print'):
            self.parse_print()
        elif self.peek().type_val == ('id', 'goto'):
            self.parse_goto()
        elif self.peek().type_val == ('id', 'gosub'):
            self.parse_gosub()
        elif self.peek().type_val == ('id', 'return'):
            self.parse_return()
        elif self.peek().type_val == ('id', 'end'):
            self.parse_end()
        elif self.peek().type_val in [('id', 'sub'), ('id', 'function')]:
            self.parse_routine_definition()
        elif self.peek().type_val == ('id', 'call'):
            self.parse_call()
        elif self.peek().type_val == ('id', 'if'):
            self.parse_if()
        elif self.peek().type_val == ('id', 'elseif'):
            self.parse_elseif()
        elif self.peek().type_val == ('id', 'else'):
            self.parse_else()
        elif self.peek().type_val == ('id', 'exit'):
            self.parse_exit()
        elif self.peek().type_val == ('id', 'do'):
            self.parse_do()
        elif self.peek().type_val == ('id', 'loop'):
            self.parse_loop()
        elif self.peek().type_val == ('id', 'while'):
            self.parse_while()
        elif self.peek().type_val == ('id', 'wend'):
            self.parse_wend()
        elif self.peek().type_val == ('id', 'for'):
            self.parse_for()
        elif self.peek().type_val == ('id', 'next'):
            self.parse_next()
        elif self.peek().type_val == ('id', 'select'):
            self.parse_select()
        elif self.peek().type_val == ('id', 'case'):
            self.parse_case()
        elif self.peek().type_val == ('id', 'open'):
            self.parse_open()
        elif self.peek().type_val == ('id', 'input'):
            self.parse_input() # TODO
        elif self.peek().type_val == ('id', 'screen'):
            self.parse_screen()
        elif self.peek().type_val == ('id', 'run'):
            self.parse_run()
        elif self.peek().type_val == ('id', 'on'):
            self.parse_on()
        elif self.peek().type_val == ('id', 'timer'):
            self.parse_timer()
        elif self.peek().type_val == ('id', 'line'):
            self.parse_line()
        elif self.peek().type_val == ('id', 'circle'):
            self.parse_circle()
        elif self.peek().type_val == ('id', 'beep'):
            self.parse_beep()
        elif self.peek().type_val == ('id', 'play'):
            self.parse_play()
        elif self.peek().type_val == ('id', 'preset'):
            self.parse_preset()
        elif self.peek().type_val == ('id', 'paint'):
            self.parse_paint()
        elif self.peek().type_val == ('id', 'draw'):
            self.parse_draw()
        # after every other identifier
        elif self.peek().type_val == ('id', 'let') or self.peek().type == 'id':
            self.parse_assignment_or_call()
        elif self.peek().type == 'EOL':
            # empty statement
            self.next()
        else:
            raise Exception('Unknown statement: %s' % (self.peek(),))

    def parse_program(self, root_fn):
        self._pending_modules.add(os.path.basename(root_fn))

        while len(self._pending_modules) > 0:
            in_fn = os.path.join(os.path.dirname(root_fn), self._pending_modules.pop())

            if not os.path.exists(in_fn):
                print 'WARNING:', in_fn, ' does not exist'
                continue
    
            print 80 * '-'
            print in_fn 

            f = open(in_fn)
            contents = f.read()
            f.close()
            self._stream = TokenStream(contents)

            self._current_module = os.path.basename(in_fn)
            self._already_parsed_modules.add(self._current_module)
            self._codegen.set_label_at_current_position(self.label_for('_main'))
            while self.peek().type != 'EOF':
                self.parse_statement()
            self._codegen.call_primitive_statement('system')

    def write_output(self, out_fn):
        self._codegen.write_output(out_fn, self._original_label_names)

class Compiler(object):

    def compile_file(self, in_fn, out_fn):
        parser = Parser()
        parser.parse_program(in_fn)
        parser.write_output(out_fn)

