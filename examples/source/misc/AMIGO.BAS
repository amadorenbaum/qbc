DECLARE SUB guarda ()
DECLARE SUB trae ()
DECLARE SUB veoex ()
DECLARE SUB graba ()
DECLARE SUB rompe ()
DECLARE SUB ORIGEN ()
DECLARE SUB banarse ()
DECLARE SUB muere ()
DECLARE SUB enfermo ()
DECLARE SUB revisa ()
DECLARE SUB pega ()
DECLARE SUB come ()
DECLARE SUB bana ()
DECLARE SUB leer ()
DECLARE SUB duerme ()
DECLARE SUB juega ()
DECLARE SUB escuela ()
DECLARE SUB Ordenes ()
DECLARE SUB Estado ()
DECLARE SUB Datos ()
DECLARE SUB DECLARA ()
DECLARE SUB PRESENTACION ()
COMMON SHARED nombre$, tunom$, peso, edad, hambre, sucio, feliz, juego, LECTURA, bano, LEYENDO, enf, temp, dormilon, cuantos, reng
RANDOMIZE TIMER
CALL DECLARA
RANDOMIZE TIMER
CALL PRESENTACION
RANDOMIZE TIMER
CALL ORIGEN

SUB bana
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF sucio >= 5 THEN
 LOCATE 2, 1
 PRINT " No hace falta ba¤arme en este momento "; tunom$; " estoy limpio"
 DO
 LOOP UNTIL INKEY$ <> ""
 GOTO Banafin
END IF
tempel:
INPUT " Me vas a ba¤ar con agua fr¡a (1) o caliente (2) (volver = 3) ", tempque$
IF tempque$ = "1" AND temp > 20 THEN GOTO bientem
IF tempque$ = "1" AND temp < 20 THEN GOTO maltem
IF tempque$ = "2" AND temp < 20 THEN GOTO bientem
IF tempque$ = "2" AND temp > 20 THEN GOTO maltem
IF tempque$ = "3" THEN GOTO Banafin
GOTO tempel

bientem:
sucio = 5
hambre = hambre - 1
PRINT
PRINT " Gracias porque si pon¡as la otra temperatura me mor¡a !!!"
DO
LOOP UNTIL INKEY$ <> ""
GOTO Banafin

maltem:
sucio = 5
hambre = hambre - 1
enf = enf + 1
feliz = feliz - 1
PRINT
PRINT " Pero como pod‚s poner esa temperatura ! ! ! ? ? ?"
COLOR 7, 1
PRINT " Pista: Antes de ba¤ar a tu tamagotchi, fijate"
PRINT "en el cuadro de estado, la temperatura, si esta"
PRINT "es mayor a 20§ ba¤alo con agua fr¡a, si es menor,"
PRINT "con agua caliente."
DO
LOOP UNTIL INKEY$ <> ""
COLOR 10, 1
Banafin:
CALL revisa
DO
LOOP UNTIL INKEY$ <> ""
CLS
END SUB

SUB banarse
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
peso = peso - .21
sucio = sucio - 1
hambre = hambre - 1
juego = juego - 1
bano = 5
FOR J = 1 TO 10
LOCATE 2, 1
PRINT "              ÜÜÜ        "
PRINT "             Û Û       "
PRINT "             Û   Û"
PRINT "              ßßß        "
PRINT "                ß        "
PRINT "              Ü          "
FOR I = 1 TO 10000
NEXT I
LOCATE 2, 1
PRINT "              ÜÜÜ        "
PRINT "             Û Û       "
PRINT "             Û   Û"
PRINT "              ßßß        "
PRINT "             ß           "
PRINT "                Ü        "
FOR I = 1 TO 10000
NEXT I
LOCATE 8 + J, 14
PRINT "ÜÜÜÜÜÜÜÜ"
NEXT J
DO
LOOP UNTIL INKEY$ <> ""
PRINT
PRINT " Ahh! Ya fui al ba¤o."
DO
LOOP UNTIL INKEY$ <> ""
CLS
END SUB

SUB come
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF hambre >= 5 THEN
 LOCATE 2, 1
 PRINT "  Gracias "; tunom$; " pero estoy satisfecho"
DO
LOOP UNTIL INKEY$ <> ""
 GOTO Comefin
END IF

