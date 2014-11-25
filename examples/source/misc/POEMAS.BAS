DECLARE FUNCTION BUENA$ (TEXTO$)
DECLARE FUNCTION ADVE$ ()
DECLARE FUNCTION VERBO$ ()
DECLARE FUNCTION ADJE$ (PERSONA!, GENERO!)
DECLARE FUNCTION ART$ (PERSONA!, GENERO!)
DECLARE FUNCTION SUSTA$ (PERSONA!, GENERO!)
DECLARE FUNCTION CONJUGA$ (VERBO$, TIEMPO!, PERSONA)
CLS
RANDOMIZE TIMER
RANDOMIZE TIMER
FOR I = 1 TO 3
  XX = INT(RND * 2) + 1
  TT = INT(RND * 16) + 1
  IF XX = 1 THEN
    RANDOMIZE TIMER
    RANDOMIZE TIMER
    
    PP = 3 * (INT(RND * 2) + 1)
    GG = INT(RND * 2) + 1
    X = INT(RND * 6) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 6 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP)) + ","
    X = INT(RND * 5) + 1
    IF X = 1 THEN PRINT BUENA$(ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 2 THEN PRINT BUENA$(CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 3 THEN PRINT BUENA$(ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 4 THEN PRINT BUENA$(CONJUGA$(VERBO$, TT, PP) + ADVE$ + ADJE$(PP, GG));
    IF X = 5 THEN PRINT BUENA$(ADJE$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP));
    X = INT(RND * 8) + 1
    IF X = 1 THEN PRINT ", y"
    IF X = 2 THEN PRINT ", o"
    IF X = 3 THEN PRINT ", mas"
    IF X = 4 THEN PRINT ", pero"
    IF X = 5 THEN PRINT ";"
    IF X = 6 THEN PRINT ";"
    IF X = 7 THEN PRINT ";"
    IF X = 8 THEN PRINT ";"
  END IF
  IF XX = 2 THEN
    PP = INT(RND * 6) + 1
    GG = INT(RND * 2) + 1
    X = INT(RND * 6) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 6 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP)) + ","
    PP = INT(RND * 6) + 1
    GG = INT(RND * 2) + 1
    X = INT(RND * 5) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    X = INT(RND * 8) + 1
    IF X = 1 THEN PRINT ", y"
    IF X = 2 THEN PRINT ", o"
    IF X = 3 THEN PRINT ", mas"
    IF X = 4 THEN PRINT ", pero"
    IF X = 5 THEN PRINT ";"
    IF X = 6 THEN PRINT ";"
    IF X = 7 THEN PRINT ";"
    IF X = 8 THEN PRINT ";"
  END IF
  XX = INT(RND * 2) + 1
  IF XX = 1 THEN
    PP = INT(RND * 6) + 1
    GG = INT(RND * 2) + 1
    X = INT(RND * 6) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ",")
    IF X = 6 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP) + ",")
    X = INT(RND * 5) + 1
    IF X = 1 THEN PRINT BUENA$(ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 2 THEN PRINT BUENA$(CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 3 THEN PRINT BUENA$(ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 4 THEN PRINT BUENA$(CONJUGA$(VERBO$, TT, PP) + ADVE$ + ADJE$(PP, GG));
    IF X = 5 THEN PRINT BUENA$(ADJE$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP));
    PRINT "."
  END IF
  IF XX = 2 THEN
    PP = INT(RND * 6) + 1
    GG = INT(RND * 2) + 1
    X = INT(RND * 6) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$) + ","
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP)) + ","
    IF X = 6 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADVE$ + CONJUGA$(VERBO$, TT, PP)) + ","
    PP = INT(RND * 6) + 1
    GG = INT(RND * 2) + 1
    X = INT(RND * 5) + 1
    IF X = 1 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 2 THEN PRINT BUENA$(ART$(PP, GG) + ADJE$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 3 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    IF X = 4 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + ADJE$(PP, GG) + CONJUGA$(VERBO$, TT, PP) + ADVE$);
    IF X = 5 THEN PRINT BUENA$(ART$(PP, GG) + SUSTA$(PP, GG) + CONJUGA$(VERBO$, TT, PP));
    PRINT "."
  END IF
  PRINT
  PRINT "          -O-"
  PRINT
NEXT I
PRINT "                         Pablo Barenbaum"

