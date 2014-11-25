DECLARE SUB borra ()
DECLARE SUB borra2 ()
DECLARE SUB pina ()
DECLARE SUB patada ()
DECLARE SUB cabezaso ()
DECLARE SUB pina2 ()
DECLARE SUB pata2 ()
DECLARE SUB cabe2 ()
DECLARE SUB camina ()
DECLARE SUB CAMI2 ()
DIM SHARED drafhon1$, drafhon2$, drafhon3$, drafhon4$, drafhon5$, drafhon6$, drafhon7$, kuyoshi1$, kuyoshi2$, kuyoshi3$, kuyoshi4$, kuyoshi5$, kuyoshi6$, kuyoshi7$, in$, in, stage, x, x1, pla2, truc4
CLS
SCREEN 13
PRINT "       JAPANESE FIGHTERS"
PRINT
PRINT
COLOR 6
PRINT "             ∞∞"
COLOR 12
PRINT "             €€‹"
PRINT "             €€ "
COLOR 15
PRINT "            ‹€€‹"
PRINT "          ‹ﬂ €€ €"
PRINT "          ±  €€  ﬂ±"
PRINT "             €€        AMADORENBAUM"
PRINT "             ∞∞   ‹        1985"
PRINT "             €ﬂﬂﬂﬂﬂ"
PRINT "             €     THE BEST ART OF GAMES"
PRINT "             €      IN THE 10 LAST YEARS"
PRINT "            ‹€"
DO: LOOP UNTIL INKEY$ = CHR$(13)
SCREEN 9
Menu:
COLOR 7
PRINT "            MENU PRINCIPAL:"
PRINT
COLOR 11
PRINT " 1= Empezar juego nuevo de 1 jugador"
PRINT
COLOR 3
PRINT " 2= Empezar juego nuevo de a 2 jugadores"
PRINT
COLOR 9
PRINT " 3= Salir"
0 c$ = INKEY$
IF c$ = "1" THEN 1
IF c$ = "2" THEN 2
IF c$ = "3" THEN CLS : SYSTEM


GOTO 0
1 SCREEN 9
CLS
COLOR 4
PRINT "  KUYOSHI             VS.        DRAFHON"
COLOR 15
PRINT "    __              FRACAS        ‹‹    "
PRINT "    ±±              TRAQUEN      ﬂ∞∞    "
PRINT "  ‹‹‹‹‹             RAGUEN       ‹‹‹‹   "
PRINT " €‹±€€ €‹±          SHAGUEN   ∞‹€ €∞‹€  "
PRINT "   €ﬂ€              YAMELENGA     €€    "
PRINT "  ‹€ €‹             THENGHA       ﬂ€‹ﬂ‹ﬂ"
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
PRINT
PRINT
PRINT "        ELIJA EL COLOR DE KUYOSHI KANAMOTO"
PRINT
PRINT "                   1= Azul oscuro"
PRINT "                   2= Verde oscuro"
PRINT "                   3= Celeste oscuro"
PRINT "                   4= Rojo oscuro"
PRINT "                   5= Rosa claro"
PRINT "                   6= Marron"
PRINT "                   7= Blanco oscuro"
PRINT "                   8= Gris"
PRINT "                   9= Azul claro"
PRINT "                  10= Verde claro"
PRINT "                  11= Celeste"
PRINT "                  12= Rojo claro"
PRINT "                  13= Rosa claro"
PRINT "                  14= Amarillo"
PRINT "                  15= Blanco"
999 INPUT a$
IF VAL(a$) < 16 THEN J = VAL(a$) ELSE 999


CLS
stage = 1
kuyoshi1$ = "      __     "
kuyoshi2$ = "      ±±     "
kuyoshi3$ = "    ‹‹‹‹‹    "
kuyoshi4$ = "   €‹±€€ €‹± "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "     € €     "
kuyoshi7$ = "    ‹€ €‹    "
in$ = "1111112222112231314132222211111111111111311322414111114111111422222222222222222222222222220"
cabeza = 10
ropa = 2
in = 1
me = 20
em = 35
91
h = 1
pinan = 0
patado = 0
cabe = 0

IF me > 0 THEN COLOR 10: LOCATE 1, 1: PRINT STRING$(me, "±"); "    "
IF em > 0 THEN COLOR 9: LOCATE 3, 1: PRINT STRING$(em, "≤"); "    "
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
IF stage = 1 THEN
drafhon1$ = "      ‹‹      "
drafhon2$ = "     ﬂ∞∞      "
drafhon3$ = "     ‹‹‹‹     "
drafhon4$ = "  ∞‹€ €∞‹€    "
drafhon5$ = "      €€      "
drafhon6$ = "      €€      "
drafhon7$ = "      ﬂ€‹ﬂ‹ﬂ‹ "
ELSEIF stage = 2 THEN
drafhon1$ = "              "
drafhon2$ = "    ‹ﬂﬂﬂ‹     "
drafhon3$ = "   €€ ‹€€€‹   "
drafhon4$ = "      ﬂ±±±ﬂ   "
drafhon5$ = "     ±‹€€€‹   "
drafhon6$ = "       €€±‹ﬂ  "
drafhon7$ = "      ‹€ €‹   "
ELSEIF stage = 3 THEN
drafhon1$ = "               "
drafhon2$ = " ‹‹   €ﬂ‹   "
drafhon3$ = " €\/€ﬂﬂﬂ‹   €  "
drafhon4$ = " €≈≈€    ﬂ‹ﬂ   "
drafhon5$ = "  ﬂﬂ   ‹ﬂﬂ €   "
drafhon6$ = "  €‹€ﬂ    ‹€‹ "
drafhon7$ = "  €ﬂ    ‹€ﬂ€ﬂ€‹ "
ELSEIF stage = 4 THEN
drafhon1$ = " ‹€€€€   ‹€€‹   "
drafhon2$ = " €ﬂ  ≥ ‹‹€**€‹  "
drafhon3$ = "     €€€€€€€€€€ "
drafhon4$ = "     ≈  €€€€€€€ "
drafhon5$ = "     ≥  €€€€€€€ "
drafhon6$ = "     ≥  €€€€€€  "
drafhon7$ = "     ≥‹€€€€€€€€‹‹‹ "
ELSEIF stage = 5 THEN
drafhon1$ = "  ‹€€€€€€€€/€    "
drafhon2$ = "   € € € € €€    "
drafhon3$ = "           €€‹   "
drafhon4$ = "           €  ﬂ‹ "
drafhon5$ = "           € ‹‹ﬂ "
drafhon6$ = "    ‹ ‹ ‹  €     "
drafhon7$ = "  ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
ELSEIF stage = 6 THEN
drafhon1$ = "   ‹€€€€€€€€/€     "
drafhon2$ = "    € € € € €€     "
drafhon3$ = "            €€‹    "
drafhon4$ = " ﬂﬂ‹‹‹‹‹‹‹‹‹€  ﬂ‹  "
drafhon5$ = " ﬂﬂ         € ‹‹ﬂ  "
drafhon6$ = "     ‹ ‹ ‹  €      "
drafhon7$ = "   ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
ELSEIF stage = 7 THEN
drafhon1$ = "     € € €       "
drafhon2$ = "     €\ /€       "
drafhon3$ = "  ‹   €€€€‹      "
drafhon4$ = "  ‹€ﬂﬂﬂ€€€€€‹    "
drafhon5$ = "  ‹ﬂ    €€€€€€‹  "
drafhon6$ = "         ﬂ€ﬂ€ﬂ   "
drafhon7$ = "  _____________  "
ELSEIF stage = 8 THEN
drafhon1$ = "                 "
drafhon2$ = "               "
drafhon3$ = "       ∞∞        "
drafhon4$ = "     ‹‹‹‹‹       "
drafhon5$ = " ∞‹€€€∞‹€     "
drafhon6$ = "      €€€        "
drafhon7$ = "    (OOOOO)____  "


END IF
90
FOR i = 1 TO 20
IF me > 0 THEN COLOR 10: LOCATE 1, 1: PRINT STRING$(me, "±"); "                         "
IF em > 0 THEN COLOR 9: LOCATE 3, 1: PRINT STRING$(em, "≤"); "                         "
IF em <= 0 THEN GOTO MUEREN
IF me <= 0 AND stage = 1 THEN GOTO 100
IF me <= 0 AND stage = 2 THEN GOTO 101
IF me <= 0 AND stage = 3 THEN GOTO 102
IF me <= 0 AND stage = 4 THEN GOTO 103
IF me <= 0 AND stage = 5 THEN GOTO 104
IF me <= 0 AND stage = 6 THEN GOTO 105
IF me <= 0 AND stage = 7 THEN GOTO 106
IF me <= 0 AND stage = 8 THEN GOTO 107
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
 COLOR 12

LOCATE 13, x + 1: PRINT kuyoshi1$
LOCATE 14, x + 1: PRINT kuyoshi2$

COLOR J
LOCATE 15, x + 1: PRINT kuyoshi3$
LOCATE 16, x + 1: PRINT kuyoshi4$
LOCATE 17, x + 1: PRINT kuyoshi5$
LOCATE 18, x + 1: PRINT kuyoshi6$
LOCATE 19, x + 1: PRINT kuyoshi7$

COLOR cabeza
LOCATE 13, 60 - x1: PRINT drafhon1$
LOCATE 14, 60 - x1: PRINT drafhon2$
COLOR ropa
LOCATE 15, 60 - x1: PRINT drafhon3$
LOCATE 16, 60 - x1: PRINT drafhon4$

                                     LOCATE 17, 60 - x1: PRINT drafhon5$
LOCATE 18, 60 - x1: PRINT drafhon6$
LOCATE 19, 60 - x1: PRINT drafhon7$
IF pinan = 0 AND cabe = 0 THEN in = in + 1
IF MID$(in$, in, 1) = "1" AND x1 < 60 THEN x1 = x1 + 1
IF MID$(in$, in, 1) = "2" AND x1 > 1 THEN x1 = x1 - 1
IF MID$(in$, in, 1) = "3" THEN pina: pinan = 1
IF MID$(in$, in, 1) = "4" THEN cabezaso: cabe = 1
IF MID$(in$, in, 1) = "5" THEN patada: patado = 1
IF MID$(in$, in, 1) = "0" THEN in = 1
c$ = INKEY$
IF c$ = CHR$(0) + "M" AND x < 60 AND pina22 = 0 AND cabe22 = 0 AND pata22 = 0 THEN x = x + 1: CAMI2
IF c$ = CHR$(0) + "K" AND x < 60 AND pina22 = 0 AND cabe22 = 0 AND pata22 = 0 AND x > 1 THEN x = x - 1: CAMI2
IF c$ = " " THEN call pina2: pina22 = 1
IF c$ = CHR$(0) + "H" THEN cabe2: cabe22 = 1
IF c$ = CHR$(0) + "P" THEN pata2: pata22 = 1
IF SCREEN(16, x + 14) <> ASC(" ") AND pina22 = 1 THEN borra: x = x - 3: me = me - (1 + INT(stage / 2)): GOTO 92
IF SCREEN(15, x + 14) <> ASC(" ") AND pata22 = 1 THEN borra: x = x - 3: me = me - (2 + INT(stage / 2)): GOTO 92
IF SCREEN(14, x + 16) <> ASC(" ") AND cabe22 = 1 THEN borra: x = x - 3: me = me - (3 + INT(stage / 2)): GOTO 92

IF SCREEN(16, x + 14) <> ASC(" ") AND pinan = 1 THEN em = em - (1 + INT(stage / 2)):  GOTO 91
IF SCREEN(15, x + 14) <> ASC(" ") AND patado = 1 THEN em = em - (2 + INT(stage / 2)):  GOTO 91
IF SCREEN(14, x + 16) <> ASC(" ") AND cabe = 1 THEN em = em - (3 + INT(stage / 2)):  GOTO 91

