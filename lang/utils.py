
ALPHA = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
SIGIL = '%&!#$:'
DIGIT = '0123456789'
IDENT = ALPHA + DIGIT + '.' + SIGIL

def take_while_in(string, i, alphabet):
    took = ''
    while i < len(string) and string[i] in alphabet:
        took += string[i]
        i += 1
    return i, took

