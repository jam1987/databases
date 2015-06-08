REM
REM  Archivo:   cineca-schema.sql
REM
REM  Contenido: Secuencia de comandos SQL para la creacion de la base de datos relacional
REM             de CINECA. Incluye solo la declaracion de claves primarias, alternas y 
REM             foráneas. 
REM
REM  Autor:     Edna Ruckhaus
REM
REM  Fecha de Creacion: Julio 12 de 2002
REM
REM  Version:   1.0


create TABLE CINE (
        IDCINE CHAR(5) NOT NULL,
        NOMBRE VARCHAR2(50) NOT NULL,
        PRECIO_ENTRADA NUMBER(10,2) NOT NULL,
        NUM_SALAS NUMBER(2) NOT NULL,
        CONSTRAINT PK_CINE PRIMARY KEY (IdCine),
        CONSTRAINT AK_CINE UNIQUE (Nombre)
);



CREATE TABLE SALA (
        IDCINE CHAR(5) NOT NULL, 
        NUMERO NUMBER(2) NOT NULL,
        CAPACIDAD INT NOT NULL,
        CONSTRAINT PK_SALA PRIMARY KEY (IDCINE, NUMERO)      
);



CREATE TABLE PELICULA(
        IDPELICULA VARCHAR2(10) NOT NULL,
        TITULO VARCHAR2(50) NOT NULL,
        CATEGORIA VARCHAR2(15) NOT NULL,
        CENSURA CHAR(1) NOT NULL,
        FECHA_ESTRENO DATE NULL,
        CONSTRAINT PK_PELICULA PRIMARY KEY (IDPELICULA),
        CONSTRAINT AK_PELICULA UNIQUE (TITULO)
);

CREATE TABLE FUNCION(
        IDCINE CHAR(5) NOT NULL,
        NUM_SALA NUMBER(2) NOT NULL,
        FECHA_HORA DATE NOT null,
        IDPELICULA VARCHAR2(10) NOT NULL,
        MONTO_RECABADO NUMBER(10,2) NULL, 
        BOLETOS_VENDIDOS int NULL,
        CONSTRAINT PK_FUNCION PRIMARY KEY (IdCine, Num_Sala, Fecha_Hora)
);

CREATE TABLE SE_ESTRENA(
        IDCINE CHAR(5) NOT NULL,
        IDPELICULA VARCHAR2(10) NOT NULL,
        CONSTRAINT PK_SE_ESTRENA PRIMARY KEY (IDCINE, IDPELICULA)       
);
        


REM Declaracion de las claves foraneas de las relaciones en el esquema
 
REM Claves foraneas de la relacion SALA
ALTER TABLE SALA ADD (
    CONSTRAINT FK_SALA__CINE 
        FOREIGN KEY (IDCINE) 
        REFERENCES CINE 
);

REM Claves foraneas de la relacion FUNCION
ALTER TABLE FUNCION ADD (
    CONSTRAINT FK_FUNCION__SALA
        FOREIGN KEY (IDCINE, NUM_SALA)
        REFERENCES SALA
);
ALTER TABLE FUNCION ADD (
    CONSTRAINT FK_FUNCION__PELICULA
        FOREIGN KEY (IDPELICULA)
        REFERENCES PELICULA
);

REM Claves foraneas de la relacion SE_ESTRENA
ALTER TABLE SE_ESTRENA ADD (
    CONSTRAINT FK_SE_ESTRENA_CINE
        FOREIGN KEY (IDCINE) 
        REFERENCES Cine);
ALTER TABLE SE_ESTRENA ADD (
    CONSTRAINT FK_SE_ESTRENA_PELICULA 
        FOREIGN KEY (IDPELICULA) 
        REFERENCES PELICULA);


