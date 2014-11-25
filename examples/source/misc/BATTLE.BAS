DECLARE SUB cosas (cosa!, y!, x!, k!, kb!)
DECLARE SUB pers (tipo!, posit!, y!, x!, k!, kb!)
DECLARE SUB perm (tipo!, posit!, y!, x!, k!, kb!)
DECLARE SUB presenta ()
DIM snx(50)
DIM sny(50)
SCREEN 0
presenta
GOSUB modo
IF modo = 2 THEN GOSUB elegmi
puntos = 0
1
nieve = 0
evil = 0
eterna = 0
shadow = 0
flying = 0
night = 0
dumb = 0
thor = 0
IF modo = 1 THEN GOSUB elegir
IF modo = 2 THEN GOSUB proximo
IF modo = 3 THEN GOSUB persol
IF modo = 3 THEN GOSUB persom
COLOR clr, clb
CLS
GOSUB dibujarp
DO
  a$ = UCASE$(INKEY$)
  GOSUB dibujae
  IF shadow = 0 THEN GOSUB dibujar
  GOSUB dibujam
  IF nieve = 0 THEN GOSUB mueveel
  GOSUB muevoyo
  GOSUB revitr
LOOP

muevoyo:
  SELECT CASE a$
    CASE CHR$(0) + "M"
      GOSUB borrar
      IF fil < fim THEN
        fil = fil + 1
      END IF
    CASE CHR$(0) + "K"
      GOSUB borrar
      IF fil > 2 THEN
        fil = fil - 1
      END IF
    CASE CHR$(0) + "P"
      GOSUB borrar
      'col = col + 1
    CASE CHR$(0) + "H"
      GOSUB borrar
      'col = col - 1
    CASE "Z"
      GOSUB borrar
      posi = 2
      PLAY "mbl64o0gbagfecdd"
      GOSUB dibujar
      GOSUB revisar
      FOR i = 1 TO 5000
      NEXT i
      GOSUB borrar
      posi = 1
    CASE "X"
      GOSUB borrar
      posi = 3
      PLAY "mbl64o0mscdgabaggabc"
      GOSUB dibujar
      GOSUB revisar
      FOR i = 1 TO 5000
      NEXT i
      GOSUB borrar
      posi = 1
    CASE ELSE
      truco$ = truco$ + a$
  END SELECT
RETURN

mueveel:
  enem = enem - thor
  IF enem <= 0 THEN
    GOTO pierdeel
  END IF
  cac = 500
  IF ABS(fim - fil) > 10 THEN
    RN = INT(RND * (fuer + 10))
  ELSE
    RN = INT(RND * cac) + 1
  END IF
  SELECT CASE RN
    CASE IS < fuer
      IF fim > fil THEN
        GOSUB borram
        sran = INT(RND * 6) + 1
        IF sran = 1 THEN
          fim = fim + 1
        ELSEIF sran = 2 THEN
          fim = fim
        ELSE
          fim = fim - 1
        END IF
      ELSE
        GOSUB borram
        fim = fim + 1
      END IF
    CASE fuer + 1
      GOSUB borram
      posm = 2
      GOSUB dibujam
      GOSUB revisar
      FOR i = 1 TO 5000
      NEXT i
      GOSUB borram
      posm = 1
    CASE IS > cac - fuer
      GOSUB borram
      posm = 3
      GOSUB dibujam
      GOSUB revisar
      FOR i = 1 TO 5000
      NEXT i
      GOSUB borram
      posm = 1
  END SELECT
RETURN

revisar:
  IF fil + 10 > fim AND fim + 10 > fil THEN
    IF posi = 2 AND flying = 0 THEN
      enem = enem - pinf: puntos = puntos + 50: nieve = 0: clm = clmant
      IF fim < 60 THEN
        GOSUB borram
        fim = fim + 2
        GOSUB dibujam
      END IF
      IF evil = 1 THEN GOSUB sangram
    END IF
    IF posi = 3 THEN
      enem = enem - patf: puntos = puntos + 10: nieve = 0: clm = clmant
      IF fim < 60 THEN
        GOSUB borram
        fim = fim + 4
        GOSUB dibujam
      END IF
      IF evil = 1 THEN GOSUB sangram
    END IF
    IF posm = 2 AND shadow = 0 AND flying = 0 THEN
      ener = ener - pinm
      IF evil = 1 THEN GOSUB sangrar
    END IF
    IF posm = 3 AND shadow = 0 AND flying = 0 THEN
      ener = ener - patm
      IF evil = 1 THEN GOSUB sangrar
    END IF
  END IF
  IF ener <= 0 THEN
    GOTO PIERDOYO
  END IF
  IF enem <= 0 THEN
    GOTO pierdeel
  END IF
RETURN

dibujae:
  LOCATE 3, 5
    COLOR 14, 0
    FOR i = 1 TO INT(ener / INT(totl / 25))
      PRINT "€";
    NEXT i
    COLOR 4, 0
    FOR i = 1 TO 25 - INT(ener / INT(totl / 25))
      PRINT "€";
    NEXT i
  LOCATE 4, 5
  COLOR 14, 0
  PRINT nombre$ + " " + STR$(ener) + SPACE$(10 - LEN(STR$(ener)))
  LOCATE 3, 50
    COLOR 14, 0
    FOR i = 1 TO INT(enem / INT(totm / 25))
      PRINT "€";
    NEXT i
    COLOR 4, 0
    FOR i = 1 TO 25 - INT(enem / INT(totm / 25))
      PRINT "€";
    NEXT i
  LOCATE 4, 50
  COLOR 14, 0
  PRINT nombrm$ + " " + STR$(enem) + SPACE$(10 - LEN(STR$(enem)))
  COLOR 14, 0
  LOCATE 1, 35
  PRINT RTRIM$(LTRIM$(STR$(puntos)))

  IF eterna = 1 THEN
    COLOR 10, 0
    LOCATE 2, 36
    PRINT "Eternum"
  END IF
  IF evil = 1 THEN
    COLOR 12, 0
    LOCATE 3, 35
    PRINT "Evil Mode"
  END IF
  IF dumb = 1 THEN
    COLOR 11, 0
    LOCATE 4, 35
    PRINT "Dumb Mode"
  END IF
  IF night = 1 THEN
    COLOR 15, 0
    LOCATE 5, 10: PRINT "ﬂﬂﬂ€€€‹"
    LOCATE 6, 10: PRINT "     €€€‹"
    LOCATE 7, 10: PRINT "     €€€ﬂ"
    LOCATE 8, 10: PRINT "‹‹‹€€€ﬂ"
    LOCATE 5, 21: PRINT ""
    LOCATE 5, 37: PRINT "."
    LOCATE 5, 64: PRINT "."
   
    LOCATE 6, 54: PRINT "."
    LOCATE 6, 22: PRINT "."
   
    LOCATE 7, 24: PRINT "."
    LOCATE 7, 33: PRINT "."
    LOCATE 7, 42: PRINT "."
    LOCATE 7, 60: PRINT ""
    LOCATE 7, 79: PRINT "."
   
    LOCATE 8, 24: PRINT "."
    LOCATE 8, 29: PRINT "."
    LOCATE 8, 41: PRINT "."
    LOCATE 8, 57: PRINT "."

    LOCATE 9, 48: PRINT "."
    LOCATE 9, 36: PRINT "."
    LOCATE 9, 53: PRINT "."
    LOCATE 9, 19: PRINT "."
   
    LOCATE 10, 22: PRINT "."
    LOCATE 10, 4: PRINT "."
    LOCATE 10, 56: PRINT "."
    LOCATE 10, 6: PRINT "."
    LOCATE 10, 49: PRINT "."
    LOCATE 10, 15: PRINT "."
  END IF
RETURN