Elec1:
LOCATE 2, 1
PRINT "      Men£"
PRINT "     ÄÄÄÄÄÄ"
PRINT " A) Sopa"
PRINT " B) Fideos"
PRINT " C) Manzana"
PRINT " D) Helado"
PRINT " E) Volver"
a$ = INKEY$
IF UCASE$(a$) = "A" THEN GOSUB Sopa
IF UCASE$(a$) = "B" THEN GOSUB Fideos
IF UCASE$(a$) = "C" THEN GOSUB Manzana
IF UCASE$(a$) = "D" THEN GOSUB Helado
IF UCASE$(a$) = "A" AND temp >= 25 THEN enf = enf + 1
IF UCASE$(a$) = "A" AND hambre <= 1 THEN GOTO Comi
IF UCASE$(a$) = "A" AND hambre > 1 THEN GOTO Nosati
IF UCASE$(a$) = "B" AND hambre <= 2 THEN GOTO Comi
IF UCASE$(a$) = "B" AND hambre > 2 THEN GOTO Nosati
IF UCASE$(a$) = "C" AND hambre <= 3 THEN GOTO Comi
IF UCASE$(a$) = "C" AND hambre > 3 THEN GOTO Nosati
IF UCASE$(a$) = "D" AND temp <= 15 THEN enf = enf + 1
IF UCASE$(a$) = "D" AND hambre <= 4 THEN
  enf = enf + 1
  GOTO Comi
END IF
IF UCASE$(a$) = "E" GOTO Comefin
GOTO Elec1

Sopa:
peso = peso + .9
PRINT "    Û    Û    Û"
PRINT "     Û    Û    Û"
PRINT "    Û    Û    Û"
PRINT " ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ"
PRINT "  Û   S O P A   Û"
PRINT "   ÛÜÜÜÜÜÜÜÜÜÜÜÛ"
RETURN

Fideos:
peso = peso + 2.5
PRINT "  F  I  D  E  O  S"
PRINT " ÛßßÛßßßßÛßßßßÛßßÛ"
PRINT "  ÛÜÛÜÜÜÜÛÜÜÜÜÛÜÛ"
RETURN

Manzana:
peso = peso + .55
PRINT "         Üß"
PRINT "         Û"
PRINT " ÜßßßÜÜÜß ßÜÜÜßßßÜ"
PRINT " Û M        Ü    Û"
PRINT " Û  A       Üß   Û"
PRINT "  ßÜ N        AÜß"
PRINT "   Û  Z  A  N  Û"
PRINT "    ÛÜÜÜßßÜÜÜÜÜÛ"
RETURN

Helado:
peso = peso + 1.8
PRINT "          ÜßßÜÜ  "
PRINT "        Üß     ßÛÜ"
PRINT "        Û         Û"
PRINT "      Üß         Û"
PRINT "     ÜÜß       Üß"
PRINT "  ÜÜß           ÛÜÜÜ"
PRINT "   ÛßßßßßßßßßßßßßÛß"
PRINT "    Û     H     Û"
PRINT "     Û    E    Û"
PRINT "      Û   L   Û"
PRINT "       Û  A  Û"
PRINT "       Û  D  Û"
PRINT "       Û  O  Û"
PRINT "        Û   Û"
PRINT "         Û Û"
PRINT "          Û"
RETURN


Comi:
hambre = 5
bano = bano - 1
sucio = sucio - 1
juego = juego - 1
PRINT
PRINT " Ahora estoy satisfecho"
DO
LOOP UNTIL INKEY$ <> ""
GOTO Comefin

Nosati:
hambre = hambre + 1
feliz = feliz - 1
PRINT
PRINT " Esta comida no me gusta . . ."
COLOR 7, 1
qpistha = INT(RND * 3) + 1
IF qpistha = 2 THEN GOTO Pistambre2
IF qpistha = 3 THEN GOTO Pistambre3
Pistambre1:
PRINT
PRINT " Pista: Cuando tu amigo est  muy hambriento "
PRINT "comer  cualquier cosa, cuando menos hambre "
PRINT "tenga, solo comer  helado, pero el helado"
PRINT "aumenta sus s¡ntomas de enfermedad."
DO
LOOP UNTIL INKEY$ <> ""
GOTO Comefin
Pistambre2:
PRINT
PRINT " Pista: Fijate antes de darle de comer a tu"
PRINT "amigo, en el bot¢n estado, que temperatura hay."
PRINT " Si es mayor a 25§ C. NO le des sopa."
PRINT " Si es menor a 15§ C. NO le des helado."
DO
LOOP UNTIL INKEY$ <> ""
GOTO Comefin
Pistambre3:
PRINT
PRINT " Pista: Cuando le des de comer a tu amigo, no te"
PRINT "olvides que darle de comer aumenta su peso. Lo"
PRINT "que m s lo engorda son los fideos, luego el"
PRINT "helado, luego la sopa y finalmente la manzana."
PRINT "  SI ESTA MUY GORDO, SE ENFERMARA"
DO
LOOP UNTIL INKEY$ <> ""
GOTO Comefin
Comefin:
COLOR 10, 1
CLS
CALL revisa
END SUB

