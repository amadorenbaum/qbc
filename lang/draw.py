
from lang.utils import take_while_in, DIGIT

def parse_draw_commands(string):
    cmds = [];
    string = string.lower()
    i = 0
    while i < len(string):
        if string[i] == ' ':
            i += 1
        elif string[i] in 'abcdefghijklmnopqrstuvwxyz':
            cmd = string[i]
            i += 1
            i, num = take_while_in(string, i, DIGIT)
            if num == '':
                raise Exception('DRAW command without argument. Offending command: %s' % (string,))
            cmds.append([cmd, int(num)])
        else:
            raise Exception('Unrecognized DRAW command: %s' % (string,))
    return cmds 

