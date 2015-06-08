SPOOL gatac-queries.txt

SELECT PELICULA.idpelicula, titulo, categoria, Fecha_Estreno, CINE.IdCine, Nombre
FROM PELICULA,SE_ESTRENA,CINE
WHERE censura='C' AND PELICULA.idpelicula=SE_ESTRENA.idpelicula AND SE_ESTRENA.idcine=CINE.IdCine  
ORDER BY titulo;


SELECT DISTINCT c.IdCine, c.Nombre 
FROM PELICULA p, FUNCION f, CINE c
WHERE p.censura!='C' AND c.IdCine=f.id_cine AND p.idpelicula=f.idpelicula;

SELECT c.IdCine, c.Nombre
FROM PELICULA p, FUNCION f, CINE c
WHERE p.censura='A' AND  p.censura='C' AND c.IdCine=f.id_cine AND p.idpelicula=f.idpelicula;

SPOOL OFF