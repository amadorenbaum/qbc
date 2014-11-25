'SCREEN 13
CLS
s$ = ""
a = 0
FOR a = 0 TO 255
  IF a <> 9 AND a <> 10 AND a <> 11 AND a <> 12 AND a <> 13 AND a <> 0 AND a <> 7 AND a <> 29 AND a <> 30 AND a <> 31 THEN
    s$ = s$ + CHR$(a)
  ELSE
    s$ = s$ + "X"
  END IF
NEXT a
PRINT s$