dibujar:
  pers tipo, posi, col, fil, clr, clb
RETURN

borrar:
  pers tipo, posi, col, fil, clb, clb
RETURN

dibujam:
  perm tipm, posm, cmq, fim, clm, cbm
RETURN

borram:
  perm tipm, posm, cmq, fim, cbm, cbm
RETURN

elegmi:
  CLS
  COLOR 14, 0
  LOCATE 2, 10
  PRINT "QuiÇn deseas ser?"
  pers 1, 1, 5, 10, 10, 0
  COLOR 14: LOCATE 4, 10: PRINT "1. Yoshi"
  pers 2, 1, 5, 30, 15, 0
  COLOR 14: LOCATE 4, 30: PRINT "2. Kuyoshi Kanamoto"
  DO
    a$ = INKEY$
    IF a$ = "1" THEN
      tipo = 1
      nombre$ = "Yoshi"
      col = 15
      fil = 10
      clr = 10
      clb = 0
      posi = 1
      ener = 100
      totl = 100
      pinf = 2
      patf = 5
      EXIT DO
    ELSEIF a$ = "2" THEN
      tipo = 2
      nombre$ = "Kuyoshi Kanamoto"
      col = 15
      fil = 10
      clr = 15
      clb = 0
      posi = 1
      ener = 100
      totl = 100
      pinf = 2
      patf = 5
      EXIT DO
    END IF
  LOOP
RETURN

elegel:
    IF a$ = "1" THEN
      fuer = 2
      tipm = 1
      nombrm$ = "El pato italiano"
      cmq = 15
      fim = 50
      clm = 6: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 2
      patm = 10
    ELSEIF a$ = "2" THEN
      fuer = 5
      tipm = 2
      nombrm$ = "Modelo ZT-2300"
      cmq = 15
      fim = 50
      clm = 8: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 3
      patm = 30
    ELSEIF a$ = "3" THEN
      fuer = 5
      tipm = 3
      nombrm$ = "Cobra"
      cmq = 15
      fim = 50
      clm = 2: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 2
      patm = 35
    ELSEIF a$ = "4" THEN
      fuer = 10
      tipm = 4
      nombrm$ = "Li-ku"
      cmq = 15
      fim = 50
      clm = 7: clmant = clm
      cbm = 0
      posm = 1
      enem = 200
      totm = 200
      pinm = 30
      patm = 20
    ELSEIF a$ = "5" THEN
      fuer = 50
      tipm = 5
      nombrm$ = "Kantal"
      cmq = 15
      fim = 50
      clm = 5: clmant = clm
      cbm = 0
      posm = 1
      enem = 1000
      totm = 1000
      pinm = 20
      patm = 50
    ELSEIF a$ = "6" THEN
      fuer = 10
      tipm = 6
      nombrm$ = "Drafhon"
      cmq = 15
      fim = 50
      clm = 2: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 20
      patm = 50
    ELSEIF a$ = "7" THEN
      fuer = 10
      tipm = 7
      nombrm$ = "Fracas"
      cmq = 15
      fim = 50
      clm = 1: clmant = clm
      cbm = 0
      posm = 1
      enem = 500
      totm = 500
      pinm = 5
      patm = 10
    ELSEIF a$ = "8" THEN
      fuer = 20
      tipm = 8
      nombrm$ = "Traquen"
      cmq = 15
      fim = 50
      clm = 13: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 5
      patm = 10
   ELSEIF a$ = "9" THEN
      fuer = 30
      tipm = 9
      nombrm$ = "Yaguen"
      cmq = 15
      fim = 50
      clm = 6: clmant = clm
      cbm = 0
      posm = 1
      enem = 100
      totm = 100
      pinm = 5
      patm = 10
   ELSEIF a$ = "A" THEN
      fuer = 30
      tipm = 10
      nombrm$ = "Yamelenga"
      cmq = 15
      fim = 50
      clm = 7: clmant = clm
      cbm = 0
      posm = 1
      enem = 500
      totm = 500
      pinm = 10
      patm = 20
   ELSEIF a$ = "B" THEN
      fuer = 50
      tipm = 11
      nombrm$ = "Thenga"
      cmq = 15
      fim = 50
      clm = 11: clmant = clm
      cbm = 0
      posm = 1
      enem = 500
      totm = 500
      pinm = 10
      patm = 20
    ELSEIF a$ = "C" THEN
      fuer = 50
      tipm = 12
      nombrm$ = "Raguen"
      cmq = 15
      fim = 50
      clm = 8: clmant = clm
      cbm = 0
      posm = 1
      enem = 5000
      totm = 5000
      pinm = 100
      patm = 100
    END IF
RETURN

elegir:
  GOSUB elegmi
  caso = 1
  GOSUB dibujoel1
  DO
    a$ = UCASE$(INKEY$)
    IF a$ = "+" THEN
      IF caso = 1 THEN
        caso = 2
      ELSEIF caso = 2 THEN
        caso = 3
      ELSEIF caso = 3 THEN
        caso = 1
      END IF
      GOSUB dibujoel1
    ELSE
      tipm = 0
      GOSUB elegel
      IF tipm > 0 THEN EXIT DO
    END IF
  LOOP
RETURN

dibujoel1:
  CLS
  IF caso = 1 THEN
    COLOR 14, 0
    LOCATE 2, 10
    PRINT "Contra quiÇn deseas luchar?"
    perm 1, 1, 5, 10, 6, 0
    COLOR 14: LOCATE 4, 10: PRINT "1. El pato italiano"
    perm 2, 1, 7, 40, 8, 0
    COLOR 14: LOCATE 4, 40: PRINT "2. Modelo ZT-2300"
    perm 3, 1, 7, 70, 2, 0
    COLOR 14: LOCATE 4, 70: PRINT "3. Cobra"
    perm 4, 1, 16, 10, 7, 0
    COLOR 14: LOCATE 12, 10: PRINT "4. Li-ku"
    perm 5, 1, 16, 40, 5, 0
    COLOR 14: LOCATE 15, 40: PRINT "5. Kantal"
    LOCATE 22, 30
    PRINT "+ M†s"
  ELSEIF caso = 2 THEN
    COLOR 14, 0
    LOCATE 2, 10
    PRINT "Contra quiÇn deseas luchar?"
    perm 6, 1, 6, 5, 2, 0
    COLOR 14: LOCATE 4, 5: PRINT "6. Drafhon"
    perm 7, 1, 6, 35, 1, 0
    COLOR 14: LOCATE 4, 35: PRINT "7. Fracas"
    perm 8, 1, 6, 60, 13, 0
    COLOR 14: LOCATE 4, 60: PRINT "8. Traquen"
    perm 9, 1, 16, 5, 6, 0
    COLOR 14: LOCATE 12, 5: PRINT "9. Yaguen"
    perm 10, 1, 16, 35, 7, 0
    COLOR 14: LOCATE 12, 35: PRINT "A. Yamelenga"
    perm 11, 1, 16, 60, 11, 0
    COLOR 14: LOCATE 12, 60: PRINT "B. Thenga"
    LOCATE 22, 30
    PRINT "+ M†s"
  ELSEIF caso = 3 THEN
    perm 12, 1, 6, 5, 8, 0
    COLOR 14: LOCATE 4, 5: PRINT "C. Raguen"
    LOCATE 22, 30
    PRINT "+ M†s"
  END IF
RETURN

