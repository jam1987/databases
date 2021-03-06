REM ESTE PROCEDIMIENTO REALIZA LA TOTALIZACION DEL CONSUMO Y DEL COSTO DE CADA
REM UNA DE LAS HABITACIONES DADA UNA FECHA. RECIBE COMO PARAMETRO A LA FECHA A 
REM BUSCAR Y INTRODUCE EL RESULTADO DENTRO DE LA TABLA RESERVA_CIERRE.

SPOOL proc1.txt

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE realiza_cierre(fechacierre CHAR) IS
montocons   CONSUMO.MONTO%TYPE;
montotarif   HABITA.TARIFA%TYPE;
montototal   RESERVA_CIERRE.MONTO_TOTAL%TYPE;

/*  ESTE CURSOR ES PARA PODER MOVERSE DENTRO DE LA TABLA RESERVA, PARA ASI OBTE-
    NER LOS DATOS PARA DADA UNA FECHA QUE PERTENEZCA A UN RANGO DE FECHAS DE UNA
    RESERVACION. */
CURSOR cierredia is
	SELECT * FROM RESERVA 
	WHERE to_date(fechacierre) between FECHA_INGRESO AND FECHA_EGRESO;
 
BEGIN   

	/* ESTE CICLO PERMITE LISTAR CADA UNO DE LOS DATOS OBTENIDOS CON EL CURSOR
	   ANTERIOR, PARA OBTENER EL MONTO TOTAL DEL CONSUMO. */
	FOR filacierre in cierredia LOOP
		/* SE OBTIENE EL MONTO TOTAL DE CONSUMOS POR RESERVACION */ 
		SELECT sum(monto) INTO montocons 
		FROM CONSUMO c
		WHERE CODIGO_RES = filacierre.CODIGO AND fechacierre = TO_CHAR(c.FECHA_HORA,'DD-MON-YY');
		
		/* SE OBTIENE LA TARIFA DE CADA HABITACION PERTENECIENTE A CADA UNA 
		   DE LAS RESERVACIONES. */
		SELECT SUM(TARIFA) INTO montotarif
		FROM HABITA h JOIN ASIGNA a ON (a.numero_hab = h.numero)
		WHERE codigo_res = filacierre.codigo;

		/* SI EL MONTO TOTAL DE CONSUMOS PARA ESE DIA ES NULO, ENTONCES SE 
		   COLOCA ESE MONTO EN CERO. */
		IF montocons IS NULL THEN montocons := 0;
		END IF;

		/* SE HACE LA TOTALIZACION DE LOS DOS MONTOS. */
		montototal := montocons + montotarif;

		/*SE HACE LA INSERCION DE LOS DATOS RESULTANTES DENTRO DE LA TABLA RESERVA_CIERRE. */
		INSERT INTO RESERVA_CIERRE VALUES (filacierre.CODIGO, TO_DATE(fechacierre),montototal);

	END LOOP;
COMMIT;
END;	
	
/

EXEC realiza_cierre('19-JUN-10');
SELECT * FROM RESERVA_CIERRE;

SPOOL OFF
 