FUNCTION ADJE$ (PERSONA, GENERO)
 IF PERSONA = 1 OR PERSONA = 2 THEN PERSONA = 3
 IF PERSONA = 4 OR PERSONA = 5 THEN PERSONA = 6
 SELECT CASE PERSONA
   CASE 3
     SELECT CASE GENERO
       CASE 1
         A = INT(RND * 73) + 1
         IF A = 1 THEN TRAN$ = "ALTO"
         IF A = 2 THEN TRAN$ = "BAJO"
         IF A = 3 THEN TRAN$ = "GORDO"
         IF A = 4 THEN TRAN$ = "FLACO"
         IF A = 5 THEN TRAN$ = "LINDO"
         IF A = 6 THEN TRAN$ = "FEO"
         IF A = 7 THEN TRAN$ = "INTELIGENTE"
         IF A = 8 THEN TRAN$ = "TONTO"
         IF A = 9 THEN TRAN$ = "MAJESTUOSO"
         IF A = 10 THEN TRAN$ = "GRANDIOSO"
         IF A = 11 THEN TRAN$ = "INSPIRANTE"
         IF A = 12 THEN TRAN$ = "ASOMBROSO"
         IF A = 13 THEN TRAN$ = "TEMIBLE"
         IF A = 14 THEN TRAN$ = "BUENO"
         IF A = 15 THEN TRAN$ = "MALO"
         IF A = 16 THEN TRAN$ = "MALIGNO"
         IF A = 17 THEN TRAN$ = "MALDITO"
         IF A = 18 THEN TRAN$ = "BENIGNO"
         IF A = 19 THEN TRAN$ = "BENDITO"
         IF A = 20 THEN TRAN$ = "SACRO"
         IF A = 21 THEN TRAN$ = "ESPIRITUAL"
         IF A = 22 THEN TRAN$ = "TERRENAL"
         IF A = 23 THEN TRAN$ = "DESPAMPANANTE"
         IF A = 24 THEN TRAN$ = "RAPIDO"
         IF A = 25 THEN TRAN$ = "RABIOSO"
         IF A = 26 THEN TRAN$ = "IRACUNDO"
         IF A = 27 THEN TRAN$ = "ENOJADO"
         IF A = 28 THEN TRAN$ = "TRISTE"
         IF A = 29 THEN TRAN$ = "FELIZ"
         IF A = 30 THEN TRAN$ = "ALEGRE"
         IF A = 31 THEN TRAN$ = "CONTENTO"
         IF A = 32 THEN TRAN$ = "BLANCO"
         IF A = 33 THEN TRAN$ = "AMARILLO"
         IF A = 34 THEN TRAN$ = "AZUL"
         IF A = 35 THEN TRAN$ = "ROJO"
         IF A = 36 THEN TRAN$ = "NARANJA"
         IF A = 37 THEN TRAN$ = "VERDE"
         IF A = 38 THEN TRAN$ = "VIOLETA"
         IF A = 39 THEN TRAN$ = "BLANCUZCO"
         IF A = 40 THEN TRAN$ = "NEGRO"
         IF A = 41 THEN TRAN$ = "AMARILLENTO"
         IF A = 42 THEN TRAN$ = "AZULADO"
         IF A = 43 THEN TRAN$ = "ROJIZO"
         IF A = 44 THEN TRAN$ = "ANARANJADO"
         IF A = 45 THEN TRAN$ = "VIOLACEO"
         IF A = 46 THEN TRAN$ = "NEGRUZCO"
         IF A = 47 THEN TRAN$ = "MARRON"
         IF A = 48 THEN TRAN$ = "AMARRONADO"
         IF A = 49 THEN TRAN$ = "VIVO"
         IF A = 50 THEN TRAN$ = "MUERTO"
         IF A = 51 THEN TRAN$ = "VIVIDO"
         IF A = 52 THEN TRAN$ = "MORIBUNDO"
         IF A = 53 THEN TRAN$ = "GRAVE"
         IF A = 54 THEN TRAN$ = "LENTO"
         IF A = 55 THEN TRAN$ = "SEVERO"
         IF A = 56 THEN TRAN$ = "MAGICO"
         IF A = 57 THEN TRAN$ = "HOMERICO"
         IF A = 58 THEN TRAN$ = "LIGERO"
         IF A = 59 THEN TRAN$ = "ARMADO"
         IF A = 60 THEN TRAN$ = "POSTRERO"
         IF A = 61 THEN TRAN$ = "OBLICUO"
         IF A = 62 THEN TRAN$ = "AGRESOR"
         IF A = 63 THEN TRAN$ = "INFINITO"
         IF A = 64 THEN TRAN$ = "TENUE"
         IF A = 65 THEN TRAN$ = "SESGO"
         IF A = 66 THEN TRAN$ = "ENCARNIZADO"
         IF A = 67 THEN TRAN$ = "DIRECTO"
         IF A = 68 THEN TRAN$ = "LADINO"
         IF A = 69 THEN TRAN$ = "MORIBUNDO"
         IF A = 70 THEN TRAN$ = "ARMADO"
         IF A = 71 THEN TRAN$ = "SE¤ALADO"
         IF A = 72 THEN TRAN$ = "ADAMANTINO"
         IF A = 73 THEN TRAN$ = "PRISIONERO"
       CASE 2
         A = INT(RND * 73) + 1
         IF A = 1 THEN TRAN$ = "ALTA"
         IF A = 2 THEN TRAN$ = "BAJA"
         IF A = 3 THEN TRAN$ = "GORDA"
         IF A = 4 THEN TRAN$ = "FLACA"
         IF A = 5 THEN TRAN$ = "LINDA"
         IF A = 6 THEN TRAN$ = "FEA"
         IF A = 7 THEN TRAN$ = "INTELIGENTE"
         IF A = 8 THEN TRAN$ = "TONTA"
         IF A = 9 THEN TRAN$ = "MAJESTUOSA"
         IF A = 10 THEN TRAN$ = "GRANDIOSA"
         IF A = 11 THEN TRAN$ = "INSPIRANTE"
         IF A = 12 THEN TRAN$ = "ASOMBROSA"
         IF A = 13 THEN TRAN$ = "TEMIBLE"
         IF A = 14 THEN TRAN$ = "BUENA"
         IF A = 15 THEN TRAN$ = "MALA"
         IF A = 16 THEN TRAN$ = "MALIGNA"
         IF A = 17 THEN TRAN$ = "MALDITA"
         IF A = 18 THEN TRAN$ = "BENIGNA"
         IF A = 19 THEN TRAN$ = "BENDITA"
         IF A = 20 THEN TRAN$ = "SACRA"
         IF A = 21 THEN TRAN$ = "ESPIRITUAL"
         IF A = 22 THEN TRAN$ = "TERRENAL"
         IF A = 23 THEN TRAN$ = "DESPAMPANANTE"
         IF A = 24 THEN TRAN$ = "RAPIDA"
         IF A = 25 THEN TRAN$ = "RABIOSA"
         IF A = 26 THEN TRAN$ = "IRACUNDA"
         IF A = 27 THEN TRAN$ = "ENOJADA"
         IF A = 28 THEN TRAN$ = "TRISTE"
         IF A = 29 THEN TRAN$ = "FELIZ"
         IF A = 30 THEN TRAN$ = "ALEGRE"
         IF A = 31 THEN TRAN$ = "CONTENTA"
         IF A = 32 THEN TRAN$ = "BLANCA"
         IF A = 33 THEN TRAN$ = "AMARILLA"
         IF A = 34 THEN TRAN$ = "AZUL"
         IF A = 35 THEN TRAN$ = "ROJA"
         IF A = 36 THEN TRAN$ = "NARANJA"
         IF A = 37 THEN TRAN$ = "VERDE"
         IF A = 38 THEN TRAN$ = "VIOLETA"
         IF A = 39 THEN TRAN$ = "BLANCUZCA"
         IF A = 40 THEN TRAN$ = "NEGRA"
         IF A = 41 THEN TRAN$ = "AMARILLENTA"
         IF A = 42 THEN TRAN$ = "AZULADA"
         IF A = 43 THEN TRAN$ = "ROJIZA"
         IF A = 44 THEN TRAN$ = "ANARANJADA"
         IF A = 45 THEN TRAN$ = "VIOLACEA"
         IF A = 46 THEN TRAN$ = "NEGRUZCA"
         IF A = 47 THEN TRAN$ = "MARRON"
         IF A = 48 THEN TRAN$ = "AMARRONADA"
         IF A = 49 THEN TRAN$ = "VIVA"
         IF A = 50 THEN TRAN$ = "MUERTA"
         IF A = 51 THEN TRAN$ = "VIVIDA"
         IF A = 52 THEN TRAN$ = "MORIBUNDA"
         IF A = 53 THEN TRAN$ = "GRAVE"
         IF A = 54 THEN TRAN$ = "LENTA"
         IF A = 55 THEN TRAN$ = "SEVERA"
         IF A = 56 THEN TRAN$ = "MAGICA"
         IF A = 57 THEN TRAN$ = "HOMERICA"
         IF A = 58 THEN TRAN$ = "LIGERA"
         IF A = 59 THEN TRAN$ = "ARMADA"
         IF A = 60 THEN TRAN$ = "POSTRERA"
         IF A = 61 THEN TRAN$ = "OBLICUA"
         IF A = 62 THEN TRAN$ = "AGRESORA"
         IF A = 63 THEN TRAN$ = "INFINITA"
         IF A = 64 THEN TRAN$ = "TENUE"
         IF A = 65 THEN TRAN$ = "SESGA"
         IF A = 66 THEN TRAN$ = "ENCARNIZADA"
         IF A = 67 THEN TRAN$ = "DIRECTA"
         IF A = 68 THEN TRAN$ = "LADINA"
         IF A = 69 THEN TRAN$ = "MORIBUNDA"
         IF A = 70 THEN TRAN$ = "ARMADA"
         IF A = 71 THEN TRAN$ = "SE¤ALADA"
         IF A = 72 THEN TRAN$ = "ADAMANTINA"
         IF A = 73 THEN TRAN$ = "PRISIONERA"
     END SELECT
    CASE 6
     SELECT CASE GENERO
       CASE 1
         A = INT(RND * 73) + 1
         IF A = 1 THEN TRAN$ = "ALTOS"
         IF A = 2 THEN TRAN$ = "BAJOS"
         IF A = 3 THEN TRAN$ = "GORDOS"
         IF A = 4 THEN TRAN$ = "FLACOS"
         IF A = 5 THEN TRAN$ = "LINDOS"
         IF A = 6 THEN TRAN$ = "FEOS"
         IF A = 7 THEN TRAN$ = "INTELIGENTES"
         IF A = 8 THEN TRAN$ = "TONTOS"
         IF A = 9 THEN TRAN$ = "MAJESTUOSOS"
         IF A = 10 THEN TRAN$ = "GRANDIOSOS"
         IF A = 11 THEN TRAN$ = "INSPIRANTES"
         IF A = 12 THEN TRAN$ = "ASOMBROSOS"
         IF A = 13 THEN TRAN$ = "TEMIBLES"
         IF A = 14 THEN TRAN$ = "BUENOS"
         IF A = 15 THEN TRAN$ = "MALOS"
         IF A = 16 THEN TRAN$ = "MALIGNOS"
         IF A = 17 THEN TRAN$ = "MALDITOS"
         IF A = 18 THEN TRAN$ = "BENIGNOS"
         IF A = 19 THEN TRAN$ = "BENDITOS"
         IF A = 20 THEN TRAN$ = "SACROS"
         IF A = 21 THEN TRAN$ = "ESPIRITUALES"
         IF A = 22 THEN TRAN$ = "TERRENALES"
         IF A = 23 THEN TRAN$ = "DESPAMPANANTES"
         IF A = 24 THEN TRAN$ = "RAPIDOS"
         IF A = 25 THEN TRAN$ = "RABIOSOS"
         IF A = 26 THEN TRAN$ = "IRACUNDOS"
         IF A = 27 THEN TRAN$ = "ENOJADOS"
         IF A = 28 THEN TRAN$ = "TRISTES"
         IF A = 29 THEN TRAN$ = "FELICES"
         IF A = 30 THEN TRAN$ = "ALEGRES"
         IF A = 31 THEN TRAN$ = "CONTENTOS"
         IF A = 32 THEN TRAN$ = "BLANCOS"
         IF A = 33 THEN TRAN$ = "AMARILLOS"
         IF A = 34 THEN TRAN$ = "AZULES"
         IF A = 35 THEN TRAN$ = "ROJOS"
         IF A = 36 THEN TRAN$ = "NARANJAS"
         IF A = 37 THEN TRAN$ = "VERDES"
         IF A = 38 THEN TRAN$ = "VIOLETAS"
         IF A = 39 THEN TRAN$ = "BLANCUZCOS"
         IF A = 40 THEN TRAN$ = "NEGROS"
         IF A = 41 THEN TRAN$ = "AMARILLENTOS"
         IF A = 42 THEN TRAN$ = "AZULADOS"
         IF A = 43 THEN TRAN$ = "ROJIZOS"
         IF A = 44 THEN TRAN$ = "ANARANJADOS"
         IF A = 45 THEN TRAN$ = "VIOLACEOS"
         IF A = 46 THEN TRAN$ = "NEGRUZCOS"
         IF A = 47 THEN TRAN$ = "MARRONES"
         IF A = 48 THEN TRAN$ = "AMARRONADOS"
         IF A = 49 THEN TRAN$ = "VIVOS"
         IF A = 50 THEN TRAN$ = "MUERTOS"
         IF A = 51 THEN TRAN$ = "VIVIDOS"
         IF A = 52 THEN TRAN$ = "MORIBUNDOS"
         IF A = 53 THEN TRAN$ = "GRAVES"
         IF A = 54 THEN TRAN$ = "LENTOS"
         IF A = 55 THEN TRAN$ = "SEVEROS"
         IF A = 56 THEN TRAN$ = "MAGICOS"
         IF A = 57 THEN TRAN$ = "HOMERICOS"
         IF A = 58 THEN TRAN$ = "LIGEROS"
         IF A = 59 THEN TRAN$ = "ARMADOS"
         IF A = 60 THEN TRAN$ = "POSTREROS"
         IF A = 61 THEN TRAN$ = "OBLICUOS"
         IF A = 62 THEN TRAN$ = "AGRESORES"
         IF A = 63 THEN TRAN$ = "INFINITOS"
         IF A = 64 THEN TRAN$ = "TENUES"
         IF A = 65 THEN TRAN$ = "SESGOS"
         IF A = 66 THEN TRAN$ = "ENCARNIZADOS"
         IF A = 67 THEN TRAN$ = "DIRECTOS"
         IF A = 68 THEN TRAN$ = "LADINOS"
         IF A = 69 THEN TRAN$ = "MORIBUNDOS"
         IF A = 70 THEN TRAN$ = "ARMADOS"
         IF A = 71 THEN TRAN$ = "SE¤ALADOS"
         IF A = 72 THEN TRAN$ = "ADAMANTINOS"
         IF A = 73 THEN TRAN$ = "PRISIONEROS"
       CASE 2
         A = INT(RND * 73) + 1
         IF A = 1 THEN TRAN$ = "ALTAS"
         IF A = 2 THEN TRAN$ = "BAJAS"
         IF A = 3 THEN TRAN$ = "GORDAS"
         IF A = 4 THEN TRAN$ = "FLACAS"
         IF A = 5 THEN TRAN$ = "LINDAS"
         IF A = 6 THEN TRAN$ = "FEAS"
         IF A = 7 THEN TRAN$ = "INTELIGENTES"
         IF A = 8 THEN TRAN$ = "TONTAS"
         IF A = 9 THEN TRAN$ = "MAJESTUOSAS"
         IF A = 10 THEN TRAN$ = "GRANDIOSAS"
         IF A = 11 THEN TRAN$ = "INSPIRANTES"
         IF A = 12 THEN TRAN$ = "ASOMBROSAS"
         IF A = 13 THEN TRAN$ = "TEMIBLES"
         IF A = 14 THEN TRAN$ = "BUENAS"
         IF A = 15 THEN TRAN$ = "MALAS"
         IF A = 16 THEN TRAN$ = "MALIGNAS"
         IF A = 17 THEN TRAN$ = "MALDITAS"
         IF A = 18 THEN TRAN$ = "BENIGNAS"
         IF A = 19 THEN TRAN$ = "BENDITAS"
         IF A = 20 THEN TRAN$ = "SACRAS"
         IF A = 21 THEN TRAN$ = "ESPIRITUALES"
         IF A = 22 THEN TRAN$ = "TERRENALES"
         IF A = 23 THEN TRAN$ = "DESPAMPANANTES"
         IF A = 24 THEN TRAN$ = "RAPIDAS"
         IF A = 25 THEN TRAN$ = "RABIOSAS"
         IF A = 26 THEN TRAN$ = "IRACUNDAS"
         IF A = 27 THEN TRAN$ = "ENOJADAS"
         IF A = 28 THEN TRAN$ = "TRISTES"
         IF A = 29 THEN TRAN$ = "FELICES"
         IF A = 30 THEN TRAN$ = "ALEGRES"
         IF A = 31 THEN TRAN$ = "CONTENTAS"
         IF A = 32 THEN TRAN$ = "BLANCAS"
         IF A = 33 THEN TRAN$ = "AMARILLAS"
         IF A = 34 THEN TRAN$ = "AZULES"
         IF A = 35 THEN TRAN$ = "ROJAS"
         IF A = 36 THEN TRAN$ = "NARANJAS"
         IF A = 37 THEN TRAN$ = "VERDES"
         IF A = 38 THEN TRAN$ = "VIOLETAS"
         IF A = 39 THEN TRAN$ = "BLANCUZCAS"
         IF A = 40 THEN TRAN$ = "NEGRAS"
         IF A = 41 THEN TRAN$ = "AMARILLENTAS"
         IF A = 42 THEN TRAN$ = "AZULADAS"
         IF A = 43 THEN TRAN$ = "ROJIZAS"
         IF A = 44 THEN TRAN$ = "ANARANJADAS"
         IF A = 45 THEN TRAN$ = "VIOLACEAS"
         IF A = 46 THEN TRAN$ = "NEGRUZCAS"
         IF A = 47 THEN TRAN$ = "MARRONES"
         IF A = 48 THEN TRAN$ = "AMARRONADAS"
         IF A = 49 THEN TRAN$ = "VIVAS"
         IF A = 50 THEN TRAN$ = "MUERTAS"
         IF A = 51 THEN TRAN$ = "VIVIDAS"
         IF A = 52 THEN TRAN$ = "MORIBUNDAS"
         IF A = 53 THEN TRAN$ = "GRAVES"
         IF A = 54 THEN TRAN$ = "LENTAS"
         IF A = 55 THEN TRAN$ = "SEVERAS"
         IF A = 56 THEN TRAN$ = "MAGICAS"
         IF A = 57 THEN TRAN$ = "HOMERICAS"
         IF A = 58 THEN TRAN$ = "LIGERAS"
         IF A = 59 THEN TRAN$ = "ARMADAS"
         IF A = 60 THEN TRAN$ = "POSTRERAS"
         IF A = 61 THEN TRAN$ = "OBLICUAS"
         IF A = 62 THEN TRAN$ = "AGRESORAS"
         IF A = 63 THEN TRAN$ = "INFINITAS"
         IF A = 64 THEN TRAN$ = "TENUES"
         IF A = 65 THEN TRAN$ = "SESGAS"
         IF A = 66 THEN TRAN$ = "ENCARNIZADAS"
         IF A = 67 THEN TRAN$ = "DIRECTAS"
         IF A = 68 THEN TRAN$ = "LADINAS"
         IF A = 69 THEN TRAN$ = "MORIBUNDAS"
         IF A = 70 THEN TRAN$ = "ARMADAS"
         IF A = 71 THEN TRAN$ = "SE¤ALADAS"
         IF A = 72 THEN TRAN$ = "ADAMANTINAS"
         IF A = 73 THEN TRAN$ = "PRISIONERAS"
     END SELECT
 END SELECT
 TRAN$ = TRAN$ + " "
 ADJE$ = TRAN$
