
var VM_OK = 1;          /* for opcodes that perform computations */
var VM_IO = 2;          /* for opcodes that perform I/O */
var VM_EXIT = 3;        /* for SYSTEM, END, etc. */
var VM_JUMP = 4;        /* for conditional and unconditional jumps */
var VM_SLEEP = 5;       /* for sleeping a given amount of time */
var VM_INPUT = 6;       /* for reading a string */

function OpPushConstant(constant) {
    var that = this;
    that.run = function (state) {
        state.stack.push(constant);
        return VM_OK;
    };
}

function OpPushRetval(variable) {
    var that = this;
    that.run = function (state) {
        var address = state.stack.pop();
        state.stack.push(state.locals[variable]);
        state.stack.push(address);
        return VM_OK;
    };
}

function OpSetArrayRef(variable) {
    var that = this;
    that.run = function (state) {
        var value = state.stack.pop();
        var index = state.stack.pop();
        var arr;
        if (variable in state.shared_names) {
            arr = state.shared[variable];
        } else if (variable in state.locals) {
            arr = state.locals[variable];
        } else {
            throw new Exception('Unbound array: ' + variable);
        }
        if (!(index in arr)) {
            throw new Exception('Array index out of bounds, setting array ' + arr + ' at index: ' + index);
        }
        arr[index] = value;
        return VM_OK;
    };
}

function OpSetRef(variable) {
    var that = this;
    that.run = function (state) {
        var value = state.stack.pop();
        if (variable in state.shared_names) {
            state.shared[variable] = value;
        } else {
            state.locals[variable] = value;
        }
        return VM_OK;
    };
}

function OpGetRef(variable) {
    var that = this;
    that.run = function (state) {
        if (variable in state.locals) {
            var value = state.locals[variable];
            state.stack.push(value);
            return VM_OK;
        } else if (variable in state.shared_names) {
            var value = state.shared[variable];
            state.stack.push(value);
            return VM_OK;
        } else {
            /*throw new Exception('Unbound variable: ' + variable);*/
            state.stack.push(0);
            return VM_OK;
        }
    };
}

function OpMidAssign(variable, right_index) {
    var that = this;
    that.run = function (state) {
        var orig, lower, repl_length, upper, replace;
        if (variable in state.locals) {
            orig = state.locals[variable];
        } else {
            orig = state.shared[variable];
        }

        replace = state.stack.pop();
        if (right_index) {
            repl_length = state.stack.pop();
        } else {
            repl_length = null;
        }
        lower = state.stack.pop() - 1;

        if (repl_length === null) {
            upper = orig.length;
        } else {
            upper = lower + repl_length;
        }

        var new_value =
            orig.substring(0, lower) +
            replace +
            orig.substring(upper, orig.length);

        if (variable in state.locals) {
            state.locals[variable] = new_value;
        } else {
            state.shared[variable] = new_value;
        }
        return VM_OK;
    };
}

function OpMidArrayAssign(variable, right_index) {
    var that = this;
    that.run = function (state) {
        var arr, orig, index, lower, repl_length, upper, replace;
        if (variable in state.locals) {
            arr = state.locals[variable];
        } else {
            arr = state.shared[variable];
        }

        replace = state.stack.pop();
        if (right_index) {
            repl_length = state.stack.pop();
        } else {
            repl_length = null;
        }
        lower = state.stack.pop() - 1;
        index = state.stack.pop();
        if (!(index in arr)) {
            throw new Exception('Array index out of bounds setting MID$ of array ' + arr + ' at index: ' + index);
        }
        orig = arr[index];

        if (repl_length === null) {
            upper = orig.length;
        } else {
            upper = lower + repl_length;
        }

        var new_value =
            orig.substring(0, lower) +
            replace +
            orig.substring(upper, orig.length);

        arr[index] = new_value;
        return VM_OK;
    };
}


function OpGetArrayRef(variable, nargs) {
    var that = this;
    that.run = function (state) {
        var args = [];
        for (var i = 0; i < nargs; i++) {
            args.push(state.stack.pop());
        }
        if (variable in state.locals) {
            var arr = state.locals[variable];
            if (!(args[0] in arr)) {
                throw new Exception('Array index out of bounds reading local array: ' + variable + ' at index: ' + args[0]);
            }
            var value = arr[args[0]];
            state.stack.push(value);
            return VM_OK;
        } else if (variable in state.shared_names) {
            var arr = state.shared[variable];
            if (!(args[0] in arr)) {
                throw new Exception('Array index out of bounds reading global array: ' + variable + ' at index: ' + args[0]);
            }
            var value = arr[args[0]];
            state.stack.push(value);
            return VM_OK;
        } else {
            throw new Exception('Unbound variable: ' + variable);
        }
    };
}

