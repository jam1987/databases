REM
REM  Archivo:   inmove-schema.sql
REM
REM  Contenido: Secuencia de comandos SQL para la creacion de la base de datos relacional
REM             de INMOVE. Incluye solo la declaracion de claves primarias, alternar y 
REM             foraneas. 
REM
REM  Comentarios: 1. Las restricciones explicitas y de dominio sobre los atributos se
REM                  presentan en el archivo inmove-integrity.sql
REM               2. Las restricciones de seguridad sobre las relaciones del esquema
REM                  se presentan en el archivo inmove-security.sql
REM

CREATE TABLE INMUEBLE(
    ID          CHAR(4)      ,
    NOMBRE      VARCHAR2(50) ,
    DIRECCION   VARCHAR2(50) ,
    TIPO        CHAR(1)      ,
    AREATOTAL   NUMBER(6,2)  ,
    FECHACONT   DATE         ,
    NROUNIDS    NUMBER(3)    ,
    NROUNIDRESP NUMBER(3)    ,
    CONSTRAINT PK_INMUEBLE PRIMARY KEY (ID)
);

CREATE TABLE UNIDAD(
    IDINMUEBLE  CHAR(4)      , 
    NUMERO      NUMBER(3)    ,
    AREA        NUMBER(5,2)  ,
    CEDULAPROP  VARCHAR2(8)  NOT NULL,
    NOMBREPROP  VARCHAR2(30) NOT NULL,
    ALICUOTA    NUMBER(4,2)  ,
    PISO        VARCHAR2(4)  ,
    CONSTRAINT  PK_UNIDAD PRIMARY KEY (IDINMUEBLE,NUMERO)
 );

 CREATE TABLE GASTO(
    ID                 CHAR(6)      NOT NULL,
    FECHA              DATE         NOT NULL,
    CONCEPTO           VARCHAR2(30) ,
    MONTO              NUMBER(10,2) ,
    PROVEEDOR          VARCHAR2(30) NOT NULL,
    INCURRE_U_ID_INM   CHAR(4)      NULL,
    INCURRE_U_NRO_UNID NUMBER(3)    NULL,
    INCURRE_I_ID_INM   CHAR(4)      NULL,
    CONSTRAINT PK_GASTO PRIMARY KEY (ID)
 );

REM   En la traduccion del enunciado esto era PAGO
CREATE TABLE CONDOMINIO (
    IDINMUEBLE CHAR(4)     NOT NULL,
    NROUNIDAD  NUMBER(3)   NOT NULL,
    MES        NUMBER(2)   NOT NULL,
    ANO        NUMBER(4)   NOT NULL,
    MONTO      NUMBER(8,2) NOT NULL,
    FECHAPAGO  DATE        NULL,
    CONSTRAINT PK_CONDOMINIO PRIMARY KEY (IDINMUEBLE, NROUNIDAD, MES, ANO)
);


REM Declaracion de las claves foraneas de las relaciones en el esquema

REM Claves foraneas de la relacion INMUEBLE
ALTER TABLE INMUEBLE ADD (
    CONSTRAINT FK_INMUEBLE__UNIDAD 
        FOREIGN KEY (ID, NROUNIDRESP) 
        REFERENCES UNIDAD DEFERRABLE
);

REM Claves foraneas de la relacion UNIDAD
ALTER TABLE UNIDAD ADD (
    CONSTRAINT FK_UNIDAD__INMUEBLE
        FOREIGN KEY (IDINMUEBLE )
        REFERENCES INMUEBLE
);

REM Claves foraneas de la relacion GASTO
ALTER TABLE GASTO ADD (
    CONSTRAINT FK_GASTO__INMUEBLE__INCURRE_I
        FOREIGN KEY (INCURRE_I_ID_INM)
        REFERENCES INMUEBLE,
    CONSTRAINT FK_GASTO__UNIDAD__INCURRE_U
        FOREIGN KEY (INCURRE_U_ID_INM, INCURRE_U_NRO_UNID)
        REFERENCES UNIDAD
);

REM Claves foraneas de la relacion CONDOMINIO
ALTER TABLE CONDOMINIO ADD (
    CONSTRAINT FK_CONDOMINIO__GASTO
        FOREIGN KEY (IDINMUEBLE, NROUNIDAD)
        REFERENCES UNIDAD
);