doom:
  COLOR 4
  FOR i = 1 TO 80
    FOR j = 1 TO 23
      LOCATE j, i: PRINT "€"
    NEXT j
  NEXT i
  FOR i = 1 TO 5000: NEXT i
  COLOR 6
  FOR i = 1 TO 80
    FOR j = 1 TO 23
      LOCATE j, i: PRINT "€"
    NEXT j
  NEXT i
  FOR i = 1 TO 5000: NEXT i
  COLOR 12
  FOR i = 1 TO 80
    FOR j = 1 TO 23
      LOCATE j, i: PRINT "€"
    NEXT j
  NEXT i
  FOR i = 1 TO 5000: NEXT i
  COLOR 14
  FOR i = 1 TO 80
    FOR j = 1 TO 23
      LOCATE j, i: PRINT "€"
    NEXT j
  NEXT i
  COLOR 0, 0
  CLS
  ener = 0
  enem = 0
  GOSUB dibujarp
  cosas 6, col, fil, 4, clb
  cosas 6, cmq, fim, 4, cbm
  COLOR 14, 0
  COLOR 4
  LOCATE 3, 3: PRINT " €ﬂ€ €ﬂ€ €ﬂ€ €ﬂ €ﬂ€ €  € €ﬂ€ €ﬂ € €ﬂ"
  LOCATE 4, 3: PRINT " € € € € € € €  € € €  € € € €  € € "
  LOCATE 5, 3: PRINT " €ﬂ€ €ﬂﬂ € € €  €ﬂ€ €  € €ﬂﬂ ﬂ€ € ﬂ€"
  LOCATE 6, 3: PRINT " € € €   €‹€ €‹ € € €‹ € €   ‹€ € ‹€"
  FOR i = 1 TO 5
    LOCATE 6 + i, 3: PRINT " € € €   €€€ €€ € € €€ € €   €€ € €€"
  FOR g = 1 TO 10000
  NEXT g
  NEXT i
  PLAY "mbo0l30mlccccccp10cccp10cccccccp10cccp10dddddddp10dddp10dddddddddddddddd"
  DO: LOOP UNTIL INKEY$ = CHR$(32)
  truco$ = ""
  GOTO PIERDOYO
RETURN

godwar:
  totl = 1000
  totm = 1000
  ener = 1000
  enem = 1000
  truco$ = ""
RETURN

begod:
  totl = 1000
  ener = 1000
  truco$ = ""
RETURN

acid:
  FOR i = 1 TO 50
    snx(i) = INT(RND * 80) + 1
    sny(i) = 5
  NEXT i
  COLOR 10, 0
  FOR l = 1 TO 15
    FOR i = 1 TO 50
      sny(i) = sny(i) + INT(RND * 5) + 1
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT "|"
      END IF
    NEXT i
    FOR j = 1 TO 5000
    NEXT j
    FOR i = 1 TO 50
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT " "
      END IF
    NEXT i
  NEXT l
  IF evil THEN
    GOSUB sangrar
    GOSUB sangram
  END IF
  GOSUB dibujarp
  enem = enem - INT(totm / 10)
  ener = ener - INT(totl / 10)
  nieve = 0: clm = clmant
  truco$ = ""
RETURN

snow:
  FOR i = 1 TO 50
    snx(i) = INT(RND * 80) + 1
    sny(i) = 5
  NEXT i
  COLOR 15, 0
  FOR l = 1 TO 15
    FOR i = 1 TO 50
      sny(i) = sny(i) + INT(RND * 5) + 1
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT "*"
      END IF
    NEXT i
    FOR j = 1 TO 5000
    NEXT j
    FOR i = 1 TO 50
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT " "
      END IF
    NEXT i
  NEXT l
  GOSUB dibujarp
  clm = 11
  nieve = 1
  truco$ = ""
RETURN

blood:
  FOR i = 1 TO 50
    snx(i) = INT(RND * 80) + 1
    sny(i) = 5
  NEXT i
  COLOR 4, 0
  FOR l = 1 TO 15
    FOR i = 1 TO 50
      sny(i) = sny(i) + INT(RND * 5) + 1
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT "‹"
      END IF
    NEXT i
    FOR j = 1 TO 5000
    NEXT j
    FOR i = 1 TO 50
      IF sny(i) <= 23 THEN
        LOCATE sny(i), snx(i)
        PRINT " "
      END IF
    NEXT i
  NEXT l
  GOSUB dibujarp
  ener = totl
  truco$ = ""
RETURN

fire:
  PLAY "mbl64o0gbagfecddabcggfegdfagcfcdb"
  fry = col + 1
  COLOR 14, 0
  FOR frx = fil + 5 TO fim - 3
    LOCATE fry - 1, frx: PRINT " €"
    LOCATE fry, frx:     PRINT "€€€"
    LOCATE fry + 1, frx: PRINT " €"
    FOR j = 1 TO 500
    NEXT j
    LOCATE fry - 1, frx: PRINT "  "
    LOCATE fry, frx:     PRINT "   "
    LOCATE fry + 1, frx: PRINT "  "
  NEXT frx
  IF evil = 1 THEN GOSUB sangram
  IF fim < 60 THEN
    GOSUB borram
    fim = fim + 10
    GOSUB dibujam
  END IF
  enem = enem - (2 * patf)
  nieve = 0: clm = clmant
  truco$ = ""
RETURN

nuke:
  PLAY "mbl64o0gbagfecddabcggfegdfagcfcdb"
  fry = col + 1
  COLOR 14, 0
  FOR frx = fil + 5 TO fim - 3
    LOCATE fry - 3, frx: PRINT "   €"
    LOCATE fry - 2, frx: PRINT "  €€€"
    LOCATE fry - 1, frx: PRINT " €€€€€"
    LOCATE fry, frx:     PRINT "€€€€€€€"
    LOCATE fry + 1, frx: PRINT " €€€€€"
    LOCATE fry + 2, frx: PRINT "  €€€"
    LOCATE fry + 3, frx: PRINT "   €"
    FOR j = 1 TO 500
    NEXT j
    LOCATE fry - 3, frx: PRINT "    "
    LOCATE fry - 2, frx: PRINT "     "
    LOCATE fry - 1, frx: PRINT "      "
    LOCATE fry, frx:     PRINT "       "
    LOCATE fry + 1, frx: PRINT "      "
    LOCATE fry + 2, frx: PRINT "     "
    LOCATE fry + 3, frx: PRINT "    "
  NEXT frx
  IF evil = 1 THEN GOSUB sangram
  enem = enem - INT(totm / 2)
  IF fim < 60 THEN
    GOSUB borram
    fim = fim + 10
    GOSUB dibujam
  END IF
  nieve = 0: clm = clmant
  truco$ = ""
RETURN

super:
  patf = patf * 2
  pinf = pinf * 2
  truco$ = ""
RETURN

care:
  pinm = 0
  patm = 0
  truco$ = ""
RETURN

shadow:
  shadow = 1
  truco$ = ""
RETURN

flying:
  GOSUB borrar
  col = 13
  GOSUB dibujar
  flying = 1
  truco$ = ""
RETURN

down:
  GOSUB borrar
  col = 15
  GOSUB dibujar
  flying = 0
  truco$ = ""
RETURN

dumb:
  fuer = 0
  dumb = 1
  truco$ = ""
RETURN

night:
  night = 1
  truco$ = ""
RETURN

pause:
  DO
  LOOP UNTIL INKEY$ = CHR$(13)
  truco$ = ""
RETURN

freeze:
  PLAY "mbl64o0gbagfecddabcggfegdfagcfcdb"
  fry = col + 1
  COLOR 3, 0
  FOR frx = fil + 5 TO fim - 3
    LOCATE fry - 1, frx: PRINT " €"
    LOCATE fry, frx:     PRINT "€€€"
    LOCATE fry + 1, frx: PRINT " €"
    FOR j = 1 TO 500
    NEXT j
    LOCATE fry - 1, frx: PRINT "  "
    LOCATE fry, frx:     PRINT "   "
    LOCATE fry + 1, frx: PRINT "  "
  NEXT frx
  clm = 11
  nieve = 1
  truco$ = ""
