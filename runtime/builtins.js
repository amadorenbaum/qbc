
function global_primitives() {
    var primitives = {};

    primitives['_MKARRAY'] = fix_type(
        FUNCTION([ANY, NUMBER, [NUMBER]]),
        function (state, args) {
            var lower;
            var upper;
            if (args.length == 2) {
                lower = 0;
                upper = args[1];
            } else {
                lower = args[1];
                upper = args[2];
            }
            var res = new Array();
            for (var i = lower; i <= upper; i++) {
                res[i] = args[0];
            }
            return res;
        }
    );

    primitives['_STACK_POP'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.stack.pop();
            return VM_OK;
        }
    );

    primitives['_RESET'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.reset();
            return VM_OK;
        }
    );

    primitives['_INPUT'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            return VM_INPUT;
        }
    );

    primitives['_STACK_DUP'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            var x = state.stack.pop();
            state.stack.push(x);
            state.stack.push(x);
            return VM_OK;
        }
    );

    primitives['_ON_TIMER_GOSUB'] = fix_type(
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            state.timer_interval = 1000 * args[0];
            state.timer_routine = args[1];
            state.timer_gosub = true;
            return VM_OK;
        }
    );

    primitives['_ON_TIMER_GOTO'] = fix_type(
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            state.timer_interval = 1000 * args[0];
            state.timer_routine = args[1];
            state.timer_gosub = false;
            return VM_OK;
        }
    );

    primitives['_TIMER_ON'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.timer_on = true;
            state.timer_last = new Date().getTime();
            return VM_OK;
        }
    );

    primitives['_TIMER_OFF'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.timer_on = false;
            return VM_OK;
        }
    );

    primitives['_DRAW'] = fix_type(
        FUNCTION([ANY]),
        function (state, args) {
            state.screen.draw(args[0]);
            return VM_OK;
        }
    );

    primitives['ABS'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            return Math.abs(args[0]);
        }
    );

    primitives['ASC'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            if (args[0].length == 0) {
                throw new Exception("Illegal function call");
            }
            return args[0].charCodeAt(0);
        }
    );

    primitives['CHR$'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            var code = args[0];
            if (code < 0 || code >= 256) {
                throw new Exception("Illegal function call");
            }
            return String.fromCharCode(code);
        }
    );

    primitives['CIRCLE'] = fix_type(
        FUNCTION([NUMBER, NUMBER, NUMBER, [NUMBER, [NUMBER, [NUMBER]]]]),
        function (state, args) {
            var x = args[0];
            var y = args[1];
            var radius = args[2];
            var color = args.length > 3 ? args[3] : state.screen.current_fg();
            var start = args.length > 4 ? args[4] : 0;
            var end = args.length > 5 ? args[5] : 2 * Math.PI;
            state.screen.circle(x, y, radius, color, start, end);
            return VM_IO;
        }
    );

    primitives['CLS'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.screen.cls();
            return VM_IO;
        }
    );

    primitives['COLOR'] = fix_type(
        FUNCTION([NUMBER, [NUMBER]]),
        function (state, args) {
            var fg = args[0];
            var bg = args.length == 2 ? args[1] : state.screen.current_bg();
            state.screen.color(fg, bg);
            return VM_OK;
        }
    );

    primitives['DATE$'] = fix_type( /* EXPRESSION */
        FUNCTION([]),
        function (state, args) {
            var now = new Date();
            var day = now.getDate();
            var month = now.getMonth() + 1;
            var year = now.getFullYear();
            day = (day < 10 ? '0' : '') + day;
            month = (month < 10 ? '0' : '') + month;
            year = '' + year;
            return day + '-' + month + '-' + year;
        }
    );

    primitives['INKEY$'] = fix_type( /* EXPRESSION */
        FUNCTION([]),
        function (state, args) {
            return state.input.inkey();
        }
    );

    primitives['INT'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            return Math.floor(args[0]);
        }
    );

    primitives['LCASE$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            return args[0].toLowerCase();
        }
    );

    primitives['LEFT$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING, NUMBER]),
        function (state, args) {
            var s = args[0];
            var n = args[1];
            if (n > s.length) {
                n = s.length;
            }
            return s.substring(0, n);
        }
    );

    primitives['LEN'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            return args[0].length;
        }
    );

    primitives['LINE'] = fix_type(
        FUNCTION([NUMBER, NUMBER, NUMBER, NUMBER, [NUMBER, [ENUM(['', 'B', 'BF'])]]]),
        function (state, args) {
            var x0 = args[0];
            var y0 = args[1];
            var x1 = args[2];
            var y1 = args[3];
            var color = args.length > 4 ? args[4] : state.screen.current_fg();
            var fill = args.length > 5 ? args[5] : '';
            if (fill == '') {
                state.screen.line(x0, y0, x1, y1, color);
            } else if (fill == 'B') {
                state.screen.rectangle(x0, y0, x1, y1, color, false);
            } else if (fill == 'BF') {
                state.screen.rectangle(x0, y0, x1, y1, color, true);
            }
            return VM_IO;
        }
    );

    primitives['LOCATE'] = fix_type(
        FUNCTION([[NUMBER, [NUMBER]]]),
        function (state, args) {
            var row = args.length >= 1 ? args[0] : state.screen.current_row();
            var col = args.length == 2 ? args[1] : state.screen.current_col();
            state.screen.locate(row, col);
            return VM_OK;
        }
    );

    primitives['LTRIM$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            var i = 0;
            var s = args[0];
            while (i < s.length && s[i] == ' ') {
                i++;
            }
            return s.substring(i, s.length);
        }
    );

    primitives['MID$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING, NUMBER, [NUMBER]]),
        function (state, args) {
            var s = args[0];
            var i = args[1] - 1;
            var j;
            if (args.length == 3) {
                j = args[2];
            } else {
                j = s.length - i;
            }
            i = i < 0 ? 0 : i;
            i = i > s.length ? s.length : i;
            j = j < 0 ? 0 : j;
            j = i + j > s.length ? s.length - i : j;
            return s.substring(i, i + j);
        }
    );

    primitives['_PLAY_SOUND'] = fix_type(
        FUNCTION([ANY]),
        function (state, args) {
            args[0].play()
            return VM_OK;
        }
    );

    primitives['SOUND'] = fix_type(
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            /* XXX: not implemented */
            return VM_OK;
        }
    );

    primitives['PAINT'] = fix_type(
        FUNCTION([NUMBER, NUMBER, [NUMBER, [NUMBER]]]),
        function (state, args) {
            var color;
            if (args.length == 3) {
                color = args[2];
            } else {
                color = state.screen.current_bg();
            }
            /* XXX: not implemented */
            return VM_IO;
        }
    );

    function primitive_print(state, args, sep) {
        var x = args[0];
        if (typeof x == 'string') {
            state.screen.print(x, sep);
        } else if (typeof x == 'number') {
            if (x >= 0) {
                state.screen.print(' ' + x.toString() + ' ', sep);
            } else {
                state.screen.print(x.toString() + ' ', sep);
            }
        } else {
            state.screen.print(x.toString(), sep);
        }
    }

    primitives['PRESET'] = fix_type(
        FUNCTION([NUMBER, NUMBER, [NUMBER]]),
        function (state, args) {
            var color;
            if (args.length == 3) {
                color = args[2];
            } else {
                color = state.screen.current_bg();
            }
            state.screen.preset(args[0], args[1], color);
            return VM_IO;
        }
    );

    primitives['PRINT'] = fix_type(
        FUNCTION([ANY]),
        function (state, args) {
            primitive_print(state, args, SCREEN_PRINT_SEP_ENTER);
            return VM_IO;
        }
    );

    primitives['PRINT;'] = fix_type(
        FUNCTION([ANY]),
        function (state, args) {
            primitive_print(state, args, SCREEN_PRINT_SEP_CONCAT);
            return VM_IO;
        }
    );

    primitives['PRINT,'] = fix_type(
        FUNCTION([ANY]),
        function (state, args) {
            primitive_print(state, args, SCREEN_PRINT_SEP_TAB);
            return VM_IO;
        }
    );

    primitives['RANDOMIZE'] = fix_type(
        FUNCTION([NUMBER]),
        function (state, args) {
            var value = args[0];
            state.rng.randomize(value);
            return VM_OK;
        }
    );

    primitives['RIGHT$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING, NUMBER]),
        function (state, args) {
            var s = args[0];
            var n = args[1];
            if (n > s.length) {
                n = s.length;
            }
            return s.substring(s.length - n, s.length);
        }
    );

    primitives['RND'] = fix_type( /* EXPRESSION */
        FUNCTION([]),
        function (state, args) {
            var value = args[0];
            return state.rng.rnd();
        }
    );

    primitives['RTRIM$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            var s = args[0];
            var i = s.length - 1;
            while (i >= 0 && s[i] == ' ') {
                i--;
            }
            return s.substring(0, i + 1);
        }
    );

    primitives['_SCREEN'] = fix_type(
        FUNCTION([NUMBER]),
        function (state, args) {
            state.screen.init_screen(args[0]);
            return VM_IO;
        }
    );

    primitives['SCREEN'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return state.screen.at(args[0], args[1]);
        }
    );

    primitives['SLEEP'] = fix_type(
        FUNCTION([[NUMBER]]),
        function (state, args) {
            var delay = (args.length == 1) ? 1000 * args[0] : 24 * 60 * 60 * 1000;
            state.sleep_wakeup = new Date().getTime() + delay;
            return VM_SLEEP;
        }
    );

    primitives['STR$'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            return args[0].toString();
        }
    );

    primitives['SPACE$'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            var res = '';
            for (var i = 0; i < args[0]; i++) {
                res = res + ' '; 
            }
            return res;
        }
    );

    primitives['STRING$'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, SCALAR]),
        function (state, args) {
            var res = '';
            var rep;
            if (typeof args[1] == 'string') {
                rep = args[1];
            } else {
                rep = String.fromCharCode(args[1]);
            }
            for (var i = 0; i < args[0]; i++) {
                res = res + rep; 
            }
            return res;
        }
    );

    primitives['SYSTEM'] = fix_type(
        FUNCTION([]),
        function (state, args) {
            state.error_handler.message('Execution finished.');
            return VM_EXIT;
        }
    );

    primitives['TIME$'] = fix_type( /* EXPRESSION */
        FUNCTION([]),
        function (state, args) {
            var now = new Date().getTime();
            var seconds = Math.floor(now / 1000);
            var minutes = Math.floor(seconds / 60);
            var hours = Math.floor(minutes / 60); 
            var h = hours % 24;
            var m = minutes % 60;
            var s = seconds % 60;
            h = (h < 10 ? '0' : '') + h;
            m = (m < 10 ? '0' : '') + m;
            s = (s < 10 ? '0' : '') + s;
            return h + ':' + m + ':' + s;
        }
    );

    primitives['TIMER'] = fix_type( /* EXPRESSION */
        FUNCTION([]),
        function (state, args) {
            var now = new Date();
            var start = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0);
            return (now.getTime() - start.getTime()) / 1000.0;
        }
    );

    primitives['UCASE$'] = fix_type( /* EXPRESSION */
        FUNCTION([STRING]),
        function (state, args) {
            return args[0].toUpperCase();
        }
    );

    primitives['VAL'] = fix_type( /* EXPRESSION */
        FUNCTION([ANY]),
        function (state, args) {
            return Number(args[0]);
        }
    );

    /* Operators */

    function from_boolean(b) {
        return b ? -1 : 0;
    }

    function to_boolean(b) {
        return b == 0 ? false : true;
    }

    primitives['XOR'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return from_boolean(!(args[0] === args[1]));
        }
    );

    primitives['EQV'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return from_boolean(args[0] === args[1]);
        }
    );

    primitives['XOR'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return args[0] ^ args[1];
        }
    );

    primitives['OR'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return args[0] | args[1];
        }
    );

    primitives['AND'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return args[0] & args[1];
        }
    );

    primitives['NOT'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER]),
        function (state, args) {
            return from_boolean(!to_boolean(args[0]));
        }
    );

    primitives['='] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(args[0] === args[1]);
        }
    );

    primitives['>'] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(args[0] > args[1]);
        }
    );

    primitives['<'] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(args[0] < args[1]);
        }
    );

    primitives['<>'] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(!(args[0] === args[1]));
        }
    );

    primitives['<='] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(args[0] <= args[1]);
        }
    );

    primitives['>='] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            return from_boolean(args[0] >= args[1]);
        }
    );

    primitives['+'] = fix_type( /* EXPRESSION */
        FUNCTION([SCALAR, SCALAR]),
        function (state, args) {
            if (typeof args[0] != typeof args[1]) {
                args[0] = args[0].toString();
                args[1] = args[1].toString();
            }
            return args[0] + args[1];
        }
    );

    primitives['MOD'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            if (args[1] == 0) {
                throw new Exception('Zero division error.');
            } else {
                return args[0] % args[1];
            }
        }
    );

    primitives['\\'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            if (args[1] == 0) {
                throw new Exception('Zero division error.');
            } else {
                return Math.floor(args[0] / args[1]);
            }
        }
    );

    primitives['*'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            return args[0] * args[1];
        }
    );

    primitives['/'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            if (args[1] == 0) {
                throw new Exception('Zero division error.');
            } else {
                return args[0] / args[1];
            }
        }
    );

    primitives['-'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, [NUMBER]]),
        function (state, args) {
            if (args.length == 2) {
                return args[0] - args[1];
            } else {
                return -args[0];
            }
        }
    );
     
    primitives['^'] = fix_type( /* EXPRESSION */
        FUNCTION([NUMBER, NUMBER]),
        function (state, args) {
            if (args[1] === (args[1] | 0)) {
                return power(args[0], args[1]);
            } else {
                return Math.exp(Math.log(args[0]) * args[1]);
            }
        }
    );

    return primitives;
}

