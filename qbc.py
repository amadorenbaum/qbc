#!/bin/python

import os
import sys

from lang.compiler import Compiler

if len(sys.argv) != 2:
    sys.stderr.write('QBasic to JavaScript converter\n')
    sys.stderr.write('Usage: %s <file.bas>\n' % (sys.argv[0],))
    sys.exit(1)

in_fn = sys.argv[1]

out_fn = 'output/' + os.path.basename(in_fn.lower())
if out_fn.endswith('.bas'):
    out_fn = out_fn[:-4]
out_fn += '.html'

compiler = Compiler()
compiler.compile_file(in_fn, out_fn)