RETURN

fatal:
  PLAY "mbl64o0gbagfecddabcggfegdfagcfcdb"
  fry = col + 1
  COLOR 12, 0
  FOR frx = fil + 5 TO fim - 3
    LOCATE fry - 3, frx: PRINT "   €"
    LOCATE fry - 2, frx: PRINT "  €€€"
    LOCATE fry - 1, frx: PRINT " €€€€€"
    LOCATE fry, frx:     PRINT "€€€€€€€"
    LOCATE fry + 1, frx: PRINT " €€€€€"
    LOCATE fry + 2, frx: PRINT "  €€€"
    LOCATE fry + 3, frx: PRINT "   €"
    FOR j = 1 TO 500
    NEXT j
    LOCATE fry - 3, frx: PRINT "    "
    LOCATE fry - 2, frx: PRINT "     "
    LOCATE fry - 1, frx: PRINT "      "
    LOCATE fry, frx:     PRINT "       "
    LOCATE fry + 1, frx: PRINT "      "
    LOCATE fry + 2, frx: PRINT "     "
    LOCATE fry + 3, frx: PRINT "    "
  NEXT frx
  COLOR 0, 0
  CLS
  enem = 0
  GOSUB dibujar
  GOSUB dibujarp
  cosas 6, cmq, fim, 4, cbm
  truco$ = ""
FOR i = 1 TO 5000: NEXT i
 COLOR 4
 LOCATE 3, 3: PRINT " €€€€€€€ ‹€‹ €€€€€ ‹€‹ €   € €€€€€ €   €"
 LOCATE 4, 3: PRINT " €       € €   €   € € €   €   €   ﬂ€ €ﬂ"
 LOCATE 5, 3: PRINT " €ﬂﬂﬂﬂﬂﬂ €‹€   €   €‹€ €   €   €    ﬂ€ﬂ"
 LOCATE 6, 3: PRINT " €       € €   €   € € €   €   €     €"
FOR i = 1 TO 5
 LOCATE 6 + i, 3:  PRINT " €       € €   €   € € €€€ €   €     €"
 FOR g = 1 TO 10000
 NEXT g
NEXT i
PLAY "o3l30mlfedddddddgabbbbbbbo0msddddmlcccccccccc"
RETURN

evil:
  evil = 1
RETURN

thor:
  FOR i = 1 TO 10
    pers tipo, posi, col, fil, 12, clb
    FOR j = 1 TO 100
    NEXT j
    PLAY "o1c64"
    pers tipo, posi, col, fil, 15, clb
    FOR j = 1 TO 100
    NEXT j
    PLAY "o1c64"
  NEXT i
  IF thor = 0 THEN
    thor = 1
  ELSE
    thor = thor * 2
  END IF
  truco$ = ""
RETURN

eterna:
  eterna = 1
  totl = 1000000
  ener = 1000000
  totm = 1000000
  enem = 1000000
RETURN

quit:
  SYSTEM
RETURN

revitr:
  IF UCASE$(RIGHT$(truco$, 6)) = "ETERNA" THEN GOSUB eterna: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 6)) = "FLYING" THEN GOSUB flying: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 6)) = "GODWAR" THEN GOSUB godwar: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 6)) = "SHADOW" THEN GOSUB shadow: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "BEGOD" THEN GOSUB begod: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "BLOOD" THEN GOSUB blood: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "SUPER" THEN GOSUB super: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "PAUSE" THEN GOSUB pause: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "NIGHT" THEN GOSUB night: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 5)) = "FATAL" THEN GOSUB fatal: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "THOR" THEN GOSUB thor: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "CARE" THEN GOSUB care: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "ACID" THEN GOSUB acid: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "SNOW" THEN GOSUB snow: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "FIRE" THEN GOSUB fire: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "DUMB" THEN GOSUB dumb: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "EXIT" THEN GOSUB quit: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "QUIT" THEN GOSUB quit: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "DOOM" THEN GOSUB doom: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "DOWN" THEN GOSUB down: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "NUKE" THEN GOSUB nuke: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 4)) = "EVIL" THEN GOSUB evil: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 3)) = "ICE" THEN GOSUB freeze: GOSUB revisar
  IF UCASE$(RIGHT$(truco$, 1)) = ";" THEN enem = 0: truco$ = "": GOSUB revisar
RETURN

dibujarp:
  COLOR 7, 0
  FOR i = 21 TO 23
    FOR j = 1 TO 80
      LOCATE i, j: PRINT "€"
    NEXT j
  NEXT i
RETURN

sangrar:
  FOR i = 1 TO 5
    cosas i, col, fil, 4, clb
    FOR j = 1 TO 5000
    NEXT j
    cosas i, col, fil, clb, clb
  NEXT i
  GOSUB dibujarp
RETURN

sangram:
  FOR i = 1 TO 5
    cosas i, cmq, fim, 4, cbm
    FOR j = 1 TO 5000
    NEXT j
    cosas i, cmq, fim, cbm, cbm
  NEXT i
  GOSUB dibujarp
RETURN

modo:
COLOR 14, 0
CLS
LOCATE 5, 32: PRINT "Battle Yoshi"
LOCATE 9, 30: PRINT "1. Modo pr†ctica"
LOCATE 11, 30: PRINT "2. Modo combate"
LOCATE 13, 30: PRINT "3. Modo torneo"
DO
  a$ = INKEY$
  IF a$ = "1" THEN
    modo = 3
    EXIT DO
  ELSEIF a$ = "2" THEN
    modo = 1
    EXIT DO
  ELSEIF a$ = "3" THEN
    modo = 2
    EXIT DO
  END IF
LOOP
RETURN

proximo:
  actual = actual + 1
  IF actual > 12 THEN SYSTEM
  a$ = LTRIM$(RTRIM$(STR$(actual)))
  IF a$ = "10" THEN
    a$ = "A"
  ELSEIF a$ = "11" THEN
    a$ = "B"
  ELSEIF a$ = "12" THEN
    a$ = "C"
  END IF
  GOSUB elegel
  COLOR 14, 0
  CLS
  LOCATE 5, 10: PRINT nombre$
  LOCATE 5, 30: PRINT "VS."
  LOCATE 5, 50: PRINT nombrm$
  pers tipo, 1, 10, 10, clr, clb
  perm actual, 1, 10, 50, clm, cbm
  COLOR 14, 0
  LOCATE 22, 27: PRINT "Presione Z para continuar"
  DO: LOOP UNTIL UCASE$(INKEY$) = "Z"
RETURN

persol:
  IF selecto = 1 THEN
    COLOR 14, 0
    CLS
    PRINT
    PRINT "Modo pr†ctica"
    PRINT
    PRINT "1. Seleccionar personajes"
    PRINT
    PRINT "2. Luchar con los mismos"
    DO
      a$ = INKEY$
      IF a$ = "1" THEN
        noelegir = 0
        EXIT DO
      ELSEIF a$ = "2" THEN
        noelegir = 1
        EXIT DO
      END IF
    LOOP
  ELSE
    noelegir = 0
  END IF
  IF noelegir = 0 THEN
    COLOR 14, 0
    CLS
    PRINT
    PRINT "Selecci¢n de luchador propio"
    PRINT
    selecto = 1
    INPUT "Dibujo (1-2): ", tipo1
    INPUT "Nombre: ", nombre1$
    INPUT "Color (0-15): ", clr1
    INPUT "Color de fondo (0-15): ", clb1
    INPUT "Energ°a: ", ener1
    INPUT "Total de energ°a: ", totl1
    INPUT "Fuerza de la pi§a: ", pinf1
    INPUT "Fuerza de la patada: ", patf1
    tipo = tipo1
    nombre$ = nombre1$
    clr = clr1
    clb = clb1
    ener = ener1
    totl = totl1
    pinf = pinf1
    patf = patf1
    col = 15
    fil = 10
    posi = 1
  ELSE
    tipm = tipm1
    nombrm$ = nombrm1$
    clm = clm1: clmant = clm
    cbm = cbm1
    enem = enem1
    totm = totm1
    pinm = pinm1
    patm = patm1
    fuer = fuer1
    cmq = 15
    fim = 50
    posm = 1
  END IF
