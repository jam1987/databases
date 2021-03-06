SPOOL PI-3.txt

REM  ****************************PREGUNTA 3****************************


REM Respuestas a todos los items de la pregunta nro. 3 del Pre-taller

REM *************************A*******************************
REM Nombres de clientes en reserva que tienen consumos no pagados.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA Y CONSUMO.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NOMBRE.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No es necesario.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  = ANY.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Separando el FROM de RESERVA Y CONSUMO con un anidamiento.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  En este caso no es necesario.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.
REM  En este caso no es necesario utilizar vistas ni consultas anidadas.

REM Nombres de clientes en reserva que tienen consumos no pagados.
SELECT NOMBRE
 FROM RESERVA1,CONSUMO1
 WHERE CODIGO=CODIGO_RES AND TIPO_PAGO IS NULL;

REM *************************B********************************
REM Nombres de los clientes que no tienen consumos no pagados.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA Y CONSUMO.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NOMBRE.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No es necesario.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  = ANY.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Separando el FROM de RESERVA Y CONSUMO con un anidamiento.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  En este caso no es necesario.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.
REM  En este caso no es necesario utilizar vistas ni consultas anidadas

REM Nombres de los clientes que no tienen consumos no pagados.
SELECT NOMBRE
 FROM RESERVA1,CONSUMO1
 WHERE CODIGO=CODIGO_RES
MINUS
SELECT NOMBRE
 FROM RESERVA1,CONSUMO1
 WHERE CODIGO=CODIGO_RES AND TIPO_PAGO IS NULL;

REM ************************C**********************************
REM Monto total, mínimo, máximo y promedio de todos los consumos efectuados 
REM por cada nombre de servicio.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  SERVICIO1 y CONSUMO1.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NOMBRE,MAX(MONTO),MIN(MONTO),AVG(MONTO),SUM(MONTO).
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  Si, sobre la particion de los datos segun el atributo NOMBRE.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  No es necesario para esta consulta.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Subdividir cada uno de los operadores MAX MIN AVG y SUM pero no es necesario.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  No es factible.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.
REM  En este caso no es necesario utilizar vistas ni consultas anidadas pero si
REM operadores de agrupamiento (GROUP BY).

REM Monto total, mínimo, máximo y promedio de todos los consumos efectuados 
REM por cada nombre de servicio.
SELECT NOMBRE,SUM(MONTO),MIN(MONTO),MAX(MONTO),AVG(MONTO)
 FROM SERVICIO1,CONSUMO1
 WHERE ID_SERVICIO=ID
 GROUP BY NOMBRE;

REM ******************************D**********************************
REM Consumo con el monto máximo sin utilizar la función de agregación MAX.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  CONSUMO1.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NUM_FACTURA y MONTO.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No en este caso.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM   >= ALL.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Estructurar seleccionando al monto que sea mayor o igual a todos los demas montos.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  En este caso lo mas factible era usar la funcion MAX no usar vistas.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Consumo con el monto máximo sin utilizar la función de agregación MAX.
SELECT NUM_FACTURA,MONTO
 FROM CONSUMO1
 WHERE MONTO >= ALL ( SELECT MONTO
		    							FROM CONSUMO1);

REM ******************************E**************************************
REM Cédula de los clientes, código y monto total consumido de las
REM reservaciones que tienen consumo total por encima de un monto dado.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA1 y CONSUMO1.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  CEDULA, CODIGO y SUM(MONTO).
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  Si, sobre los grupos según CEDULA y CODIGO.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  En esta caso no es necesario.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Se estructura agrupando según CEDULA y CODIGO para poder sumar los consumos por 
REM cada reserva de manera individual
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM No en este caso no es factible.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Cédula de los clientes, código y monto total consumido de las
REM reservaciones que tienen consumo total por encima de un monto dado.
SELECT CEDULA,CODIGO,SUM(MONTO)
 FROM RESERVA1 JOIN CONSUMO1 ON CODIGO=CODIGO_RES
 GROUP BY CEDULA,CODIGO
 HAVING SUM(MONTO)>&MONTOMINIMO;

REM ******************************F***************************************
REM Habitaciones que no fueron utilizadas durante los últimos quince días.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA1, ASIGNA1 y HABITA1.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NUMERO_HAB y NUMERO.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No en este caso.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  En este caso no podrían usarse ninguno.
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Tomar el total de numeros de habitación y restarle las que si han sido usadas 
REM en los ultimos 15 días.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM No, no es necesario.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Habitaciones que no fueron utilizadas durante los últimos quince días.
SELECT NUMERO
	FROM HABITA1