END FUNCTION

FUNCTION ADVE$
 A = INT(RND * 14) + 1
 IF A = 1 THEN TRAN$ = "BIEN"
 IF A = 2 THEN TRAN$ = "MAL"
 IF A = 3 THEN TRAN$ = "SUAVEMENTE"
 IF A = 4 THEN TRAN$ = "RAPIDAMENTE"
 IF A = 5 THEN TRAN$ = "LENTAMENTE"
 IF A = 6 THEN TRAN$ = "TONTAMENTE"
 IF A = 7 THEN TRAN$ = "INTELIGENTEMENTE"
 IF A = 8 THEN TRAN$ = "FACILMENTE"
 IF A = 9 THEN TRAN$ = "DIFICILMENTE"
 IF A = 10 THEN TRAN$ = "TIERNAMENTE"
 IF A = 11 THEN TRAN$ = "BRUTALMENTE"
 IF A = 12 THEN TRAN$ = "CALIDAMENTE"
 IF A = 13 THEN TRAN$ = "FRIAMENTE"
 IF A = 14 THEN TRAN$ = "VELOZMENTE"

 TRAN$ = TRAN$ + " "
 ADVE$ = TRAN$
END FUNCTION

FUNCTION ART$ (PERSONA, GENERO)
 SELECT CASE PERSONA
  CASE IS <= 3
    SELECT CASE GENERO
     CASE 1
       A = INT(RND * 3) + 1
       IF A = 1 THEN TRAN$ = "EL"
       IF A = 2 THEN TRAN$ = "UN"
       IF A = 3 THEN TRAN$ = "OTRO"
     CASE 2
       A = INT(RND * 3) + 1
       IF A = 1 THEN TRAN$ = "LA"
       IF A = 2 THEN TRAN$ = "UNA"
       IF A = 3 THEN TRAN$ = "OTRA"
    END SELECT
  CASE IS <= 6
    SELECT CASE GENERO
     CASE 1
       A = INT(RND * 3) + 1
       IF A = 1 THEN TRAN$ = "LOS"
       IF A = 2 THEN TRAN$ = "UNOS"
       IF A = 3 THEN TRAN$ = "OTROS"
     CASE 2
       A = INT(RND * 3) + 1
       IF A = 1 THEN TRAN$ = "LAS"
       IF A = 2 THEN TRAN$ = "UNAS"
       IF A = 3 THEN TRAN$ = "OTRAS"
    END SELECT
 END SELECT
 TRAN$ = TRAN$ + " "
 ART$ = TRAN$
END FUNCTION

FUNCTION BUENA$ (TEXTO$)
 TRAN$ = LTRIM$(RTRIM$(TEXTO$))
 TRAN$ = UCASE$(LEFT$(TRAN$, 1)) + LCASE$(MID$(TRAN$, 2, LEN(TRAN$) - 1))
 BUENA$ = TRAN$
END FUNCTION