RETURN

persom:
  IF noelegir = 0 THEN
    COLOR 14, 0
    CLS
    PRINT
    PRINT "Selecci¢n de luchador enemigo"
    PRINT
    INPUT "Dibujo (0-12): ", tipm1
    INPUT "Nombre: ", nombrm1$
    INPUT "Color (0-15): ", clm1
    INPUT "Color de fondo (0-15): ", cbm1
    INPUT "Energ°a: ", enem1
    INPUT "Total de energ°a: ", totm1
    INPUT "Fuerza: ", fuer1
    INPUT "Fuerza de la pi§a: ", pinm1
    INPUT "Fuerza de la patada: ", patm1
    tipm = tipm1
    nombrm$ = nombrm1$
    clm = clm1: clmant = clm
    cbm = cbm1
    enem = enem1
    totm = totm1
    pinm = pinm1
    patm = patm1
    fuer = fuer1
    cmq = 15
    fim = 50
    posm = 1
  ELSE
    tipm = tipm1
    nombrm$ = nombrm1$
    clm = clm1: clmant = clm
    cbm = cbm1
    enem = enem1
    totm = totm1
    pinm = pinm1
    patm = patm1
    fuer = fuer1
    cmq = 15
    fim = 50
    posm = 1
  END IF
RETURN

PIERDOYO:
  GOSUB borrar
  cosas 6, col, fil, 4, clb
  COLOR 4, 0
  LOCATE 12, 35
  PRINT "GAME OVER"
  DO: LOOP UNTIL INKEY$ = CHR$(13)
  IF modo = 2 THEN
    CLS
    PLAY "mbo3l8ababcdde"
    COLOR 14
    LOCATE 12, 25
    PRINT "Has obtenido " + RTRIM$(LTRIM$(STR$(puntos))) + " puntos."
    DO: LOOP UNTIL INKEY$ = CHR$(13)
    SYSTEM
  ELSE
    GOTO 1
  END IF

pierdeel:
  IF ener = totl THEN
    puntos = puntos + 200
  ELSE
    puntos = puntos + 100
  END IF
  GOSUB borram
  cosas 6, cmq, fim, 4, cbm
  COLOR 14, 0
  LOCATE 12, 35
  PRINT "Ganaste."
  DO: LOOP UNTIL INKEY$ = CHR$(13)
  SLEEP
  GOTO 1

SUB cosas (cosa, y, x, k, kb)
  SELECT CASE cosa
    CASE 1
        COLOR k, kb
        LOCATE y - 1, x: PRINT "               "
        LOCATE y, x:     PRINT "  €   €        "
        LOCATE y + 1, x: PRINT "      €        "
        LOCATE y + 2, x: PRINT "      €   ﬂ    "
        LOCATE y + 3, x: PRINT "   ‹  €€       "
        LOCATE y + 4, x: PRINT "    €€≤≤€€     "
        LOCATE y + 5, x: PRINT "   €≤±∞∞±≤€    "
    CASE 2
        COLOR k, kb
        LOCATE y - 1, x: PRINT "               "
        LOCATE y, x:     PRINT "    €€    €€   "
        LOCATE y + 1, x: PRINT "   €≤≤€  €≤≤€  "
        LOCATE y + 2, x: PRINT "‹ €±±±±€€±±±±€ "
        LOCATE y + 3, x: PRINT " €∞∞∞∞∞€€∞∞∞∞∞€"
        LOCATE y + 4, x: PRINT "€€∞∞∞∞∞€€∞∞∞∞∞€"
        LOCATE y + 5, x: PRINT " €∞∞∞∞€€€€∞∞∞∞€"
    CASE 3
        COLOR k, kb
        LOCATE y, x:     PRINT "‹   ‹‹    ‹‹   "
        LOCATE y + 1, x: PRINT "   ‹ﬂﬂ‹  ‹ﬂﬂ‹  "
        LOCATE y + 2, x: PRINT "   €≤≤≤€€≤≤≤€  "
        LOCATE y + 3, x: PRINT "  €±±±±€€±±±±€ "
        LOCATE y + 4, x: PRINT "  €±±±±€€±±±±€ "
        LOCATE y + 5, x: PRINT "  €±±±€€€€±±±€ "
    CASE 4
        COLOR k, kb
        LOCATE y - 1, x: PRINT "     ‹‹‹       "
        LOCATE y, x:     PRINT "    €   €      "
        LOCATE y + 1, x: PRINT "        €  €   "
        LOCATE y + 2, x: PRINT "    €  €€€     "
        LOCATE y + 3, x: PRINT "     ‹€≤≤€€  € "
        LOCATE y + 4, x: PRINT "   ‹€€≤±±≤€€‹  "
        LOCATE y + 5, x: PRINT " ‹€€€≤±∞∞±≤€€€‹"
    CASE 5
        COLOR k, kb
        LOCATE y - 1, x: PRINT "               "
        LOCATE y, x:     PRINT "               "
        LOCATE y + 1, x: PRINT "       €       "
        LOCATE y + 2, x: PRINT "       €       "
        LOCATE y + 3, x: PRINT "    € €≤€      "
        LOCATE y + 4, x: PRINT "     €≤±≤€     "
        LOCATE y + 5, x: PRINT "   ‹€≤±∞±≤€‹€  "
    CASE 6
        COLOR k, kb
        LOCATE y - 1, x: PRINT "               "
        LOCATE y, x:     PRINT "               "
        LOCATE y + 1, x: PRINT "               "
        LOCATE y + 2, x: PRINT "               "
        LOCATE y + 3, x: PRINT "               "
        LOCATE y + 4, x: PRINT "     ‹‹‹‹‹‹‹   "
        LOCATE y + 5, x: PRINT " ‹€€€€€€€€€€€‹ "

  END SELECT
END SUB

