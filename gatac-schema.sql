SPOOL "gatac-schema.txt"
CREATE TABLE CINE (
  IdCine CHAR(5),
  Nombre VARCHAR(50),
  Precio_entrada FLOAT,
  num_salas NUMBER(2),
  CONSTRAINT PK_ID PRIMARY KEY(IdCine)
)

CREATE TABLE SALA (
  idcine CHAR(5),
  numero NUMBER(2),
  capacidad NUMBER,
  CONSTRAINT PK_IDNUM PRIMARY KEY(idcine,numero),
  CONSTRAINT FK_ID FOREIGN KEY(idcine) REFERENCES CINE
)

CREATE TABLE PELICULA (
  idpelicula CHAR(5),
  titulo VARCHAR(50),
  categoria VARCHAR(15),
  censura CHAR(1),
  Fecha_estreno DATE,
  CONSTRAINT PK_IDTIT PRIMARY KEY(idpelicula,titulo)
)

CREATE TABLE FUNCION (
  id_cine CHAR(5),
  num_sala NUMBER(2),
  fecha_hora DATE,
  idpelicula CHAR(5),
  monto_recabado NUMBER(8,2),
  boletos_vendidos NUMBER,
  CONSTRAINT PK_PRIM PRIMARY KEY(id_cine,num_sala,fecha_hora,idpelicula),
  CONSTRAINT FK_FUN FOREIGN KEY(id_cine,num_sala) REFERENCES SALA,
  CONSTRAINT FK_FUN2 FOREIGN KEY(idpelicula) REFERENCES PELICULA
)

CREATE TABLE SE_ESTRENA (
  idcine CHAR(5),
  idpelicula CHAR(5),
  CONSTRAINT PK_ESTRENA PRIMARY KEY(idcine,idpelicula),
  CONSTRAINT FK_CINE FOREIGN KEY(idcine) REFERENCES CINE,
  CONSTRAINT FK_PELICULA FOREIGN KEY(idpelicula) REFERENCES PELICULA
)

SPOOL OFF