FUNCTION CONJUGA$ (XVERBO$, TIEMPO, PERSONA)
 XVERBO$ = UCASE$(LTRIM$(RTRIM$(XVERBO$)))
 IF RIGHT$(XVERBO$, 2) = "AR" THEN CONJ = 1
 IF RIGHT$(XVERBO$, 2) = "ER" THEN CONJ = 2
 IF RIGHT$(XVERBO$, 2) = "IR" THEN CONJ = 3
 TRAN$ = LEFT$(XVERBO$, LEN(XVERBO$) - 2)
 SELECT CASE CONJ
   CASE 1
     SELECT CASE TIEMPO
       CASE 1                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "O"
           CASE 2
             TRAN$ = TRAN$ + "AS"
           CASE 3
             TRAN$ = TRAN$ + "A"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + " IS"
           CASE 6
             TRAN$ = TRAN$ + "AN"
          END SELECT
        CASE 2                 
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "ABA"
           CASE 2
             TRAN$ = TRAN$ + "ABAS"
           CASE 3
             TRAN$ = TRAN$ + "ABA"
           CASE 4
             TRAN$ = TRAN$ + "ABAMOS"
           CASE 5
             TRAN$ = TRAN$ + "ABAIS"
           CASE 6
             TRAN$ = TRAN$ + "ABAN"
          END SELECT
        CASE 3                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "E"
           CASE 2
             TRAN$ = TRAN$ + "ASTE"
           CASE 3
             TRAN$ = TRAN$ + "O"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + "ASTEIS"
           CASE 6
             TRAN$ = TRAN$ + "ARON"
         END SELECT
        CASE 4                       
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "AR‚"
           CASE 2
             TRAN$ = TRAN$ + "AR S"
           CASE 3
             TRAN$ = TRAN$ + "AR "
           CASE 4
             TRAN$ = TRAN$ + "AREMOS"
           CASE 5
             TRAN$ = TRAN$ + "AR‚IS"
           CASE 6
             TRAN$ = TRAN$ + "AR N"
         END SELECT
        CASE 5                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "AR¡A"
           CASE 2
             TRAN$ = TRAN$ + "AR¡AS"
           CASE 3
             TRAN$ = TRAN$ + "AR¡A"
           CASE 4
             TRAN$ = TRAN$ + "AR¡AMOS"
           CASE 5
             TRAN$ = TRAN$ + "AR¡AIS"
           CASE 6
             TRAN$ = TRAN$ + "AR¡AN"
         END SELECT
        CASE 6                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HE " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HAS " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HA " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HEMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HAB‚IS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HAN " + TRAN$ + "ADO"
         END SELECT
        CASE 7                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAB¡A " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HAB¡AS " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HAB¡A " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HAB¡AMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HAB¡AIS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HAB¡AN " + TRAN$ + "ADO"
         END SELECT
        CASE 8                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBE " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HUBISTE " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HUBO " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HUBIMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HUBISTEIS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HUBIERON " + TRAN$ + "ADO"
         END SELECT
        CASE 9                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HABR‚ " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HABR S " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HABR  " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HABREMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HABR‚IS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HABR N " + TRAN$ + "ADO"
         END SELECT
        CASE 10                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "E"
           CASE 2
             TRAN$ = TRAN$ + "ES"
           CASE 3
             TRAN$ = TRAN$ + "E"
           CASE 4
             TRAN$ = TRAN$ + "EMOS"
           CASE 5
             TRAN$ = TRAN$ + "‚IS"
           CASE 6
             TRAN$ = TRAN$ + "EN"
         END SELECT
        CASE 11                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "ARA"
             ELSE
               TRAN$ = TRAN$ + "ASE"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "ARAS"
             ELSE
               TRAN$ = TRAN$ + "ASES"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "ARA"
             ELSE
               TRAN$ = TRAN$ + "ASE"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + " RAMOS"
             ELSE
               TRAN$ = TRAN$ + " SEMOS"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + " RAIS"
             ELSE
               TRAN$ = TRAN$ + " SEIS"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "ARAN"
             ELSE
               TRAN$ = TRAN$ + "ASEN"
             END IF
         END SELECT
        CASE 12                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "ARE"
           CASE 2
             TRAN$ = TRAN$ + "ARES"
           CASE 3
             TRAN$ = TRAN$ + "ARE"
           CASE 4
             TRAN$ = TRAN$ + "AREMOS"
           CASE 5
             TRAN$ = TRAN$ + "AREIS"
           CASE 6
             TRAN$ = TRAN$ + "AREN"
         END SELECT
        CASE 13                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAYA " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HAYAS " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HAYA " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HAYAMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HAY IS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HAYAN " + TRAN$ + "ADO"
         END SELECT
        CASE 14                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "ADO"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAS " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBIESES " + TRAN$ + "ADO"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "ADO"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAMOS " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBI‚SEMOS " + TRAN$ + "ADO"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAIS " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBI‚SEIS " + TRAN$ + "ADO"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAN " + TRAN$ + "ADO"
             ELSE
               TRAN$ = "HUBIESEN " + TRAN$ + "ADO"
             END IF
         END SELECT
        CASE 15                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBIERE " + TRAN$ + "ADO"
           CASE 2
             TRAN$ = "HUBIERES " + TRAN$ + "ADO"
           CASE 3
             TRAN$ = "HUBIERE " + TRAN$ + "ADO"
           CASE 4
             TRAN$ = "HUBI‚REMOS " + TRAN$ + "ADO"
           CASE 5
             TRAN$ = "HUBIEREIS " + TRAN$ + "ADO"
           CASE 6
             TRAN$ = "HUBIEREN " + TRAN$ + "ADO"
         END SELECT
        CASE 16                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "E"
           CASE 2
             TRAN$ = TRAN$ + "A"
           CASE 3
             TRAN$ = TRAN$ + "E"
           CASE 4
             TRAN$ = TRAN$ + "EMOS"
           CASE 5
             TRAN$ = TRAN$ + "AD"
           CASE 6
             TRAN$ = TRAN$ + "EN"
         END SELECT

     END SELECT
   
   CASE 2
     SELECT CASE TIEMPO
       CASE 1                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "O"
           CASE 2
             TRAN$ = TRAN$ + "ES"
           CASE 3
             TRAN$ = TRAN$ + "E"
           CASE 4
             TRAN$ = TRAN$ + "EMOS"
           CASE 5
             TRAN$ = TRAN$ + "‚IS"
           CASE 6
             TRAN$ = TRAN$ + "EN"
          END SELECT
        CASE 2                 
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "¡A"
           CASE 2
             TRAN$ = TRAN$ + "¡AS"
           CASE 3
             TRAN$ = TRAN$ + "¡A"
           CASE 4
             TRAN$ = TRAN$ + "¡AMOS"
           CASE 5
             TRAN$ = TRAN$ + "¡AIS"
           CASE 6
             TRAN$ = TRAN$ + "¡AN"
          END SELECT
        CASE 3                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "¡"
           CASE 2
             TRAN$ = TRAN$ + "ISTE"
           CASE 3
             TRAN$ = TRAN$ + "I¢"
           CASE 4
             TRAN$ = TRAN$ + "IMOS"
           CASE 5
             TRAN$ = TRAN$ + "ISTEIS"
           CASE 6
             TRAN$ = TRAN$ + "IERON"
         END SELECT
        CASE 4                       
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "ER‚"
           CASE 2
             TRAN$ = TRAN$ + "ER S"
           CASE 3
             TRAN$ = TRAN$ + "ER "
           CASE 4
             TRAN$ = TRAN$ + "EREMOS"
           CASE 5
             TRAN$ = TRAN$ + "ER‚IS"
           CASE 6
             TRAN$ = TRAN$ + "ER N"
         END SELECT
        CASE 5                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "ER¡A"
           CASE 2
             TRAN$ = TRAN$ + "ER¡AS"
           CASE 3
             TRAN$ = TRAN$ + "ER¡A"
           CASE 4
             TRAN$ = TRAN$ + "ER¡AMOS"
           CASE 5
             TRAN$ = TRAN$ + "ER¡AIS"
           CASE 6
             TRAN$ = TRAN$ + "ER¡AN"
         END SELECT
        CASE 6                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HA " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HEMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAB‚IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAN " + TRAN$ + "IDO"
         END SELECT
        CASE 7                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAB¡A " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAB¡AS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HAB¡A " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HAB¡AMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAB¡AIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAB¡AN " + TRAN$ + "IDO"
         END SELECT
        CASE 8                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HUBISTE " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HUBO " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HUBIMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HUBISTEIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HUBIERON " + TRAN$ + "IDO"
         END SELECT
        CASE 9                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HABR‚ " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HABR S " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HABR  " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HABREMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HABR‚IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HABR N " + TRAN$ + "IDO"
         END SELECT
        CASE 10                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "A"
           CASE 2
             TRAN$ = TRAN$ + "AS"
           CASE 3
             TRAN$ = TRAN$ + "A"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + " IS"
           CASE 6
             TRAN$ = TRAN$ + "AN"
         END SELECT
        CASE 11                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERA"
             ELSE
               TRAN$ = TRAN$ + "IESE"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERAS"
             ELSE
               TRAN$ = TRAN$ + "IESES"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERA"
             ELSE
               TRAN$ = TRAN$ + "IESE"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "I‚RAMOS "
             ELSE
               TRAN$ = TRAN$ + "I‚SEMOS"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "I‚RAIS"
             ELSE
               TRAN$ = TRAN$ + "I‚SEIS"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERAN"
             ELSE
               TRAN$ = TRAN$ + "IESEN"
             END IF
         END SELECT
        CASE 12                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "IERE"
           CASE 2
             TRAN$ = TRAN$ + "IERES"
           CASE 3
             TRAN$ = TRAN$ + "IERE"
           CASE 4
             TRAN$ = TRAN$ + "IEREMOS"
           CASE 5
             TRAN$ = TRAN$ + "IEREIS"
           CASE 6
             TRAN$ = TRAN$ + "IEREN"
         END SELECT
        CASE 13                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAYA " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAYAS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HAYA " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HAYAMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAY IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAYAN " + TRAN$ + "IDO"
         END SELECT
        CASE 14                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "IDO"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESES " + TRAN$ + "IDO"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "IDO"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAMOS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBI‚SEMOS " + TRAN$ + "IDO"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAIS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBI‚SEIS " + TRAN$ + "IDO"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAN " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESEN " + TRAN$ + "IDO"
             END IF
         END SELECT
        CASE 15                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBIERE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HUBIERES " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HUBIERE " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HUBI‚REMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HUBIEREIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HUBIEREN " + TRAN$ + "IDO"
         END SELECT
        CASE 16                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "A"
           CASE 2
             TRAN$ = TRAN$ + "E"
           CASE 3
             TRAN$ = TRAN$ + "A"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + "ED"
           CASE 6
             TRAN$ = TRAN$ + "AN"
         END SELECT
     END SELECT
  
   
   CASE 3
     SELECT CASE TIEMPO
       CASE 1                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "¡A"
           CASE 2
             TRAN$ = TRAN$ + "¡AS"
           CASE 3
             TRAN$ = TRAN$ + "¡A"
           CASE 4
             TRAN$ = TRAN$ + "¡AMOS"
           CASE 5
             TRAN$ = TRAN$ + "¡AIS"
           CASE 6
             TRAN$ = TRAN$ + "¡AN"
          END SELECT
        CASE 3                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "¡"
           CASE 2
             TRAN$ = TRAN$ + "ISTE"
           CASE 3
             TRAN$ = TRAN$ + "I¢"
           CASE 4
             TRAN$ = TRAN$ + "IMOS"
           CASE 5
             TRAN$ = TRAN$ + "ISTEIS"
           CASE 6
             TRAN$ = TRAN$ + "IERON"
         END SELECT
        CASE 4                       
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "IR‚"
           CASE 2
             TRAN$ = TRAN$ + "IR S"
           CASE 3
             TRAN$ = TRAN$ + "IR "
           CASE 4
             TRAN$ = TRAN$ + "IREMOS"
           CASE 5
             TRAN$ = TRAN$ + "IR‚IS"
           CASE 6
             TRAN$ = TRAN$ + "IR N"
         END SELECT
        CASE 5                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "IR¡A"
           CASE 2
             TRAN$ = TRAN$ + "IR¡AS"
           CASE 3
             TRAN$ = TRAN$ + "IR¡A"
           CASE 4
             TRAN$ = TRAN$ + "IR¡AMOS"
           CASE 5
             TRAN$ = TRAN$ + "IR¡AIS"
           CASE 6
             TRAN$ = TRAN$ + "IR¡AN"
         END SELECT
        CASE 6                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HA " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HEMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAB‚IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAN " + TRAN$ + "IDO"
         END SELECT
        CASE 7                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAB¡A " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAB¡AS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HAB¡A " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HAB¡AMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAB¡AIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAB¡AN " + TRAN$ + "IDO"
         END SELECT
        CASE 8                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HUBISTE " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HUBO " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HUBIMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HUBISTEIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HUBIERON " + TRAN$ + "IDO"
         END SELECT
        CASE 9                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HABR‚ " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HABR S " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HABR  " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HABREMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HABR‚IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HABR N " + TRAN$ + "IDO"
         END SELECT
        CASE 10                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "A"
           CASE 2
             TRAN$ = TRAN$ + "AS"
           CASE 3
             TRAN$ = TRAN$ + "A"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + " IS"
           CASE 6
             TRAN$ = TRAN$ + "AN"
         END SELECT
        CASE 11                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERA"
             ELSE
               TRAN$ = TRAN$ + "IESE"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERAS"
             ELSE
               TRAN$ = TRAN$ + "IESES"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERA"
             ELSE
               TRAN$ = TRAN$ + "IESE"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "I‚RAMOS"
             ELSE
               TRAN$ = TRAN$ + "I‚SEMOS"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "I‚RAIS"
             ELSE
               TRAN$ = TRAN$ + "I‚SEIS"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = TRAN$ + "IERAN"
             ELSE
               TRAN$ = TRAN$ + "IESEN"
             END IF
         END SELECT
        CASE 12                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "IERE"
           CASE 2
             TRAN$ = TRAN$ + "IERES"
           CASE 3
             TRAN$ = TRAN$ + "IERE"
           CASE 4
             TRAN$ = TRAN$ + "IEREMOS"
           CASE 5
             TRAN$ = TRAN$ + "IEREIS"
           CASE 6
             TRAN$ = TRAN$ + "IEREN"
         END SELECT
        CASE 13                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HAYA " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HAYAS " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HAYA " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HAYAMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HAY IS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HAYAN " + TRAN$ + "IDO"
         END SELECT
        CASE 14                     
         SELECT CASE PERSONA
           CASE 1
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "IDO"
             END IF
           CASE 2
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESES " + TRAN$ + "IDO"
             END IF
           CASE 3
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERA " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESE " + TRAN$ + "IDO"
             END IF
           CASE 4
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAMOS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBI‚SEMOS " + TRAN$ + "IDO"
             END IF
           CASE 5
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBI‚RAIS " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBI‚SEIS " + TRAN$ + "IDO"
             END IF
           CASE 6
             IF INT(RND * 2) + 1 = 1 THEN
               TRAN$ = "HUBIERAN " + TRAN$ + "IDO"
             ELSE
               TRAN$ = "HUBIESEN " + TRAN$ + "IDO"
             END IF
         END SELECT
        CASE 15                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = "HUBIERE " + TRAN$ + "IDO"
           CASE 2
             TRAN$ = "HUBIERES " + TRAN$ + "IDO"
           CASE 3
             TRAN$ = "HUBIERE " + TRAN$ + "IDO"
           CASE 4
             TRAN$ = "HUBI‚REMOS " + TRAN$ + "IDO"
           CASE 5
             TRAN$ = "HUBIEREIS " + TRAN$ + "IDO"
           CASE 6
             TRAN$ = "HUBIEREN " + TRAN$ + "IDO"
         END SELECT
        CASE 16                     
         SELECT CASE PERSONA
           CASE 1
             TRAN$ = TRAN$ + "A"
           CASE 2
             TRAN$ = TRAN$ + "E"
           CASE 3
             TRAN$ = TRAN$ + "A"
           CASE 4
             TRAN$ = TRAN$ + "AMOS"
           CASE 5
             TRAN$ = TRAN$ + "ID"
           CASE 6
             TRAN$ = TRAN$ + "AN"
         END SELECT
     END SELECT
 END SELECT
 TRAN$ = TRAN$ + " "
 CONJUGA$ = TRAN$