IF c$ = CHR$(13) AND x > 4 THEN borra: pata22 = 0: pina22 = 0: cabe22 = 0: x = x - 3: GOTO 92
IF 63 - x1 < 14 + x AND x > 2 THEN x = x - 1
IF c$ = "F" OR c$ = "f" AND truc = 0 THEN truc = 1: GOTO 90
IF c$ = "R" OR c$ = "r" AND truc = 1 THEN truc = 2: GOTO 90
IF c$ = "A" OR c$ = "a" AND truc = 2 THEN truc = 3: GOTO 90
IF c$ = "G" OR c$ = "g" AND truc = 3 THEN truc = 4: GOTO 90
IF c$ = "G" OR c$ = "g" AND truc = 4 THEN GOTO truc

IF c$ = "g" AND truc2 = 0 AND me < 18 THEN truc2 = 1: GOTO 90
IF c$ = "i" AND truc2 = 1 AND me < 18 THEN truc2 = 2: GOTO 90
IF c$ = "v" AND truc2 = 2 AND me < 18 THEN truc2 = 3: GOTO 90
IF c$ = "e" AND truc2 = 3 AND me < 18 THEN truc2 = 4: GOTO 90
IF c$ = "m" AND truc2 = 4 AND me < 18 THEN truc2 = 5: GOTO 90
IF c$ = "e" AND truc2 = 5 AND me < 18 THEN truc2 = 6: GOTO 90
IF c$ = "b" AND truc2 = 6 AND me < 18 THEN truc2 = 7: GOTO 90
IF c$ = "l" AND truc2 = 7 AND me < 18 THEN truc2 = 8: GOTO 90
IF c$ = "o" AND truc2 = 8 AND me < 18 THEN truc2 = 9: GOTO 90
IF c$ = "o" AND truc2 = 9 AND me < 18 THEN truc2 = 10: GOTO 90
IF c$ = "d" AND truc2 = 10 AND me < 18 AND stage < 8 THEN truc2 = 0: GOTO truc2
IF c$ = "A" OR c$ = "a" AND truc3 = 0 AND em > 17 THEN truc3 = 1: GOTO 90
IF c$ = "R" OR c$ = "r" AND truc3 = 1 AND em > 17 THEN truc3 = 2: GOTO 90
IF c$ = "A" OR c$ = "a" AND truc3 = 2 AND em > 17 THEN truc3 = 3: GOTO 90
IF c$ = "Y" OR c$ = "y" AND truc3 = 3 AND em > 17 THEN truc3 = 4: GOTO 90
IF c$ = "E" OR c$ = "e" AND truc3 = 4 AND em > 17 THEN truc3 = 5: GOTO 90
IF c$ = "X" OR c$ = "x" AND truc3 = 5 AND stage < 8 THEN truc3 = 0: GOSUB truc3
IF c$ = "Z" OR c$ = "z" AND truc4 < 21 AND stage = 8 THEN truc4 = truc4 + 1
IF truc4 = 20 AND c$ = "G" OR c$ = "g" AND stage = 8 THEN truc4 = 100
IF truc4 = 100 AND c$ = "O" OR c$ = "o" AND stage = 8 THEN truc4 = 0: GOTO Matar
NEXT i
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
h = h + 1
hh = hh + 1
IF h >= 3 THEN 91
IF hh >= 3 THEN 92

GOTO 90
92

