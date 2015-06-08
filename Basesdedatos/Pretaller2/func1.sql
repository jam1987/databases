REM ESTA FUNCION RECIBE COMO PARAMETRO EL NUMERO DE HABITACION
REM A CHEQUEAR . DEVUELVE COMO SALIDA EL CODIGO CORRESPONDIENTE
REM AL TIPO DE HABITACION, SI ES HAA, HMA, HDA, HPA O HBA.
CREATE OR REPLACE FUNCTION fclas_hab(hab CHAR) RETURN CHAR IS
suma NUMBER(3);
res CHAR(3);
BEGIN

/* AQUI SE REALIZA LA CONSULTA PARA OBTENER EL NUMERO DE DIAS
  TOTAL PARA UNA HABITACION DADA. */
SELECT SUM(FECHA_EGRESO-FECHA_INGRESO) INTO suma
FROM RESERVA JOIN ASIGNA ON CODIGO_RES=CODIGO
WHERE (TO_CHAR(FECHA_INGRESO,'DD-MON') BETWEEN '01-JAN' AND '30-JUN' AND NUMERO_HAB=hab);

/* AQUI SE HACE LA VERIFICACION PARA SABER EL TIPO DE HABITACION. */
IF (suma>180*0.9) THEN
    res:='HAA';
ELSIF suma BETWEEN 180*0.6 AND 180*0.9 THEN 
    res:='HMA';
ELSIF  suma BETWEEN 180*0.3 AND 180*0.6 THEN
    res:='HDA';
ELSIF suma BETWEEN 180*0.1 AND 180*0.3 THEN
    res:='HPA';
ELSE 
    res:='HBA';
END IF;
RETURN res;
END;
/