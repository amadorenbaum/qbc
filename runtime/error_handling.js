
function Exception(message) {
    var that = this;
    that.message = message;

    that.toString = function () {
        return that.message;
    };
}

function ErrorHandler(parent_document, parent_error_container) {
    var that = this;

    this.handle = function (exception) {
        that.message(exception.message);
    };

    this.message = function (msg) {
        parent_error_container.innerHTML = msg.replace(/\n/g, '<br>');
    };
}