function OpWaitIO(constant) {
    var that = this;
    that.run = function (state) {
        return VM_IO;
    };
}

function call_primitive(state, primitive_name, nargs) {
    var args = []
    for (var i = 0; i < nargs; i++) {
        args.unshift(state.stack.pop());
    }
    if (primitive_name in state.primitives) {
        state.context.current_primitive = primitive_name; 
        return state.primitives[primitive_name](state, args);
    } else {
        throw new Exception('Unknown primitive: ' + primitive_name);
    }
}

function OpCallPrimitiveStatement(primitive_name, nargs) {
    var that = this;
    that.run = function (state) {
        return call_primitive(state, primitive_name, nargs);
    };
}

function OpCallPrimitiveFunction(primitive_name, nargs) {
    var that = this;
    that.run = function (state) {
        var result = call_primitive(state, primitive_name, nargs);
        state.stack.push(result);
        return VM_IO;
    };
}

function OpJump(address) {
    var that = this;
    that.run = function (state) {
        state.ip = address;
        return VM_JUMP;
    };
}

function OpJumpIfFalse(address) {
    var that = this;
    that.run = function (state) {
        var condition = state.stack.pop();
        if (condition == 0) {
            state.ip = address;
            return VM_JUMP;
        } else {
            return VM_OK;
        }
    };
}

function OpGosub(address) {
    var that = this;
    that.run = function (state) {
        state.stack.push(state.ip + 1);
        state.ip = address;
        return VM_JUMP;
    };
}

function OpReturn() {
    var that = this;
    that.run = function (state) {
        if (state.stack.length == 0) {
            throw new Exception('RETURN without GOSUB');
        }
        state.ip = state.stack.pop();
        return VM_JUMP;
    };
}

function OpEnter(local_names) {
    var that = this;
    that.run = function (state) {
        state.environment.push(state.locals);
        state.locals = {};
        var address = state.stack.pop();
        if (state.stack.length < local_names.length) {
            throw new Exception("Too few arguments.");
        }
        for (var i = local_names.length; i > 0; i--) {
            state.locals[local_names[i - 1]] = state.stack.pop();
        }
        state.stack.push(address);
        return VM_OK;
    };
}

function OpLeave() {
    var that = this;
    that.run = function (state) {
        state.locals = state.environment.pop();
        return VM_OK;
    };
}

function OpForStart(index, index_upper, index_step) {
    var that = this;
    that.run = function (state) {
        state.locals[index_step] = state.stack.pop();
        state.locals[index_upper] = state.stack.pop();
        state.locals[index] = state.stack.pop(); /* lower */
        return VM_OK;
    };
}

function OpForCheck(index, index_upper, index_step, end_address) {
    var that = this;
    that.run = function (state) {
        var upper = state.locals[index_upper];
        var step = state.locals[index_step];
        var current = state.locals[index];
        var should_stop;
        if (step > 0) {
            should_stop = current > upper;
        } else {
            should_stop = current < upper;
        }
        if (should_stop) {
            state.ip = end_address;
            return VM_JUMP;
        } else {
            return VM_OK;
        }
    };
}

function OpForNext(index, index_step, start_address) {
    var that = this;
    that.run = function (state) {
        state.locals[index] = state.locals[index] + state.locals[index_step];
        state.ip = start_address;
        return VM_JUMP;
    };
}

function fix_type(type, f) {
    return function (state, args) {
        if (!type.match(args)) {
            var msg = '';
            msg += 'Type mismatch.';
            msg += ' Primitive ' + state.context.current_primitive;
            msg += ' expected: ' + '(' + type.description() + ') ';
            msg += ' but got: ' + pprint_args(args) + '.';
            throw new Exception(msg);
        }
        return f(state, args);
    };
}