SUB Datos
COLOR 10, 1
LOCATE 2, 1
PRINT "    Amigochi de Dinosaurio"
PRINT " ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ "
PRINT " ºDue¤o: "; tunom$
PRINT " ºNombre: "; nombre$
PRINT " ºEdad: "; edad; " a¤os"
PRINT " ºPeso: "; peso; " kg."
PRINT " ºFecha actual: "; DATE$
PRINT " ºHora actual: "; TIME$; " hs."
PRINT " ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
DO
LOOP UNTIL INKEY$ <> ""
CLS
CALL revisa
END SUB

SUB DECLARA
peso = RND * 4 + 1
edad = 0
hambre = 3
sucio = 4
feliz = 5
juego = 5
LECTURA = 5
dormilon = 5
bano = 3
LEYENDO = 0
enf = 0
temp = INT(RND * 40) + 1
CALL revisa
END SUB

SUB duerme
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF dormilon >= 5 THEN
  LOCATE 2, 1
  PRINT " Ahora no tengo para nada sue¤o "; tunom$; "!"
DO
LOOP UNTIL INKEY$ <> ""
  GOTO duermefinfin
END IF

luzel:
INPUT " Vas a apagar la luz? si (1), no (2), volver (3) ", luzque$
IF luzque$ = "1" AND edad > 10 THEN GOTO bienluz1
IF luzque$ = "1" AND edad < 10 THEN GOTO malluz1
IF luzque$ = "2" AND edad > 10 THEN GOTO malluz2
IF luzque$ = "2" AND edad < 10 THEN GOTO bienluz2

bienluz1:
dormilon = 5
feliz = feliz + 1
PRINT
PRINT " Al menos apagaste la luz, ya tengo mas de 10"
DO
LOOP UNTIL INKEY$ <> ""
GOTO Duermefin
bienluz2:
dormilon = 5
feliz = feliz + 1
PRINT
PRINT " Gracias por no apagarme la luz, si no iba a tener miedo"
DO
LOOP UNTIL INKEY$ <> ""
GOTO Duermefin
malluz1:
dormilon = dormilon + 1
feliz = feliz - 1
PRINT
PRINT " Dorm¡ MUY mal porque tuviste que apagar la luz, tuve miedo . . ."
GOTO Pista
malluz2:
dormilon = dormilon + 1
feliz = feliz - 1
PRINT
PRINT " Con esa luz prendida toda la noche, casi no dorm¡ nada !"
GOTO Pista
Pista:
COLOR 7, 1
PRINT
PRINT " Pista: Cuando un tamagotchi, es menor de 10 a¤os,"
PRINT "le tiene miedo a la oscuridad por lo que NO hay "
PRINT "que apagarle la luz. De lo contrario, si es mayor"
PRINT "de 10, le molestar  la luz prendida."
COLOR 10, 1
DO
LOOP UNTIL INKEY$ <> ""
Duermefin:
PRINT
PRINT "       ÚÄÄÄÄÄÄÄ¿"
PRINT "       ³ÄÄ   ÄÄ³"
PRINT "       ³   È   ³"
PRINT "       ³  ÄÄÄÄ ³"
PRINT "       ÀÄÄÄÄÄÄÄÙ"
DO
LOOP UNTIL INKEY$ <> ""
duermefinfin:
CLS
CALL revisa
END SUB

SUB enfermo
COLOR 10, 1
CLS
LOCATE 2, 1
PRINT "  "; nombre$; " est  muy enfermo"
PRINT
PRINT "     ÚÄÄÄÄÄÄÄÄÄ¿"
PRINT "     ³       ³"
PRINT "     ³ Ä  È  Ä ³"
PRINT "     ³  ÚÄÄÄ¿  ³"
PRINT "     ÀÄÄÄÄÄÄÄÄÄÙ"
PRINT
PRINT " AAAAY, me duele la pancita de comer mucho helado y dormir mal porque me pegas maldito "; tunom$; " AAAY!"
DO
LOOP UNTIL INKEY$ <> ""
CLS
inyeccion:
LOCATE 2, 1
PRINT
PRINT " Qu‚ inyecci¢n le dar s?"
PRINT "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
PRINT " 1. Ardictus"
PRINT " 2. BCG"
PRINT " 3. Triple"
PRINT " 4. Hectchemona"
PRINT " 5. Freawgy"
a$ = INKEY$
IF a$ = "1" THEN GOTO mal
IF a$ = "2" THEN GOTO mal
IF a$ = "3" THEN GOTO mal
IF a$ = "4" THEN GOTO bien
IF a$ = "5" THEN GOTO mal
GOTO inyeccion

mal:
PRINT
PRINT nombre$; " est  muy mal . . . Si se salva es por casualidad. . ."
DO
LOOP UNTIL INKEY$ <> ""
l = INT(RND * 10) + 1
IF l < 4 THEN
GOTO bien
ELSE
CALL muere
END IF
bien:
enf = 1
feliz = 5
hambre = 3
COLOR 7, 1
PRINT
PRINT " Por suerte, "; nombre$; " se ha salvado, pero"
PRINT "ten‚s que cuidarlo bien para que no vuelva a"
PRINT "ocurrir."
COLOR 10, 1
DO
LOOP UNTIL INKEY$ <> ""
GOTO enfermofin