kuyoshi1$ = "      __     "
kuyoshi2$ = "      ±±     "
kuyoshi3$ = "    ‹‹‹‹‹    "
kuyoshi4$ = "   €‹±€€ €‹± "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "     € €     "
kuyoshi7$ = "    ‹€ €‹    "
hh = 1
pina22 = 0
pata22 = 0
cabe22 = 0
LOCATE 20, 1: PRINT STRING$(80, "∞")
GOTO 90
100 CLS
stage = 2
LOCATE 1, 1
PRINT
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX DRAFHON   "
COLOR 15
PRINT "  ± __ ±            FRACAS                      "
PRINT "  € ±± €            TRAQUEN       €∞∞∞          "
PRINT "  €‹‹‹‹€            RAGUEN        ﬂ  ‹‹‹‹       "
PRINT "   €€€              SHAGUEN       ﬂ  €€€€       "
PRINT "   €ﬂ€              YAMELENGA     ﬂ  €€€€  ∞    "
PRINT "  ‹€ €‹             THENGHA          ∞ﬂ€‹€€‹‹‹  "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.           FRACAS     "
COLOR 15
PRINT "    __                               ‹ﬂﬂﬂ‹      "
PRINT "    ±±              TRAQUEN         €€  €€€     "
PRINT "  ‹‹‹‹‹             RAGUEN              ±±±     "
PRINT " €‹±€€ €‹±          SHAGUEN         ±  ‹€€€‹    "
PRINT "   €ﬂ€              YAMELENGA        ﬂﬂ €€±‹ﬂ   "
PRINT "  ‹€ €‹             THENGHA            ‹€ €‹    "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
cabeza = 9
ropa = 1
in = 1
me = 40
x1 = 0
em = 35
in$ = "1113122222113111411111113311441111111333333531112225222211114541114441144411144111444225252225255222222222222222222222222222223312121212121212121212121221211111111111111111122222222222222222222222222222222220"
CLS
GOTO 91
101 CLS
LOCATE 1, 1
stage = 3
PRINT
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX FRACAS   "
COLOR 15
PRINT "  ± __ ±                                +       "
PRINT "  € ±± €            TRAQUEN                     "
PRINT "  €‹‹‹‹€            RAGUEN            +         "
PRINT "   €€€              SHAGUEN             +       "
PRINT "   €ﬂ€              YAMELENGA       ‹‹‹         "
PRINT "  ‹€ €‹             THENGHA       ‹€‹ﬂ€€ﬂ€€‹ﬂ€‹ "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.          TRAQUEN     "
COLOR 15
PRINT "    __                           ‹‹   €ﬂ‹    "
PRINT "    ±±                           €\/€ﬂﬂﬂ‹   €   "
PRINT "  ‹‹‹‹‹             RAGUEN       €≈≈€    ﬂ‹ﬂ    "
PRINT " €‹±€€ €‹±          SHAGUEN       ﬂﬂ   ‹ﬂﬂ €    "
PRINT "   €ﬂ€              YAMELENGA     €‹€ﬂ    ‹€‹  "
PRINT "  ‹€ €‹             THENGHA       €ﬂ    ‹€ﬂ€ﬂ€‹"
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
cabeza = 5
ropa = 13
x1 = 0
em = 35
me = 40
in = 1
in$ = "11111111111111111111134343434322222222222222222222221111111111343434343434222222222220"
CLS
GOTO 91
102 CLS
stage = 4
LOCATE 1, 1
PRINT
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX TRAQUEN  "
COLOR 15
PRINT "  ± __ ±                                        "
PRINT "  € ±± €                                        "
PRINT "  €‹‹‹‹€            RAGUEN                      "
PRINT "   €€€              SHAGUEN         €           "
PRINT "   €ﬂ€              YAMELENGA  ﬂ€€€ﬂﬂﬂﬂﬂﬂ‹      "
PRINT "  ‹€ €‹             THENGHA    ﬂ  ‹€‹ﬂ€€ﬂ€€‹ﬂ€‹ "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.          RAGUEN      "
COLOR 15
PRINT "    __                       ‹€€€€   ‹€€‹       "
PRINT "    ±±                       €ﬂ  ≥ ‹‹€**€‹      "
PRINT "  ‹‹‹‹‹                          €€€€€€€€€€     "
PRINT " €‹±€€ €‹±          SHAGUEN      ≈  €€€€€€€     "
PRINT "   €ﬂ€              YAMELENGA    ≥  €€€€€€      "
PRINT "  ‹€ €‹             THENGHA      ≥‹€€€€€€€€‹‹‹  "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
cabeza = 7
em = 35
x1 = 0
in = 1
ropa = 8
me = 50
in$ = "22222222221111111111111414141414141414141423232323232325532311551111111111122255225552511111111111111111222222222222222221222222225551111112222222222222114114111111114444444443333333322223454354532222222220"
CLS
GOTO 91
103 CLS
stage = 5
LOCATE 1, 1
PRINT
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX RAGUEN   "
COLOR 15
PRINT "  ± __ ±                               ‹€‹      "
PRINT "  € ±± €                               ‹€‹      "
PRINT "  €‹‹‹‹€                             ‹ﬂ € ﬂ‹    "
PRINT "   €€€              SHAGUEN        ﬂﬂ ‹‹€‹€ ﬂ   "
PRINT "   €ﬂ€              YAMELENGA       ‹€ﬂ   ﬂ‹‹   "
PRINT "  ‹€ €‹             THENGHA        ‹‹ﬂﬂ   ﬂ‹‹‹  "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.         SHAGUEN      "
COLOR 15
PRINT "    __                            ‹€€€€€€€€/€   "
PRINT "    ±±                             € € € € €€   "
PRINT "  ‹‹‹‹‹                                    €ﬂﬂ‹ "
PRINT " €‹±€€ €‹±                                 €   €"
PRINT "   €ﬂ€              YAMELENGA       ‹ ‹ ‹  € ﬂﬂ "
PRINT "  ‹€ €‹             THENGHA       ﬂ‹€‹€‹€‹€€ﬂ€ﬂ€"
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
in = 1
cabeza = 14
em = 35
ropa = 6
x1 = 0
me = 55
in$ = "1111111111111111444444444444411111111111111144444444444422222222222222223333333444343434311111111111122221212121212123434343434343411111111111222222222222222222222222222111111111111111111111111111111111111122222222222222222222222222222222222222220"
CLS
GOTO 91
104 CLS
stage = 6
LOCATE 1, 1
PRINT
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX SHAGUEN  "
COLOR 15
PRINT "  ± __ ±                                        "
PRINT "  € ±± €                                        "
PRINT "  €‹‹‹‹€                                        "
PRINT "   €€€                                          "
PRINT "   €ﬂ€              YAMELENGA                   "
PRINT "  ‹€ €‹             THENGHA        ‹‹ﬂﬂ   ﬂ‹‹‹  "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.          SHAGUEN Jr. "
COLOR 15
PRINT "    __                            ‹€€€€€€€€/€   "
PRINT "    ±±                             € € € € €€   "
PRINT "  ‹‹‹‹‹                                    €ﬂﬂ‹ "
PRINT " €‹±€€ €‹±                        ﬂﬂﬂﬂﬂﬂﬂﬂﬂ€   €"
PRINT "   €ﬂ€              YAMELENGA       ‹ ‹ ‹  € ﬂﬂ "
PRINT "  ‹€ €‹             THENGHA       ﬂ‹€‹€‹€‹€€ﬂ€ﬂ€"
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
cabeza = 14
em = 35
in = 1
x1 = 0
ropa = 6
me = 55
in$ = "444444444444411111111111111144444444444422222222111122222222333333311111111111111111111111111111122222222222232244222222222222233444444222242223222222233423333333444343434311111111111122221212121212123434343434343411111111111111111111111111122222222222222222222222220"
CLS
GOTO 91
105 CLS
stage = 7
PRINT
LOCATE 1, 1
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX SHAGUEN JR."
COLOR 15
PRINT "  ± __ ±                                        "
PRINT "  € ±± €                           (Abaco)      "
PRINT "  €‹‹‹‹€                                        "
PRINT "   €€€                             ‹   €   ‹    "
PRINT "   €ﬂ€              YAMELENGA      € ‹ €   €    "
PRINT "  ‹€ €‹             THENGHA       ‹€‹€‹€‹€‹€‹   "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI             VS.          YAMELENGA   "
COLOR 15
PRINT "    __                               € € €      "
PRINT "    ±±                               €\ /€      "
PRINT "  ‹‹‹‹‹                            ‹  ﬂ€€€€‹    "
PRINT " €‹±€€ €‹±                         ‹€ﬂﬂﬂ€€€€€‹  "
PRINT "   €ﬂ€              YAMELENGA      ‹ﬂ    ﬂ€ﬂ€ﬂ  "
PRINT "  ‹€ €‹             THENGHA        ___________  "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
cabeza = 7
in = 1
x1 = 0
em = 35
ropa = 7
me = 65
in$ = "111111111111111111111151143543543543555554343444343434343434444444442222222222222222222222223333333331111111111111111111111111111111111133333332222221111111112121212121222222222111111343433422222222222222222222222222222220"
CLS
GOTO 91
106 CLS
stage = 8
PRINT
LOCATE 1, 1
PRINT "    HAS GANADO!!"
COLOR 4
PRINT "  KUYOSHI             VS.         EX YAMELENGA  "
COLOR 15
PRINT "  ± __ ±                                        "
PRINT "  € ±± €                                        "
PRINT "  €‹‹‹‹€                                        "
PRINT "   €€€                                          "
PRINT "   €ﬂ€                                          "
PRINT "  ‹€ €‹             THENGHA       ‹‹‹‹‹‹‹‹‹‹‹   "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 4
PRINT "  KUYOSHI         (ANTI-CHEAT)     THENGHA     "
COLOR 15
PRINT "    __            €   € ‹ﬂﬂ‹                JAMAS PODRAS"
PRINT "    ±±            €   € €            ∞∞       SALVAR AL MUNDO!"
PRINT "  ‹‹‹‹‹           €   € €           ‹‹‹‹‹   ‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ"
PRINT " €‹±€€ €‹±         € €   ﬂﬂ‹    ∞‹€€€∞‹€   HAHAHAHAHAHAHA!"
PRINT "   €ﬂ€             € €     €         €€€        "
PRINT "  ‹€ €‹             €   ﬂ‹‹ﬂ ‹     (OOOOO)      "
PRINT
PRINT "        PRESIONE ESPACIO PARA CONTINUAR"
DO: LOOP UNTIL INKEY$ = CHR$(32)
x1 = 0
in = 1
cabeza = 3
em = 35
ropa = 11
me = 80
in$ = "1111111111111111112222222222222111111435435435435435435445435435435435435435222222222222222222222222234343434343434343434341111111111111111112222343434343434333333333333222211111333311112222233333344444411111222222333334444442222222222222222222222222222222222223333344111111111111111122222222222222244443222222222111111111111111111434343434343111111111111111444444444441111111122222222222222222222222222222222222222221111133434343434343434333111110"
CLS
GOTO 91
107 CLS
LINE (180, 60)-(155, 180), J
LINE (155, 180)-(155, 200), J
LINE (155, 200)-(225, 280), J
LINE (225, 280)-(225, 355), J
LINE (480, 350)-(480, 290), J
LINE (480, 290)-(605, 290), J
LINE (605, 290)-(605, 165), J
LINE (605, 165)-(545, 165), J
LINE (545, 165)-(555, 255), J
LINE (555, 255)-(560, 260), J
LINE (555, 255)-(560, 270), J
LINE (555, 255)-(555, 270), J
LINE (555, 255)-(370, 245), J
LINE (370, 245)-(360, 250), J
LINE (360, 250)-(345, 295), J
LINE (345, 295)-(315, 245), J
LINE (315, 245)-(300, 240), J
LINE (300, 240)-(255, 235), J
LINE (255, 235)-(210, 190), J
LINE (210, 190)-(210, 180), J
LINE (210, 180)-(245, 70), J
LINE (245, 70)-(180, 60), J
LINE (315, 245)-(310, 205), 6
LINE (310, 205)-(305, 205), 6
LINE (305, 205)-(305, 185), 6
LINE (305, 185)-(310, 180), 6
LINE (310, 180)-(310, 150), 6
LINE (360, 245)-(360, 250), 6
LINE (360, 250)-(365, 205), 6
LINE (365, 205)-(375, 205), 6
LINE (375, 205)-(360, 185), 6
LINE (360, 185)-(360, 160), 6
LINE (350, 165)-(350, 175), 6
LINE (340, 175)-(340, 160), 6
LINE (340, 220)-(350, 225), 6
LINE (350, 225)-(360, 225), 6
LINE (360, 225)-(345, 230), 6
LINE (345, 230)-(340, 220), 6
LINE (360, 160)-(390, 165), 8
LINE (390, 165)-(400, 180), 8
LINE (400, 180)-(400, 160), 8
LINE (400, 160)-(360, 150), 8
LINE (360, 150)-(380, 150), 8
LINE (380, 150)-(350, 145), 8
LINE (350, 145)-(325, 150), 8
LINE (325, 150)-(340, 140), 8
LINE (340, 140)-(310, 150), 8
LINE (310, 150)-(325, 160), 8
LINE (325, 160)-(325, 155), 8
LINE (325, 155)-(350, 160), 8
LINE (350, 160)-(350, 155), 8
LINE (350, 155)-(360, 160), 8
LINE (550, 140)-(553, 137), 6
LINE (553, 137)-(559, 137), 6
LINE (559, 137)-(562, 140), 6
LINE (562, 140)-(562, 152), 6
LINE (562, 152)-(559, 155), 6
LINE (559, 155)-(553, 155), 6
LINE (553, 155)-(550, 152), 6
LINE (550, 152)-(550, 140), 6
LINE (562, 140)-(565, 137), 6
LINE (565, 137)-(571, 137), 6
LINE (571, 137)-(574, 140), 6
LINE (574, 140)-(574, 152), 6
LINE (574, 152)-(571, 155), 6
LINE (571, 155)-(565, 155), 6
LINE (565, 155)-(562, 152), 6
LINE (574, 152)-(577, 155), 6
LINE (577, 155)-(583, 155), 6
LINE (583, 155)-(586, 152), 6
LINE (586, 152)-(586, 140), 6
LINE (586, 140)-(583, 137), 6
LINE (583, 137)-(577, 137), 6
LINE (577, 137)-(574, 140), 6
LINE (550, 143)-(544, 149), 6
LINE (544, 149)-(544, 164), 6
LINE (562, 155)-(565, 158), 6
LINE (565, 158)-(565, 161), 6
LINE (589, 164)-(586, 152), 6
LINE (187, 59)-(211, 32), 6
LINE (211, 32)-(223, 38), 6
LINE (223, 38)-(208, 53), 6
LINE (208, 53)-(202, 50), 6
LINE (202, 50)-(214, 38), 6
LINE (217, 35)-(220, 32), 6
LINE (220, 32)-(229, 38), 6
LINE (229, 38)-(214, 53), 6
LINE (214, 53)-(211, 50), 6
LINE (187, 59)-(193, 41), 6
LINE (193, 41)-(202, 35), 6
LINE (202, 35)-(202, 41), 6
LINE (226, 35)-(232, 35), 6
LINE (232, 35)-(235, 41), 6
LINE (235, 41)-(223, 50), 6
LINE (223, 50)-(217, 50), 6
LINE (220, 65)-(232, 44), 6
LINE (289, 23)-(277, 35), 11
LINE (277, 35)-(307, 65), 11
LINE (307, 65)-(307, 110), 11
LINE (307, 110)-(313, 110), 11
LINE (313, 110)-(313, 65), 11
LINE (313, 65)-(340, 38), 11
LINE (340, 38)-(328, 26), 11
LINE (328, 26)-(307, 47), 11
LINE (307, 47)-(289, 23), 11
LINE (343, 101)-(352, 110), 11
LINE (352, 110)-(367, 110), 11
LINE (367, 110)-(376, 101), 11
LINE (376, 101)-(376, 38), 11
LINE (376, 38)-(367, 29), 11
LINE (367, 29)-(352, 29), 11
LINE (352, 29)-(343, 38), 11
LINE (343, 38)-(343, 101), 11
LINE (355, 95)-(358, 98), 11
LINE (358, 98)-(361, 95), 11
LINE (361, 95)-(361, 41), 11
LINE (361, 41)-(358, 38), 11
LINE (358, 38)-(355, 41), 11
LINE (382, 29)-(382, 101), 11
LINE (382, 101)-(391, 110), 11
LINE (391, 110)-(406, 110), 11
LINE (406, 110)-(415, 101), 11
LINE (415, 101)-(415, 26), 11
LINE (415, 26)-(403, 26), 11
LINE (403, 26)-(403, 95), 11
LINE (403, 95)-(397, 101), 11
LINE (397, 101)-(391, 95), 11
LINE (391, 95)-(391, 29), 11
LINE (391, 29)-(382, 29), 11
LINE (442, 29)-(442, 119), 11
LINE (442, 119)-(448, 119), 11
LINE (448, 119)-(460, 80), 11
LINE (460, 80)-(460, 119), 11
LINE (460, 119)-(469, 119), 11
LINE (469, 119)-(487, 29), 11
LINE (487, 29)-(472, 29), 11
LINE (472, 29)-(466, 83), 11
LINE (466, 83)-(460, 65), 11
LINE (460, 65)-(457, 65), 11
LINE (457, 65)-(448, 95), 11
LINE (448, 95)-(448, 29), 11
LINE (442, 29)-(448, 29), 11
LINE (490, 29)-(490, 119), 11
LINE (490, 119)-(493, 119), 11
LINE (493, 119)-(493, 29), 11
LINE (490, 29)-(493, 29), 11
LINE (499, 119)-(508, 119), 11
LINE (508, 119)-(508, 47), 11
LINE (508, 47)-(526, 119), 11
LINE (526, 119)-(538, 119), 11
LINE (538, 119)-(538, 26), 11
LINE (538, 26)-(532, 26), 11
LINE (532, 26)-(523, 62), 11
LINE (523, 62)-(493, 29), 11
LINE (124, 188)-(151, 92), 16
LINE (130, 122)-(106, 197), 16
LINE (592, 302)-(619, 296), 16
LINE (619, 296)-(619, 278), 16
LINE (625, 278)-(625, 305), 16
LINE (625, 305)-(604, 311), 16
LINE (499, 119)-(499, 35), 11
LINE (481, 290)-(478, 281), J
LINE (478, 290)-(472, 287), J
LINE (478, 290)-(472, 293), J
LINE (226, 281)-(235, 284), J
LINE (226, 281)-(235, 278), J
LINE (226, 281)-(229, 275), J
LINE (256, 236)-(253, 242), J
LINE (256, 236)-(247, 239), J
PLAY "l30o4ddcddddfffffddddcccccceeddddddddddddddddddd"
DO: LOOP UNTIL INKEY$ = CHR$(13)
SYSTEM