SUB perm (tipo, posit, y, x, k, kb)
  SELECT CASE tipo
    CASE 0
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT "   €€"
          LOCATE y + 1, x: PRINT "€ €€€€"
          LOCATE y + 2, x: PRINT "ﬂﬂ€€€€"
          LOCATE y + 3, x: PRINT "  €€€€"
          LOCATE y + 4, x: PRINT "  € €€"
          LOCATE y + 5, x: PRINT " ‹€ ‹€"
        CASE 2
          COLOR k, kb
          LOCATE y, x - 3:     PRINT "      €€"
          LOCATE y + 1, x - 3: PRINT "‹‹   €€€€"
          LOCATE y + 2, x - 3: PRINT " ﬂﬂﬂ€€€€€"
          LOCATE y + 3, x - 3: PRINT "     €€€€"
          LOCATE y + 4, x - 3: PRINT "     € €€"
          LOCATE y + 5, x - 3: PRINT "    ‹€ ‹€"
        CASE 3
          COLOR k, kb
          LOCATE y, x - 3:     PRINT "      €€"
          LOCATE y + 1, x - 3: PRINT "   € €€€€"
          LOCATE y + 2, x - 3: PRINT "   ﬂﬂ€€€€"
          LOCATE y + 3, x - 3: PRINT "€‹‹‹‹€€€€"
          LOCATE y + 4, x - 3: PRINT "       €€"
          LOCATE y + 5, x - 3: PRINT "       ‹€"
      END SELECT
    CASE 1
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT "   ‹€€‹ "
          LOCATE y + 1, x: PRINT "‹‹€€€‹€ "
          LOCATE y + 2, x: PRINT "   €€€€"
          LOCATE y + 3, x: PRINT "   €€€€‹"
          LOCATE y + 4, x: PRINT " ‹€€€€€€€€"
          LOCATE y + 5, x: PRINT " €€€€€€€€€€€€"
        CASE 2
          COLOR k, kb
          LOCATE y, x - 3:     PRINT "   ‹€€‹ "
          LOCATE y + 1, x - 3: PRINT "‹‹€€€‹€ "
          LOCATE y + 2, x - 3: PRINT "‹‹ﬂ€€€€"
          LOCATE y + 3, x - 3: PRINT "   ﬂ€€€€‹"
          LOCATE y + 4, x - 3: PRINT "   ‹€€€€€€€€"
          LOCATE y + 5, x - 3: PRINT "    €€€€€€€€€€€€"
        CASE 3
          COLOR k, kb
          LOCATE y, x - 3:     PRINT "   ‹€€‹ "
          LOCATE y + 1, x - 3: PRINT "‹‹€€€‹€ "
          LOCATE y + 2, x - 3: PRINT "   €€€€"
          LOCATE y + 3, x - 3: PRINT "    €€€€‹"
          LOCATE y + 4, x - 3: PRINT "  ‹€€€€€€€€"
          LOCATE y + 5, x - 3: PRINT "   €€€€€€€€€€€€"
      END SELECT
    CASE 2
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 2, x: PRINT "   €€€"
          LOCATE y - 1, x: PRINT "  ﬂ€€€"
          LOCATE y, x:     PRINT "  ‹€€€€€"
          LOCATE y + 1, x: PRINT "  €€€€€€€"
          LOCATE y + 2, x: PRINT "   €€€€€€"
          LOCATE y + 3, x: PRINT "    €€€€€"
          LOCATE y + 4, x: PRINT "    €€€€  "
          LOCATE y + 5, x: PRINT "   ‹€€€€"
        CASE 2
          COLOR k, kb
          LOCATE y - 2, x - 3: PRINT "      €€€"
          LOCATE y - 1, x - 3: PRINT "     ﬂ€€€"
          LOCATE y, x - 3:     PRINT "‹‹   ‹€€€€€"
          LOCATE y + 1, x - 3: PRINT "€€€€€€€€€€€"
          LOCATE y + 2, x - 3: PRINT "ﬂﬂ   ﬂ€€€€€"
          LOCATE y + 3, x - 3: PRINT "       €€€€"
          LOCATE y + 4, x - 3: PRINT "       €€€€  "
          LOCATE y + 5, x - 3: PRINT "      ‹€€€€"
        CASE 3
          COLOR k, kb
          LOCATE y - 2, x - 3: PRINT "      €€€"
          LOCATE y - 1, x - 3: PRINT "     ﬂ€€€"
          LOCATE y, x - 3:     PRINT "     ‹€€€€€"
          LOCATE y + 1, x - 3: PRINT "‹‹   €€€€€€€"
          LOCATE y + 2, x - 3: PRINT "€€€€€€€€€€€€"
          LOCATE y + 3, x - 3: PRINT "       €€€€€"
          LOCATE y + 4, x - 3: PRINT "       €€€"
          LOCATE y + 5, x - 3: PRINT "      ‹€€€"
      END SELECT
   CASE 3
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT "ﬂﬂ€‹"
          LOCATE y + 1, x: PRINT "ﬂﬂﬂ€"
          LOCATE y + 2, x: PRINT "   ﬂ€"
          LOCATE y + 3, x: PRINT "    ﬂ€"
          LOCATE y + 4, x: PRINT "     ﬂﬂﬂﬂ€"
          LOCATE y + 5, x: PRINT " €ﬂﬂﬂﬂﬂﬂﬂﬂ"
        CASE 2
          COLOR k, kb
          LOCATE y, x:     PRINT "‹‹€‹"
          LOCATE y + 1, x: PRINT "ﬂﬂﬂ€"
          LOCATE y + 2, x: PRINT "   ﬂ€"
          LOCATE y + 3, x: PRINT "    ﬂ€"
          LOCATE y + 4, x: PRINT "     ﬂﬂﬂﬂ€"
          LOCATE y + 5, x: PRINT " €ﬂﬂﬂﬂﬂﬂﬂﬂ"
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT "ﬂﬂ€‹"
          LOCATE y + 1, x: PRINT "ﬂﬂﬂ€"
          LOCATE y + 2, x: PRINT "   ﬂ€"
          LOCATE y + 3, x: PRINT "    ﬂ€"
          LOCATE y + 4, x: PRINT "     ﬂﬂﬂﬂﬂﬂ€‹‹‹‹"
          LOCATE y + 5, x: PRINT "               ﬂﬂ€‹"
      END SELECT
   CASE 4
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 3, x: PRINT "  ‹€‹"
          LOCATE y - 2, x: PRINT "ﬂﬂ€€€ﬂﬂ"
          LOCATE y - 1, x: PRINT " ﬂ€€€"
          LOCATE y, x:     PRINT "   €€"
          LOCATE y + 1, x: PRINT " ‹€€€€‹"
          LOCATE y + 2, x: PRINT " €€€€€ €"
          LOCATE y + 3, x: PRINT "€ €€€€ €"
          LOCATE y + 4, x: PRINT "  € €€"
          LOCATE y + 5, x: PRINT " ‹€ ‹€"
        CASE 2
          COLOR k, kb
          LOCATE y - 3, x - 4: PRINT "      ‹€‹"
          LOCATE y - 2, x - 4: PRINT "    ﬂﬂ€€€ﬂﬂ"
          LOCATE y - 1, x - 4: PRINT "     ﬂ€€€"
          LOCATE y, x - 4:     PRINT "       €€"
          LOCATE y + 1, x - 4: PRINT "€‹‹‹‹‹€€€€‹"
          LOCATE y + 2, x - 4: PRINT "      €€€€ €"
          LOCATE y + 3, x - 4: PRINT "      €€€€ €"
          LOCATE y + 4, x - 4: PRINT "      € €€"
          LOCATE y + 5, x - 4: PRINT "     ‹€ ‹€"
        CASE 3
          COLOR k, kb
          LOCATE y - 3, x - 4: PRINT "      ‹€‹"
          LOCATE y - 2, x - 4: PRINT "    ﬂﬂ€€€ﬂﬂ"
          LOCATE y - 1, x - 4: PRINT "     ﬂ€€€"
          LOCATE y, x - 4:     PRINT "       €€"
          LOCATE y + 1, x - 4: PRINT "     ‹€€€€‹"
          LOCATE y + 2, x - 4: PRINT "     €€€€€ €"
          LOCATE y + 3, x - 4: PRINT "‹   € €€€€ €"
          LOCATE y + 4, x - 4: PRINT "ﬂﬂﬂﬂﬂﬂﬂﬂ€€"
          LOCATE y + 5, x - 4: PRINT "        ‹€"
      END SELECT
   CASE 5
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT " €        €"
          LOCATE y + 1, x: PRINT "  €      €"
          LOCATE y + 2, x: PRINT "  €      €"
          LOCATE y + 3, x: PRINT "   €‹  ‹€"
          LOCATE y + 4, x: PRINT "  €€€€€€€€‹"
          LOCATE y + 5, x: PRINT "‹€€€€€€€€€€€€‹‹‹‹‹"
        CASE 2
          COLOR k, kb
          LOCATE y + 2, x - 2: PRINT "€‹‹‹‹ €‹‹‹"
          LOCATE y + 3, x - 2: PRINT "     €‹  ‹€"
          LOCATE y + 4, x - 2: PRINT "    €€€€€€€€‹"
          LOCATE y + 5, x - 2: PRINT "  ‹€€€€€€€€€€€€‹‹‹‹‹"
        CASE 3
          COLOR k, kb
          LOCATE y, x - 3:     PRINT "  ‹ﬂﬂﬂ€"
          LOCATE y + 1, x - 3: PRINT " €    €‹‹"
          LOCATE y + 2, x - 3: PRINT "      €  €"
          LOCATE y + 3, x - 3: PRINT "     €‹  ‹€"
          LOCATE y + 4, x - 3: PRINT "  ‹€€€€€€€€€€‹"
          LOCATE y + 5, x - 3: PRINT "‹€€€€€€€€€€€€€€€‹‹‹‹‹"
      END SELECT
    CASE 6
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 1, x: PRINT "      ‹‹      "
          LOCATE y, x:     PRINT "     ﬂ∞∞      "
          LOCATE y + 1, x: PRINT "     ‹‹‹‹     "
          LOCATE y + 2, x: PRINT "  ∞‹€ €∞‹€    "
          LOCATE y + 3, x: PRINT "      €€      "
          LOCATE y + 4, x: PRINT "      €€      "
          LOCATE y + 5, x: PRINT "      ﬂ€‹ﬂ‹ﬂ‹ "
        CASE 2
          COLOR k, kb
          LOCATE y - 1, x: PRINT "      ‹‹      "
          LOCATE y, x:     PRINT "     ﬂ∞∞      "
          LOCATE y + 1, x: PRINT "     ‹‹‹‹     "
          LOCATE y + 2, x: PRINT " ∞‹‹ﬂ €∞‹€    "
          LOCATE y + 3, x: PRINT "      €€      "
          LOCATE y + 4, x: PRINT "      €€      "
          LOCATE y + 5, x: PRINT "      ﬂ€‹ﬂ‹ﬂ  "
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT " €∞∞∞         "
          LOCATE y + 1, x: PRINT "     ‹‹‹‹     "
          LOCATE y + 2, x: PRINT "    € €∞‹€    "
          LOCATE y + 3, x: PRINT "    ∞ €€      "
          LOCATE y + 4, x: PRINT "       €€     "
          LOCATE y + 5, x: PRINT "        ﬂ€‹ﬂ‹ﬂ"
      END SELECT
    CASE 7
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT "    ‹ﬂﬂﬂ‹     "
          LOCATE y + 1, x: PRINT "   €€ ‹€€€‹   "
          LOCATE y + 2, x: PRINT "      ﬂ±±±ﬂ   "
          LOCATE y + 3, x: PRINT "     ±‹€€€‹   "
          LOCATE y + 4, x: PRINT "       €€±‹ﬂ  "
          LOCATE y + 5, x: PRINT "      ‹€ €‹   "
        CASE 2
          COLOR k, kb
          LOCATE y, x:     PRINT "     ‹ﬂﬂﬂ‹    "
          LOCATE y + 1, x: PRINT "    €€ ‹€€€‹  "
          LOCATE y + 2, x: PRINT " ±±    ﬂ±±±ﬂ  "
          LOCATE y + 3, x: PRINT " ±€€€€€‹€€€‹  "
          LOCATE y + 4, x: PRINT " ±±     €€±‹ﬂ "
          LOCATE y + 5, x: PRINT "       ‹€ €‹  "
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT "     ‹ﬂﬂﬂ‹    "
          LOCATE y + 1, x: PRINT "    €€ ‹€€€‹  "
          LOCATE y + 2, x: PRINT "       ﬂ±±±ﬂ  "
          LOCATE y + 3, x: PRINT "      ±‹€€€‹  "
          LOCATE y + 4, x: PRINT " €‹‹‹‹‹‹€€±‹ﬂ "
          LOCATE y + 5, x: PRINT "         ﬂ€‹  "
      END SELECT
    CASE 8
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT " ‹‹   €ﬂ‹   "
          LOCATE y + 1, x: PRINT " €\/€ﬂﬂﬂ‹   €  "
          LOCATE y + 2, x: PRINT " €≈≈€    ﬂ‹ﬂ   "
          LOCATE y + 3, x: PRINT "  ﬂﬂ   ‹ﬂﬂ €   "
          LOCATE y + 4, x: PRINT "  €‹€ﬂ    ‹€‹ "
          LOCATE y + 5, x: PRINT "  €ﬂ    ‹€ﬂ€ﬂ€‹"
        CASE 2
          COLOR k, kb
          LOCATE y - 1, x: PRINT " €€ﬂﬂﬂ‹‹‹      "
          LOCATE y, x:     PRINT " ‹‹     ﬂﬂ‹   "
          LOCATE y + 1, x: PRINT " €\/€ﬂﬂﬂ‹   €   "
          LOCATE y + 2, x: PRINT " €≈≈€    ﬂ‹ﬂ    "
          LOCATE y + 3, x: PRINT "  ﬂﬂ   ‹ﬂﬂ €    "
          LOCATE y + 4, x: PRINT "   €‹€ﬂ  ‹€‹   "
          LOCATE y + 5, x: PRINT "   €ﬂ  ‹€ﬂ€ﬂ€‹ "
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT " ‹‹     €ﬂ‹  "
          LOCATE y + 1, x: PRINT " €--€ﬂﬂﬂ‹     € "
          LOCATE y + 2, x: PRINT " €≈≈€    ﬂ‹‹‹ﬂ  "
          LOCATE y + 3, x: PRINT "  ﬂﬂ  ‹€€ﬂﬂ€    "
          LOCATE y + 4, x: PRINT " €‹€€ﬂﬂ   ‹€‹  "
          LOCATE y + 5, x: PRINT " €ﬂ     ‹€ﬂ€ﬂ€‹"
      END SELECT
    CASE 9
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 1, x: PRINT "  ‹€€€€€€€€/€    "
          LOCATE y, x:     PRINT "   € € € € €€    "
          LOCATE y + 1, x: PRINT "           €‹‹   "
          LOCATE y + 2, x: PRINT "           €  ﬂ‹ "
          LOCATE y + 3, x: PRINT "           € ‹‹ﬂ "
          LOCATE y + 4, x: PRINT "    ‹ ‹ ‹  €     "
          LOCATE y + 5, x: PRINT "  ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
        CASE 2
          COLOR k, kb
          LOCATE y - 1, x: PRINT "        ‹       "
          LOCATE y, x:     PRINT "       €*€      "
          LOCATE y + 1, x: PRINT " ‹€€€€€€€€€€‹   "
          LOCATE y + 2, x: PRINT "  € € € € €  ﬂ‹ "
          LOCATE y + 3, x: PRINT "   € € €  € ‹‹ﬂ "
          LOCATE y + 4, x: PRINT "  ﬂ€€€€€€€€     "
          LOCATE y + 5, x: PRINT "         €€ﬂ€ﬂ€ "
        CASE 3
          COLOR k, kb
          LOCATE y - 1, x: PRINT "   ‹€€€€€€€€/€    "
          LOCATE y, x:     PRINT "    € € € € €€    "
          LOCATE y + 1, x: PRINT " ‹‹         € ﬂ‹  "
          LOCATE y + 2, x: PRINT " ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€ﬂﬂ   "
          LOCATE y + 3, x: PRINT "            €     "
          LOCATE y + 4, x: PRINT "     ‹ ‹ ‹  €     "
          LOCATE y + 5, x: PRINT "   ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
      END SELECT
    CASE 10
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 1, x: PRINT "     € € €       "
          LOCATE y, x:     PRINT "     €\ /€       "
          LOCATE y + 1, x: PRINT "  ‹   €€€€‹      "
          LOCATE y + 2, x: PRINT "  ‹€ﬂﬂﬂ€€€€€‹    "
          LOCATE y + 3, x: PRINT "  ‹ﬂ    €€€€€€‹  "
          LOCATE y + 4, x: PRINT "         ﬂ€ﬂ€ﬂ   "
          LOCATE y + 5, x: PRINT "                  "
        CASE 2
          COLOR k, kb
          LOCATE y - 1, x: PRINT "     € € €       "
          LOCATE y, x:     PRINT "     €\ /€       "
          LOCATE y + 1, x: PRINT "      €€€€‹      "
          LOCATE y + 2, x: PRINT " €ﬂﬂﬂﬂ€€€€€‹    "
          LOCATE y + 3, x: PRINT "        €€€€€€‹  "
          LOCATE y + 4, x: PRINT "         ﬂ€ﬂ€ﬂ   "
          LOCATE y + 5, x: PRINT "                  "
        CASE 3
          COLOR k, kb
          LOCATE y - 1, x: PRINT "     € € €       "
          LOCATE y, x:     PRINT "     €\ /€       "
          LOCATE y + 1, x: PRINT "      €€€€‹      "
          LOCATE y + 2, x: PRINT "     ‹ﬂﬂ€€€€€‹   "
          LOCATE y + 3, x: PRINT " ‹‹‹ﬂ    €€€€€€‹ "
          LOCATE y + 4, x: PRINT " €€       ﬂ€ﬂ€ﬂ  "
          LOCATE y + 5, x: PRINT "                  "
      END SELECT
    CASE 11
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT "               "
          LOCATE y + 1, x: PRINT "       ∞∞        "
          LOCATE y + 2, x: PRINT "     ‹‹‹‹‹       "
          LOCATE y + 3, x: PRINT " ∞‹€€€∞‹€     "
          LOCATE y + 4, x: PRINT "      €€€        "
          LOCATE y + 5, x: PRINT "    (OOOOO)____  "
        CASE 2
          COLOR k, kb
          LOCATE y, x:     PRINT "               "
          LOCATE y + 1, x: PRINT "        ∞∞       "
          LOCATE y + 2, x: PRINT " ∞   ‹‹‹‹‹      "
          LOCATE y + 3, x: PRINT " ∞‹‹€€€∞‹€    "
          LOCATE y + 4, x: PRINT "       €€€       "
          LOCATE y + 5, x: PRINT "     (OOOOO)____ "
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT "               "
          LOCATE y + 1, x: PRINT "        ∞∞       "
          LOCATE y + 2, x: PRINT "      ‹‹‹‹‹      "
          LOCATE y + 3, x: PRINT "     €€€∞‹€    "
          LOCATE y + 4, x: PRINT "     ∞ €€€       "
          LOCATE y + 5, x: PRINT " OOOOOOOOO)____ "
      END SELECT
    CASE 12
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 1, x: PRINT " ‹€€€€   ‹€€‹   "
          LOCATE y, x:     PRINT " €ﬂ  ≥ ‹‹€**€‹  "
          LOCATE y + 1, x: PRINT "     €€€€€€€€€€ "
          LOCATE y + 2, x: PRINT "     ≥  €€€€€€€ "
          LOCATE y + 3, x: PRINT "     ≥  €€€€€€€ "
          LOCATE y + 4, x: PRINT "     ≥  €€€€€€  "
          LOCATE y + 5, x: PRINT "     ≥‹€€€€€€€€‹‹‹ "
        CASE 2
          COLOR k, kb
          LOCATE y - 1, x: PRINT "         ‹€€‹     "
          LOCATE y, x:     PRINT "       ‹‹€\/€‹    "
          LOCATE y + 1, x: PRINT "       €€€€€€€€   "
          LOCATE y + 2, x: PRINT " ‹‹ƒƒ€€€€€€€€€€ƒƒ "
          LOCATE y + 3, x: PRINT " €€     €€€€€€€   "
          LOCATE y + 4, x: PRINT " ﬂ€€‹   €€€€€€    "
          LOCATE y + 5, x: PRINT "      ‹€€€€€€€€‹‹‹"
        CASE 3
          COLOR k, kb
          LOCATE y - 1, x: PRINT "   ‹€€€€  ‹€€‹   "
          LOCATE y, x:     PRINT "   €ﬂ  ≥‹‹€\/€‹  "
          LOCATE y + 1, x: PRINT "      €€€€€€€€€€ "
          LOCATE y + 2, x: PRINT " €     ≈ €€€€€€€ "
          LOCATE y + 3, x: PRINT " €€€€€€€€€€€€€€€ "
          LOCATE y + 4, x: PRINT "       ≥  €€€€€  "
          LOCATE y + 5, x: PRINT "       ≥    ﬂ€€€‹ "
      END SELECT
  END SELECT