enfermofin:
CLS
END SUB

SUB escuela
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF edad < 7 THEN
 LOCATE 2, 1
 PRINT " Todav¡a soy muy chico para que me mandes a la escuela "; tunom$
DO
LOOP UNTIL INKEY$ <> ""
 GOTO escuelafin
END IF
feliz = feliz + 1
LEYENDO = 1
sucio = sucio - 1
LECTURA = 0
PRINT
PRINT "                ÛßßßßßÛ"
PRINT "                Ûßßßßßß"
PRINT "     ÛßßßßßßßßßßÛßßßßßßßßßßÛ"
PRINT "    Û        ESCUELA        Û"
PRINT "    Û                       Û"
PRINT "    Û                       Û"
PRINT "    Û        ÛßßßßÛ         Û"
PRINT "    Û        Û    Û         Û"
PRINT "    Û        Û    Û         Û"
PRINT "     ßßßßßßßßßßßßßßßßßßßßßßß"
PRINT " Ahora estoy contento ! ! !"
COLOR 7, 1
PRINT " Informaci¢n: Ahora que has mandado a tu tamagotchi a la escuela,"
PRINT "puedes hacerlo leer."
DO
LOOP UNTIL INKEY$ <> ""
COLOR 10, 1
escuelafin:
CALL revisa
CLS
END SUB

SUB Estado
COLOR 10, 1
CLS
PRINT "            Amigochi de Dinosaurio"
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
PRINT "ºGanas de Comer (satisfecho = 5, no satisfecho = 0): "; hambre
PRINT "ºSuciedad (limpio = 5, sucio = 0): "; sucio
PRINT "ºFeliz (feliz = 5, infeliz = 0): "; feliz
PRINT "ºGanas de Jugar (pocas = 5, muchas = 0): "; juego
PRINT "ºGanas de leer (pocas = 5, muchas = 0): "; LECTURA
PRINT "ºGanas de ir al ba¤o (pocas = 5, muchas = 0): "; bano
PRINT "ºTemperatura "; temp; "§ C."
PRINT "ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
DO
LOOP UNTIL INKEY$ <> ""
CLS
CALL revisa
END SUB

SUB graba
END SUB

SUB juega
RANDOMIZE TIMER
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF juego >= 5 THEN
LOCATE 2, 1
enf = enf + 1
PRINT " Ya jugu‚ bastante por ahora, despu‚s voy . . ."
DO
LOOP UNTIL INKEY$ <> ""
CLS
EXIT SUB
END IF

l = INT(RND * 20) + 1
IF l < 4 THEN CALL rompe
feliz = feliz + 1
enf = enf - 1
sucio = sucio - 1
hambre = hambre - 1
dormilon = dormilon - 1
hambre = hambre - 1
juego = 5
piepapti:
LOCATE 1, 1
PRINT " Presione Space Bar para aceptar, y 'M' para salir."
DO
LOOP UNTIL INKEY$ <> ""
 CLS
 ppt = 1: GOTO pap
pipati:
 a$ = INKEY$
 IF a$ = CHR$(0) + "M" AND ppt = 2 THEN
   ppt = 3
   CLS
   GOTO pap
 END IF
 IF a$ = CHR$(0) + "M" AND ppt = 3 THEN
 ppt = 1
 CLS
 GOTO pap
 END IF
 IF a$ = CHR$(0) + "M" AND ppt = 1 THEN
 ppt = 2
 CLS
 GOTO pap
 END IF
 IF UCASE$(a$) = "M" THEN GOTO coso
 IF a$ = " " THEN GOTO PIED
pap:
 IF ppt = 1 THEN GOTO PAPEL
 IF ppt = 2 THEN GOTO PIEDRA
 IF ppt = 3 THEN GOTO TIJERA
GOTO pipati

TIJERA:
LOCATE 9, 1
PRINT "          ÛßßßßßÛ "
PRINT "Ûßßßßßßßßßß  ÜÜÜÛ    "
PRINT "Û          ÜÜÜÜÜÛ"
PRINT "Û                ßßßßßßßßßßßßßßÛ"
PRINT "Û          ßßßßßßßßßßßßÛßßßßßßßß"
PRINT "Û            ÛßßßßßßßÜ  ßÜ "
PRINT "ßßßßßßßßßÛ   ÛÜÜÜÜÜ   ßÜ Üß "
PRINT "         ÛÜÜÜÜÜÜÜÜÛ     ß "
PRINT "        TIJERA"
GOTO pipati

