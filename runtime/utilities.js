
function clear_container(container) {
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }
}

function pprint_args(args) {
    var res = '';
    for (var i = 0; i < args.length; i++) {
        res += pprint_arg(args[i]);
        if (i < args.length - 1) {
            res += ', ';
        }
    }
    return '(' + res + ')';
}

function pprint_arg(arg) {
    if (typeof arg == 'string') {
        return '"' + arg.toString() + '"';
    } else {
        return String(arg);
    }
}

function power(x, y) {
    if (y == 0) {
        return 1;
    }
    if (y < 0) {
        if (x == 0) {
            throw new Exception('Cannot raise 0 to a negative power.');
        }
        x = 1 / x;
        y = -y;
    }
    var res = 1;
    while (y > 0) {
        if (y % 2 == 1) {
            res = res * x;
        }
        x = x * x;
        y = Math.floor(y / 2);
    }
    return res;
}
