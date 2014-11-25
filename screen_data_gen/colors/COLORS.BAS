SCREEN 13
w = 8
FOR i = 0 TO 15
FOR j = 0 TO 15
  LINE (w * i, w * j)-(w * i + w - 1, w * j + w - 1), 16 * j + i, BF
NEXT j
NEXT i

