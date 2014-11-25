
function TypeAny() {
    var that = this;

    that.match = function (arg) {
        return true;
    };

    that.description = function () {
        return '*';
    };
}

function TypeNumber() {
    var that = this;

    that.match = function (arg) {
        return typeof arg == 'number';
    };

    that.description = function () {
        return 'number';
    };
}

function TypeString() {
    var that = this;

    that.match = function (arg) {
        return typeof arg == 'string';
    };

    that.description = function () {
        return 'string';
    };
}

function TypeScalar() {
    var that = this;

    that.match = function (arg) {
        return typeof arg == 'number' || typeof arg == 'string';
    };

    that.description = function () {
        return 'scalar';
    };
}

function TypeFuncDomain(types) {
    var that = this;

    that.match = function (args) {
        if (types.length != args.length) {
            return false;
        }
        for (var i = 0; i < types.length; i++) {
            if (!types[i].match(args[i])) {
                return false;
            }
        }
        return true;
    };

    that.description = function () {
        var res = '';
        for (var i = 0; i < types.length; i++) {
            res += types[i].description();
            if (i < types.length - 1) {
                res += ',';
            }
        }
        return res;
    };
}

function TypeFuncDomainOptional(types, optional_domain_type) {
    var that = this;

    that.match = function (args) {
        if (types.length > args.length) {
            return false;
        }
        for (var i = 0; i < types.length; i++) {
            if (!types[i].match(args[i])) {
                return false;
            }
        }
        var remaining_args = [];
        for (var i = types.length; i < args.length; i++) {
            remaining_args.push(args[i]);
        }
        return remaining_args.length == 0
            || optional_domain_type.match(remaining_args);
    };

    that.description = function () {
        var res = '';
        for (var i = 0; i < types.length; i++) {
            res += types[i].description();
            if (i < types.length - 1) {
                res += ',';
            }
        }
        return res + ', ' + '[' + optional_domain_type.description() + ']';
    };
}

var ANY = new TypeAny();

var NUMBER = new TypeNumber();
var STRING = new TypeString();
var SCALAR = new TypeScalar();

function FUNCTION(list) {
    if (list instanceof Array) {
        if (list.length == 0) {
            return new TypeFuncDomain([]);
        } else if (list[list.length - 1] instanceof Array) {
            var mandatory = [];
            for (var i = 0; i < list.length - 1; i++) {
                mandatory.push(list[i]);
            }
            var optional = FUNCTION(list[list.length - 1]);
            return new TypeFuncDomainOptional(mandatory, optional); 
        } else {
            return new TypeFuncDomain(list);
        }
    } else {
        return list;
    }
}

function ENUM(list) {
    return new function () {
        var that = this;

        that.match = function (arg) {
            return list.indexOf(arg) != -1;
        };

        that.description = function () {
            var res = '';
            for (var i = 0; i < list.length; i++) {
                res += list[i].toString();
                if (i < list.length - 1) {
                    res += '|';
                }
            }
            return '{' + res + '}';
        };
    };
}

