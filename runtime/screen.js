
var SCREEN_EMPTY = 32;

var SCREEN_PRINT_SEP_ENTER = 0;
var SCREEN_PRINT_SEP_CONCAT = 1;
var SCREEN_PRINT_SEP_TAB = 2;

function default_palette() {
    return PALETTE;
}

function make_screen_traits(width_in_chars, height_in_chars, char_width, char_height, mult_x, mult_y) {
    var traits = Object();

    traits.width_in_chars = width_in_chars;
    traits.height_in_chars = height_in_chars;

    traits.char_width = char_width;
    traits.char_height = char_height;

    traits.total_width = width_in_chars * char_width;
    traits.total_height = height_in_chars * char_height;

    traits.mult_x = mult_x;
    traits.mult_y = mult_y;

    traits.font_data = [];
    traits.palette = default_palette();
    return traits;
}

function default_screen_types(available_screens) {
  var types = {};
  types[0] = make_screen_traits(80, 24, 8, 16, 1, 1);
  types[1] = make_screen_traits(40, 25, 16, 16, 2, 2);
  types[2] = make_screen_traits(80, 25, 8, 16, 1, 1);
  types[7] = make_screen_traits(40, 25, 16, 16, 2, 2);
  types[8] = make_screen_traits(80, 25, 8, 16, 1, 1);
  types[9] = make_screen_traits(80, 25, 8, 14, 1, 1);
  types[10] = make_screen_traits(80, 25, 8, 14, 1, 1);
  types[11] = make_screen_traits(80, 30, 8, 16, 1, 1);
  types[12] = make_screen_traits(80, 30, 8, 16, 1, 1);
  types[13] = make_screen_traits(40, 25, 16, 16, 2, 2);

  for (var screen in available_screens) {
      types[available_screens[screen].number].font_data = available_screens[screen].data;
  }
  return types;
}

