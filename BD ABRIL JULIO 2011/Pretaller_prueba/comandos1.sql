REM PREGUNTA 1
REM A

SELECT IDCINE
FROM CINE
MINUS
SELECT IDCINE
FROM FUNCION F JOIN PELICULA  P ON P.CENSURA='C' 
WHERE F.IDPELICULA=P.IDPELICULA;

REM B

SELECT IDCINE, AVG((BOLETOS_VENDIDOS/CAPACIDAD)*100) AVERAGE, MAX((BOLETOS_VENDIDOS/CAPACIDAD)*100) MAXIMUM, MIN((BOLETOS_VENDIDOS/CAPACIDAD)*100) MINIMUM
FROM FUNCION NATURAL JOIN SALA 
WHERE NUM_SALA=NUMERO
GROUP BY IDCINE;

REM C

SELECT IDCINE
FROM SE_ESTRENA
HAVING COUNT(*)>5
GROUP BY IDCINE;

REM D

SELECT DISTINCT C.IDCINE, NOMBRE
FROM (CINE C JOIN FUNCION F ON C.IDCINE=F.IDCINE) JOIN PELICULA P ON F.IDPELICULA=P.IDPELICULA
WHERE P.CATEGORIA='Accion' AND F.FECHA_HORA<SYSDATE
HAVING COUNT(*)>6
GROUP BY C.IDCINE, NOMBRE;

REM E

SELECT IDCINE
FROM SALA
HAVING MIN(CAPACIDAD)=AVG(CAPACIDAD)
GROUP BY IDCINE;

SELECT IDCINE
FROM SALA
WHERE NOT EXISTS ( SELECT  S1.NUMERO, S2.NUMERO
		   FROM SALA S1 JOIN SALA S2 ON S1.IDCINE=S2.IDCINE
		   WHERE  S1.NUMERO!=S2.NUMERO AND S1.CAPACIDAD!=S2.CAPACIDAD);


REM F

SELECT IDCINE, NUM_SALA, FECHA_HORA, F.IDPELICULA, TITULO, MONTO_RECABADO, BOLETOS_VENDIDOS
FROM FUNCION F JOIN PELICULA P ON F.IDPELICULA=P.IDPELICULA
WHERE MONTO_RECABADO>ALL(SELECT MONTO_RECABADO
			  FROM FUNCION F JOIN CINE C ON F.IDCINE=C.IDCINE
			  WHERE (ASCII(SUBSTR(LPAD(F.idcine,5,'0'),1,1)) =86) AND
				(ASCII(SUBSTR(LPAD(F.idcine,5,'0'),2,1)) =65) AND
				(ASCII(SUBSTR(LPAD(F.idcine,5,'0'),3,1)) =76) AND
				FECHA_HORA BETWEEN '01-JUL-02' AND '31-JUL-02'); 


REM 1.1
REM LAS FUNCIONES MIN, MAX Y AVG SE PUEDEN EXPRESAR EN EL SELECT PONIENDO LA FUNCION DE AGREGACION Y ENTRE PARENTESIS EL PARAMETRO
REM A EVALUAR DENTRO DE LA FUNCION. CABE DESTACAR QUE DICHO PARAMETRO DEBE PERTENECER AL DOMINIO DE LOS ENTEROS. DE LO CONTRARIO DA ERROR.

REM 1.2
REM PARA LAS CONSULTAS C Y D, LA CLAUSULA HAVING SE UTILIZA PARA LA FUNCION DE AGREGACION COUNT, YA QUE SE TOMA EL COUNT PARA VERIFICAR LAS
REM TUPLAS QUE CUMPLAN CON UNA CIERTA CONDICION DE COMPARACION DE ENTEROS.

REM 1.3
REM UNA CONSULTA ES ANIDADA SI Y SOLO SI DENTRO DEL WHERE SE ENCUENTRA UNA SUBCONSULTA, PARA ESTO LA SINTAXIS ES LA SIGUIENTE:
REM SELECT <LISTA_PARAMETROS>
REM FROM <LISTA_TABLAS>
REM WHERE <EXPRESIONES> <OPERADOR> (SELECT ...
REM                                   )
REM DONDE EL OPERADOR PUEDE SER: DE COMPARACION (>,<,=), EL OPERADOR ANY, EL OPERADOR ALL, EL OPERADOR EXISTS Y NOT EXISTS.

REM 1.5
REM PARA LA PREGUNTA F SE PROCEDE DE LA SIGUIENTE MANERA:
REM SE OBTIENEN LOS DATOS BASICOS DEL CINE, EL NUMERO DE SALA, LA FECHA, LA PELICULA, EL MONTO RECABADO Y EL NUMERO DE BOLETOS VENDIDOS,
REM PARA ESTO SE USAN LAS TABLAS FUNCION Y PELICULA,
REM PARA LOGRAR LA CONDICION QUE EL MONTO RECABADO SEA MAYOR QUE EL MONTO OBTENIDO POR TODAS LAS FUNCIONES DE LOS CINES DE VALENCIA
REM SE USA EL OPERADOR ALL, PARA QUE EN LA SUBCONSULTA SE OBTENGA EL RESULTADO, LA CONDICION DEL WHERE INTERNO ES QUE LOS PRIMEROS 3 CARACTERES
REM SEAN IGUALES A LOS 3 PRIMEROS DE LOS CINES DE VALENCIA.