END SUB

SUB pers (tipo, posit, y, x, k, kb)
  SELECT CASE tipo
    CASE 1
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y, x:     PRINT " €€"
          LOCATE y + 1, x: PRINT "€€€€ €"
          LOCATE y + 2, x: PRINT "€€€€ﬂﬂ"
          LOCATE y + 3, x: PRINT "€€€€"
          LOCATE y + 4, x: PRINT "€€ €"
          LOCATE y + 5, x: PRINT "€‹ €‹"
        CASE 2
          COLOR k, kb
          LOCATE y, x:     PRINT " €€"
          LOCATE y + 1, x: PRINT "€€€€    ‹‹"
          LOCATE y + 2, x: PRINT "€€€€€ﬂﬂﬂﬂ"
          LOCATE y + 3, x: PRINT "€€€€"
          LOCATE y + 4, x: PRINT "€€ €"
          LOCATE y + 5, x: PRINT "€‹ €‹"
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT " €€"
          LOCATE y + 1, x: PRINT "€€€€ €"
          LOCATE y + 2, x: PRINT "€€€€ﬂﬂ"
          LOCATE y + 3, x: PRINT "€€€€‹‹‹‹€"
          LOCATE y + 4, x: PRINT "€€"
          LOCATE y + 5, x: PRINT "€‹"
      END SELECT
    CASE 2
      SELECT CASE posit
        CASE 1
          COLOR k, kb
          LOCATE y - 1, x: PRINT "      __"
          LOCATE y, x:     PRINT "      ±±"
          LOCATE y + 1, x: PRINT "    ‹‹‹‹‹"
          LOCATE y + 2, x: PRINT "   €‹±€€ €‹±"
          LOCATE y + 3, x: PRINT "     €€€"
          LOCATE y + 4, x: PRINT "     € €"
          LOCATE y + 5, x: PRINT "    ‹€ €‹"
        CASE 2
          COLOR k, kb
          LOCATE y, x - 1: PRINT "      __"
          LOCATE y, x:     PRINT "      ±±"
          LOCATE y + 1, x: PRINT "    ‹‹‹‹‹‹"
          LOCATE y + 2, x: PRINT "   €‹±€€  ﬂ‹±"
          LOCATE y + 3, x: PRINT "     €€€"
          LOCATE y + 4, x: PRINT "     € €"
          LOCATE y + 5, x: PRINT "    ‹€ €‹"
        CASE 3
          COLOR k, kb
          LOCATE y, x:     PRINT "  __   ±     "
          LOCATE y + 1, x: PRINT "  ±± ‹ﬂ     € "
          LOCATE y + 2, x: PRINT "‹ﬂ€€ﬂ   ‹‹ﬂﬂ "
          LOCATE y + 3, x: PRINT "ﬂ‹±€‹‹ﬂﬂ"
          LOCATE y + 4, x: PRINT "‹ﬂ"
          LOCATE y + 5, x: PRINT "‹€"
      END SELECT
  END SELECT
END SUB

SUB presenta
  CLS
  LOCATE 12, 27
  PRINT "Amadorenbaum 1982 presents..."
  LOCATE 13, 32
  PRINT "Battle Yoshi!"
  SLEEP
END SUB