GAMEOVER:
CLS
LINE (235, 160)-(200, 240), 6
LINE (200, 240)-(195, 250), 6
LINE (195, 250)-(190, 255), 6
LINE (190, 255)-(180, 260), 6
LINE (180, 260)-(160, 265), 6
LINE (160, 265)-(125, 265), 6
LINE (125, 265)-(95, 260), 6
LINE (190, 195)-(200, 225), 6
LINE (200, 225)-(165, 220), 6
LINE (150, 240)-(120, 245), 6
LINE (150, 240)-(170, 240), 6
LINE (175, 175)-(185, 180), 6
LINE (205, 180)-(215, 185), 6
LINE (235, 160)-(245, 185), 8
LINE (245, 185)-(250, 210), 8
LINE (250, 210)-(260, 185), 8
LINE (260, 185)-(250, 150), 8
LINE (250, 150)-(270, 165), 8
LINE (270, 165)-(280, 180), 8
LINE (280, 180)-(280, 155), 8
LINE (280, 155)-(255, 135), 8
LINE (255, 135)-(190, 125), 8
LINE (190, 125)-(210, 115), 8
LINE (210, 115)-(165, 130), 8
LINE (165, 130)-(140, 140), 8
LINE (140, 140)-(125, 155), 8
LINE (125, 155)-(130, 175), 8
LINE (130, 175)-(135, 180), 8
LINE (135, 180)-(135, 165), 8
LINE (135, 165)-(145, 155), 8
LINE (145, 155)-(165, 150), 8
LINE (165, 150)-(180, 150), 8
LINE (180, 150)-(195, 165), 8
LINE (195, 165)-(215, 175), 8
LINE (215, 175)-(205, 165), 8
LINE (205, 165)-(200, 155), 8
LINE (200, 155)-(235, 160), 8
LINE (190, 140)-(215, 135), 8
LINE (215, 135)-(205, 145), 8
LINE (205, 145)-(230, 140), 8
LINE (230, 140)-(225, 145), 8
LINE (125, 160)-(110, 190), 6
LINE (110, 190)-(105, 190), 6
LINE (105, 190)-(100, 195), 6
LINE (100, 195)-(100, 205), 6
LINE (100, 205)-(70, 280), 6
LINE (70, 280)-(95, 310), 6
LINE (95, 310)-(105, 285), 6
LINE (105, 285)-(115, 265), 6
LINE (105, 285)-(160, 355), J
LINE (73, 270)-(-23, 270), J
LINE (112, 273)-(157, 303), 4
LINE (157, 303)-(181, 315), 4
LINE (181, 315)-(205, 321), 4
LINE (205, 321)-(328, 321), 4
LINE (328, 321)-(370, 318), 4
LINE (370, 318)-(385, 315), 4
LINE (385, 315)-(394, 312), 4
LINE (394, 312)-(397, 309), 4
LINE (397, 309)-(397, 306), 4
LINE (397, 306)-(394, 300), 4
LINE (394, 300)-(385, 297), 4
LINE (385, 297)-(301, 294), 4
LINE (301, 294)-(256, 291), 4
LINE (256, 291)-(247, 288), 4
LINE (247, 288)-(286, 285), 4
LINE (286, 285)-(316, 285), 4
LINE (316, 285)-(337, 282), 4
LINE (337, 282)-(340, 279), 4
LINE (340, 279)-(340, 276), 4
LINE (340, 276)-(301, 273), 4
LINE (301, 273)-(253, 270), 4
LINE (253, 270)-(244, 267), 4
LINE (244, 267)-(256, 264), 4
LINE (256, 264)-(286, 264), 4
LINE (286, 264)-(304, 261), 4
LINE (304, 261)-(307, 258), 4
LINE (307, 258)-(304, 255), 4
LINE (304, 255)-(226, 234), 4
LINE (226, 234)-(232, 228), 4
LINE (232, 228)-(244, 222), 4
LINE (244, 222)-(253, 219), 4
LINE (253, 219)-(268, 213), 4
LINE (268, 213)-(274, 207), 4
LINE (274, 207)-(280, 195), 4
LINE (280, 195)-(274, 186), 4
LINE (274, 186)-(265, 177), 4
LINE (265, 177)-(258, 174), 4
LINE (113, 27)-(65, 75), 3
LINE (65, 75)-(113, 123), 3
LINE (113, 123)-(161, 75), 3
LINE (161, 75)-(145, 59), 3
LINE (145, 59)-(113, 91), 3
LINE (177, 107)-(177, 43), 3
LINE (177, 43)-(209, 43), 3
LINE (209, 43)-(209, 107), 3
LINE (177, 75)-(209, 75), 3
LINE (225, 107)-(225, 43), 3
LINE (225, 43)-(241, 59), 3
LINE (241, 59)-(257, 43), 3
LINE (257, 43)-(257, 107), 3
LINE (273, 107)-(273, 43), 3
LINE (273, 43)-(305, 43), 3
LINE (273, 75)-(289, 75), 3
LINE (273, 107)-(305, 107), 3
LINE (321, 43)-(321, 43), 3
LINE (337, 43)-(337, 107), 3
LINE (337, 107)-(369, 107), 3
LINE (369, 107)-(369, 43), 3
LINE (369, 43)-(337, 43), 3
LINE (385, 43)-(401, 107), 3
LINE (401, 107)-(417, 43), 3
LINE (433, 43)-(433, 107), 3
LINE (433, 107)-(465, 107), 3
LINE (433, 75)-(449, 75), 3
LINE (433, 43)-(465, 43), 3
LINE (481, 107)-(545, 43), 3
LINE (545, 43)-(577, 75), 3
LINE (577, 75)-(545, 107), 3
LINE (545, 107)-(513, 75), 3
LINE (513, 75)-(513, 139), 3
LINE (481, 139)-(225, 123), 11
LINE (225, 118)-(485, 128), 11
LINE (485, 118)-(152, 111), 11
LINE (122, 243)-(122, 249), 6
LINE (122, 249)-(128, 255), 6
LINE (128, 255)-(155, 240), 6
LINE (128, 243)-(128, 255), 16
LINE (134, 249)-(134, 243), 16
LINE (140, 243)-(140, 246), 16
DO: LOOP UNTIL INKEY$ = CHR$(13)
SYSTEM
truc:
FOR i = 1 TO 13
COLOR 14
LOCATE i, 60 - x1: PRINT " € €€ €€ €€ € "
COLOR 15
LOCATE i + 1, 60 - x1: PRINT "ﬂ€€€€€€€€€€€€ﬂ"
FOR g = 1 TO 1000
NEXT g
NEXT i
FOR i = 1 TO 13
COLOR 14
LOCATE i, 60 - x1: PRINT "              "
COLOR 15
LOCATE i + 1, 60 - x1: PRINT "              "
FOR g = 1 TO 1000
NEXT g
NEXT i

COLOR 4
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "  €   €        "
LOCATE 15, 60 - x1: PRINT "      €        "
LOCATE 16, 60 - x1: PRINT "      €   ﬂ    "
LOCATE 17, 60 - x1: PRINT "   ‹  €€       "
LOCATE 18, 60 - x1: PRINT "    €€€€€€     "
LOCATE 19, 60 - x1: PRINT "   €€€€€€€€    "
FOR i = 1 TO 500: NEXT i
FOR ii = 1 TO 10
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "    €€    €€   "
LOCATE 15, 60 - x1: PRINT "   €≤≤€  €≤≤€  "
LOCATE 16, 60 - x1: PRINT "‹ €±±±±€€±±±±€ "
LOCATE 17, 60 - x1: PRINT " €∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 18, 60 - x1: PRINT "€€∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 19, 60 - x1: PRINT " €∞∞∞∞€€€€∞∞∞∞€"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "‹   ‹‹    ‹‹   "
LOCATE 15, 60 - x1: PRINT "   ‹ﬂﬂ‹  ‹ﬂﬂ‹  "
LOCATE 16, 60 - x1: PRINT "   €≤≤≤€€≤≤≤€  "
LOCATE 17, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 18, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 19, 60 - x1: PRINT "  €±±±€€€€±±±€ "
FOR i = 1 TO 500: NEXT i
NEXT ii
LOCATE 13, 60 - x1: PRINT "     ‹‹‹       "
LOCATE 14, 60 - x1: PRINT "    €   €      "
LOCATE 15, 60 - x1: PRINT "        €  €   "
LOCATE 16, 60 - x1: PRINT "    €  €€€     "
LOCATE 17, 60 - x1: PRINT "     ‹€€€€€  € "
LOCATE 18, 60 - x1: PRINT "   ‹€€€€€€€€‹  "
LOCATE 19, 60 - x1: PRINT " ‹€€€€€€€€€€€€‹"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "               "
LOCATE 15, 60 - x1: PRINT "       €       "
LOCATE 16, 60 - x1: PRINT "       €       "
LOCATE 17, 60 - x1: PRINT "    € €€€      "
LOCATE 18, 60 - x1: PRINT "     €€€€€     "
LOCATE 19, 60 - x1: PRINT "   ‹€€€€€€€‹€  "
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "               "
LOCATE 15, 60 - x1: PRINT "               "
LOCATE 16, 60 - x1: PRINT "               "
LOCATE 17, 60 - x1: PRINT "               "
LOCATE 18, 60 - x1: PRINT "    ‹‹‹‹‹‹‹‹   "
LOCATE 19, 60 - x1: PRINT "  ‹€€€€€€€€€€‹ "
FOR i = 1 TO 5000: NEXT i
 COLOR 4
 LOCATE 3, 3: PRINT " €ﬂ€ €ﬂ€ €ﬂ€ €ﬂ €ﬂ€ €  € €ﬂ€ €ﬂ € €ﬂ"
 LOCATE 4, 3: PRINT " € € € € € € €  € € €  € € € €  € € "
 LOCATE 5, 3: PRINT " €ﬂ€ €ﬂﬂ € € €  €ﬂ€ €  € €ﬂﬂ ﬂ€ € ﬂ€"
 LOCATE 6, 3: PRINT " € € €   €‹€ €‹ € € €‹ € €   ‹€ € ‹€"
 FOR i = 1 TO 5
  LOCATE 6+i, 3: PRINT " € € €   €€€ €€ € € €€ € €   €€ € €€"
FOR g = 1 TO 500
NEXT g
NEXT i
PLAY "mbo0l30mlccccccp10cccp10cccccccp10cccp10dddddddp10dddp10dddddddddddddddd"
DO: LOOP WHILE INKEY$ = ""
FOR ii = 1 TO 10
RANDOMIZE TIMER
x = INT(RND * 640) + 1
y = INT(RND * 400) + 1
x1 = INT(RND * 640) + 1
y1 = INT(RND * 400) + 1
x2 = INT(RND * 640) + 1
y2 = INT(RND * 400) + 1
x3 = INT(RND * 640) + 1
y3 = INT(RND * 400) + 1
x4 = INT(RND * 640) + 1
y4 = INT(RND * 400) + 1
x5 = INT(RND * 640) + 1
y5 = INT(RND * 400) + 1
x6 = INT(RND * 640) + 1
y6 = INT(RND * 400) + 1
x7 = INT(RND * 640) + 1
y7 = INT(RND * 400) + 1
x8 = INT(RND * 640) + 1
y8 = INT(RND * 400) + 1
x9 = INT(RND * 640) + 1
y9 = INT(RND * 400) + 1
x10 = INT(RND * 640) + 1
y10 = INT(RND * 400) + 1
FOR i = 1 TO 50
CIRCLE (x, y), i, 14
CIRCLE (x1, y1), i, 14
CIRCLE (x2, y2), i, 14
CIRCLE (x3, y3), i, 14
CIRCLE (x4, y4), i, 14
CIRCLE (x5, y5), i, 14
CIRCLE (x6, y6), i, 14
CIRCLE (x7, y7), i, 14
CIRCLE (x8, y8), i, 14
CIRCLE (x9, y9), i, 14
CIRCLE (x10, y10), i, 14
NEXT i
FOR i = 1 TO 50
CIRCLE (x, y), i, 0
CIRCLE (x1, y1), i, 0
CIRCLE (x2, y2), i, 0
CIRCLE (x3, y3), i, 0
CIRCLE (x4, y4), i, 0
CIRCLE (x5, y5), i, 0
CIRCLE (x6, y6), i, 0
CIRCLE (x7, y7), i, 0
CIRCLE (x8, y8), i, 0
CIRCLE (x9, y9), i, 0
CIRCLE (x10, y10), i, 0
CIRCLE (x4, y4), i, 0
NEXT i
PLAY "mbl64o0fedcbagfdeccfdgedfcgefd"
NEXT ii
PLAY "o1l30mlfedddddddgabbbbbbbo0msddddmlcccccccccc"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
SYSTEM
truc2:
FOR i = x + 14 TO 60 - x1 - 5
COLOR 14
LOCATE 14, i: PRINT "  ‹‹‹‹‹‹‹‹‹‹   "
LOCATE 15, i: PRINT " ‹‹‹‹‹‹‹≤±∞±€  "
LOCATE 16, i: PRINT "  ‹‹‹‹‹‹≤≤≤≤ﬂ  "
FOR g = 1 TO 50
NEXT g
NEXT i
LOCATE 14, i: PRINT "  ‹‹‹‹‹‹‹‹‹‹   "
LOCATE 15, i: PRINT " ‹‹‹‹‹‹‹≤±∞±€  "
LOCATE 16, i: PRINT "  ‹‹‹‹‹‹≤≤≤≤ﬂ  "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "   ‹‹‹‹‹‹‹‹‹‹∞  "
LOCATE 15, i: PRINT "  ‹‹‹‹‹‹‹≤±∞±∞  "
LOCATE 16, i: PRINT "   ‹‹‹‹‹‹≤≤≤≤∞  "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "    ‹‹‹‹‹‹‹‹‹∞   "
LOCATE 15, i: PRINT "   ‹‹‹‹‹‹‹≤±∞∞∞  "
LOCATE 16, i: PRINT "    ‹‹‹‹‹‹≤≤≤∞   "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "     ‹‹‹‹‹‹‹‹∞    "
LOCATE 15, i: PRINT "    ‹‹‹‹‹‹‹≤±∞∞   "
LOCATE 16, i: PRINT "     ‹‹‹‹‹‹≤≤∞    "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "       ‹‹‹‹‹‹∞  ∞ "
LOCATE 15, i: PRINT "      ‹‹‹‹‹‹‹∞∞∞  "
LOCATE 16, i: PRINT "       ‹‹‹‹‹‹∞    "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "        ‹‹‹‹∞   ∞∞"
LOCATE 15, i: PRINT "         ‹‹ ∞∞    "
LOCATE 16, i: PRINT "        ‹‹‹‹∞     "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "          ‹‹∞    ∞"
LOCATE 15, i: PRINT "          ‹∞∞     "
LOCATE 16, i: PRINT "         ‹‹∞∞     "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "          ∞∞∞     "
LOCATE 15, i: PRINT "          ∞∞      "
LOCATE 16, i: PRINT "           ∞∞     "
FOR g = 1 TO 1000
NEXT g
 
