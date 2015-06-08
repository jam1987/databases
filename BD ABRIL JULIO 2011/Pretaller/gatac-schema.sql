SPOOL gatac-schema.txt

CREATE TABLE CINE (
  IdCine CHAR(5),
  Nombre VARCHAR(50),
  Precio_entrada FLOAT,
  num_salas NUMBER(2),
  CONSTRAINT PK_ID PRIMARY KEY(IdCine),
  CONSTRAINT AK_NOMBRE UNIQUE(Nombre)
);

CREATE TABLE SALA (
  idcine CHAR(5),
  numero NUMBER(2),
  capacidad NUMBER(3),
  CONSTRAINT PK_IDSALA PRIMARY KEY(idcine,numero),
  CONSTRAINT FK_ID FOREIGN KEY(idcine) REFERENCES CINE (IdCine)
);

CREATE TABLE PELICULA (
  idpelicula CHAR(6),
  titulo VARCHAR(50),
  categoria VARCHAR(15),
  censura CHAR(1),
  Fecha_estreno DATE,
  CONSTRAINT PK_IDTIT PRIMARY KEY(idpelicula),
  CONSTRAINT AK_TITULO UNIQUE(titulo)
);

CREATE TABLE FUNCION (
  id_cine CHAR(5),
  numsala NUMBER(2),
  fecha_hora DATE,
  idpelicula CHAR(6),
  montorecabado NUMBER(8,2),
  boletos_vendidos NUMBER,
  CONSTRAINT PK_PRIM PRIMARY KEY (id_cine,numsala,fecha_hora,idpelicula),
  CONSTRAINT FK_FUNNUMERO FOREIGN KEY (id_cine,numsala) REFERENCES SALA (idcine,numero),
  CONSTRAINT FK_FUN2 FOREIGN KEY(idpelicula) REFERENCES PELICULA (idpelicula)
);

CREATE TABLE SE_ESTRENA (
  idcine CHAR(5),
  idpelicula CHAR(6),
  CONSTRAINT PK_ESTRENA PRIMARY KEY (idcine,idpelicula),
  CONSTRAINT FK_CINE FOREIGN KEY (idcine) REFERENCES CINE (IdCine),
  CONSTRAINT FK_PELICULA FOREIGN KEY (idpelicula) REFERENCES PELICULA (idpelicula)
);


SPOOL OFF