MINUS
SELECT NUMERO_HAB
	FROM RESERVA1 JOIN ASIGNA1 ON CODIGO=CODIGO_RES
	WHERE (FECHA_INGRESO BETWEEN SYSDATE-15 AND SYSDATE) 
	OR (FECHA_EGRESO BETWEEN SYSDATE-15 AND SYSDATE)
	OR (FECHA_INGRESO<SYSDATE-15 AND FECHA_EGRESO>SYSDATE);

REM *******************************G***************************************
REM Habitaciones que han tenido el mayor monto total de consumos.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA1 y CONSUMO1.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  NUMERO_HAB, SUM(MONTO) y MAX(SUM(MONTO)).
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  Si, se debe agrupar sobre NUMERO_HAB
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  WHERE X = (SELECT ... ).
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Primero calculando las sumas de los consumos de cada habitación y luego
REM seleccionando a la mayor de estas sumas
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  Si es factible ya que se hace varias veces referencia a  RESERVA JOIN CONSUMO.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Habitaciones que han tenido el mayor monto total de consumos.
SELECT NUMERO_HAB
	FROM CONSUMO1
	GROUP BY NUMERO_HAB
	HAVING SUM(MONTO) IN (SELECT MAX(SUM(MONTO)) MONTO
                        	FROM CONSUMO1
                          GROUP BY NUMERO_HAB
												);


REM 3.3.1 Escriba en SQL las definiciones de las vistas que considere que son útiles y se
REM      justifica su creación para resolver algunas de las consultas, de acuerdo con su
REM      respuesta a la pregunta
REM Es factible usar vistas para que el  JOIN y el GROUP BY se ejecuten una sola vez.

REM Habitaciones que han tenido el mayor monto total de consumos.
DROP VIEW SUMCONSUMOHAB;
CREATE VIEW SUMCONSUMOHAB AS
	SELECT NUMERO_HAB,SUM(MONTO) SUMA
 		FROM RESERVA1 JOIN CONSUMO1 ON CODIGO=CODIGO_RES
 		GROUP BY NUMERO_HAB;

SELECT NUMERO_HAB
 FROM SUMCONSUMOHAB
 WHERE SUMA = (SELECT MAX(SUMA)
								FROM SUMCONSUMOHAB);

