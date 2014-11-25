
function Input(parent_document) {
    var that = this;

    var max_buf = 16;
    var input_buffer = [];

    parent_document.onkeypress = function (event) {
        if (0 <= event.keyCode && event.keyCode < 256) {
            that.push(String.fromCharCode(event.keyCode));
        } else {
            var elem = document.getElementById('errmsg_container');
            elem.innerHTML = event.toString;
        }
    }

    parent_document.onkeydown = function (event) {
        switch (event.keyCode) {
            case 8: /* backspace */
                that.push(String.fromCharCode(8));
                break;
            case 13: /* enter */
                that.push(String.fromCharCode(13));
                break;
            case 27: /* esc */
                that.push(String.fromCharCode(27));
                break;
            case 37: /* left */
                that.push(String.fromCharCode(0) + "K");
                break;
            case 38: /* up */
                that.push(String.fromCharCode(0) + "H");
                break;
            case 39: /* right */
                that.push(String.fromCharCode(0) + "M");
                break;
            case 40: /* down */
                that.push(String.fromCharCode(0) + "P");
                break;
        }
    }

    that.push = function (code) {
        if (input_buffer.length < max_buf) {
            input_buffer.push(code);
        }
    };

    that.clear_buffer = function () {
        input_buffer = [];
    };

    that.inkey = function () {
        if (input_buffer.length == 0) {
            return '';
        } else {
            return input_buffer.shift();
        }
    };
}
