REM
REM  Archivo:   inmove-domains.sql
REM
REM  Contenido: Secuencia de comandos SQL para la agregar restricciones de dominio a las
REM             columnas del esquema relacional de INMOVE. 
REM
REM  Comentarios: 1. Antes de ejecutar este script debio haberse ejecutado previamente
REM                  el scrip inmove-schema.sql
REM
REM


REM
REM Declaracion de las restricciones de dominio de las columnas de la tabla INMUEBLE
REM

REM La columna NOMBRE debe poseer solo caracteres alfabeticos
ALTER TABLE INMUEBLE ADD (
    CONSTRAINT DOM_INMUEBLE__NOMBRE
        CHECK (TRANSLATE(UPPER(NOMBRE),'ABCDEFGHIJKLMNOPQRSTUVWXYZ ','XXXXXXXXXXXXXXXXXXXXXXXXXXX') =
               LPAD('X',LENGTH(NOMBRE),'X'))
);


REM La columna TIPO debe admitir solo los valores 'A', 'O' y 'C'
ALTER TABLE INMUEBLE ADD (
    CONSTRAINT DOM_INMUEBLE__TIPO 
        CHECK (TIPO IN ('A','C','O')) 
);

REM La columna NROUNIDS debe ser un numero entre 1 y 999
ALTER TABLE INMUEBLE ADD (
    CONSTRAINT DOM_INMUEBLE__NROUNIDS
        CHECK (NROUNIDS >= 1)
);

REM La columna AREATOTAL debe ser un numero positivo
ALTER TABLE INMUEBLE ADD (
    CONSTRAINT DOM_INMUEBLE__AREATOTAL
        CHECK (AREATOTAL >= 0)
);

REM La columna FECHACONT debe estar en el formato 'DD-MM-YYYY'
REM Esta restriccion no puede implementarse a nivel de datos ya que ORACLE
REM supone un cierto formato de almacenamiento de los valores de tipo fecha.
REM En este caso el resultado de toda consulta que acceda a esta columna debe
REM implicar la transformacion del formato de fecha para hacer esta caracteristica
REM transparente al usuario


REM
REM Declaracion de las restricciones de dominio de las columnas de la tabla UNIDAD
REM

REM La columna NUMERO debe tener valores comprendidos entre 0 y 999
ALTER TABLE UNIDAD ADD (
    CONSTRAINT DOM_UNIDAD__NUMERO
        CHECK (NUMERO>=0)
);

REM La columna AREA debe tener valores positivos
ALTER TABLE UNIDAD ADD (
    CONSTRAINT DOM_UNIDAD__AREA
        CHECK (AREA>=0)
);

REM La columna CEDULAPROP debete poseer caracteres numericos
ALTER TABLE UNIDAD ADD (
    CONSTRAINT DOM_UNIDAD__CEDULAPROP
        CHECK ((ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),1,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),2,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),3,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),4,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),5,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),6,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),7,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(LPAD(CEDULAPROP,8,'0'),8,1)) BETWEEN 48 AND 57))
);

REM La columna NOMBREPROP debe poseer caracteres alfabeticos
ALTER TABLE UNIDAD ADD (
    CONSTRAINT DOM_UNIDAD__NOMBREPROP
        CHECK (TRANSLATE(UPPER(NOMBREPROP),'ABCDEFGHIJKLMNOPQRSTUVWXYZ ','XXXXXXXXXXXXXXXXXXXXXXXXXXX') =
               LPAD('X',LENGTH(NOMBREPROP),'X'))
);


REM
REM Declaracion de las restricciones de dominio de las columnas de la tabla GASTO
REM

REM Los valores de la columna ID deben ser tales que el primer caracter sea I o U y el restro de los caracteres
REM sean numericos
ALTER TABLE GASTO ADD (
    CONSTRAINT DOM_GASTO__ID
        CHECK (SUBSTR(ID,1,1) IN ('I','U') AND
               (ASCII(SUBSTR(ID,2,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(ID,3,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(ID,4,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(ID,5,1)) BETWEEN 48 AND 57) AND
               (ASCII(SUBSTR(ID,6,1)) BETWEEN 48 AND 57))
);

REM Los valores de la columna CONCEPTO deben ser secuencias de hasta 30 caracteres alfabeticos
ALTER TABLE GASTO ADD (
    CONSTRAINT DOM_GASTO__CONCEPTO
        CHECK (TRANSLATE(UPPER(CONCEPTO),'ABCDEFGHIJKLMNOPQRSTUVWXYZ ','XXXXXXXXXXXXXXXXXXXXXXXXXXX') =
               LPAD('X',LENGTH(CONCEPTO),'X'))
);

REM La columna FECHA debe tener el formato 'DD-MM-YYYY'
REM Esta restriccion no puede implementarse a nivel de datos ya que ORACLE
REM supone un cierto formato de almacenamiento de los valores de tipo fecha.
REM En este caso el resultado de toda consulta que acceda a esta columna debe
REM implicar la transformacion del formato de fecha para hacer esta caracteristica
REM transparente al usuario

REM La columna PROVEEDOR debete contener caracteres alfabeticos
REM Los valores de la columna CONCEPTO deben ser secuencias de hasta 30 caracteres alfabeticos
ALTER TABLE GASTO ADD (
    CONSTRAINT DOM_GASTO__PROVEEDOR
        CHECK (TRANSLATE(UPPER(PROVEEDOR),'ABCDEFGHIJKLMNOPQRSTUVWXYZ ','XXXXXXXXXXXXXXXXXXXXXXXXXXX') =
               LPAD('X',LENGTH(PROVEEDOR),'X'))
);

REM Dependiendo del tipo de gasto (inmueble o unidad) se permitiran o no valores
REM nulos en las columnas que constituyen claves foraneas
ALTER TABLE GASTO ADD (
    CONSTRAINT R7_GASTO
        CHECK ((SUBSTR(ID,1,1)='I' AND INCURRE_U_ID_INM IS NULL AND  
                INCURRE_U_NRO_UNID IS NULL AND INCURRE_I_ID_INM IS NOT NULL)
               OR
               (SUBSTR(ID,1,1)='U' AND INCURRE_U_ID_INM IS NOT NULL AND  
                INCURRE_U_NRO_UNID IS NOT NULL AND INCURRE_I_ID_INM IS NULL))
);


REM
REM Declaracion de las restricciones de dominio de las columnas de la tabla CONDOMINIO
REM

REM Los valores de la columna MES deben estar entre 1 y 12
ALTER TABLE CONDOMINIO ADD (
    CONSTRAINT DOM_GASTO__MES
        CHECK (MES BETWEEN 1 AND 12)
);

REM Los valores de la columna ANO deben ser superiores a 2001
ALTER TABLE CONDOMINIO ADD (
    CONSTRAINT DOM_GASTO__ANO
        CHECK (ANO >= 2001)
);

REM Los valores de la columna MONTO deben ser positivos
ALTER TABLE CONDOMINIO ADD (
    CONSTRAINT DOM_GASTO__MONTO
        CHECK (MONTO >= 0)
);

REM Los valores de la columna FECHAPAGO deben estar en el formato 'DD-MM-YYYY'
REM Esta restriccion no puede implementarse a nivel de datos ya que ORACLE
REM supone un cierto formato de almacenamiento de los valores de tipo fecha.
REM En este caso el resultado de toda consulta que acceda a esta columna debe
REM implicar la transformacion del formato de fecha para hacer esta caracteristica
REM transparente al usuario