PAPEL:
LOCATE 9, 1
PRINT "          ÛßßßßßßßßßßÛ "
PRINT "Ûßßßßßßßßßß   ßßßßßßßßÜÜÜÜÜÜ"
PRINT "Û          ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ"
PRINT "Û                           ßßßßÛ"
PRINT "Û          ßßßßßßßßßßßßßßßßßßÛßßß"
PRINT "Û            Ûßßßßßßßßßßßßßßßß"
PRINT "ßßßßßßßßßÛ    ßßÛÜÜÜÜÜÜÜÜ"
PRINT "         ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ "
PRINT "        PAPEL"
GOTO pipati

PIEDRA:
LOCATE 9, 1
PRINT "          ÛßßßßßßÛ "
PRINT "Ûßßßßßßßßßß  ÜÜÜÜÛ"
PRINT "Û          ÜÜÜÜÜÜÛ"
PRINT "Û                Û"
PRINT "Û          ßßßßßßÛ"
PRINT "Û            Ûßßßß"
PRINT "ßßßßßßßßßÛ   ÛÜÜÜ"
PRINT "         ÛÜÜÜÜÜÜÛ "
PRINT "       PIEDRA"
GOTO pipati

PIED:
RRNNDD = INT(RND * 3 + 1)
IF RRNNDD = 1 THEN
LOCATE 12, 70
PRINT "PIEDRA"
END IF
IF RRNNDD = 2 THEN
LOCATE 12, 70
PRINT "PAPEL"
END IF
IF RRNNDD = 3 THEN
LOCATE 12, 70
PRINT "TIJERA"
END IF
DO
LOOP UNTIL INKEY$ <> ""
GOTO piepapti
coso:
PRINT
PRINT " Jugar un rato me hace bien pero si intentas hacerme"
PRINT "jugar mucho me puedo enfermar."
DO
LOOP UNTIL INKEY$ <> ""
GOTO juegafin

juegafin:
CALL revisa
CLS
END SUB

SUB leer
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
IF LEYENDO = 0 THEN
LOCATE 2, 1
PRINT " Todav¡a no se leer, "; tunom$; " me ten‚s que mandar a la escuela. "
DO
LOOP UNTIL INKEY$ <> ""
GOTO Leefin
END IF
IF LECTURA >= 5 THEN
LOCATE 2, 1
PRINT " La verdad, ahora no tengo ganas de leer "; tunom$
DO
LOOP UNTIL INKEY$ <> ""
GOTO Leefin
END IF
feliz = feliz + 1
LECTURA = 5
PRINT
PRINT "      ÛßßßßßßÜ ÜßßßßßßÛ "
PRINT "      Û LIBRO Û LIBRO Û"
PRINT "      Û LIBRO Û LIBRO Û"
PRINT "      Û LIBRO Û LIBRO Û"
PRINT "      ÛÜÜÜÜÜÜß ßÜÜÜÜÜÜÛ"
PRINT " Ten¡a muchas ganas de leer, adem s me pone muy contento ! ! !"
DO
LOOP UNTIL INKEY$ <> ""
Leefin:
CLS
CALL revisa
END SUB

SUB muere
END SUB

SUB Ordenes
COLOR 10, 1
CLS
orden:
LOCATE 2, 1
PRINT " Ordenes ÄÄÄÄÄÄÄÄÄÄÄ> Men£"
PRINT " ÍÍÍÍÍÍÍ             ÄÄÄÄÄÄ"
PRINT " 1_ Comer"
PRINT " 2_ Ba¤arse"
PRINT " 3_ Leer"
PRINT " 4_ Ir a dormir"
PRINT " 5_ Jugar"
PRINT " 6_ Pegarle"
IF LEYENDO = 0 THEN PRINT " 7_ Ir a la escuela" ELSE
IF LEYENDO = 0 THEN PRINT " 8_ Volver" ELSE PRINT " 7_ Volver"
a$ = INKEY$
IF UCASE$(a$) = "1" THEN CALL come
IF UCASE$(a$) = "2" THEN CALL bana
IF UCASE$(a$) = "3" THEN CALL leer
IF UCASE$(a$) = "4" THEN CALL duerme
IF UCASE$(a$) = "5" THEN CALL juega
IF UCASE$(a$) = "6" THEN CALL pega
IF UCASE$(a$) = "7" AND LEYENDO = 0 THEN CALL escuela
IF UCASE$(a$) = "7" AND LEYENDO = 1 THEN GOTO final
IF UCASE$(a$) = "8" AND LEYENDO = 0 THEN GOTO final
GOTO orden
final:
CLS
END SUB