END FUNCTION

FUNCTION SUSTA$ (PERSONA, GENERO)
 SELECT CASE PERSONA
   CASE 1
     TRAN$ = "YO"
   CASE 2
     TRAN$ = "TU"
   CASE 3
     SELECT CASE GENERO
       CASE 1
         A = INT(RND * 104) + 1
         IF A = 1 THEN TRAN$ = "PERRO"
         IF A = 2 THEN TRAN$ = "ANIMAL"
         IF A = 3 THEN TRAN$ = "GATO"
         IF A = 4 THEN TRAN$ = "ESCARABAJO"
         IF A = 5 THEN TRAN$ = "ARACNIDO"
         IF A = 6 THEN TRAN$ = "ELEFANTE"
         IF A = 7 THEN TRAN$ = "BURRO"
         IF A = 8 THEN TRAN$ = "CABALLO"
         IF A = 9 THEN TRAN$ = "BUHO"
         IF A = 10 THEN TRAN$ = "LIBRO"
         IF A = 11 THEN TRAN$ = "PAPEL"
         IF A = 12 THEN TRAN$ = "PELO"
         IF A = 13 THEN TRAN$ = "HOMBRE"
         IF A = 14 THEN TRAN$ = "SER HUMANO"
         IF A = 15 THEN TRAN$ = "NI¤O"
         IF A = 16 THEN TRAN$ = "JOVEN"
         IF A = 17 THEN TRAN$ = "CHICO"
         IF A = 18 THEN TRAN$ = "SUE¤O"
         IF A = 19 THEN TRAN$ = "ALIMENTO"
         IF A = 20 THEN TRAN$ = "ENOJO"
         IF A = 21 THEN TRAN$ = "JUEGO"
         IF A = 22 THEN TRAN$ = "JUGUETE"
         IF A = 23 THEN TRAN$ = "PIE"
         IF A = 24 THEN TRAN$ = "CUERPO"
         IF A = 25 THEN TRAN$ = "ORGANISMO"
         IF A = 26 THEN TRAN$ = "BAILE"
         IF A = 27 THEN TRAN$ = "ENCUENTRO"
         IF A = 28 THEN TRAN$ = "PERNO"
         IF A = 29 THEN TRAN$ = "CUERNO"
         IF A = 30 THEN TRAN$ = "TA¤IDO"
         IF A = 31 THEN TRAN$ = "ELEMENTO"
         IF A = 32 THEN TRAN$ = "OBJETO"
         IF A = 33 THEN TRAN$ = "MUERTO"
         IF A = 34 THEN TRAN$ = "LUCHADOR"
         IF A = 35 THEN TRAN$ = "COMBATIENTE"
         IF A = 36 THEN TRAN$ = "ESCUDO"
         IF A = 37 THEN TRAN$ = "RIO"
         IF A = 38 THEN TRAN$ = "ARPON"
         IF A = 39 THEN TRAN$ = "ANZUELO"
         IF A = 40 THEN TRAN$ = "PEZ"
         IF A = 41 THEN TRAN$ = "VUELO"
         IF A = 42 THEN TRAN$ = "TREN"
         IF A = 43 THEN TRAN$ = "AUTOMOVIL"
         IF A = 44 THEN TRAN$ = "AUTO"
         IF A = 45 THEN TRAN$ = "GUERRERO"
         IF A = 46 THEN TRAN$ = "PAIS"
         IF A = 47 THEN TRAN$ = "DUE¤O"
         IF A = 48 THEN TRAN$ = "TERRENO"
         IF A = 49 THEN TRAN$ = "BIGOTE"
         IF A = 50 THEN TRAN$ = "OJO"
         IF A = 51 THEN TRAN$ = "AGUJERO"
         IF A = 52 THEN TRAN$ = "HOYO"
         IF A = 53 THEN TRAN$ = "PALO"
         IF A = 54 THEN TRAN$ = "BOTE"
         IF A = 55 THEN TRAN$ = "BARCO"
         IF A = 56 THEN TRAN$ = "REMO"
         IF A = 57 THEN TRAN$ = "REMERO"
         IF A = 58 THEN TRAN$ = "FABRICANTE"
         IF A = 59 THEN TRAN$ = "DESTRUCTOR"
         IF A = 60 THEN TRAN$ = "CONSTRUCTOR"
         IF A = 61 THEN TRAN$ = "RELOJ"
         IF A = 62 THEN TRAN$ = "TIEMPO"
         IF A = 63 THEN TRAN$ = "TORNILLO"
         IF A = 64 THEN TRAN$ = "TRATO"
         IF A = 65 THEN TRAN$ = "TRATADO"
         IF A = 66 THEN TRAN$ = "ACUERDO"
         IF A = 67 THEN TRAN$ = "ZAPATERO"
         IF A = 68 THEN TRAN$ = "ZAPATO"
         IF A = 69 THEN TRAN$ = "ROPAJE"
         IF A = 70 THEN TRAN$ = "PELAJE"
         IF A = 71 THEN TRAN$ = "DINERO"
         IF A = 72 THEN TRAN$ = "BILLETE"
         IF A = 73 THEN TRAN$ = "ASIENTO"
         IF A = 74 THEN TRAN$ = "NI¤ERO"
         IF A = 75 THEN TRAN$ = "APARADOR"
         IF A = 76 THEN TRAN$ = "ARMARIO"
         IF A = 77 THEN TRAN$ = "DEPARTAMENTO"
         IF A = 78 THEN TRAN$ = "MUEBLE"
         IF A = 79 THEN TRAN$ = "SILLON"
         IF A = 80 THEN TRAN$ = "TECLADO"
         IF A = 81 THEN TRAN$ = "MONITOR"
         IF A = 82 THEN TRAN$ = "PASTOR"
         IF A = 83 THEN TRAN$ = "TORO"
         IF A = 84 THEN TRAN$ = "REY"
         IF A = 85 THEN TRAN$ = "EMPERADOR"
         IF A = 86 THEN TRAN$ = "JUGADOR"
         IF A = 87 THEN TRAN$ = "TABLERO"
         IF A = 88 THEN TRAN$ = "AMBITO"
         IF A = 89 THEN TRAN$ = "COLOR"
         IF A = 90 THEN TRAN$ = "RIGOR"
         IF A = 91 THEN TRAN$ = "CABALLO"
         IF A = 92 THEN TRAN$ = "REY"
         IF A = 93 THEN TRAN$ = "ALFIL"
         IF A = 94 THEN TRAN$ = "PEON"
         IF A = 95 THEN TRAN$ = "TIEMPO"
         IF A = 96 THEN TRAN$ = "RITO"
         IF A = 97 THEN TRAN$ = "ORIENTE"
         IF A = 98 THEN TRAN$ = "OCCIDENTE"
         IF A = 99 THEN TRAN$ = "ANFITEATRO"
         IF A = 100 THEN TRAN$ = "JUEGO"
         IF A = 101 THEN TRAN$ = "DIA"
         IF A = 102 THEN TRAN$ = "DIOS"
         IF A = 103 THEN TRAN$ = "RINCON"
         IF A = 104 THEN TRAN$ = "ALBEDRIO"
       CASE 2
         A = INT(RND * 96) + 1
         IF A = 1 THEN TRAN$ = "PERRA"
         IF A = 2 THEN TRAN$ = "LUZ"
         IF A = 3 THEN TRAN$ = "GATA"
         IF A = 4 THEN TRAN$ = "JIRAFA"
         IF A = 5 THEN TRAN$ = "ARA¤A"
         IF A = 6 THEN TRAN$ = "REINA"
         IF A = 7 THEN TRAN$ = "EMPERATRIZ"
         IF A = 8 THEN TRAN$ = "YEGUA"
         IF A = 9 THEN TRAN$ = "REINA"
         IF A = 10 THEN TRAN$ = "LECHUZA"
         IF A = 11 THEN TRAN$ = "PAPELERA"
         IF A = 12 THEN TRAN$ = "PELAMBRE"
         IF A = 13 THEN TRAN$ = "MUJER"
         IF A = 14 THEN TRAN$ = "CONDESA"
         IF A = 15 THEN TRAN$ = "NI¤A"
         IF A = 16 THEN TRAN$ = "JOVEN"
         IF A = 17 THEN TRAN$ = "CHICA"
         IF A = 18 THEN TRAN$ = "CAMA"
         IF A = 19 THEN TRAN$ = "ALIMENTACION"
         IF A = 20 THEN TRAN$ = "SE¤ORA"
         IF A = 21 THEN TRAN$ = "JUGADORA"
         IF A = 22 THEN TRAN$ = "PIEZA"
         IF A = 23 THEN TRAN$ = "PIERNA"
         IF A = 24 THEN TRAN$ = "MANO"
         IF A = 25 THEN TRAN$ = "PECHERA"
         IF A = 26 THEN TRAN$ = "BAILARINA"
         IF A = 27 THEN TRAN$ = "CORTEZA"
         IF A = 28 THEN TRAN$ = "EDAD"
         IF A = 29 THEN TRAN$ = "CHALUPA"
         IF A = 30 THEN TRAN$ = "CAMPANA"
         IF A = 31 THEN TRAN$ = "MONEDA"
         IF A = 32 THEN TRAN$ = "VIVIENDA"
         IF A = 33 THEN TRAN$ = "HABITACION"
         IF A = 34 THEN TRAN$ = "LUCHADORA"
         IF A = 35 THEN TRAN$ = "COMBATIENTE"
         IF A = 36 THEN TRAN$ = "ESPADA"
         IF A = 37 THEN TRAN$ = "LANZA"
         IF A = 38 THEN TRAN$ = "MAR"
         IF A = 39 THEN TRAN$ = "MUERTA"
         IF A = 40 THEN TRAN$ = "PECERA"
         IF A = 41 THEN TRAN$ = "MOSCA"
         IF A = 42 THEN TRAN$ = "VIA"
         IF A = 43 THEN TRAN$ = "RUTA"
         IF A = 44 THEN TRAN$ = "PUERTA"
         IF A = 45 THEN TRAN$ = "GUERRERA"
         IF A = 46 THEN TRAN$ = "NACION"
         IF A = 47 THEN TRAN$ = "REPUBLICA"
         IF A = 48 THEN TRAN$ = "DUE¤A"
         IF A = 49 THEN TRAN$ = "BARBA"
         IF A = 50 THEN TRAN$ = "OREJA"
         IF A = 51 THEN TRAN$ = "BOCA"
         IF A = 52 THEN TRAN$ = "NARIZ"
         IF A = 53 THEN TRAN$ = "MADERA"
         IF A = 54 THEN TRAN$ = "EMBARCACION"
         IF A = 55 THEN TRAN$ = "BARRA"
         IF A = 56 THEN TRAN$ = "ROPA"
         IF A = 57 THEN TRAN$ = "REMERA"
         IF A = 58 THEN TRAN$ = "EDIFICACION"
         IF A = 59 THEN TRAN$ = "DESTRUCTORA"
         IF A = 60 THEN TRAN$ = "CONSTRUCTORA"
         IF A = 61 THEN TRAN$ = "CLEPSIDRA"
         IF A = 62 THEN TRAN$ = "MIEL"
         IF A = 63 THEN TRAN$ = "CORTINA"
         IF A = 64 THEN TRAN$ = "TIERRA"
         IF A = 65 THEN TRAN$ = "DESCRIPCION"
         IF A = 66 THEN TRAN$ = "NAVE"
         IF A = 67 THEN TRAN$ = "ZAPATILLA"
         IF A = 68 THEN TRAN$ = "SOGA"
         IF A = 69 THEN TRAN$ = "CARGA"
         IF A = 70 THEN TRAN$ = "SOCIEDAD"
         IF A = 71 THEN TRAN$ = "CIVILIZACION"
         IF A = 72 THEN TRAN$ = "RAZA"
         IF A = 73 THEN TRAN$ = "SILLA"
         IF A = 74 THEN TRAN$ = "NI¤ERA"
         IF A = 75 THEN TRAN$ = "COMODA"
         IF A = 76 THEN TRAN$ = "PANTALLA"
         IF A = 77 THEN TRAN$ = "TRANSPIRACION"
         IF A = 78 THEN TRAN$ = "SONRISA"
         IF A = 79 THEN TRAN$ = "RISA"
         IF A = 80 THEN TRAN$ = "CARCAJADA"
         IF A = 81 THEN TRAN$ = "PLANTA"
         IF A = 82 THEN TRAN$ = "OVEJA"
         IF A = 83 THEN TRAN$ = "VACA"
         IF A = 84 THEN TRAN$ = "PIEZA"
         IF A = 85 THEN TRAN$ = "FORMA"
         IF A = 86 THEN TRAN$ = "TORRE"
         IF A = 87 THEN TRAN$ = "REINA"
         IF A = 88 THEN TRAN$ = "GUERRA"
         IF A = 89 THEN TRAN$ = "TIERRA"
         IF A = 90 THEN TRAN$ = "DAMA"
         IF A = 91 THEN TRAN$ = "BATALLA"
         IF A = 92 THEN TRAN$ = "MANO"
         IF A = 93 THEN TRAN$ = "JORNADA"
         IF A = 94 THEN TRAN$ = "NOCHE"
         IF A = 95 THEN TRAN$ = "TRAMA"
         IF A = 96 THEN TRAN$ = "AGONIA"
     END SELECT
    CASE 4
      IF GENERO = 1 THEN TRAN$ = "NOSOTROS"
      IF GENERO = 2 THEN TRAN$ = "NOSOTRAS"
    CASE 5
      IF GENERO = 1 THEN TRAN$ = "VOSOTROS"
      IF GENERO = 2 THEN TRAN$ = "VOSOTRAS"
    CASE 6
     SELECT CASE GENERO
       CASE 1
         A = INT(RND * 104) + 1
         IF A = 1 THEN TRAN$ = "PERROS"
         IF A = 2 THEN TRAN$ = "ANIMALES"
         IF A = 3 THEN TRAN$ = "GATOS"
         IF A = 4 THEN TRAN$ = "ESCARABAJOS"
         IF A = 5 THEN TRAN$ = "ARACNIDOS"
         IF A = 6 THEN TRAN$ = "ELEFANTES"
         IF A = 7 THEN TRAN$ = "BURROS"
         IF A = 8 THEN TRAN$ = "CABALLOS"
         IF A = 9 THEN TRAN$ = "BUHOS"
         IF A = 10 THEN TRAN$ = "LIBROS"
         IF A = 11 THEN TRAN$ = "PAPELES"
         IF A = 12 THEN TRAN$ = "PELOS"
         IF A = 13 THEN TRAN$ = "HOMBRES"
         IF A = 14 THEN TRAN$ = "SERES HUMANOS"
         IF A = 15 THEN TRAN$ = "NI¤OS"
         IF A = 16 THEN TRAN$ = "JOVENES"
         IF A = 17 THEN TRAN$ = "CHICOS"
         IF A = 18 THEN TRAN$ = "SUE¤OS"
         IF A = 19 THEN TRAN$ = "ALIMENTOS"
         IF A = 20 THEN TRAN$ = "ENOJOS"
         IF A = 21 THEN TRAN$ = "JUEGOS"
         IF A = 22 THEN TRAN$ = "JUGUETES"
         IF A = 23 THEN TRAN$ = "PIES"
         IF A = 24 THEN TRAN$ = "CUERPOS"
         IF A = 25 THEN TRAN$ = "ORGANISMOS"
         IF A = 26 THEN TRAN$ = "BAILES"
         IF A = 27 THEN TRAN$ = "ENCUENTROS"
         IF A = 28 THEN TRAN$ = "PERNOS"
         IF A = 29 THEN TRAN$ = "CUERNOS"
         IF A = 30 THEN TRAN$ = "TA¤IDOS"
         IF A = 31 THEN TRAN$ = "ELEMENTOS"
         IF A = 32 THEN TRAN$ = "OBJETOS"
         IF A = 33 THEN TRAN$ = "MUERTOS"
         IF A = 34 THEN TRAN$ = "LUCHADORES"
         IF A = 35 THEN TRAN$ = "COMBATIENTES"
         IF A = 36 THEN TRAN$ = "ESCUDOS"
         IF A = 37 THEN TRAN$ = "RIOS"
         IF A = 38 THEN TRAN$ = "ARPONES"
         IF A = 39 THEN TRAN$ = "ANZUELOS"
         IF A = 40 THEN TRAN$ = "PECES"
         IF A = 41 THEN TRAN$ = "VUELOS"
         IF A = 42 THEN TRAN$ = "TRENES"
         IF A = 43 THEN TRAN$ = "AUTOMOVILES"
         IF A = 44 THEN TRAN$ = "AUTOS"
         IF A = 45 THEN TRAN$ = "GUERREROS"
         IF A = 46 THEN TRAN$ = "PAISES"
         IF A = 47 THEN TRAN$ = "DUE¤OS"
         IF A = 48 THEN TRAN$ = "TERRENOS"
         IF A = 49 THEN TRAN$ = "BIGOTES"
         IF A = 50 THEN TRAN$ = "OJOS"
         IF A = 51 THEN TRAN$ = "AGUJEROS"
         IF A = 52 THEN TRAN$ = "HOYOS"
         IF A = 53 THEN TRAN$ = "PALOS"
         IF A = 54 THEN TRAN$ = "BOTES"
         IF A = 55 THEN TRAN$ = "BARCOS"
         IF A = 56 THEN TRAN$ = "REMOS"
         IF A = 57 THEN TRAN$ = "REMEROS"
         IF A = 58 THEN TRAN$ = "FABRICANTES"
         IF A = 59 THEN TRAN$ = "DESTRUCTORES"
         IF A = 60 THEN TRAN$ = "CONSTRUCTORES"
         IF A = 61 THEN TRAN$ = "RELOJES"
         IF A = 62 THEN TRAN$ = "TIEMPOS"
         IF A = 63 THEN TRAN$ = "TORNILLOS"
         IF A = 64 THEN TRAN$ = "TRATOS"
         IF A = 65 THEN TRAN$ = "TRATADOS"
         IF A = 66 THEN TRAN$ = "ACUERDOS"
         IF A = 67 THEN TRAN$ = "ZAPATEROS"
         IF A = 68 THEN TRAN$ = "ZAPATOS"
         IF A = 69 THEN TRAN$ = "ROPAJES"
         IF A = 70 THEN TRAN$ = "PELAJES"
         IF A = 71 THEN TRAN$ = "VITORES"
         IF A = 72 THEN TRAN$ = "BILLETES"
         IF A = 73 THEN TRAN$ = "ASIENTOS"
         IF A = 74 THEN TRAN$ = "NI¤EROS"
         IF A = 75 THEN TRAN$ = "APARADORES"
         IF A = 76 THEN TRAN$ = "ARMARIOS"
         IF A = 77 THEN TRAN$ = "DEPARTAMENTOS"
         IF A = 78 THEN TRAN$ = "MUEBLES"
         IF A = 79 THEN TRAN$ = "SILLONES"
         IF A = 80 THEN TRAN$ = "TECLADOS"
         IF A = 81 THEN TRAN$ = "MONITORES"
         IF A = 82 THEN TRAN$ = "PASTORES"
         IF A = 83 THEN TRAN$ = "TOROS"
         IF A = 84 THEN TRAN$ = "REYES"
         IF A = 85 THEN TRAN$ = "EMPERADORES"
         IF A = 86 THEN TRAN$ = "JUGADORES"
         IF A = 87 THEN TRAN$ = "TABLEROS"
         IF A = 88 THEN TRAN$ = "AMBITOS"
         IF A = 89 THEN TRAN$ = "COLORES"
         IF A = 90 THEN TRAN$ = "RIGORES"
         IF A = 91 THEN TRAN$ = "CABALLOS"
         IF A = 92 THEN TRAN$ = "REYES"
         IF A = 93 THEN TRAN$ = "ALFILES"
         IF A = 94 THEN TRAN$ = "PEONES"
         IF A = 95 THEN TRAN$ = "TIEMPOS"
         IF A = 96 THEN TRAN$ = "RITOS"
         IF A = 97 THEN TRAN$ = "ORIENTES"
         IF A = 98 THEN TRAN$ = "OCCIDENTES"
         IF A = 99 THEN TRAN$ = "ANFITEATROS"
         IF A = 100 THEN TRAN$ = "JUEGOS"
         IF A = 101 THEN TRAN$ = "DIAS"
         IF A = 102 THEN TRAN$ = "DIOSES"
         IF A = 103 THEN TRAN$ = "RINCONES"
         IF A = 104 THEN TRAN$ = "ALBEDRIOS"
       CASE 2
         A = INT(RND * 96) + 1
         IF A = 1 THEN TRAN$ = "PERRAS"
         IF A = 2 THEN TRAN$ = "LUCES"
         IF A = 3 THEN TRAN$ = "GATAS"
         IF A = 4 THEN TRAN$ = "JIRAFAS"
         IF A = 5 THEN TRAN$ = "ARA¤AS"
         IF A = 6 THEN TRAN$ = "REINAS"
         IF A = 7 THEN TRAN$ = "EMPERATRICES"
         IF A = 8 THEN TRAN$ = "YEGUAS"
         IF A = 9 THEN TRAN$ = "REINAS"
         IF A = 10 THEN TRAN$ = "LECHUZAS"
         IF A = 11 THEN TRAN$ = "PAPELERAS"
         IF A = 12 THEN TRAN$ = "PELAMBRES"
         IF A = 13 THEN TRAN$ = "MUJERES"
         IF A = 14 THEN TRAN$ = "CONDESAS"
         IF A = 15 THEN TRAN$ = "NI¤AS"
         IF A = 16 THEN TRAN$ = "JOVENES"
         IF A = 17 THEN TRAN$ = "CHICAS"
         IF A = 18 THEN TRAN$ = "CAMAS"
         IF A = 19 THEN TRAN$ = "ALIMENTACIONES"
         IF A = 20 THEN TRAN$ = "SE¤ORAS"
         IF A = 21 THEN TRAN$ = "JUGADORAS"
         IF A = 22 THEN TRAN$ = "PIEZAS"
         IF A = 23 THEN TRAN$ = "PIERNAS"
         IF A = 24 THEN TRAN$ = "MANOS"
         IF A = 25 THEN TRAN$ = "PECHERAS"
         IF A = 26 THEN TRAN$ = "BAILARINAS"
         IF A = 27 THEN TRAN$ = "CORTEZAS"
         IF A = 28 THEN TRAN$ = "EDADES"
         IF A = 29 THEN TRAN$ = "CHALUPAS"
         IF A = 30 THEN TRAN$ = "CAMPANAS"
         IF A = 31 THEN TRAN$ = "MONEDAS"
         IF A = 32 THEN TRAN$ = "VIVIENDAS"
         IF A = 33 THEN TRAN$ = "HABITACIONES"
         IF A = 34 THEN TRAN$ = "LUCHADORAS"
         IF A = 35 THEN TRAN$ = "COMBATIENTES"
         IF A = 36 THEN TRAN$ = "ESPADAS"
         IF A = 37 THEN TRAN$ = "LANZAS"
         IF A = 38 THEN TRAN$ = "ISLAS"
         IF A = 39 THEN TRAN$ = "MUERTAS"
         IF A = 40 THEN TRAN$ = "PECERAS"
         IF A = 41 THEN TRAN$ = "MOSCAS"
         IF A = 42 THEN TRAN$ = "VIAS"
         IF A = 43 THEN TRAN$ = "RUTAS"
         IF A = 44 THEN TRAN$ = "PUERTAS"
         IF A = 45 THEN TRAN$ = "GUERRERAS"
         IF A = 46 THEN TRAN$ = "NACIONES"
         IF A = 47 THEN TRAN$ = "REPUBLICAS"
         IF A = 48 THEN TRAN$ = "DUE¤AS"
         IF A = 49 THEN TRAN$ = "BARBAS"
         IF A = 50 THEN TRAN$ = "OREJAS"
         IF A = 51 THEN TRAN$ = "BOCAS"
         IF A = 52 THEN TRAN$ = "NARICES"
         IF A = 53 THEN TRAN$ = "MADERAS"
         IF A = 54 THEN TRAN$ = "EMBARCACIONES"
         IF A = 55 THEN TRAN$ = "BARRAS"
         IF A = 56 THEN TRAN$ = "ROPAS"
         IF A = 57 THEN TRAN$ = "REMERAS"
         IF A = 58 THEN TRAN$ = "EDIFICACIONES"
         IF A = 59 THEN TRAN$ = "DESTRUCTORAS"
         IF A = 60 THEN TRAN$ = "CONSTRUCTORAS"
         IF A = 61 THEN TRAN$ = "CLEPSIDRAS"
         IF A = 62 THEN TRAN$ = "MIELES"
         IF A = 63 THEN TRAN$ = "CORTINAS"
         IF A = 64 THEN TRAN$ = "TIERRAS"
         IF A = 65 THEN TRAN$ = "DESCRIPCIONES"
         IF A = 66 THEN TRAN$ = "NAVES"
         IF A = 67 THEN TRAN$ = "ZAPATILLAS"
         IF A = 68 THEN TRAN$ = "SOGAS"
         IF A = 69 THEN TRAN$ = "CARGAS"
         IF A = 70 THEN TRAN$ = "SOCIEDADES"
         IF A = 71 THEN TRAN$ = "CIVILIZACIONES"
         IF A = 72 THEN TRAN$ = "RAZAS"
         IF A = 73 THEN TRAN$ = "SILLAS"
         IF A = 74 THEN TRAN$ = "NI¤ERAS"
         IF A = 75 THEN TRAN$ = "COMODAS"
         IF A = 76 THEN TRAN$ = "PANTALLAS"
         IF A = 77 THEN TRAN$ = "TRANSPIRACIONES"
         IF A = 78 THEN TRAN$ = "SONRISAS"
         IF A = 79 THEN TRAN$ = "RISAS"
         IF A = 80 THEN TRAN$ = "CARCAJADAS"
         IF A = 81 THEN TRAN$ = "PLANTAS"
         IF A = 82 THEN TRAN$ = "OVEJAS"
         IF A = 83 THEN TRAN$ = "VACAS"
         IF A = 84 THEN TRAN$ = "PIEZAS"
         IF A = 85 THEN TRAN$ = "FORMAS"
         IF A = 86 THEN TRAN$ = "TORRES"
         IF A = 87 THEN TRAN$ = "REINAS"
         IF A = 88 THEN TRAN$ = "GUERRAS"
         IF A = 89 THEN TRAN$ = "TIERRAS"
         IF A = 90 THEN TRAN$ = "DAMAS"
         IF A = 91 THEN TRAN$ = "BATALLAS"
         IF A = 92 THEN TRAN$ = "MANOS"
         IF A = 93 THEN TRAN$ = "JORNADAS"
         IF A = 94 THEN TRAN$ = "NOCHES"
         IF A = 95 THEN TRAN$ = "TRAMAS"
         IF A = 96 THEN TRAN$ = "AGONIAS"
     END SELECT
 END SELECT
 TRAN$ = TRAN$ + " "
 SUSTA$ = TRAN$