REM ***********************************H************************************
REM Identificación de los servicios que han sido usados por huéspedes de habitaciones
REM con la tarifa más baja y que pertenecen a reservaciones con niños.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  HABITA, ASIGNA y CONSUMO.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  ID_SERVICIO
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No en este caso.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  WHERE X = (SELECT ... ).
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  calculando primero la minima tarifa, después el numero de habitacion de las que 
REM tengan esa tarifa, despues ver a quienes han asignado a estas habitaciones que tengan 
REM reservaciones con niños y luego ver cuales son los servicios usados por esos huespedes 
REM en esas habitaciones.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  Es factible usar vistas para que el anidamiento no sea de tantos niveles y sea mas eficiente
REM ya que como se observa en este caso solo se hace el anidamiento para escojer la tarifa minima.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Identificación de los servicios que han sido usados por huéspedes de habitaciones
REM con la tarifa más baja y que pertenecen a reservaciones con niños.
SELECT DISTINCT ID_SERVICIO
	FROM	(SELECT DISTINCT NUMERO_HAB, CODIGO_RES
	    FROM (SELECT NUMERO
	        FROM HABITA1
		       WHERE (TARIFA=(SELECT MIN(TARIFA)
			      FROM HABITA1
				 ) JOIN ASIGNA1 
				     ON(NUMERO=NUMERO_HAB)
				WHERE(NUM_NI>0))
	NATURAL JOIN CONSUMO1;

REM 3.3.1 Escriba en SQL las definiciones de las vistas que considere que son útiles y se
REM      justifica su creación para resolver algunas de las consultas, de acuerdo con su
REM      respuesta a la pregunta
REM 	Es factible usar vistas para que el anidamiento no sea de tantos niveles y sea mas eficiente
REM ya que como se observa en este caso solo se hace el anidamiento para escojer la tarifa minima.

REM Identificación de los servicios que han sido usados por huéspedes de habitaciones
REM con la tarifa más baja y que pertenecen a reservaciones con niños.
DROP VIEW RTMBCNINOS;
CREATE VIEW RTMBCNINOS AS
	SELECT NUMERO_HAB NHAB,CODIGO_RES CRES
	FROM HABITA1 JOIN ASIGNA1 ON NUMERO_HAB=NUMERO
	WHERE TARIFA = (SELECT MIN(TARIFA)
								  	FROM HABITA)
		AND NUM_NI > 0;

SELECT DISTINCT ID_SERVICIO
	FROM CONSUMO1,RTMBCNINOS
	WHERE NUMERO_HAB=NHAB AND CODIGO_RES=CRES;

REM *********************************I****************************************
REM Consumos efectuados en el servicio que tiene el promedio más alto en montos de
REM consumos.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  CONSUMO.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  todos los atributos de CONSUMO.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  agrupar ID_SERVICIO al menos 2 veces
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  WHERE X = (SELECT ... ).
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  Agrupo por servicio los averajes de los cosumos para luego obtener el maximo promedio 
REM (AVERAJE) y luego buscar el o los servicios que tienen ese promedio maximo para después 
REM buscar los consumos de ese servicio(s).
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM Si, ya que como se por lo visto se debe hacer varias veces referencia al averaje de cada servicio.
 
REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Consumos efectuados en el servicio que tiene el promedio más alto en montos de
REM consumos.

SELECT *
	FROM CONSUMO1
	WHERE ID_SERVICIO = (SELECT ID_SERVICIO
                         FROM (SELECT ID_SERVICIO,AVG(MONTO) PROM
 					      FROM CONSUMO1
 					      GROUP BY ID_SERVICIO)
					WHERE PROM=(SELECT MAX(PROM)
					            FROM (SELECT ID_SERVICIO,AVG(MONTO) PROM
 								   FROM CONSUMO1
 								   GROUP BY ID_SERVICIO)
							  )
					);

REM 3.3.1 Escriba en SQL las definiciones de las vistas que considere que son útiles y se
REM      justifica su creación para resolver algunas de las consultas, de acuerdo con su
REM      respuesta a la pregunta
REM  Es factible usar vistas ya que como se por lo visto se debe hacer varias veces
REM referencia al averaje de cada servicio es mejor tener la vista con esos averajes.

REM Consumos efectuados en el servicio que tiene el promedio más alto en montos de
REM consumos.
DROP VIEW PROMPORCONSUM;
CREATE VIEW PROMPORCONSUM AS
	SELECT ID_SERVICIO,AVG(MONTO) PROM
 		FROM CONSUMO1
 		GROUP BY ID_SERVICIO;

SELECT *
	FROM CONSUMO1
	WHERE ID_SERVICIO = (SELECT ID_SERVICIO
					 FROM PROMPORCONSUM
					 WHERE PROM=(SELECT MAX(PROM)
				                  FROM PROMPORCONSUM
		                            )
					);

REM ******************************J*******************************************
REM Reservas donde los clientes han consumido todos los servicios.

REM 3.1.1 ¿Cuáles relaciones se necesitan?
REM  RESERVA, CONSUMO y SERVICIO.
REM 3.1.2 ¿Cuáles atributos deben especificarse?
REM  Todos los atributos de RESERVA.
REM 3.1.3 ¿trabajan sobre grupos o particiones de los datos?
REM  No en este caso.
REM 3.1.4 ¿Cuáles operadores de anidamiento podrían usarse?
REM  WHERE X = (SELECT ... ).
REM 3.1.5 ¿De qué manera puede subdividir o estructurar?
REM  De manera que formulemos una division con sus pasos respectivos ya que SQL no tiene 
REM el oprador division y despues hacer join de este resultado con las reservas para obtener
REM los datos.
REM 3.1.6 ¿Es factible usar vistas? Si es asi indique las ventajas?
REM  No es tan necesario el uso de vistas pero si ayuda un poco en la visualizacion de la respuesta.

REM 3.2.1 Escriba la consulta en SQL, sin usar vistas y utilizando consultas anidadas.

REM Reservas donde los clientes han consumido todos los servicios.
	SELECT *
		FROM RESERVA JOIN (SELECT CODIGO COD
					    FROM RESERVA1
					    MINUS
					    SELECT DISTINCT CODIGO
					    FROM(SELECT CODIGO, ID
				 	         FROM RESERVA1 CROSS JOIN SERVICIO1
				              MINUS 
				              SELECT CODIGO_RES, ID_SERVICIO 
					         FROM CONSUMO
			                   )
					    )
    ON CODIGO=COD;

REM 3.3.1 Escriba en SQL las definiciones de las vistas que considere que son útiles y se
REM      justifica su creación para resolver algunas de las consultas, de acuerdo con su
REM      respuesta a la pregunta
REM No es tan necesario el uso de vistas pero si ayuda un poco en la visualizacion de la respuesta.

REM Reservas donde los clientes han consumido todos los servicios.
DROP VIEW CODSTODSER;
CREATE VIEW CODSTODSER AS
	SELECT CODIGO COD
		FROM RESERVA1
	MINUS
	SELECT DISTINCT CODIGO
		FROM(SELECT CODIGO, ID
				 	 FROM RESERVA1 CROSS JOIN SERVICIO1
				 MINUS 
				 SELECT CODIGO_RES, ID_SERVICIO 
					 FROM CONSUMO1
			   );

	SELECT *
		FROM RESERVA1 JOIN CODSTODSER 
				     ON CODIGO=COD;



SPOOL OFF