SUB ORIGEN
CLS
Amigochi:
LOCATE 4, 1
PRINT "               Amigochi    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
PRINT "               ÄÄÄìÄÄÄÄ    ³ <D>a t o s   º"
PRINT "                           ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
PRINT "                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
PRINT "                           ³<O>r d e n e sº"
PRINT "                           ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
PRINT "                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
PRINT "                           ³ <E>s t a d o º"
PRINT "                           ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
PRINT " ÚÄÄÄÄÄÄÄ·                                 "
PRINT " ³<S>alirº                                 "
PRINT " ÔÍÍÍÍÍÍÍ¼                                 "
a$ = INKEY$
IF UCASE$(a$) = "D" THEN
GOSUB Datap
CLS
CALL Datos
END IF
IF UCASE$(a$) = "O" THEN
GOSUB ordap
CLS
CALL Ordenes
END IF
IF UCASE$(a$) = "E" THEN
GOSUB estap
CLS
CALL Estado
END IF
IF UCASE$(a$) = "G" THEN
GOSUB grbap
CLS
CALL graba
END IF
IF UCASE$(a$) = "V" THEN
GOSUB Verap
CLS
GOSUB Cosoto
END IF
IF UCASE$(a$) = "S" THEN
GOSUB salap
CLS
SYSTEM
END IF
GOTO Amigochi
Datap:
LOCATE 4, 28
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
LOCATE 5, 28
PRINT "º <D>a t o s   ³"
LOCATE 6, 28
PRINT "ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
FOR I = 1 TO 50000
NEXT I
RETURN
ordap:
LOCATE 7, 28
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
LOCATE 8, 28
PRINT "º<O>r d e n e s³"
LOCATE 9, 28
PRINT "ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
FOR I = 1 TO 50000
NEXT I
RETURN
estap:
LOCATE 10, 28
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
LOCATE 11, 28
PRINT "º <E>s t a d o ³"
LOCATE 12, 28
PRINT "ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
FOR I = 1 TO 50000
NEXT I
RETURN
grbap:
COLOR 14, 1
LOCATE 14, 28
PRINT "®   <G>raba    ¯"
COLOR 10, 1
FOR I = 1 TO 50000
NEXT I
RETURN
salap:
LOCATE 13, 2
PRINT "ÉÍÍÍÍÍÍÍ¸"
LOCATE 14, 2
PRINT "º<S>alir³"
LOCATE 15, 2
PRINT "ÓÄÄÄÄÄÄÄÙ"
FOR I = 1 TO 50000
NEXT I
COLOR 7, 0
CLS
PRINT "               Gracias por haber jugado a AMIGO"
PRINT "ÚÄÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄÄ¿ÚÄÄ¿ ÚÄÄÄ¿ÚÄÄ¿ ÚÄÄÄ¿ÚÄ¿ Ú¿ÚÄÄÄ¿ ÚÄÄÄÄ¿Ú¿ Ú¿ÚÄÄÄ¿"
PRINT "³ÚÄÄ¿³³   ³³ÚÄÄ¿³³Ú¿À¿³ÚÄ¿³³Ú¿³ ³ÚÄÄÙ³ ³ ³³³Ú¿ ³ ³ÚÄÄ¿³³³ ³³³   ³"
PRINT "³³  ³³³³³³³³³  ³³³³À¿³³³ ³³³³³³ ³À¿  ³³³ ³³³³³ÚÙ ³³  ³³³³ ³³³³³³³"
PRINT "³ÀÄÄÙ³³ÃÁ´³³ÀÄÄÙ³³³ ³³³³ ³³³ÀÙÀ¿³ÚÙ  ³³³ ³³³ÀÙÀÄ¿³ÀÄÄÙ³³³ ³³³ÃÁ´³"
PRINT "³ÚÄÄ¿³³³ ³³³ÚÄÄ¿³³³ÚÙ³³³ ³³³ÚÄ¿³³³   ³³ÀÄÙ³³ÚÄÄ¿³³ÚÄÄ¿³³³ ³³³³ ³³"
PRINT "³³  ³³³³ ³³³³  ³³³ÀÙÚÙ³ÀÄÙ³³³ ³³³ÀÄÄ¿³ÃÄÄ¿³³ÀÄÄÙ³³³  ³³³ÀÄÙ³³³ ³³"
PRINT "ÀÙ  ÀÙÀÙ ÀÙÀÙ  ÀÙÀÄÄÙ ÀÄÄÄÙÀÙ ÀÙÀÄÄÄÙÀÙ  ÀÙÀÄÄÄÄÙÀÙ  ÀÙÀÄÄÄÙÀÙ ÀÙ"
PRINT "                        COMPANY S.A"
DO
LOOP UNTIL INKEY$ <> ""
RETURN
Verap:
COLOR 14, 1
LOCATE 15, 28
PRINT "®<V>er  L pidas¯"
COLOR 10, 1
FOR I = 1 TO 10000
NEXT I
RETURN
Cosoto:
CLS
NUM = 0
CLS
RETURN
END SUB

