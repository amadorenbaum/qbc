ven = 0
aus = 0
finl = 0
dias = 30
COLOR 3, 4
CLS
LOCATE 12, 31: PRINT "Super arqueologos"
REM PLAY "l20aabbbccgdgdgdgdaaa"
PLAY "l10aabaabl5ab"
DO
LOOP WHILE INKEY$ = ""
CLS
COLOR 10, 1
0 CLS
PRINT "                          LA HISTORIA "
PRINT "  Vos sos el arqueologo Francis Grinpel hiciste un trato con "
PRINT "  Edward Cobola, un coleccionista famoso que quiere donar restos"
PRINT "  arqueologicos a un museo, y vos tenes que encontrar 3 restos"
PRINT "  en un mes."
PRINT "  Los restos son:"
PRINT "    ‹‹      ‹‹ (Hueso de pterodactilo)     /    ‹‹ "
PRINT "    ‹€ﬂﬂﬂﬂﬂﬂ€‹                               ‹€€€€€€‹"
PRINT "                   ‹‹‹    ‹‹                  €€€€€€"
PRINT "                    ﬂ€€ ‹€ﬂ (Jarr¢n viejo)   ﬂ€€€€€€ﬂ"
PRINT "                   ‹€€€€€€€‹                   //   "
PRINT "                    €∞∞∞∞∞€                   // (Hacha de vikingo)"
PRINT "                     ﬂ€€€ﬂ                   //"
PRINT "                                            //"
DO
LOOP UNTIL INKEY$ = CHR$(13)
1 CLS
2
LOCATE 1, 1: PRINT "Menu principal "
LOCATE 2, 1: PRINT "A= Viajar"
LOCATE 3, 1: PRINT "B= Mirar el libro de pistas"
LOCATE 4, 1: PRINT "C= Salir"
COLOR 4: PLAY "p30"
COLOR 10: PLAY "p30"
c$ = INKEY$
IF dias = 0 THEN GOSUB diasno
IF c$ = "a" OR c$ = "A" THEN GOSUB viaja
IF c$ = "b" OR c$ = "B" THEN 3
IF c$ = "c" OR c$ = "C" THEN CLS : SYSTEM
GOTO 2
viaja:
CLS
PRINT "A= Italia"
PRINT "B= Finlandia"
PRINT "C= EE. UU."
PRINT "D= Australia"
4 c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" AND ven = 0 THEN GOSUB Venecia ELSE
IF c$ = "B" OR c$ = "b" AND finl = 0 THEN 5 ELSE
IF c$ = "C" OR c$ = "c" THEN 6 ELSE
IF c$ = "D" OR c$ = "d" AND aus = 0 THEN 7 ELSE
GOTO 4
3 CLS
LOCATE 1, 33: PRINT "Libro de pistas"
PRINT "  1= Los jarrones viejos los hicieron italianos y africanos."
PRINT "  2= Los pterodactilos habitaban Asia y Oceania"
PRINT "  3= Los vikingos eran germanos."
DO: LOOP UNTIL INKEY$ = CHR$(32): GOTO 1
Venecia:
8 CLS
PRINT "Buscar en:"
PRINT "A= Vesubio"
PRINT "B= Casa antigua"
PRINT "C= Mediterraneo"
100 LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN GOSUB Bien ELSE
IF c$ = "B" OR c$ = "b" OR c$ = "C" OR c$ = "c" THEN 200 ELSE
GOTO 100
200 CLS
PRINT "Vos encontraste un jarron, se lo diste al coleccionista, el lo"
PRINT "verifico y se dio cuenta de que estaba hecho en Hong Kong por"
PRINT "la etiqueta , te tiraron a la mierda, te despidieron a la ''porqueria''"
PRINT ", te quedaste huerfano tirado en las calles, te atropello un camion"
PRINT "cargado con vacas y se te cayo una cagada de 10 vacas."
SYSTEM
Bien:
COLOR 6, 1
CLS
10
LOCATE 5, 1:  PRINT "                                    ‹‹‹"
LOCATE 6, 1:  PRINT "                                  ‹€€€€€‹"
LOCATE 7, 1:  PRINT "                                €€€€€€€€€€€"
LOCATE 8, 1:  PRINT "                              €€€€€€ C €€€€€€"
LOCATE 9, 1:  PRINT "                            €€€€€€€€€€€€€€€€€€€"
LOCATE 10, 1: PRINT "                            €€€€ B €€€€€€€€€€€€"
LOCATE 11, 1: PRINT "                          €€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 12, 1: PRINT "_________________________€€€€€€€€€€€€€€€€ A €€€€€€____________________________"
LOCATE 1, 1
PRINT "®A que cueva quieres ir?"
12 LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "a" THEN COLOR 10, 1: GOTO 200 ELSE
IF c$ = "b" THEN COLOR 10, 1: GOTO 11 ELSE
IF c$ = "c" THEN COLOR 10, 1: CLS : PRINT "Fallaste en la cueva, perdiste 5 dias del mes": dias = dias - 5 ELSE 12
11 CLS
y% = 10
x% = 10
13
COLOR 10
LOCATE 1, 1: PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 2, 1: PRINT " €€€€€€   €€€€€€  €€€€    €€€€€€€€  €€€€€€€€  €€€€€€€€€€€€"
LOCATE 3, 1: PRINT "  €€€€     €€€€    €€      €€€€€€    €€€€€€  = €€€€€€€€€€"
LOCATE 4, 1: PRINT "   €€       €€              €€€€   =  €€€€      €€€€€€€€"
LOCATE 5, 1: PRINT "                             €€    -   €€= =     €€€€€€"
LOCATE 6, 1: PRINT "                                 --    ==         €€€€"
LOCATE 7, 1: PRINT "                               --   -         =    €€"
COLOR 0
LOCATE 8, 1: PRINT "    -        _       - - -__ _ -_--~-` _~_  _-`-`___-`-`"
LOCATE 9, 1: PRINT "  --__-   __ __-- - ---__   --  -   _  - -  __ - - ----_- - -- - "
COLOR 14
LOCATE 10, 1: PRINT "                  €€€€€€€€€€€€€€€€€€€€€€€€€€    - ---^^--_='-'-'-'=="
LOCATE 11, 1: PRINT "               €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€ ==   --"
LOCATE 12, 1: PRINT "       €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 13, 1: PRINT "_____€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€______________"
COLOR 10, 1
PRINT "Se§ala con el cursor el lugar donde esta enterrado y aprieta <SPACE BAR>."
PRINT "OJO: Un jarro es falso."
LET c$ = INKEY$
LOCATE y% - 1, x% : PRINT "   "
LOCATE y%, x% : PRINT " Ò "
LOCATE y% + 1, x% : PRINT "   "
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = CHR$(0) + "M" THEN x% = x% + 1 ELSE
IF c$ = CHR$(0) + "K" THEN x% = x% - 1 ELSE
IF c$ = CHR$(0) + "H" THEN y% = y% - 1 ELSE
IF c$ = CHR$(0) + "P" THEN y% = y% + 1 ELSE
IF y% = 13 AND x% = 31 AND c$ = " " THEN 200 ELSE
IF y% = 11 AND x% = 24 AND c$ = " " THEN GOSUB BienB ELSE
IF c$ = " " THEN PLAY "l10a": dias = dias - 1 ELSE
IF y% = 1 THEN y% = y% + 1 ELSE
IF y% = 21 THEN y% = y% - 1 ELSE
IF x% = 1 THEN x% = x% + 1 ELSE
IF x% = 80 THEN x% = x% - 1 ELSE
GOTO 13
BienB:
ven = 1
COLOR 10, 1
CLS
PRINT "≠Encontraste el jarron!"
dias = dias - 5
PRINT "Te quedan"; dias; "Dias"
SLEEP 10
IF ven = 1 AND aus = 1 AND finl = 1 THEN GOSUB ganaste ELSE
GOSUB viaja
6 CLS
PRINT "Llegaste a estados unidos y te tropezaste con una lata"
PRINT ", caiste en el medio de la calle y te atropello un autobus escolar"
PRINT "y te hizo mierda, fuiste al velatorio, pero como muerto."
SYSTEM
5 CLS
PRINT "Buscar en:"
PRINT "A= Iglu"
PRINT "B= Monta§a"
PRINT "C= Enterrado"
14 LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "a" OR c$ = "A" THEN 15 ELSE
IF c$ = "b" OR c$ = "B" THEN GOSUB mal ELSE
IF c$ = "c" OR c$ = "C" THEN GOSUB mal ELSE
GOTO 14
mal:
CLS
PRINT "Le diste una espada al coleccionista y te echo para la mierda "
PRINT "te agarro una patota y te sacaron la cabeza, la prepararon para"
PRINT "su almuerzo. alpiste  perdiste  fuiste"
PRINT "JAJAJAJA!!!!"
PLAY "l10aab>c<bbal20b"
SYSTEM
15 CLS
COLOR 15, 1
PRINT "‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹         ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹           ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹                   ‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
COLOR 0
PRINT "Estas en el iglu, hay un yelmo y una espada vikingos."
PRINT "A= Tomar el yelmo"
PRINT "B= Tomar la espada"
PRINT "C= Destruir el iglu"
yel = 0
16 LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" AND yel = 0 THEN LOCATE 15, 30: PRINT "Agarraste el yelmo y lo guardaste en tu coleccion": yel = 1: BEEP ELSE
IF c$ = "B" OR c$ = "b" THEN GOSUB mal ELSE
IF c$ = "C" OR c$ = "c" THEN 17 ELSE
GOTO 16
17 CLS
FOR a% = 1 TO 3
FOR i% = 1 TO 15
COLOR 0, i%
CLS
PLAY "p64"
SOUND 37 + i%, 1
NEXT i%
NEXT a%
COLOR 3, 4
20 CLS
PRINT "≠Descubriste otro iglu detras del anterior!"
BEEP : BEEP : BEEP : BEEP : BEEP : BEEP : BEEP : BEEP
COLOR 15
LOCATE 5, 1: PRINT "                                  ‹‹ ‹‹ ‹‹   "
LOCATE 6, 1: PRINT "                                 ‹‹ ‹‹ ‹‹ ‹  "
LOCATE 7, 1: PRINT "                                ‹‹ ‹±±±±±‹‹‹ "
LOCATE 8, 1: PRINT "________________________________‹‹ ‹±±±±±‹‹‹__________________________________"
PRINT "A= Entrar al nuevo iglu"
PRINT "B= Inspeccionar las partes del otro iglu"
PRINT "C= Mirar el libro de pistas"
18 LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN 19 ELSE
IF c$ = "B" OR c$ = "b" THEN GOSUB errorb ELSE
IF c$ = "C" OR c$ = "c" THEN GOSUB pist ELSE
GOTO 18
errorb:
CLS
PRINT "Le entregaste un yelmo vikingo al coleccionista y el te despidio,"
PRINT "viajaste a Francia, Paris y te tiraste de la torre Eiffel y caiste"
PRINT "en un camion de cerdos."
PRINT "Alpiste, perdiste, fuiste"
PRINT "JAJAJAJAAA! tonto."
PLAY "l10aab>c<bbal20b"
SYSTEM
pist:
CLS
PRINT TAB(33); "Libro de pistas"
PRINT "1= Los vikingos construian los iglues en fila como minimo una fila de dos iglues."
PRINT "2= Los vikingos guardaban las armas en iglues que ellos mismos construian."
PRINT "3= Muchas veces no se pudo descubrir un iglu que estaba tras otro, porque los ponian en forma secreta."
COLOR 14
PRINT "-≠Wohw, entonces he descubierto un iglu secreto! creo que entrare en este!"
DO: LOOP WHILE INKEY$ = "": GOTO 20
19 CLS
COLOR 15, 1
LOCATE 1, 1: PRINT "‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 2, 1: PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 3, 1: PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹±±±±‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 4, 1: PRINT " ‹±±±±‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ±±±±‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 5, 1: PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 6, 1: PRINT " ‹‹‹‹‹‹‹ ‹‹‹±±±‹ ‹‹‹‹‹‹‹ ‹‹‹‹±      ‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 7, 1: PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹±            ‹‹‹‹‹‹‹ ±±±‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 8, 1: PRINT " ‹‹‹‹‹‹‹±±±±‹‹‹‹ ‹‹‹‹‹‹‹ ‹±              ‹‹‹‹‹‹‹ ‹±±±‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 9, 1: PRINT "‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹±                  ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 10, 1: PRINT " ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹±                   ‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹"
LOCATE 11, 1: PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€∞€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 12, 1: PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€∞€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 13, 1: PRINT "€€€€€€€€€€€€€€€€€€€€€€€€€€€€∞€€€€€€€€€∞€€€€€€€€€€€€€€€€€€€€€€€€€€€"
LOCATE 14, 1: PRINT "Se§ala con el cursor el lugar donde esta el hacha y presione <SPACE BAR>."
COLOR 3, 4
y% = 2
x% = 2
GOSUB dibu
COLOR 3, 4
58  LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = CHR$(0) + "M" AND x% < 79 THEN GOSUB ante: x% = x% + 1: GOSUB dibu ELSE
IF c$ = CHR$(0) + "K" AND x% > 1 THEN GOSUB ante: x% = x% - 1: GOSUB dibu ELSE
IF c$ = CHR$(0) + "H" AND y% > 1 THEN GOSUB ante: y% = y% - 1: GOSUB dibu ELSE
IF c$ = CHR$(0) + "P" AND y% < 12 THEN GOSUB ante: y% = y% + 1: GOSUB dibu ELSE
IF y% = 12 AND x% = 30 AND c$ = " " THEN 22 ELSE
IF c$ = " " THEN PLAY "l10a": dias = dias - 1 ELSE
IF y% = 1 THEN y% = y% + 1 ELSE
IF y% = 21 THEN y% = y% - 1 ELSE
IF x% = 1 THEN x% = x% + 1 ELSE
IF x% = 80 THEN x% = x% - 1 ELSE
GOTO 58
22
CLS
COLOR 15, 4
PRINT "                        ≠Encontraste 3 hachas juntas!"
PRINT "                           ®Cual es la verdadera?"
PRINT "                    HACHA A       HACHA B        HACHA C"
PRINT "                      €€€           €€              ‹‹"
PRINT "                    €€€€€€€      ‹€€€€€€‹        ‹€€€€€€‹"
PRINT "                     €€€€€        €€€€€€          €€€€€€"
PRINT "                   €€€€€€€€€     ﬂ€€€€€€ﬂ        ﬂ€€€€€€ﬂ"
PRINT "                      //            //              // "
PRINT "                     //            //              //"
PRINT "                    //            //              //"
PRINT "                   //            //              //"
LOCATE 23, 1: PRINT "Cual hacha prefieres."
25
c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN 30 ELSE
IF c$ = "B" OR c$ = "b" THEN 30 ELSE
IF c$ = "C" OR c$ = "c" THEN GOSUB bienhach ELSE
GOTO 25
30 CLS
COLOR 3, 4
PRINT "Entr¢ un vikingo y pens¢ que le estabas robando, te descabez¢,"
PRINT "y te us¢ para su sopa."
PLAY "l10aab>c<bbal20b"
SYSTEM
bienhach:
CLS
COLOR 3, 4
PRINT "≠≠≠Encontraste el hacha!!! Cobola te va a felicitar."
dias = dias - 5
PRINT "Te quedan"; dias; "D°as."
finl = 1
SLEEP 10
IF ven = 1 AND aus = 1 AND finl = 1 THEN GOSUB ganaste ELSE
GOTO viaja
dibu:
COLOR 3, 4
XY1 = SCREEN(y%, x% - 1)
LOCATE y%, x% - 1: PRINT " "
xy2 = SCREEN(y%, x%)
LOCATE y%, x% : PRINT "Ò"
xy3 = SCREEN(y%, x% + 1)
LOCATE y%, x% + 1: PRINT " "
RETURN
ante:
COLOR 10, 1
LOCATE y%, x% - 1: PRINT CHR$(XY1) + CHR$(xy2) + CHR$(xy3)
RETURN
7 CLS
PRINT "®A que lugar quieres ir?"
PRINT "A= A un bosque"
PRINT "B= A un campo"
PRINT "C= A Sidney (bajo el rio)"
1000000
LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN GOSUB malC ELSE
IF c$ = "B" OR c$ = "b" THEN GOSUB malD ELSE
IF c$ = "C" OR c$ = "c" THEN 50 ELSE
GOTO 1000000
malC:
CLS
PRINT "Fuiste al bosque y te encontraste con unos indigenas, pensaste que"
PRINT "eran buenos y los seguiste, fuiste a su tribu, aparecio el jefe indio,"
PRINT "agarro unas algas y te las froto suavemente. A la semana tuviste sarna"
PRINT "al poco tiempo, te agarro gripe, al dia, tuviste diarrea triple y"
PRINT "super-fuertes congestiones, tan fuertes que vomitabas acido."
PRINT "Luego te agarro rabia y mordiste a toda la tribu y te salvaste de que"
PRINT "te cocinaran, pero luego te agarro un virus de computadora que te convirtio"
PRINT "en transistor y moriste."
PLAY "l10ab>c<defggfdcdfgfddcfdfdgfdcdfgffdcffgfddcffdfdffcddffgdgdgdfffcdgdfffcfgffgc"
SYSTEM
malD:
CLS
PRINT "El coleccionista te echo y te quedaste machucado en las cloacas."
PLAY "l5ab>cdefg<l20ab>cdefg<l30ab>cdefg<l40ab>cdefg<"
SYSTEM
50
COLOR 0, 11
CLS
PRINT "Estas bajo el r°o en Sidney,"
PRINT "®Que tunel eliges?"
COLOR 6
LOCATE 6
PRINT "      ‹‹‹‹‹‹‹‹         ‹‹‹‹‹‹‹‹‹‹      ‹‹‹‹‹‹‹‹‹‹‹"
PRINT "     €        €       €€        €‹     €‹        €‹ "
PRINT "    €     A    €      €     B    €     €ﬂ   C    ﬂ€ "
PRINT "    €          €      €‹        €€     €         €€               "
PRINT "˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜"
50000
IF dias = 0 THEN GOSUB diasno ELSE
LET c$ = INKEY$
IF c$ = "a" OR c$ = "A" THEN 6000 ELSE
IF c$ = "b" OR c$ = "B" THEN GOSUB malD ELSE
IF c$ = "c" OR c$ = "C" THEN GOSUB malD ELSE
GOTO 50000
6000
CLS
COLOR 0, 11
PRINT "≠Era el correcto!"
PRINT " ≠Encontraste tres algas!"
PRINT " A= Mirar el libro de pistas en la pag 80"
PRINT " B= Mirar el libro de pistas en la pag ant."
COLOR 2
PRINT "         ‹‹          ‹‹            ^‹"
PRINT "       ‹€‹           ‹           ﬂ€‹"
PRINT "        ‹€€           €           ‹€"
PRINT "        €‹            €           €€‹"
PRINT "        ‹€€          €ﬂ           ‹€"
PRINT "       €€ﬂ           ﬂ            €‹‹"
PRINT "_________€€__________€ﬂ_____________€ﬂ________________________________________"
COLOR 0
PRINT "         c           d              e"
30000
LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "a" OR c$ = "A" THEN GOSUB pistZ ELSE
IF c$ = "b" OR c$ = "B" THEN GOSUB pistY ELSE
IF c$ = "c" OR c$ = "C" THEN 7000 ELSE
IF c$ = "d" OR c$ = "D" THEN 8000 ELSE
IF c$ = "e" OR c$ = "E" THEN 8000 ELSE
GOTO 30000
pistY:
CLS
PRINT TAB(33); "Libro de pistas"
PRINT "1= Los vikingos construian los iglues en fila como minimo una fila de dos iglues."
PRINT "2= Los vikingos guardaban las armas en iglues que ellos mismos construian."
PRINT "3= Muchas veces no se pudo descubrir un iglu que estaba tras otro, porque los ponian en forma secreta."
DO: LOOP UNTIL INKEY$ = CHR$(32): GOTO 6000
pistZ:
CLS
PRINT TAB(33); "Libro de pistas"
PRINT "1= En sidney hay algas venenosas y no venenosas."
PRINT "2= Las algas mas venenosas llevan pinches que casi no se notan."
PRINT "3= Las algas peligrosas llevan mas pinches de las que son mas venenosas."
DO: LOOP UNTIL INKEY$ = CHR$(32): GOTO 6000
8000
CLS
PRINT "El coleccionista te echo para la calle y te tiro el alga encima"
PRINT "al poco tiempo, te agarro gripe, al dia, tuviste diarrea triple y"
PRINT "super-fuertes congestiones, tan fuertes que vomitabas acido."
PLAY "l10ab>c<defggfdcdfgfddcfdfdgfdcdfgffdcffgfddcffdfdffcddf"
7000
COLOR 0, 11
CLS
PRINT "Arrancaste el alga C y era la correcta, sacaste un poco de tierra"
PRINT "y viste una palanca, la activaste, se abrio un pozo y caiste, luego "
PRINT "te encontraste en un campo indigena. "
COLOR 15, 11
PRINT
PRINT
PRINT "                         _-~~~~~~~-_"
PRINT "                          -_________---"
PRINT ""
COLOR 4
PRINT "         /\             /\              /\"
PRINT "       /    \         /    \          /    \ "
PRINT "     /      A \     /      B \      /   /\ C \"
PRINT "     |   /\   |     |   /\   |      |  /  \  |"
COLOR 2
PRINT "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
COLOR 0
PRINT "®Que choza eliges?"
2000
LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN GOSUB indio ELSE
IF c$ = "B" OR c$ = "b" THEN GOSUB bienf ELSE
IF c$ = "C" OR c$ = "c" THEN 3000 ELSE
GOTO 2000
3000
CLS
PRINT "Te encontraste con el jefe indio y te mato a flechazos."
PRINT "JAJAJA!"
PLAY "l5ab>cdefg<l20ab>cdefg<l30ab>cdefg<l40ab>cdefg<"
SYSTEM
indio:
CLS
PRINT "Te encontraste con un indio y te dijo que salgas de Australia"
PRINT "porque hay un fantasma de un Pterodactilo en la choza de al lado"
PRINT "y te busca."
PRINT "®Que le quieres decir?"
PRINT "A= Andate a contar otro cuento chino antes de que te mate a pi§as."
PRINT "B= A si jaja!!! te creo y todo."
PRINT "C= Creo que tenes razon, me contaron que cosas muy extra§as estuvieron"
PRINT "   pasando alli, pero yo no me voy a ir de aca cueste lo que cueste."
1000
LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN 3000 ELSE
IF c$ = "B" OR c$ = "b" THEN GOSUB malD ELSE
IF c$ = "C" OR c$ = "c" THEN GOSUB bienf ELSE
GOTO 1000
bienf:
CLS
PRINT "Entraste en la choza B y no habia ningun fantasma."
PRINT "®Que deseas hacer?"
PRINT "A= Buscar a ver si esta enterrado el hueso de Pterodactilo."
PRINT "B= Abrir el cofre que esta al lado tuyo."
PRINT "C= Tomar una llave colgada.": lla3 = 0
aca:
LET c$ = INKEY$
IF dias = 0 THEN GOSUB diasno ELSE
IF c$ = "A" OR c$ = "a" THEN 3000 ELSE
IF c$ = "B" OR c$ = "b" AND lla3 = 1 THEN GOSUB bieng ELSE
IF c$ = "B" OR c$ = "b" AND lla3 = 0 THEN LOCATE 6, 60: PRINT "≠Necesitas una llave!!!": BEEP ELSE
IF c$ = "C" OR c$ = "c" THEN lla3 = 1: LOCATE 7, 30: PRINT "La tomaste": BEEP ELSE
GOTO aca
bieng:
CLS
dias = dias - 5
PRINT "Abriste el cofre y adivina que..."
PRINT "≠Encontraste el hueso de Pterodactilo!"
PRINT "Te quedan"; dias; "dias"
aus = 1
DO: LOOP WHILE INKEY$ = ""
IF ven = 1 AND aus = 1 AND finl = 1 THEN GOSUB ganaste ELSE
GOSUB viaja
ganaste:
CLS
COLOR 3, 4
CLS
PRINT "≠≠≠Conseguiste los tres restos arqueologicos!!! "
PRINT "Edward Cobola te felicit¢ y te di¢ $10000 m†s todos los gastos"
IF yel = 1 THEN LOCATE 5, 2 ELSE GOSUB con
PRINT "≠Ah, el yelmo te lo compr¢ por $1000 m†s!"
con:
SYSTEM
alla:
c$ = INKEY$
IF c$ <> "" THEN SYSTEM
GOTO alla
diasno:
COLOR 3, 4
CLS
PRINT " Se te acabaron los dias, tardaste m†s de un mes. Edward Cobola te dijo"
PRINT "que te metieras los restos arqueol¢gicos en el orto, y te peg¢ una patada"
PRINT "en la nari' y te dio un coscorron en el lomo luego de pegarte Chas! Chas!"
PRINT "en la cola."
PLAY "l5abcdl10abcdl20abcdl40abcdl60abcdl5abcdl10abcdl20abcd"
SYSTEM
'Hicimos 523 renglones (Sin este)
'Este juego es producido por juegos 1995 (C) corporation 94/5
'se creo en la fecha 20/12/95 ≠Hasta el 96!
'Juegos 1995 es producto de la compa§ia Amadorenbaum S.A.