COLOR 4
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "  €   €        "
LOCATE 15, 60 - x1: PRINT "      €        "
LOCATE 16, 60 - x1: PRINT "      €   ﬂ    "
LOCATE 17, 60 - x1: PRINT "   ‹  €€       "
LOCATE 18, 60 - x1: PRINT "    €€≤≤€€     "
LOCATE 19, 60 - x1: PRINT "   €≤±∞∞±≤€    "
FOR i = 1 TO 500: NEXT i
FOR ii = 1 TO 10
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "    €€    €€   "
LOCATE 15, 60 - x1: PRINT "   €≤≤€  €≤≤€  "
LOCATE 16, 60 - x1: PRINT "‹ €±±±±€€±±±±€ "
LOCATE 17, 60 - x1: PRINT " €∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 18, 60 - x1: PRINT "€€∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 19, 60 - x1: PRINT " €∞∞∞∞€€€€∞∞∞∞€"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "‹   ‹‹    ‹‹   "
LOCATE 15, 60 - x1: PRINT "   ‹ﬂﬂ‹  ‹ﬂﬂ‹  "
LOCATE 16, 60 - x1: PRINT "   €≤≤≤€€≤≤≤€  "
LOCATE 17, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 18, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 19, 60 - x1: PRINT "  €±±±€€€€±±±€ "
FOR i = 1 TO 500: NEXT i
NEXT ii
LOCATE 13, 60 - x1: PRINT "     ‹‹‹       "
LOCATE 14, 60 - x1: PRINT "    €   €      "
LOCATE 15, 60 - x1: PRINT "        €  €   "
LOCATE 16, 60 - x1: PRINT "    €  €€€     "
LOCATE 17, 60 - x1: PRINT "     ‹€≤≤€€  € "
LOCATE 18, 60 - x1: PRINT "   ‹€€≤±±≤€€‹  "
LOCATE 19, 60 - x1: PRINT " ‹€€€≤±∞∞±≤€€€‹"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "               "
LOCATE 15, 60 - x1: PRINT "       €       "
LOCATE 16, 60 - x1: PRINT "       €       "
LOCATE 17, 60 - x1: PRINT "    € €≤€      "
LOCATE 18, 60 - x1: PRINT "     €≤±≤€     "
LOCATE 19, 60 - x1: PRINT "   ‹€≤±∞±≤€‹€  "
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "               "
LOCATE 15, 60 - x1: PRINT "               "
LOCATE 16, 60 - x1: PRINT "               "
LOCATE 17, 60 - x1: PRINT "               "
LOCATE 18, 60 - x1: PRINT "    ‹‹‹‹‹‹‹‹   "
LOCATE 19, 60 - x1: PRINT "  ‹€€€€€€€€€€‹ "
FOR i = 1 TO 5000: NEXT i
 COLOR 4
 LOCATE 3, 3: PRINT " €€€€‹ €   ‹€‹ ‹€‹ €ﬂ‹ ‹€‹ €   € €€€€€ €   €"
 LOCATE 4, 3: PRINT " €   € €   € € € € € € € € €   €   €   ﬂ€ €ﬂ"
 LOCATE 5, 3: PRINT " €€€€  €   € € € € € € €‹€ €   €   €    ﬂ€ﬂ"
 LOCATE 6, 3: PRINT " €   € €   € € € € € € € € €   €   €     €"
 FOR i = 1 TO 5
  LOCATE 6 + i, 3: PRINT " €€€€€ €€€ €€€ €€€ €€€ € € €€€ €   €     €"
FOR g = 1 TO 500
NEXT g
NEXT i
PLAY "o3l30mlfedddddddgabbbbbbbo0msddddmlcccccccccc"
DO: LOOP UNTIL INKEY$ = CHR$(32)
CLS
IF stage = 1 THEN GOTO 100
IF stage = 2 THEN GOTO 101
IF stage = 3 THEN GOTO 102
IF stage = 4 THEN GOTO 103
IF stage = 5 THEN GOTO 104
IF stage = 6 THEN GOTO 105
IF stage = 7 THEN GOTO 106
IF stage = 8 THEN GOTO 107
truc3:
FOR i = x + 14 TO 60 - x1 - 12 STEP 3
COLOR 15
LOCATE 14, i: PRINT "    ‹ ﬂﬂﬂ‹‹ ﬂ‹ ‹"
LOCATE 15, i: PRINT "      ﬂﬂ€€€€€€ﬂ "
LOCATE 16, i: PRINT "    ﬂ ‹ﬂ ﬂ€‹ ﬂ‹ "
NEXT i
LOCATE 14, i: PRINT "    ‹      ‹   "
LOCATE 15, i: PRINT "     ﬂ€€€€ﬂ    "
LOCATE 16, i: PRINT "     ‹ﬂ  ﬂ‹    "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "    ‹           "
LOCATE 15, i: PRINT "     ﬂ€€€‹      "
LOCATE 16, i: PRINT "    ‹‹   ﬂ‹     "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "      ‹  ‹ﬂ‹     "
LOCATE 15, i: PRINT "       €€ ‹      "
LOCATE 16, i: PRINT "      ﬂ  ﬂ       "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "      ‹           "
LOCATE 15, i: PRINT "       €          "
LOCATE 16, i: PRINT "       ﬂ‹         "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "      ‹           "
LOCATE 15, i: PRINT "          ‹ﬂ      "
LOCATE 16, i: PRINT "      ﬂ           "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "                  "
LOCATE 15, i: PRINT "                  "
LOCATE 16, i: PRINT "      ‹‹  ‹‹      "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "                  "
LOCATE 15, i: PRINT "                  "
LOCATE 16, i: PRINT "       ‹   ‹      "
FOR g = 1 TO 1000
NEXT g
LOCATE 14, i: PRINT "                  "
LOCATE 15, i: PRINT "                  "
LOCATE 16, i: PRINT "                  "
FOR g = 1 TO 1000
NEXT g
COLOR 4
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "  €   €        "
LOCATE 15, 60 - x1: PRINT "      €        "
LOCATE 16, 60 - x1: PRINT "      €   ﬂ    "
LOCATE 17, 60 - x1: PRINT "   ‹  €€       "
LOCATE 18, 60 - x1: PRINT "    €€€€€€     "
LOCATE 19, 60 - x1: PRINT "   €€€€€€€€    "
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "    €€    €€   "
LOCATE 15, 60 - x1: PRINT "   €≤≤€  €≤≤€  "
LOCATE 16, 60 - x1: PRINT "‹ €±±±±€€±±±±€ "
LOCATE 17, 60 - x1: PRINT " €∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 18, 60 - x1: PRINT "€€∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 19, 60 - x1: PRINT "‹€∞∞∞∞€€€€∞∞∞∞€"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "‹   ‹‹    ‹‹   "
LOCATE 15, 60 - x1: PRINT "   ‹ﬂﬂ‹  ‹ﬂﬂ‹  "
LOCATE 16, 60 - x1: PRINT "   €≤≤≤€€≤≤≤€  "
LOCATE 17, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 18, 60 - x1: PRINT "  €±±±±€€±±±±€ "
LOCATE 19, 60 - x1: PRINT "‹‹€±±±€€€€±±±€‹"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "     ‹‹‹       "
LOCATE 14, 60 - x1: PRINT "    €   €      "
LOCATE 15, 60 - x1: PRINT "        €  €   "
LOCATE 16, 60 - x1: PRINT "    €  €€€     "
LOCATE 17, 60 - x1: PRINT "     ‹€€€€€  € "
LOCATE 18, 60 - x1: PRINT "   ‹€€€€€€€€‹  "
LOCATE 19, 60 - x1: PRINT " ‹€€€€€€€€€€€€‹"
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "               "
LOCATE 15, 60 - x1: PRINT "       €       "
LOCATE 16, 60 - x1: PRINT "       €       "
LOCATE 17, 60 - x1: PRINT "    € €€€      "
LOCATE 18, 60 - x1: PRINT "     €€€€€     "
LOCATE 19, 60 - x1: PRINT "   ‹€€€€€€€‹€  "
FOR i = 1 TO 500: NEXT i
LOCATE 13, 60 - x1: PRINT "               "
LOCATE 14, 60 - x1: PRINT "       A       "
LOCATE 15, 60 - x1: PRINT "      RAY      "
LOCATE 16, 60 - x1: PRINT "       EX      "
LOCATE 17, 60 - x1: PRINT "               "
LOCATE 18, 60 - x1: PRINT "               "
LOCATE 19, 60 - x1: PRINT "  ‹€€€€€€€€€€‹ "
me = me - (me / 2)
IF me > 0 THEN LOCATE 1, 1: PRINT STRING$(me, "±"); STRING$(80 - me, " ")
RETURN
2 SCREEN 9
x = 3
x1 = 3
me = 35
em = 35
pla2 = 1
910
h = 1
pinan = 0
patado = 0
cabe = 0

IF me > 0 THEN COLOR 12: LOCATE 1, 1: PRINT STRING$(me, "±"); "    "
IF em > 0 THEN COLOR 1: LOCATE 3, 1: PRINT STRING$(em, "≤"); "    "
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
drafhon1$ = "     __       "
drafhon2$ = "     ±±       "
drafhon3$ = "    ‹‹‹‹‹     "
drafhon4$ = " ±‹€ €€±‹€    "
drafhon5$ = "     €€€      "
drafhon6$ = "     € €      "
drafhon7$ = "    ‹€ €‹     "
 

 
900
FOR i = 1 TO 4

IF me > 0 THEN COLOR 4: LOCATE 1, 1: PRINT STRING$(me, "±"); "                         "
IF em > 0 THEN COLOR 9: LOCATE 3, 1: PRINT STRING$(em, "≤"); "                         "
IF em <= 0 THEN GOTO Gana2
IF me <= 0 THEN GOTO Gana1
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
 COLOR 12
LOCATE 13, x + 1: PRINT kuyoshi1$
LOCATE 14, x + 1: PRINT kuyoshi2$