function Screen(parent_document, parent_screen_container, available_screens) {
    var screen_types = default_screen_types(available_screens);

    var current_col = 1;
    var current_row = 1;

    var current_fg = 7;
    var current_bg = 0;

    var canvas, context;
    var current_screen_number;
    var traits;
    var content_matrix;

    var that = this;

    /*
     * TODO:
     *   chr$(7)  --> bell
     *   chr$(10) --> linefeed
     *   etc.?
     */
    that._put_char = function (asc, i, j, fg, bg) {
        var lst = traits.font_data[asc];
        context.fillStyle = traits.palette[bg];
        context.fillRect(traits.char_width * (i - 1), traits.char_height * (j - 1), traits.char_width, traits.char_height);
        context.fillStyle = traits.palette[fg];
		for (var k in lst) {
          context.fillRect(traits.char_width * (i - 1) + lst[k][0], traits.char_height * (j - 1) + lst[k][1], lst[k][2], 1);
        }
        content_matrix[i][j] = asc;
    };

    that._check_in_screen_range = function (row, col) {
        if (  row < 1
           || row > traits.height_in_chars - 1
           || col < 1
           || col > traits.width_in_chars) {
            throw new Exception('Position not in screen range: ' + row + ',' + col);
        }
    };

    that._scroll_screen_up = function () {
        /* Move contents */
        var old_content_matrix = content_matrix;
        content_matrix = {};
        for (var i = 1; i <= traits.width_in_chars; i++) {
            content_matrix[i] = {};
            for (var j = 1; j + 1 <= traits.height_in_chars; j++) {
                content_matrix[i][j] = old_content_matrix[i][j + 1];
            }
            content_matrix[i][traits.height_in_chars] = SCREEN_EMPTY;
        }

        /* Move graphics */
        context.drawImage(canvas,
            0, traits.char_height, traits.total_width, traits.total_height - traits.char_height,
            0, 0, traits.total_width, traits.total_height - traits.char_height
        );
        /* Clear last row */
        context.fillStyle = traits.palette[current_bg];
        context.fillRect(0, traits.total_height - traits.char_height, traits.total_width, traits.char_height);
    };

    that.at = function (row, col) {
        that._check_in_screen_range(row, col);
        return content_matrix[col][row];
    };

    that._move_forward_one_char = function () {
        current_col++;
        if (current_col > traits.width_in_chars) {
            that._move_forward_one_row();
        }
    };

    that.move_back_one_char = function () {
        current_col--;
        if (current_col == 0) {
            current_col = traits.width_in_chars;
            current_row--;
            if (current_row == 0) {
                current_row = 1;
            }
        }
    };

    that._move_forward_to_next_zone = function () {
        that._move_forward_one_char();
        while (current_col % 14 != 1) {
            that._move_forward_one_char();
        }
    };

    that._move_forward_one_row = function () {
        current_col = 1;
        if (current_row < traits.height_in_chars) {
            current_row++;
        } else {
            that._scroll_screen_up();
        }
    };

    that.init_screen = function (screen_number) {
        current_screen_number = screen_number;
        traits = screen_types[current_screen_number];

        canvas = parent_document.createElement('canvas');
        canvas.width = traits.total_width;
        canvas.height = traits.total_height;

        clear_container(parent_screen_container);

        parent_screen_container.appendChild(canvas);
        context = canvas.getContext('2d');

        that.cls();
    };

    that.cls = function () {
        context.fillStyle = traits.palette[current_bg];
        context.fillRect(0, 0, traits.mult_x * traits.total_width, traits.mult_y * traits.total_height);

        content_matrix = {};
        for (var i = 1; i <= traits.width_in_chars; i++) {
            content_matrix[i] = {}
            for (var j = 1; j <= traits.height_in_chars; j++) {
                content_matrix[i][j] = SCREEN_EMPTY;
            }
        }
        current_col = 1;
        current_row = 1;

        that._cursor_visible = false;
    };

    that.color = function (fg, bg) {
        current_fg = fg;
        current_bg = bg;
    };

    that.locate = function (row, col) {
        that._check_in_screen_range(row, col);
        current_row = row;
        current_col = col;
    };

    that._current_row_col_x_y = function () {
        var x = (current_col - 1) * traits.char_width;
        var y = (current_row - 1) * traits.char_height;
        return [x, y];
    };

    that.print = function (string, sep) {
        for (var i = 0; i < string.length; i++) {
            if (string.charCodeAt(i) == 13) {
                that._move_forward_one_row();
            } else {
                that._put_char(string.charCodeAt(i), current_col, current_row, current_fg, current_bg);
                if (i == string.length - 1 && sep == SCREEN_PRINT_SEP_ENTER) {
                    that._move_forward_one_row();
                } else if (i == string.length - 1 && sep == SCREEN_PRINT_SEP_TAB) {
                    that._move_forward_to_next_zone();
                } else {
                    that._move_forward_one_char();
                }
            }
        }
        if (string.length == 0) {
            if (sep == SCREEN_PRINT_SEP_ENTER) {
                that._move_forward_one_row();
            } else {
                that._move_forward_to_next_zone();
            }
        }
    };

    that.put_pixel = function (x, y, real_color) {
        var rx0 = traits.mult_x * x;
        var ry0 = traits.mult_y * y;
        context.beginPath();
        context.rect(rx0, ry0, traits.mult_x, traits.mult_y);
        context.fillStyle = real_color;
        context.fill();
    };

    that.line = function (x0, y0, x1, y1, color) {
        var rx0 = traits.mult_x * x0;
        var ry0 = traits.mult_y * y0;
        var rx1 = traits.mult_x * x1;
        var ry1 = traits.mult_y * y1;
        for (var i = 0; i < traits.mult_x; i++) {
            for (var j = 0; j < traits.mult_y; j++) {
                context.beginPath();
                context.moveTo(rx0 + i, ry0 + j);
                context.lineTo(rx1 + i, ry1 + j);
                context.closePath();
                context.strokeStyle = traits.palette[color];
                context.stroke();
            }
        }
    };

    that.rectangle = function (x0, y0, x1, y1, color, isFull) {
        var rx0 = traits.mult_x * x0;
        var ry0 = traits.mult_y * y0;
        var rx1 = traits.mult_x * x1;
        var ry1 = traits.mult_y * y1;

        for (var i = 0; i < traits.mult_x; i++) {
            for (var j = 0; j < traits.mult_y; j++) {
                context.beginPath();
                context.rect(x0 + i, y0 + j, x1 + i, y1 + j);
                context.closePath();
                if (isFull) {
                    context.fillStyle = traits.palette[color];
                    context.fill();
                }
                context.strokeStyle = traits.palette[color];
                context.stroke();
            }
        }
    };

    that.circle = function (x, y, radius, color, start, end) {
        var rx = traits.mult_x * x;
        var ry = traits.mult_y * y;
        var rradius = traits.mult_x * radius;
        for (var i = 0; i < traits.mult_x; i++) {
            for (var j = 0; j < traits.mult_y; j++) {
                /* start and end are from 0 to 2 * Math.PI */
                context.beginPath();
                context.arc(rx + i, ry + j, rradius, start, end);
                context.closePath();
                context.strokeStyle = traits.palette[color];
                context.stroke();
            }
        }
    };

    that.current_row = function () {
        return current_row;
    };

    that.current_col = function () {
        return current_col;
    };

    that.current_fg = function () {
        return current_fg;
    };

    that.current_bg = function () {
        return current_bg;
    };

    /* Blinking cursor handling */

    that._cursor_previous_contents = null;

    that._cursor_visible = false;

    that._cursor_period = 70;
    that._cursor_phase = 0;

    that._cursor_box = function () {
        var xy = that._current_row_col_x_y();
        var x0 = xy[0];
        var y0 = xy[1] + traits.char_height - 2;
        var x1 = x0 + traits.char_width - 1;
        var y1 = y0;
        return [x0, y0, x1, y1];
    };

    that.cursor_show = function () {
        if (that._cursor_visible) {
            return;
        }
        var box = that._cursor_box();
        var x0 = box[0]; var y0 = box[1];
        var x1 = box[2]; var y1 = box[3];
        that._cursor_previous_contents = [];
        for (var i = x0; i <= x1; i++) {
            var lst = [];
            for (var j = y0; j <= y1; j++) {
                lst.push(context.getImageData(i, j, 1, 1).data);
                that.put_pixel(i, j, traits.palette[current_fg]);
            }
            that._cursor_previous_contents.push(lst);
        }
        that._cursor_visible = true;
    };

    function rgb_hex(pix) {
        var r = pix[0].toString(16);
        var g = pix[1].toString(16);
        var b = pix[2].toString(16);
        r = (r.length == 1) ? ('0' + r) : r;
        g = (g.length == 1) ? ('0' + g) : g;
        b = (b.length == 1) ? ('0' + b) : b;
        return '#' + r + g + b;
    }

    that.cursor_hide = function () {
        if (!that._cursor_visible) {
            return;
        }
        var box = that._cursor_box();
        var x0 = box[0]; var y0 = box[1];
        var x1 = box[2]; var y1 = box[3];
        for (var i = x0; i <= x1; i++) {
            for (var j = y0; j <= y1; j++) {
                var pix = that._cursor_previous_contents[i - x0][j - y0];
                var col = rgb_hex(pix);
                that.put_pixel(i, j, col);
            }
        }
        that._cursor_visible = false;
    };

    that.cursor_blink = function () {
        that._cursor_phase++;
        if (that._cursor_phase == that._cursor_period) {
            if (that._cursor_visible) {
                that.cursor_hide();
            } else {
                that.cursor_show();
            }
            that._cursor_phase = 0;
        }
    };

    that.toString = function () {
        var msg = '';
        msg += 'Screen(';
        msg += traits.total_width + 'x' + traits.total_height;
        msg += ' | ';
        msg += 'w = ' + traits.width_in_chars + ' chr x ' + traits.char_width + ' px/chr';
        msg += ' | ';
        msg += 'h = ' + traits.height_in_chars + ' chr x ' + traits.char_height + ' px/chr';
        msg += ')';
        return msg;
    };

    var current_draw_x, current_draw_y, current_draw_color;

    that.preset = function (x, y, color) {
        that.put_pixel(x, y, traits.palette[Math.floor(color)]);
        current_draw_x = x;
        current_draw_y = y;
        current_draw_color = color;
    };

    that._draw_move = function (dx, dy, ntimes) {
        for (var i = 0; i < ntimes; i++) {
            var xx = current_draw_x + dx;
            var yy = current_draw_y + dy;
            if (0 <= xx && xx < traits.total_width && 0 <= yy && yy < traits.total_height) {
                current_draw_x = xx;
                current_draw_y = yy;
                that.preset(current_draw_x, current_draw_y, current_draw_color);
            }
        }
    };

    that.draw = function (commands) {
        for (var i = 0; i < commands.length; i++) {
            var cmd = commands[i];
            if (cmd[0] == 'c') {
                current_draw_color = cmd[1];
            } else if (cmd[0] == 'u') {
                that._draw_move(0, -1, cmd[1]);
            } else if (cmd[0] == 'd') {
                that._draw_move(0, 1, cmd[1]);
            } else if (cmd[0] == 'l') {
                that._draw_move(-1, 0, cmd[1]);
            } else if (cmd[0] == 'r') {
                that._draw_move(1, 0, cmd[1]);
            } else if (cmd[0] == 'e') {
                that._draw_move(1, -1, cmd[1]);
            } else if (cmd[0] == 'f') {
                that._draw_move(1, 1, cmd[1]);
            } else if (cmd[0] == 'g') {
                that._draw_move(-1, 1, cmd[1]);
            } else if (cmd[0] == 'h') {
                that._draw_move(-1, -1, cmd[1]);
            } else {
                throw new Exception('DRAW: command unrecognized: "' + cmd[0] + '"'); 
            }
        }
    };

    /**/

    that.init_screen(0);
}

