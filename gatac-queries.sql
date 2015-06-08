SELECT idpelicula, titulo, categoria, Fecha_Estreno, IdCine, Nombre
FROM PELICULA JOIN SE_ESTRENA JOIN CINE
ON (PELICULA.idpelicula=SE_ESTRENA.idpelicula AND idcine=IdCine)
WHERE censura='C'  
ORDER BY titulo;