COLOR 4
LOCATE 15, x + 1: PRINT kuyoshi3$
LOCATE 16, x + 1: PRINT kuyoshi4$
LOCATE 17, x + 1: PRINT kuyoshi5$
LOCATE 18, x + 1: PRINT kuyoshi6$
LOCATE 19, x + 1: PRINT kuyoshi7$

COLOR 6
LOCATE 13, 60 - x1: PRINT drafhon1$
LOCATE 14, 60 - x1: PRINT drafhon2$
COLOR 9
LOCATE 15, 60 - x1: PRINT drafhon3$
LOCATE 16, 60 - x1: PRINT drafhon4$

LOCATE 17, 60 - x1: PRINT drafhon5$
LOCATE 18, 60 - x1: PRINT drafhon6$
LOCATE 19, 60 - x1: PRINT drafhon7$
c$ = INKEY$
c$ = UCASE$(c$)
IF c$ = "D" AND pinan = 0 AND cabe = 0 AND patado = 0 AND 60 - x1 < 65 THEN x1 = x1 - 1
IF c$ = "A" AND pinan = 0 AND cabe = 0 AND patado = 0 AND 60 - x1 > 14 THEN x1 = x1 + 1
IF c$ = "Q" THEN pla2 = 1: call pina2: pinan = 1
IF c$ = "W" THEN pla2 = 1: call cabe2: cabe = 1
IF c$ = "S" THEN pla2 = 1: call pata2: patado = 1
IF c$ = "E" AND x1 > 4 THEN borra2: patado = 0: pinan = 0: cabe = 0: x1 = x1 - 3: GOTO 920
IF c$ = CHR$(0) + "M" AND x < 60 AND pina22 = 0 AND cabe22 = 0 AND pata22 = 0 THEN x = x + 1
IF c$ = CHR$(0) + "K" AND x > 1 AND pina22 = 0 AND cabe22 = 0 AND pata22 = 0 AND x > 1 THEN x = x - 1
IF c$ = " " THEN pla2 = 0: call pina2: pina22 = 1
IF c$ = CHR$(0) + "H" THEN pla2 = 0: call cabe2: cabe22 = 1
IF c$ = CHR$(0) + "P" THEN pla2 = 0: call pata2: pata22 = 1

IF SCREEN(16, x + 14) <> ASC(" ") AND pina22 = 1 THEN borra: x = x - 3: me = me - 1: GOTO 920
IF SCREEN(15, x + 14) <> ASC(" ") AND pata22 = 1 THEN borra: x = x - 3: me = me - 2: GOTO 920
IF SCREEN(14, x + 14) <> ASC(" ") AND cabe22 = 1 THEN borra: x = x - 3: me = me - 3: GOTO 920


IF SCREEN(16, 60 - x1 - 3) <> ASC(" ") AND 60 - x1 < 65 AND pinan = 1 THEN borra2: em = em - 1: x1 = x1 - 3: GOTO 910
IF SCREEN(15, 60 - x1 - 3) <> ASC(" ") AND 60 - x1 < 65 AND patado = 1 THEN borra2: em = em - 2: x1 = x1 - 3: GOTO 910
IF SCREEN(14, 60 - x1 - 3) <> ASC(" ") AND 60 - x1 < 65 AND cabe = 1 THEN borra2: em = em - 3: x1 = x1 - 3: GOTO 910

IF c$ = CHR$(13) AND x > 4 THEN borra: pata22 = 0: pina22 = 0: cabe22 = 0: x = x - 3: GOTO 920
IF 63 - x1 < LEN(drafhon(7)) + x AND x > 2 THEN x = x - 1
 

NEXT i
COLOR 6
LOCATE 20, 1: PRINT STRING$(80, "∞")
h = h + 1
hh = hh + 1
IF h >= 3 THEN 910
IF hh >= 3 THEN 920

GOTO 900
920

kuyoshi1$ = "      __     "
kuyoshi2$ = "      ±±     "
kuyoshi3$ = "    ‹‹‹‹‹    "
kuyoshi4$ = "   €‹±€€ €‹± "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "     € €     "
kuyoshi7$ = "    ‹€ €‹    "
hh = 1
pina22 = 0
pata22 = 0
cabe22 = 0
LOCATE 20, 1: PRINT STRING$(80, "∞")
GOTO 900
Gana1:
SCREEN 8
COLOR 12
LOCATE 13, 10: PRINT kuyoshi1$
LOCATE 14, 10: PRINT kuyoshi2$

COLOR 4
LOCATE 15, 10: PRINT kuyoshi3$
LOCATE 16, 10: PRINT kuyoshi4$
LOCATE 17, 10: PRINT kuyoshi5$
LOCATE 18, 10: PRINT kuyoshi6$
LOCATE 19, 10: PRINT kuyoshi7$
LOCATE 5, 20: PRINT "Ganador: JUGADOR N¯1! (ROJO)"
DO: LOOP UNTIL INKEY$ = CHR$(13)
CLS
SYSTEM
Gana2:

SCREEN 8
COLOR 6
LOCATE 13, 10: PRINT drafhon1$
LOCATE 14, 10: PRINT drafhon2$
COLOR 9
LOCATE 15, 10: PRINT drafhon3$
LOCATE 16, 10: PRINT drafhon4$
            
LOCATE 17, 10: PRINT drafhon5$
LOCATE 18, 10: PRINT drafhon6$
LOCATE 19, 10: PRINT drafhon7$
LOCATE 5, 20: PRINT "Ganador: JUGADOR N¯2! (AZUL)"
DO: LOOP UNTIL INKEY$ = CHR$(13)
CLS
SYSTEM
Matar:
COLOR 4
LOCATE 14, 60 - x1: PRINT "    ‹€‹     "
LOCATE 15, 60 - x1: PRINT "    ‹€‹     "
LOCATE 16, 60 - x1: PRINT "  ‹ﬂ € ﬂ‹   "
LOCATE 17, 60 - x1: PRINT "ﬂﬂ  ‹€‹  ﬂ  "
LOCATE 18, 60 - x1: PRINT "  ‹€€€€€‹   "
LOCATE 19, 60 - x1: PRINT "  (OOOOO)   "
FOR i = 1 TO 10000: NEXT i
LOCATE 14, 60 - x1: PRINT "   ‹€ ‹     "
LOCATE 15, 60 - x1: PRINT "    ‹€ ‹    "
LOCATE 16, 60 - x1: PRINT "  ‹ﬂ €  ﬂ‹  "
LOCATE 17, 60 - x1: PRINT "ﬂﬂ  ‹€ ‹   ﬂ "
LOCATE 18, 60 - x1: PRINT "  ‹€€€ €€‹   "
LOCATE 19, 60 - x1: PRINT "  (OOO OO)   "
FOR i = 1 TO 7000: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "    ‹€ ‹    "
LOCATE 16, 60 - x1: PRINT "  ‹ﬂ €  ﬂ‹  "
LOCATE 17, 60 - x1: PRINT "ﬂﬂ  ‹€ ‹   ﬂ "
LOCATE 18, 60 - x1: PRINT "  ‹€€€ €€‹   "
LOCATE 19, 60 - x1: PRINT "  (OOO OO)   "
FOR i = 1 TO 5000: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "ﬂﬂ  ‹€ ‹   ﬂ "
LOCATE 18, 60 - x1: PRINT "  ‹€€€ €€‹   "
LOCATE 18, 60 - x1: PRINT "  (OOO OO)   "
FOR i = 1 TO 2500: NEXT i
FOR a = 1 TO 100
LOCATE 14, 60 - x1: PRINT "    ∞∞   ∞  "
LOCATE 15, 60 - x1: PRINT "  ∞  ∞ ∞∞ ∞ "
LOCATE 16, 60 - x1: PRINT "     ∞∞∞    "
LOCATE 17, 60 - x1: PRINT " ∞  ‹€∞‹   ∞ "
LOCATE 18, 60 - x1: PRINT "  ‹€€€ €€‹   "
LOCATE 19, 60 - x1: PRINT "  (OOO OO)   "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "    ∞∞    ∞ "
LOCATE 15, 60 - x1: PRINT "   ∞ ∞  ∞∞  "
LOCATE 16, 60 - x1: PRINT " ∞   ∞ ∞   ∞"
LOCATE 17, 60 - x1: PRINT "    ‹€∞‹     "
LOCATE 18, 60 - x1: PRINT "∞ ‹€€€ €€‹  ∞"
LOCATE 19, 60 - x1: PRINT "  (OOO OO)   "
FOR i = 1 TO 500: NEXT i
NEXT a
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "€   ‹  ‹   € "
LOCATE 18, 60 - x1: PRINT "€‹‹€€  €€‹‹€ "
LOCATE 19, 60 - x1: PRINT "  (OOOOOO)   "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "€          € "
LOCATE 18, 60 - x1: PRINT "€‹‹‹‹‹‹‹‹‹‹€ "
LOCATE 19, 60 - x1: PRINT "   OO  OO    "
FOR i = 1 TO 550: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "€          € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹€€ "
LOCATE 19, 60 - x1: PRINT "   O    O    "
FOR i = 1 TO 600: NEXT i
LOCATE 14, 60 - x1: PRINT "   *    *   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 650: NEXT i
LOCATE 14, 60 - x1: PRINT "   +    +   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 700: NEXT i
LOCATE 14, 60 - x1: PRINT "   x    x   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "   *    *   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "   +    +   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "   x    x   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "   -    -   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "   |    |   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT " ‹        ‹ "
LOCATE 17, 60 - x1: PRINT "€ ‹ ‹ ‹ €  € "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹€‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "     ∞∞      "
LOCATE 18, 60 - x1: PRINT "€‹€‹€‹∞‹€‹‹€ "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 750: NEXT i
LOCATE 14, 60 - x1: PRINT "            "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "    ∞ ∞∞    "
LOCATE 17, 60 - x1: PRINT "     ∞       "
LOCATE 18, 60 - x1: PRINT "  €‹€∞∞‹€‹   "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "  ±±±±±±±   "
LOCATE 15, 60 - x1: PRINT " ±± * *  ±  "
LOCATE 16, 60 - x1: PRINT "  ±     ±   "
LOCATE 17, 60 - x1: PRINT "   ±  ±±±    "
LOCATE 18, 60 - x1: PRINT "    ±±±±     "
LOCATE 19, 60 - x1: PRINT "     ±±      "
FOR a = 1 TO 10
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "   ≤≤≤≤≤*   "
LOCATE 15, 60 - x1: PRINT "    ≤ ≤ ≤   "
LOCATE 16, 60 - x1: PRINT "     ≤ ≤    "
LOCATE 17, 60 - x1: PRINT "   ≤≤≤≤≤     "
LOCATE 18, 60 - x1: PRINT "     ≤≤      "
LOCATE 19, 60 - x1: PRINT "     ≤       "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "   ≤≤≤≤≤*   "
LOCATE 15, 60 - x1: PRINT "    ≤ ≤ ≤   "
LOCATE 16, 60 - x1: PRINT "        ≤   "
LOCATE 17, 60 - x1: PRINT "   ≤ ≤ ≤     "
LOCATE 18, 60 - x1: PRINT "  ≤≤≤≤≤≤     "
LOCATE 19, 60 - x1: PRINT "     ≤       "
NEXT a
LOCATE 14, 60 - x1: PRINT "   ≤≤≤≤≤*   "
LOCATE 15, 60 - x1: PRINT "        ≤   "
LOCATE 16, 60 - x1: PRINT "       ≤    "
LOCATE 17, 60 - x1: PRINT "   ≤≤≤≤≤     "
LOCATE 18, 60 - x1: PRINT "     ≤≤      "
LOCATE 19, 60 - x1: PRINT "     ≤       "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "    ≤≤≤     "
LOCATE 15, 60 - x1: PRINT "   ±±±±±    "
LOCATE 16, 60 - x1: PRINT "   ±±±±±    "
LOCATE 17, 60 - x1: PRINT "    ≤≤≤      "
LOCATE 18, 60 - x1: PRINT "     ±       "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "    ≤≤≤     "
LOCATE 15, 60 - x1: PRINT "   ±± ±±    "
LOCATE 16, 60 - x1: PRINT "   ±± ±±    "
LOCATE 17, 60 - x1: PRINT "    ≤≤≤      "
LOCATE 18, 60 - x1: PRINT "     ±       "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "    ≤≤≤     "
LOCATE 15, 60 - x1: PRINT "   ±   ±    "
LOCATE 16, 60 - x1: PRINT "   ±   ±    "
LOCATE 17, 60 - x1: PRINT "    ≤ ≤      "
LOCATE 18, 60 - x1: PRINT "     ±       "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "       ±±   "
LOCATE 15, 60 - x1: PRINT "      ±±    "
LOCATE 16, 60 - x1: PRINT "     ±      "
LOCATE 17, 60 - x1: PRINT "    ±        "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "       ±±   "
LOCATE 15, 60 - x1: PRINT "      ±±    "
LOCATE 16, 60 - x1: PRINT "     ±      "
LOCATE 17, 60 - x1: PRINT "             "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "       ±±   "
LOCATE 15, 60 - x1: PRINT "       ±    "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "             "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
LOCATE 14, 60 - x1: PRINT "       ±±   "
LOCATE 15, 60 - x1: PRINT "            "
LOCATE 16, 60 - x1: PRINT "            "
LOCATE 17, 60 - x1: PRINT "             "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 500: NEXT i
FOR a = 1 TO 50
LOCATE 14, 60 - x1: PRINT "             "
LOCATE 15, 60 - x1: PRINT "             "
LOCATE 16, 60 - x1: PRINT "  VoLvErE!   "
LOCATE 17, 60 - x1: PRINT "             "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 1000: NEXT i
LOCATE 14, 60 - x1: PRINT "             "
LOCATE 15, 60 - x1: PRINT "             "
LOCATE 16, 60 - x1: PRINT "  vOlVeRe !  "
LOCATE 17, 60 - x1: PRINT "             "
LOCATE 18, 60 - x1: PRINT "             "
LOCATE 19, 60 - x1: PRINT "             "
FOR i = 1 TO 1000: NEXT i
NEXT a
CLS
GOTO 107
MUEREN:
 

