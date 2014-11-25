DECLARE SUB COMIENZO ()
DECLARE SUB inicio ()
DECLARE SUB instalar (EXT$)
DECLARE SUB almacen ()
DECLARE FUNCTION llevar$ (cadena$, longit!)
DECLARE SUB nombrear ()
DIM SHARED nomarc$, taman, tipo$
DIM SHARED nombre$(8), matra$(19)
LOCATE 1, 1
COMIENZO
instalar "Installing DLLs"
instalar "Installing INIs"
instalar "Installing SYSs"
instalar "Installing EXEs"
instalar "Booting Uindou . . ."
inicio
nombre$(1) = "Program Files"
nombre$(2) = "Guindou"
nombre$(3) = "My documents"
nombre$(4) = "Games"
nombre$(5) = ""
nombre$(6) = "Ofis"
nombre$(7) = "Trash can"
nombre$(8) = ""
almacen
X = 3
Y = 4
COLOR 0, 0
CLS
tope:
LOCATE 1, 1
COLOR 15, 1
LOCATE 2, 1
PRINT "    Administrador de programa                                                   "
COLOR 4, 1
LOCATE 2, 2
PRINT "ў"
COLOR 15, 1
LOCATE 2, 74
PRINT "_"
LOCATE 2, 76
PRINT "ў"
LOCATE 2, 78
PRINT "x"
COLOR 0, 7
LOCATE 3, 1
PRINT "кФФФФФФФФФФФФФФФФФФФФТФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФП"
FOR i = 4 TO 20
LOCATE i, 1
PRINT "Г                    Г                                                         Г"
NEXT i
PRINT "РФФФФФФФФФФФФФФФФФФФФСФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФй"
COLOR 0, 3
PRINT "                                                                                "
PRINT "                                                                                "
LOCATE 23, 1
COLOR 0, 7
PRINT "  Inicio                                                                        "
LOCATE 23, 10
COLOR 15, 7
PRINT "Г"
LOCATE 23, 11
COLOR 8, 7
PRINT "Г"
LOCATE 23, 13
COLOR 1, 7
PRINT "E"

a = 0
FOR i = 4 TO 19 STEP 2
  a = a + 1
  COLOR 14, 7
  LOCATE i, 4
  PRINT "лмм"
  COLOR 0, 7
  LOCATE i, 8
  PRINT MID$(nombre$(a), 1, 14)
NEXT i
LOCATE 4, 23
PRINT "Nombre     ГTamaЄo GBГTipo                               "
LOCATE 5, 23
PRINT "ФФФФФФФФФФФХФФФФФФФФФХФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФ"
FOR i = 6 TO 19
 LOCATE i, 23
 PRINT matra$(i)
NEXT i
DO
  e$ = INKEY$
  COLOR 0, 7
  LOCATE 23, 70
  PRINT TIME$
  COLOR 15
  LOCATE Y, X
  PRINT "л"
  IF e$ = CHR$(0) + "M" AND X < 80 THEN X = X + 1: GOTO tope
  IF e$ = CHR$(0) + "K" AND X > 1 THEN X = X - 1: GOTO tope
  IF e$ = CHR$(0) + "H" AND Y > 2 THEN Y = Y - 1: GOTO tope
  IF e$ = CHR$(0) + "P" AND Y < 23 THEN Y = Y + 1: GOTO tope
  IF e$ = " " THEN APRETADAS = APRETADAS + 1: GOSUB Aprete: GOTO tope
LOOP

Aprete:
  IF APRETADAS = 1 THEN
    LOCATE 10, 20
    COLOR 15, 1
    PRINT " Error                                   x "
    COLOR 0, 7
    LOCATE 11, 20
    PRINT "кФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФП"
    LOCATE 12, 20
    PRINT "Г            Este programa hizo una       Г"
    LOCATE 13, 20
    PRINT "Г          operaciЂn que no sirve y       Г"
    LOCATE 14, 20
    PRINT "Г          se regarcar . Jodete.          Г"
    LOCATE 15, 20
    PRINT "РФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФФй"
    COLOR 4, 7
    LOCATE 12, 22
    PRINT "млллллм"
    COLOR 15, 4
    LOCATE 13, 22
    PRINT "   X   "
    COLOR 4, 7
    LOCATE 14, 22
    PRINT "плллллп"
  END IF
  IF APRETADAS > 1 THEN
    PRINT CHR$(7)
    COLOR 7, 1
    CLS
    COLOR 1, 7
    LOCATE 10, 30
    PRINT "FAYO EN EL SISTEMA"
    COLOR 15, 1
    LOCATE 13, 15
    PRINT "Error en 00:00043FAHACEFGAHEBCGA001FFF. El sistema sizo"
    LOCATE 14, 15
    PRINT "mier porque  lo garcaste  bolЃ.  Apret  cualquier tecla"
    LOCATE 15, 15
    PRINT "para continuar, o sino cualquier otra tecla para seguir"
    LOCATE 16, 15
    PRINT "continuando."
    COLOR 7, 1
    LOCATE 16, 27, 1, 30, 31
  END IF
  DO
  LOOP UNTIL INKEY$ <> ""
  COLOR 0, 0
  CLS
