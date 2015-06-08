REM VISTA PREG 4

CREATE VIEW RECAUDACION1 AS (
SELECT P.IDPELICULA, P.TITULO, P.CATEGORIA, P.CENSURA, P.FECHA_ESTRENO, SUM(F.MONTO_RECABADO) S FROM (PELICULA P
JOIN FUNCION  F ON P.IDPELICULA=F.IDPELICULA)
GROUP BY  P.IDPELICULA,P.TITULO, P.CATEGORIA, P.CENSURA, P.FECHA_ESTRENO
);

SELECT * FROM RECAUDACION1;

REM Respuestas Teoricas
REM 4.1. ¿Qué diferencia existe entre una tabla y una vista?
REM Una vista es una tabla derivada de otras. Estas otras pueden ser tablas bases o vistas
REM previamente definidas. La diferencia es que las vistas no necesariamenete existen en forma 
REM fisica,en contraste con las tablas que se almacenan realmente en la base de datos.

REM 4.2. ¿Puede una vista ser utilizada como una tabla en una consulta?
REM Si, y esto es util a la hora de querer acceder con frecuencia a una tabla que es el resultado de 
REM dos reuniones, que incluya los atributos que se desean obtener con frecuencia.

REM 4.3. ¿Cómo pueden asignársele nombres a las columnas que devuelve una vista?

REM Esto se puede hacer especificando explicitamente nombres de atributos nuevos
REM en el CREATE VIEW al lado del nombre de la vista, todos entre parentesis y 
REM que tengan correspondencia uno a uno con los atributos especificados en la 
REM clausula select de la consulta que defina la vista.