function VirtualMachineState(
                parent_document,
                parent_screen_container,
                parent_errmsg_container,
                shared_names,
                available_screens,
                code,
                entry_point
        ) {

    var that = this;

    that.screen = new Screen(parent_document, parent_screen_container, available_screens);
    that.input = new Input(parent_document);

    that.error_handler = new ErrorHandler(parent_document, parent_errmsg_container);
    that.code = code;
    that.ip = entry_point;

    that.primitives = global_primitives();
    that.rng = new RandomNumberGenerator();

    that.shared_names = shared_names;

    that.run_delay = 10;      /* milliseconds */

    that.reset = function () {
        that.stack = [];
        that.shared = {};
        that.locals = {};
        that.environment = [];

        that.timer_on = false;
        that.timer_interval = 0; /* milliseconds */
        that.timer_routine = -1;
        that.timer_last = 0;      /* time */
        that.timer_gosub = false;

        that.sleep_wakeup = 0; /* time */
    };

    that.reset();
    that.input_read_string_data = '';

    /* Context for error reporting */
    that.context = {};
    that.context.current_primitive = ''; 

    function string_dict(dict) {
        var s = [];
        for (var k in dict) {
            s.push(' || ' + k + ': ' + String(dict[k]) + '\n');
        }
        return '{\n' + s.join('') + '}';
    }

    that.toString = function () {
        var msg = '';
        msg += 'Screen: ' + that.screen + '\n';
        msg += 'IP: ' + that.ip + '\n';
        msg += 'Stack: ' + that.stack + '\n';
        msg += 'Timer: ' + (that.timer_on ? 'on' : 'off') + '\n';
        msg += 'Timer interval: ' + that.timer_interval + '\n';
        msg += 'Timer routine: ' + that.timer_routine + '\n';
        msg += 'Timer last: ' + that.timer_last + '\n';
        msg += 'Timer gosub: ' + that.timer_gosub + '\n';
        msg += 'Globals: ' + string_dict(that.shared) + '\n';
        msg += 'Locals: ' + string_dict(that.locals) + '\n';
        msg += 'Environment: [' + '\n';
        for (var i = that.environment.length; i-- > 0;) {
            msg += string_dict(that.environment[i]);
        }
        msg += ']';
        return msg;
    };
}

function VirtualMachine(state) {
    var that = this;

    that.step = function () {
        if (state.ip >= state.code.length) {
            throw new Exception('Program ended without SYSTEM.');
        }
        var op = state.code[state.ip];
        return op.run(state);
    };

    that.input_read_string = function () {
        var key = state.input.inkey();
        state.screen.cursor_blink();
        if (key == '') {
            return setTimeout(that.input_read_string, that.run_delay);
        } else if (key.charCodeAt(0) == 8) {
            /* Backspace */
            if (that.input_read_string_data.length == 0) {
                return setTimeout(that.input_read_string, that.run_delay);
            }
            var n = that.input_read_string_data.length;
            that.input_read_string_data = that.input_read_string_data.substring(0, n - 1);
            state.screen.cursor_hide();
            state.screen.move_back_one_char();
            state.screen.print(' ', SCREEN_PRINT_SEP_CONCAT);
            state.screen.move_back_one_char();
            return setTimeout(that.input_read_string, that.run_delay);
        } else if (key.charCodeAt(0) == 13) {
            /* Enter */
            state.screen.cursor_hide();
            state.stack.push(that.input_read_string_data);
            that.input_read_string_data = '';
            state.screen.print('', SCREEN_PRINT_SEP_ENTER);
            return setTimeout(that.run, that.run_delay);
        } else {
            that.input_read_string_data += key;
            state.screen.print(key, SCREEN_PRINT_SEP_CONCAT);
            return setTimeout(that.input_read_string, that.run_delay);
        }
    };

    that.sleep = function () {
        var key = state.input.inkey();
        var now = new Date().getTime();
        if (key != '' || now > state.sleep_wakeup) {
            return setTimeout(that.run, that.run_delay);
        } else {
            return setTimeout(that.sleep, that.run_delay);
        }
    };

    that.run = function () {
        try {
            for (var i = 0; i < 1024; i++) {
                var result = that.step();
                if (result == VM_OK || result == VM_IO) {
                    state.ip++;
                } else if (result == VM_JUMP) {
                    /* Do not increase the IP. */
                } else if (result == VM_SLEEP) {
                    state.ip++;
                    state.input.clear_buffer();
                    return setTimeout(that.sleep, state.run_delay);
                } else if (result == VM_INPUT) {
                    state.ip++;
                    state.input.clear_buffer();
                    that.input_read_string_data = '';
                    return setTimeout(that.input_read_string, state.run_delay);
                } else if (result == VM_EXIT) {
                    /* End, do not setTimeout again. */
                    return;
                }
            }

            /* Timer */
            if (state.timer_on && state.timer_interval > 0 && state.timer_routine > -1) {
                var now = new Date().getTime();
                if (now - state.timer_last > state.timer_interval) {
                    if (state.timer_gosub) {
                        state.stack.push(state.ip);
                    }
                    state.ip = state.timer_routine;
                    state.timer_last = now;
                }
            }

            return setTimeout(that.run, that.run_delay);
        } catch (exception) {
            if (exception instanceof Exception) {
                state.error_handler.handle(
                    new Exception(
                        'Error: <b>' + exception + '</b>\n' +
                        'State:\n' + state
                    )
                );
            } else {
                throw exception;
            }
        }
    };
}