SUB pega
edad = edad + .45: peso = peso + .32
COLOR 10, 1
CLS
PRINT
PRINT "          ÛßßßßßßßßßßÛ "
PRINT "Ûßßßßßßßßßß   ßßßßßßßßÜÜÜÜÜÜ"
PRINT "Û          ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ"
PRINT "Û                           ßßßßÛ"
PRINT "Û          ßßßßßßßßßßßßßßßßßßÛßßß"
PRINT "Û            Ûßßßßßßßßßßßßßßßß"
PRINT "ßßßßßßßßßÛ    ßßÛÜÜÜÜÜÜÜÜ"
PRINT "         ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ "
PRINT " P... por qu‚ me ...pegas? Y... yo no te hice nada. "
DO
LOOP UNTIL INKEY$ <> ""
enf = enf + 2
hambre = hambre - 1
dormilon = dormilon - 1
feliz = feliz - 2
CLS
CALL revisa
END SUB

SUB PRESENTACION
SCREEN 9
CLS
LOCATE 12, 1
COLOR 14, 0
PRINT "              AA        MMM     MMM      II     GGGGGGGGG       OOOO"
COLOR 14, 0
PRINT "             A  A       M MM   MM M      II     GG             OO  OO"
COLOR 14, 0
PRINT "            A    A      M  MM MM  M      II     GG            OO    OO"
COLOR 14, 0
PRINT "           AAAAAAAA     M    M    M      II     GGGGGGGGG    OO      OO"
COLOR 14, 0
PRINT "           A      A     M         M      II     G       G     OO    OO"
COLOR 14, 0
PRINT "           A      A     M         M      II     G       G      OO  OO"
COLOR 14, 0
PRINT "           A      A     M         M      II     GGGGGGGGG       OOOO"
X0 = 1
X1 = 80
Y0 = 1
Y1 = 23
DO
FOR K = 219 TO 219
Q = RND 
IF Q < 0.3 THEN
FG = 4
ELSEIF Q < 0.6 THEN
FG = 2
ELSEIF Q < 0.7 THEN
FG = INT(RND * 15)
ELSE
FG = 1
END IF
Q = RND 
IF Q < 0.3 THEN
BG = 10
ELSEIF Q < 0.6 THEN
BG = 14
ELSEIF Q < 0.7 THEN
FG = INT(RND * 15)
ELSE
BG = 9
END IF
COLOR FG, BG
FOR I = Y0 TO Y1
FOR J = X0 TO X1
LOCATE I, J
IF SCREEN(I, J) = 32 OR SCREEN(I,J) >= 200 THEN
PRINT CHR$(K)
ELSE
COLOR BG, FG
PRINT CHR$(SCREEN(I, J))
COLOR FG, BG
END IF
IF RND < 0.001 THEN
QX0 = RND
END IF
IF RND < 0.001 THEN
QX1 = RND
END IF
IF RND < 0.001 THEN
QY0 = RND
END IF
IF RND < 0.001 THEN
QY1 = RND
END IF
IF X1 - X0 < 1 THEN
IF RND < 0.3 THEN QX0 = 0
END IF
IF X1 - X0 < 1 THEN
IF RND < 0.3 THEN QX1 = .5
END IF
IF Y1 - Y0 < 1 THEN
IF RND < 0.3 THEN QY0 = 0
END IF
IF Y1 - Y0 < 1 THEN
IF RND < 0.3 THEN QY1 = 0.5
END IF
IF RND < 0.1 THEN
IF QY0 < 0.3 THEN
IF Y0 > 1 THEN Y0 = Y0 - 1
ELSEIF QY0 < 0.6 THEN
IF Y0 < Y1 THEN Y0 = Y0 + 1
END IF
END IF
IF RND < 0.1 THEN
IF QY1 < 0.3 THEN
IF Y1 > Y0 THEN Y1 = Y1 - 1
ELSEIF QY1 < 0.6 THEN
IF Y1 < 23 THEN Y1 = Y1 + 1
END IF
END IF
IF RND < 0.1 THEN
IF QX0 < 0.3 THEN
IF X0 > 1 THEN X0 = X0 - 1
ELSEIF QX0 < 0.6 THEN
IF X0 < X1 THEN X0 = X0 + 1
END IF
END IF
IF RND < 0.1 THEN
IF QX1 < 0.3 THEN
IF X1 > X0 THEN X1 = X1 - 1
ELSEIF QX1 < 0.6 THEN
IF X1 < 80 THEN X1 = X1 + 1
END IF
END IF
NEXT J
NEXT I
NEXT K
LOOP WHILE INKEY$ = ""
COLOR 10,1
CLS
LOCATE 1, 1
INPUT " Cu l es tu nombre? ", tunom$
LOCATE 2, 1
INPUT " Cu l ser  el nombre de tu mascota? ", nombre$
CALL veoex
PRINT
PRINT "                   ÜÜÜÜÜÜÜ"
PRINT "                 Ûß       ßÛ"
PRINT "                Û Û         Û"
PRINT "               Û  ßßßÛ       Û"
PRINT "               Û      ÛÜ     Û"
PRINT "               Û        ÛÜÜ  Û"
PRINT "               Û          ÛÜÜÛ"
PRINT "               Û             Û"
PRINT "                Û           Û"
PRINT "                 ÛÜ       ÜÛ"
PRINT "                   ßßßßßßß"
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT
PRINT "                ÜÜÜÜÜÜÜÜÜÜÜÜÜ "
PRINT "               Û ÜÜ       ÜÜ Û"
PRINT "               Û ßß   Û   ßß Û"
PRINT "               Û  Û  ßßß  Û  Û"
PRINT "                Û  ßÛßßßÛß  Û "
PRINT "                 ÛÜÜÜÜÜÜÜÜÜÛ"
PRINT "                   "; nombre$
PRINT
DO
LOOP UNTIL INKEY$ <> ""
IF reng = cuantos + 1 THEN INPUT " Cu l es tu nombre? ", tunom$
END SUB