COLOR 1
LOCATE 13, x + 1: PRINT "      __     "
LOCATE 14, x + 1: PRINT "      ±±     "
COLOR J
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹    "
LOCATE 16, x + 1: PRINT "   €‹±€€ €‹± "
LOCATE 17, x + 1: PRINT "     €€€     "
LOCATE 18, x + 1: PRINT "     € €     "
LOCATE 19, x + 1: PRINT "    ‹€ €‹    "
FOR i = 1 TO 1000: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "       __    "
LOCATE 14, x + 1: PRINT "       ±±    "
COLOR J
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹    "
LOCATE 16, x + 1: PRINT "   €‹±€€ €‹± "
LOCATE 17, x + 1: PRINT "     €€€     "
LOCATE 18, x + 1: PRINT "     € €     "
LOCATE 19, x + 1: PRINT "    ‹€ €‹    "
FOR i = 1 TO 1000: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "      __     "
LOCATE 14, x + 1: PRINT "      ±±     "
COLOR J
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹    "
LOCATE 16, x + 1: PRINT "   €‹±€€ €‹± "
LOCATE 17, x + 1: PRINT "     €€€     "
LOCATE 18, x + 1: PRINT "     € €     "
LOCATE 19, x + 1: PRINT "    ‹€ €‹    "
FOR i = 1 TO 1000: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "     __     "
LOCATE 14, x + 1: PRINT "     ±±     "
COLOR J
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹    "
LOCATE 16, x + 1: PRINT "   €‹±€€ €‹± "
LOCATE 17, x + 1: PRINT "     €€€     "
LOCATE 18, x + 1: PRINT "     € €     "
LOCATE 19, x + 1: PRINT "    ‹€ €‹    "
FOR i = 1 TO 1000: NEXT i
FOR a = 1 TO 10
COLOR 2
LOCATE 13, x + 1: PRINT "             "
LOCATE 14, x + 1: PRINT "       |±∞   "
COLOR 4
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹∞   "
LOCATE 16, x + 1: PRINT "   €‹±€€ ∞‹± "
LOCATE 17, x + 1: PRINT "     €€€ ∞∞  "
LOCATE 18, x + 1: PRINT "     € €∞∞∞  "
LOCATE 19, x + 1: PRINT "    ‹€ €∞∞∞  "
FOR i = 1 TO 700: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "             "
LOCATE 14, x + 1: PRINT "       |±∞   "
COLOR 4
LOCATE 15, x + 1: PRINT "    ‹‹‹‹‹∞   "
LOCATE 16, x + 1: PRINT "   €‹±€€∞∞∞± "
LOCATE 17, x + 1: PRINT "     €€€∞∞∞  "
LOCATE 18, x + 1: PRINT "     € ∞∞∞∞∞ "
LOCATE 19, x + 1: PRINT "    ‹€ ∞∞∞∞∞ "
FOR i = 1 TO 700: NEXT i
NEXT a
COLOR 1
LOCATE 13, x + 1: PRINT "             "
LOCATE 14, x + 1: PRINT "       |±∞   "
COLOR 4
LOCATE 15, x + 1: PRINT "    ‹‹‹‹∞∞∞  "
LOCATE 16, x + 1: PRINT "   €‹±€∞∞∞∞∞ "
LOCATE 17, x + 1: PRINT "     €€∞∞∞∞∞ "
LOCATE 18, x + 1: PRINT "     €∞∞∞∞∞∞ "
LOCATE 19, x + 1: PRINT "     ∞∞∞∞∞∞∞ "
FOR i = 1 TO 500: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "             "
LOCATE 14, x + 1: PRINT "       |±∞   "
COLOR 4
LOCATE 15, x + 1: PRINT "    ‹‹∞∞∞∞∞  "
LOCATE 16, x + 1: PRINT "   €‹±∞∞∞∞∞∞ "
LOCATE 17, x + 1: PRINT "     ∞∞∞∞∞∞∞ "
LOCATE 18, x + 1: PRINT "    ∞∞∞∞∞∞∞∞ "
LOCATE 19, x + 1: PRINT "   ∞∞∞∞∞∞∞∞∞ "
FOR i = 1 TO 500: NEXT i
COLOR 1
LOCATE 13, x + 1: PRINT "             "
LOCATE 14, x + 1: PRINT "       |±∞   "
COLOR 4
LOCATE 15, x + 1: PRINT "    ∞∞∞∞∞∞∞  "
LOCATE 16, x + 1: PRINT "   ∞∞∞∞∞∞∞∞∞ "
LOCATE 17, x + 1: PRINT "   ∞∞∞∞∞∞∞∞∞ "
LOCATE 18, x + 1: PRINT "   ∞∞∞∞∞∞∞∞∞ "
LOCATE 19, x + 1: PRINT "∞∞∞∞∞∞∞∞∞∞∞∞∞"
FOR i = 1 TO 500: NEXT i
COLOR 4
LOCATE 13, x + 1: PRINT "        |±±    "
LOCATE 14, x + 1: PRINT "  €   €        "
LOCATE 15, x + 1: PRINT "      €        "
LOCATE 16, x + 1: PRINT "      €   ﬂ    "
LOCATE 17, x + 1: PRINT "   ‹  €€       "
LOCATE 18, x + 1: PRINT "    €€€€€€     "
LOCATE 19, x + 1: PRINT "   €€€€€€€€    "
FOR a = 1 TO 50
FOR i = 1 TO 750: NEXT i
LOCATE 13, x + 1: PRINT "               "
LOCATE 14, x + 1: PRINT "    €€    €€ __"
LOCATE 15, x + 1: PRINT "   €≤≤€  €≤≤€±±"
LOCATE 16, x + 1: PRINT "‹ €±±±±€€±±±±€ "
LOCATE 17, x + 1: PRINT " €∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 18, x + 1: PRINT "€€∞∞∞∞∞€€∞∞∞∞∞€"
LOCATE 19, x + 1: PRINT "‹€∞∞∞∞€€€€∞∞∞∞€"
FOR i = 1 TO 500: NEXT i
LOCATE 13, x + 1: PRINT "               "
LOCATE 14, x + 1: PRINT "‹   ‹‹    ‹‹ __"
LOCATE 15, x + 1: PRINT "   ‹€€‹  ‹€€‹±±"
LOCATE 16, x + 1: PRINT "   €≤≤≤€€≤≤≤€  "
LOCATE 17, x + 1: PRINT "  €±±±±€€±±±±€ "
LOCATE 18, x + 1: PRINT "  €±±±±€€±±±±€ "
LOCATE 19, x + 1: PRINT "‹‹€±±±€€€€±±±€‹"
NEXT a
FOR i = 1 TO 500: NEXT i
LOCATE 13, x + 1: PRINT "     ‹‹‹       "
LOCATE 14, x + 1: PRINT "    €   €      "
LOCATE 15, x + 1: PRINT "        €  € __"
LOCATE 16, x + 1: PRINT "    €  €€€   ±±"
LOCATE 17, x + 1: PRINT "     ‹€€€€€  € "
LOCATE 18, x + 1: PRINT "   ‹€€€€€€€€‹  "
LOCATE 19, x + 1: PRINT " ‹€€€€€€€€€€€€‹"
FOR i = 1 TO 500: NEXT i
LOCATE 13, x + 1: PRINT "               "
LOCATE 14, x + 1: PRINT "               "
LOCATE 15, x + 1: PRINT "       €       "
LOCATE 16, x + 1: PRINT "       €       "
LOCATE 17, x + 1: PRINT "    € €€€      "
LOCATE 18, x + 1: PRINT "     €€€€€   __"
LOCATE 19, x + 1: PRINT "   ‹€€€€€€€‹€±±"
FOR i = 1 TO 500: NEXT i
LOCATE 13, x + 1: PRINT "               "
LOCATE 14, x + 1: PRINT "   GAME OVER   "
LOCATE 15, x + 1: PRINT "               "
LOCATE 16, x + 1: PRINT "               "
LOCATE 17, x + 1: PRINT "               "
LOCATE 18, x + 1: PRINT "         |±±   "
LOCATE 19, x + 1: PRINT "  ‹€€€€€€€€€€‹ "
DO: LOOP UNTIL INKEY$ = CHR$(13)
GOTO GAMEOVER

SUB borra
COLOR 0
LOCATE 13, x + 1: PRINT kuyoshi1$
LOCATE 14, x + 1: PRINT kuyoshi2$
LOCATE 15, x + 1: PRINT kuyoshi3$
LOCATE 16, x + 1: PRINT kuyoshi4$
LOCATE 17, x + 1: PRINT kuyoshi5$
LOCATE 18, x + 1: PRINT kuyoshi6$
LOCATE 19, x + 1: PRINT kuyoshi7$

END SUB

SUB borra2
COLOR 0
LOCATE 13, 60 - x1: PRINT drafhon1$
LOCATE 14, 60 - x1: PRINT drafhon2$
LOCATE 15, 60 - x1: PRINT drafhon3$
LOCATE 16, 60 - x1: PRINT drafhon4$
LOCATE 17, 60 - x1: PRINT drafhon5$
LOCATE 18, 60 - x1: PRINT drafhon6$
LOCATE 19, 60 - x1: PRINT drafhon7$

END SUB

