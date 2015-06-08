CREATE TABLE alumnos 
(
 matricula text NOT NULL,
 nombre text NOT NULL,
 semestre text NOT NULL,
 carrera text NOT NULL,
 CONSTRAINT matricula PRIMARY KEY(matricula)
)
WITH (OIDS=FALSE);
ALTER TABLE alumnos OWNER TO "postgres";
