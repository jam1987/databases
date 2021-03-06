SPOOL Pregunta3.txt

REM PREG 3.2

REM PREG A
SELECT NOMBRE
FROM RESERVA1,CONSUMO1
WHERE CODIGO=CODIGO_RES AND TIPO_PAGO IS NULL;



REM PREG B
SELECT DISTINCT NOMBRE
FROM RESERVA1, CONSUMO1
WHERE CODIGO=CODIGO_RES
MINUS
SELECT NOMBRE
FROM RESERVA1,CONSUMO1
WHERE CODIGO=CODIGO_RES AND TIPO_PAGO IS NULL;


REM PREG C
SELECT NOMBRE, MONTO
FROM SERVICIO1, CONSUMO1 c
WHERE MONTO = 
                 (SELECT MAX(MONTO)
                  FROM CONSUMO1
                  WHERE c.ID_SERVICIO=ID_SERVICIO
                  GROUP BY ID_SERVICIO)
AND ID_SERVICIO=ID;



SELECT DISTINCT NOMBRE, MONTO
FROM SERVICIO1, CONSUMO1 c
WHERE MONTO = 
                 (SELECT MIN(MONTO)
                  FROM CONSUMO1
                  WHERE c.ID_SERVICIO=ID_SERVICIO
                  GROUP BY ID_SERVICIO)
AND ID_SERVICIO=ID;

SELECT NOMBRE, SUM(MONTO),AVG(MONTO)
FROM SERVICIO1, CONSUMO1
WHERE ID_SERVICIO=ID
GROUP BY NOMBRE;


CREATE VIEW HUESPEDES
AS SELECT NOMBRE, FECHA_INGRESO, FECHA_EGRESO
   FROM RESERVA1;



REM PREG D

SELECT NUM_FACTURA
FROM CONSUMO1 
WHERE MONTO>= ALL
               (SELECT MONTO
                FROM CONSUMO1);


REM PREG E

SELECT DISTINCT CEDULA,CODIGO, SUM(MONTO)
FROM  RESERVA1, CONSUMO1
WHERE CODIGO=CODIGO_RES
HAVING SUM(MONTO)>&var
GROUP BY CEDULA,CODIGO;

REM PREG F


REM PREG F



SELECT NUMERO
FROM HABITA1
MINUS
SELECT  NUMERO_HAB
FROM ASIGNA1 JOIN RESERVA1 ON (CODIGO=CODIGO_RES)
GROUP BY NUMERO_HAB
HAVING MAX(FECHA_EGRESO) - sysdate >=15 ; 
                                                               

REM PREG G

SELECT NUMERO_HAB
FROM CONSUMO1
WHERE MONTO = 
             (SELECT MAX(MONTO)
              FROM CONSUMO1
              );

REM 3.3

REM PREG I


WHERE prom = (CREATE VIEW PROMEDIO
AS SELECT ID_SERVICIO id , AVG(MONTO) prom
FROM CONSUMO1
GROUP BY ID_SERVICIO;

CREATE VIEW PROMEDIOMAX
AS SELECT id i
FROM PROMEDIO
              SELECT MAX(prom)
              FROM PROMEDIO
              );

SELECT MONTO, CODIGO_RES
FROM CONSUMO1 JOIN PROMEDIOMAX ON (ID_SERVICIO=i);

REM PREG J CON VISTAS

CREATE VIEW CANTSERV AS
SELECT SUM(COUNT(DISTINCT ID)) cantservicio
FROM SERVICIO1
GROUP BY ID;

SELECT CODIGO_RES 
FROM CONSUMO1 JOIN RESERVA1 ON (CODIGO=CODIGO_RES)
WHERE ID_SERVICIO = ALL (
                        SELECT ID
                        FROM SERVICIO1
                        WHERE ID=ID_SERVICIO
                        )
HAVING COUNT(CODIGO_RES)= (
                           SELECT cantservicio
                           FROM CANTSERV
                           )
GROUP BY CODIGO_RES;

REM PREG J SIN VISTAS


SELECT CODIGO_RES 
FROM CONSUMO1 JOIN RESERVA1 ON (CODIGO=CODIGO_RES)
WHERE ID_SERVICIO = ALL (
                        SELECT ID
                        FROM SERVICIO1
                        WHERE ID=ID_SERVICIO
                        )
HAVING COUNT(CODIGO_RES)= (
                           SELECT SUM(COUNT(DISTINCT ID))
                           FROM SERVICIO1
                           GROUP BY ID
                           )
GROUP BY CODIGO_RES;

REM PREG 4

CREATE VIEW HABITA2
AS SELECT NUMERO_HAB
FROM ASIGNA1 JOIN RESERVA1 ON (CODIGO=CODIGO_RES)
GROUP BY NUMERO_HAB
HAVING   sysdate - MAX(FECHA_INGRESO) >=90;

SPOOL OFF