SUB cabe2
PLAY "mbo1l64cdddefdc"
IF pla2 = 0 THEN
kuyoshi1$ = "             "
kuyoshi2$ = "       ±±±|  "
kuyoshi3$ = "    ‹‹‹‹     "
kuyoshi4$ = "   €‹±€€‹±   "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "     € €     "
kuyoshi7$ = "    ‹€ €‹    "
ELSEIF pla2 = 1 THEN
drafhon1$ = "            "
drafhon2$ = "  |±±±       "
drafhon3$ = "     ‹‹‹‹    "
drafhon4$ = "   ±‹€€±‹€   "
drafhon5$ = "     €€€     "
drafhon6$ = "     € €     "
drafhon7$ = "    ‹€ €‹    "
ELSE
END IF




END SUB

SUB cabezaso
IF stage = 1 THEN
drafhon1$ = "              "
drafhon2$ = " €∞∞∞         "
drafhon3$ = "    ‹€€‹      "
drafhon4$ = "   € €∞‹€     "
drafhon5$ = "   ∞ €€       "
drafhon6$ = "      €€      "
drafhon7$ = "       ﬂ€‹ﬂ‹ﬂ "
ELSEIF stage = 2 THEN
drafhon1$ = "              "
drafhon2$ = "+ + €€ﬂﬂ‹     "
drafhon3$ = "      ‹€€€‹   "
drafhon4$ = "      ﬂ±±±ﬂ   "
drafhon5$ = "     ±‹€€€‹   "
drafhon6$ = "       €€±‹ﬂ  "
drafhon7$ = "      ‹€ €‹   "
ELSEIF stage = 3 THEN
drafhon1$ = " €€ﬂﬂﬂ‹‹‹      "
drafhon2$ = " ‹‹     ﬂﬂ‹   "
drafhon3$ = " €\/€ﬂﬂﬂ‹   €   "
drafhon4$ = " €≈≈€    ﬂ‹ﬂ    "
drafhon5$ = "  ﬂﬂ   ‹ﬂﬂ €    "
drafhon6$ = "   €‹€ﬂ  ‹€‹   "
drafhon7$ = "   €ﬂ  ‹€ﬂ€ﬂ€‹ "
ELSEIF stage = 4 THEN
drafhon1$ = "          ‹€€‹   "
drafhon2$ = "   ≥     ‹€\/€‹  "
drafhon3$ = "  ≥≥≥≥   €€€€€€€ "
drafhon4$ = " ≥≥≥≥≥€€€€€€€€€€ "
drafhon5$ = " ≥≥≥≥≥€€€€€€€€€€ "
drafhon6$ = "  ≥≥≥≥   €€€€€€  "
drafhon7$ = "   ≥   ‹€€€€€€€€‹ "
ELSEIF stage = 5 THEN
drafhon1$ = "        ‹       "
drafhon2$ = "       €*€      "
drafhon3$ = " ‹€€€€€€€€€€‹   "
drafhon4$ = "  € € € € €  ﬂ‹ "
drafhon5$ = "   € € €  € ‹‹ﬂ "
drafhon6$ = "  ﬂ€€€€€€€€     "
drafhon7$ = "         €€ﬂ€ﬂ€ "

ELSEIF stage = 6 THEN
drafhon1$ = "        ‹       "
drafhon2$ = "       €*€      "
drafhon3$ = " ‹€€€€€€€€€€‹   "
drafhon4$ = "  € € € € €  ﬂ‹ "
drafhon5$ = " ﬂﬂ€ € €  € ‹‹ﬂ "
drafhon6$ = "  ﬂ€€€€€€€€     "
drafhon7$ = "         €€ﬂ€ﬂ€ "
ELSEIF stage = 7 THEN
drafhon1$ = "      € € €      "
drafhon2$ = " €€   €\ /€      "
drafhon3$ = "   ﬂ‹  €€€€‹     "
drafhon4$ = "     ﬂﬂﬂ€€€€€‹   "
drafhon5$ = "         €€€€€€‹ "
drafhon6$ = "          ﬂ€ﬂ€ﬂ  "
drafhon7$ = "   _____________ "
ELSEIF stage = 8 THEN
drafhon1$ = "                 "
drafhon2$ = " oOoOoOo€       "
drafhon3$ = "        ∞∞       "
drafhon4$ = "      ‹‹‹‹‹      "
drafhon5$ = "  ∞‹€€€∞‹€    "
drafhon6$ = "       €€€       "
drafhon7$ = "     (OOOOO)____ "





END IF
END SUB

SUB CAMI2
kuyoshi1$ = "      __     "
kuyoshi2$ = "      ±±     "
kuyoshi3$ = "    ‹‹‹‹‹    "
kuyoshi4$ = "   €‹±€€ €‹± "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "    ‹ﬂ ﬂ‹    "
kuyoshi7$ = "   ‹€   €‹   "

END SUB

SUB pata2
PLAY "l64o0mscdgabaggabc"

IF pla2 = 0 THEN
kuyoshi1$ = "             "
kuyoshi2$ = "  __   ±     "
kuyoshi3$ = "  ±± ‹ﬂ     € "
kuyoshi4$ = "‹ﬂ€€ﬂ   ‹‹ﬂﬂ "
kuyoshi5$ = "ﬂ‹±€‹‹ﬂﬂ     "
kuyoshi6$ = "‹ﬂ           "
kuyoshi7$ = "‹€           "
                     
ELSEIF pla2 = 1 THEN
drafhon1$ = "              "
drafhon2$ = "      ±   __  "
drafhon3$ = " €     ﬂ‹ ±±  "
drafhon4$ = "  ﬂﬂ‹‹   ﬂ€€ﬂ‹"
drafhon5$ = "      ﬂﬂ‹‹€±‹ﬂ"
drafhon6$ = "            ﬂ‹"
drafhon7$ = "            €‹"
ELSE
END IF

END SUB

SUB patada
IF stage = 2 THEN
drafhon1$ = "              "
drafhon2$ = "     ‹ﬂﬂﬂ‹    "
drafhon3$ = "    €€ ‹€€€‹  "
drafhon4$ = "       ﬂ±±±ﬂ  "
drafhon5$ = "      ±‹€€€‹  "
drafhon6$ = " €‹‹‹‹‹‹€€±‹ﬂ "
drafhon7$ = "         ﬂ€‹  "
ELSEIF stage = 4 THEN
drafhon1$ = "   ‹€€€€  ‹€€‹   "
drafhon2$ = "   €ﬂ  ≥‹‹€\/€‹  "
drafhon3$ = "      €€€€€€€€€€ "
drafhon4$ = " €     ≈ €€€€€€€ "
drafhon5$ = " €€€€€€€€€€€€€€€ "
drafhon6$ = "       ≥  €€€€€  "
drafhon7$ = "       ≥    ﬂ€€€‹ "
ELSEIF stage = 7 THEN
drafhon1$ = "      € € €      "
drafhon2$ = "      €\ /€      "
drafhon3$ = "       €€€€‹     "
drafhon4$ = "     ‹ﬂﬂ€€€€€‹   "
drafhon5$ = " ‹‹‹ﬂ    €€€€€€‹ "
drafhon6$ = " €€       ﬂ€ﬂ€ﬂ  "
drafhon7$ = "   _____________ "
ELSEIF stage = 8 THEN
drafhon1$ = "                 "
drafhon2$ = "               "
drafhon3$ = "        ∞∞       "
drafhon4$ = "      ‹‹‹‹‹      "
drafhon5$ = "     €€€∞‹€    "
drafhon6$ = "     ∞ €€€       "
drafhon7$ = " OOOOOOOOO)____ "

END IF
END SUB

SUB pina
IF stage = 1 THEN
drafhon1$ = "       ‹‹     "
drafhon2$ = "      ﬂ∞∞     "
drafhon3$ = "     ‹‹‹‹‹    "
drafhon4$ = " ∞‹‹ﬂ  €∞‹€   "
drafhon5$ = "       €€     "
drafhon6$ = "       €€     "
drafhon7$ = "       ﬂ€‹ﬂ‹ﬂ "
ELSEIF stage = 2 THEN
drafhon1$ = "              "
drafhon2$ = "     ‹ﬂﬂﬂ‹    "
drafhon3$ = "    €€ ‹€€€‹  "
drafhon4$ = " ±±    ﬂ±±±ﬂ  "
drafhon5$ = " ±€€€€€‹€€€‹  "
drafhon6$ = " ±±     €€±‹ﬂ "
drafhon7$ = "       ‹€ €‹  "
ELSEIF stage = 3 THEN
drafhon1$ = "                "
drafhon2$ = " ‹‹     €ﬂ‹  "
drafhon3$ = " €--€ﬂﬂﬂ‹     € "
drafhon4$ = " €≈≈€    ﬂ‹‹‹ﬂ  "
drafhon5$ = "  ﬂﬂ  ‹€€ﬂﬂ€    "
drafhon6$ = " €‹€€ﬂﬂ   ‹€‹  "
drafhon7$ = " €ﬂ     ‹€ﬂ€ﬂ€ "
ELSEIF stage = 4 THEN
drafhon1$ = "         ‹€€‹     "
drafhon2$ = "       ‹‹€\/€‹    "
drafhon3$ = "       €€€€€€€€   "
drafhon4$ = " ‹‹ƒƒ€€€€€€€€€€ƒƒ "
drafhon5$ = " €€     €€€€€€€   "
drafhon6$ = " ﬂ€€‹   €€€€€€    "
drafhon7$ = "      ‹€€€€€€€€‹‹‹ "
ELSEIF stage = 5 THEN
drafhon1$ = "   ‹€€€€€€€€/€    "
drafhon2$ = "    € € € € €€    "
drafhon3$ = " ‹‹         € ﬂ‹  "
drafhon4$ = " ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€ﬂﬂ   "
drafhon5$ = "            €     "
drafhon6$ = "     ‹ ‹ ‹  €     "
drafhon7$ = "   ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
ELSEIF stage = 6 THEN
drafhon1$ = "   ‹€€€€€€€€*€    "
drafhon2$ = "    € € € € €€    "
drafhon3$ = "            €€‹   "
drafhon4$ = " ﬂ‹ﬂﬂﬂﬂ‹‹ﬂ‹€  ﬂ‹ "
drafhon5$ = " ﬂ         € €‹ﬂ "
drafhon6$ = "     ‹ ‹ ‹  €     "
drafhon7$ = "   ﬂ‹€‹€‹€‹€€€ﬂ€ﬂ€ "
ELSEIF stage = 7 THEN
drafhon1$ = "      € € €      "
drafhon2$ = "      €\ /€      "
drafhon3$ = "       €€€€‹     "
drafhon4$ = " €ﬂﬂﬂﬂﬂ€€€€€‹   "
drafhon5$ = "         €€€€€€‹ "
drafhon6$ = "          ﬂ€ﬂ€ﬂ  "
drafhon7$ = "   _____________ "
ELSEIF stage = 8 THEN
drafhon1$ = "                 "
drafhon2$ = "               "
drafhon3$ = "        ∞∞       "
drafhon4$ = " ∞   ‹‹‹‹‹      "
drafhon5$ = " ∞‹‹€€€∞‹€    "
drafhon6$ = "       €€€       "
drafhon7$ = "     (OOOOO)____ "



END IF
END SUB

SUB pina2
PLAY "mbl64o0gbagfecdd"
IF pla2 = 0 THEN
kuyoshi1$ = "      __     "
kuyoshi2$ = "      ±±     "
kuyoshi3$ = "    ‹‹‹‹‹‹   "
kuyoshi4$ = "   €‹±€€  ﬂ‹± "
kuyoshi5$ = "     €€€     "
kuyoshi6$ = "     € €     "
kuyoshi7$ = "    ‹€ €‹    "
ELSEIF pla2 = 1 THEN
drafhon1$ = "     __     "
drafhon2$ = "     ±±     "
drafhon3$ = "   ‹‹‹‹‹‹   "
drafhon4$ = "±‹ﬂ  €€±‹€  "
drafhon5$ = "     €€€    "
drafhon6$ = "     € €    "
drafhon7$ = "    ‹€ €‹   "
ELSE
END IF

END SUB

