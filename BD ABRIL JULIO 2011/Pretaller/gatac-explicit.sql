SPOOL gatac-explicit.txt

ALTER TABLE PELICULA ADD (
CONSTRAINT CK_BOL 
CHECK ((categoria = 'Drama' AND censura in ('B','C','D')) OR ( categoria in ('Comedia','Accion','Romance','Suspenso','Ciencia Ficcion','Documental','Terror','Musical','Animacion') AND censura in ('A','B','C','D'))));

SPOOL OFF