END FUNCTION

FUNCTION VERBO$
 A = INT(RND * 64) + 1
 IF A = 1 THEN TRAN$ = "AMAR"
 IF A = 2 THEN TRAN$ = "LLAMAR"
 IF A = 3 THEN TRAN$ = "TOMAR"
 IF A = 4 THEN TRAN$ = "CENAR "
 IF A = 5 THEN TRAN$ = "SO¤AR"
 IF A = 6 THEN TRAN$ = "LEVANTAR"
 IF A = 7 THEN TRAN$ = "PENSAR"
 IF A = 8 THEN TRAN$ = "ATONTAR"
 IF A = 9 THEN TRAN$ = "AHUMAR"
 IF A = 10 THEN TRAN$ = "NIVELAR"
 IF A = 11 THEN TRAN$ = "DESPERTAR"
 IF A = 12 THEN TRAN$ = "COCINAR"
 IF A = 13 THEN TRAN$ = "REBANAR"
 IF A = 14 THEN TRAN$ = "TONIFICAR"
 IF A = 15 THEN TRAN$ = "DISPARAR"
 IF A = 16 THEN TRAN$ = "SE¤ALAR"
 IF A = 17 THEN TRAN$ = "CORTAR"
 IF A = 18 THEN TRAN$ = "MATAR"
 IF A = 19 THEN TRAN$ = "SACAR"
 IF A = 20 THEN TRAN$ = "QUITAR"
 IF A = 21 THEN TRAN$ = "REVELAR"
 IF A = 22 THEN TRAN$ = "REPORTAR"
 IF A = 23 THEN TRAN$ = "CREAR"
 IF A = 24 THEN TRAN$ = "ACORTAR"
 IF A = 25 THEN TRAN$ = "ESPANTAR"
 IF A = 26 THEN TRAN$ = "ACOSTAR"
 IF A = 27 THEN TRAN$ = "IGUALAR"
 IF A = 28 THEN TRAN$ = "EQUILIBRAR"
 IF A = 29 THEN TRAN$ = "PESAR"
 IF A = 30 THEN TRAN$ = "PINTAR"
 IF A = 31 THEN TRAN$ = "DESPINTAR"
 IF A = 32 THEN TRAN$ = "LIMPIAR"
 IF A = 33 THEN TRAN$ = "ENSUCIAR"
 IF A = 34 THEN TRAN$ = "ENJABONAR"
 IF A = 35 THEN TRAN$ = "CLONAR"
 IF A = 36 THEN TRAN$ = "MIRAR"
 IF A = 37 THEN TRAN$ = "OBSERVAR"
 IF A = 38 THEN TRAN$ = "ALEGRAR"
 IF A = 39 THEN TRAN$ = "VER"
 IF A = 40 THEN TRAN$ = "TEMER"
 IF A = 41 THEN TRAN$ = "ROER"
 IF A = 42 THEN TRAN$ = "ROMPER"
 IF A = 43 THEN TRAN$ = "RETORNAR"
 IF A = 44 THEN TRAN$ = "COSER"
 IF A = 45 THEN TRAN$ = "ELEVAR"
 IF A = 46 THEN TRAN$ = "PARTIR"
 IF A = 47 THEN TRAN$ = "DESCUBRIR"
 IF A = 48 THEN TRAN$ = "TA¤IR"
 IF A = 49 THEN TRAN$ = "COMER"
 IF A = 50 THEN TRAN$ = "REGIR"
 IF A = 51 THEN TRAN$ = "DEMORAR"
 IF A = 52 THEN TRAN$ = "ODIAR"
 IF A = 53 THEN TRAN$ = "IRRADIAR"
 IF A = 54 THEN TRAN$ = "IR"
 IF A = 55 THEN TRAN$ = "CONSUMIR"
 IF A = 56 THEN TRAN$ = "CESAR"
 IF A = 57 THEN TRAN$ = "ENCENDER"
 IF A = 58 THEN TRAN$ = "BUSCAR"
 IF A = 59 THEN TRAN$ = "LIBRAR"
 IF A = 61 THEN TRAN$ = "GOBERNAR"
 IF A = 62 THEN TRAN$ = "SUJETAR"
 IF A = 63 THEN TRAN$ = "MOVER"
 IF A = 64 THEN TRAN$ = "EMPEZAR"
 TRAN$ = TRAN$ + " "
 VERBO$ = TRAN$
END FUNCTION