SUB revisa
IF INT(RND * 10) + 1 < 4 THEN temp = INT(RND * 40) + 1
IF edad / peso > 1.193 THEN enf = enf + 1
IF hambre <= 0 THEN hambre = 0
IF sucio <= 0 THEN sucio = 0
IF feliz <= 0 THEN feliz = 0
IF juego <= 0 THEN juego = 0
IF LECTURA <= 0 THEN LECTURA = 0
IF dormilon <= 0 THEN dormilon = 0
IF bano <= 0 THEN bano = 0
IF enf <= 0 THEN enf = 0
IF hambre >= 5 THEN hambre = 5
IF sucio >= 5 THEN sucio = 5
IF feliz >= 5 THEN feliz = 5
IF juego >= 5 THEN juego = 5
IF LECTURA >= 5 THEN LECTURA = 5
IF dormilon >= 5 THEN dormilon = 5
IF bano >= 5 THEN bano = 5
IF enf >= 30 THEN enf = 30
IF hambre = 0 THEN
enf = enf + 1
CLS
PRINT "Tengo hambre "
DO
LOOP UNTIL INKEY$ <> ""
CALL come
END IF
IF sucio = 0 THEN
CLS
PRINT "Me voy a ba¤ar "
DO
LOOP UNTIL INKEY$ <> ""
CALL bana
END IF
IF feliz = 0 THEN
enf = enf + 1
CALL enfermo
END IF
IF juego = 0 THEN
enf = enf + 1
CALL juega
END IF
IF LECTURA = 0 THEN
enf = enf + 1
PRINT " Tengo ganas de leer !"
DO
LOOP UNTIL INKEY$ <> ""
CALL leer
END IF
IF dormilon = 0 THEN
enf = enf + 1
CLS
PRINT "Tengo sue¤o "
DO
LOOP UNTIL INKEY$ <> ""
CALL duerme
END IF
IF bano = 0 THEN
CLS
PRINT "Quiero ir al ba¤o "
DO
LOOP UNTIL INKEY$ <> ""
CALL banarse
END IF
IF enf = 30 THEN CALL enfermo
IF edad > 70 AND INT(RND * 50) + 1 = 50 THEN CALL muere
IF edad > 80 THEN CALL enfermo
IF edad > 90 THEN CALL muere
END SUB

SUB rompe
CLS
COLOR 10, 1
PRINT
PRINT nombre$; " ha roto un florero mientras jugaba !"
PRINT "        ÜÜÜÜÜÜÜÜÜÜÜÜ"
PRINT "         ßÜ      Üß "
PRINT "        Üß   ßÜ   ßÜ"
PRINT "       ßÜ    Üß    Üß"
PRINT "         ßÜ   ßÜ Üß"
PRINT "           Û    Û"
PRINT "            ÛÜÜÛ"
DO
LOOP UNTIL INKEY$ <> ""
PRINT
PRINT "   ® No importa ¯         ® Le pego ¯"
PRINT "          1                     2    "
dododo:
a$ = INKEY$
IF a$ = "1" THEN GOTO ninporta
IF a$ = "2" THEN GOTO lepego
GOTO dododo
lepego:
LOCATE 9, 1
PRINT "          ÛßßßßßßßßßßÛ "
PRINT "Ûßßßßßßßßßß   ßßßßßßßßÜÜÜÜÜÜ"
PRINT "Û          ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ"
PRINT "Û                           ßßßßÛ"
PRINT "Û          ßßßßßßßßßßßßßßßßßßÛßßß"
PRINT "Û            Ûßßßßßßßßßßßßßßßß"
PRINT "ßßßßßßßßßÛ    ßßÛÜÜÜÜÜÜÜÜ"
PRINT "         ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ "
feliz = feliz - 2
enf = enf + 2
hambre = hambre - 1
dormilon = dormilon - 1
ninporta:
CALL Ordenes
END SUB

SUB trae
END SUB

SUB veoex
END SUB