RETURN

SUB almacen
 FOR i = 1 TO 19
   nombrear
   matra$(i) = llevar$(nomarc$, 10) + " Г" + llevar$(STR$(taman), 8) + " Г" + llevar$(tipo$, 30)
 NEXT i
END SUB

SUB COMIENZO
  COLOR 7, 0
  CLS
  PRINT "OAS REGISTERING OS/UINDOU                                   0.043563551345693"
  PRINT
  PRINT "Slave Master checking     205067"
  PRINT "Master Boot checking     1305461"
  PRINT
  PRINT
  PRINT "Checking record clusters    3203"
  FOR jj = 1 TO 50000
  NEXT jj
END SUB

SUB inicio
  COLOR 0, 3
  CLS
  LOCATE 5, 20
  PRINT "  ллллллллллллллллллллллллллллл"
  LOCATE 6, 20
  PRINT " ллл          ллл          ллл"
  LOCATE 7, 20
  PRINT " ллл          ллл          ллл"
  LOCATE 8, 20
  PRINT "ллл          ллл          ллл"
  LOCATE 9, 20
  PRINT "ллл          ллл          ллл"
  LOCATE 10, 20
  PRINT " ллллллллллллллллллллллллллллл"
  LOCATE 11, 20
  PRINT " ллл          ллл          ллл"
  LOCATE 12, 20
  PRINT " ллл          ллл          ллл"
  LOCATE 13, 20
  PRINT "  ллл          ллл          ллл"
  LOCATE 14, 20
  PRINT "  ллл          ллл          ллл"
  LOCATE 15, 20
  PRINT "  ллллллллллллллллллллллллллллл"
  COLOR 4
  LOCATE 6, 24
  PRINT "лллллллллл"
  LOCATE 7, 24
  PRINT "лллллллллл"
  LOCATE 8, 23
  PRINT "лллллллллл"
  LOCATE 9, 23
  PRINT "лллллллллл"
  COLOR 1
  LOCATE 6, 37
  PRINT "лллллллллл"
  LOCATE 7, 37
  PRINT "лллллллллл"
  LOCATE 8, 36
  PRINT "лллллллллл"
  LOCATE 9, 36
  PRINT "лллллллллл"
  COLOR 14
  LOCATE 11, 24
  PRINT "лллллллллл"
  LOCATE 12, 24
  PRINT "лллллллллл"
  LOCATE 13, 25
  PRINT "лллллллллл"
  LOCATE 14, 25
  PRINT "лллллллллл"
  COLOR 2
  LOCATE 11, 37
  PRINT "лллллллллл"
  LOCATE 12, 37
  PRINT "лллллллллл"
  LOCATE 13, 38
  PRINT "лллллллллл"
  LOCATE 14, 38
  PRINT "лллллллллл"
  LOCATE 18, 32
  COLOR 0, 3
  PRINT "U I N D O U"
  FOR i = 1 TO 50000
  NEXT i
  COLOR 0, 0
  CLS
END SUB

SUB instalar (EXT$)
  COLOR 15, 0
  CLS
  PRINT EXT$
  COLOR 4, 0
  FOR i = 2 TO 20
    FOR j = 1 TO 70
      LOCATE i, j
      PRINT "л"
      FOR ESP = 1 TO 100
      NEXT ESP
    NEXT j
  NEXT i
END SUB

FUNCTION llevar$ (cadena$, longit)
  IF LEN(cadena$) = longit THEN llevar$ = cadena$ : EXIT FUNCTION
  IF LEN(cadena$) > longit THEN
    cadena$ = MID$(cadena$, 1, longit)
  ELSE
    cadena$ = cadena$ + SPACE$(longit - LEN(cadena$))
  END IF
  llevar$ = cadena$
END FUNCTION

SUB nombrear
  RANDOMIZE TIMER
  nomarc$ = ""
  taman = 0
  tipo$ = ""
  FOR i = 1 TO INT(RND * 8) + 1
    nomarc$ = nomarc$ + CHR$(INT(RND * 26) + 65)
  NEXT i
  taman = INT(RND * 30000) + 1
  SELECT CASE INT(RND * 4) + 1
    CASE 1
     tipo$ = "AplicaciЂn"
    CASE 2
     tipo$ = "Archivo de mapa de bits"
    CASE 3
     tipo$ = "Archivo de sonido"
    CASE 4
     tipo$ = "Documento de texto"
  END SELECT
END SUB

