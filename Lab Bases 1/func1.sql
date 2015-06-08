
CREATE OR REPLACE FUNCTION fclas_hab(hab CHAR) RETURN CHAR IS
suma NUMBER(3);
res CHAR(3);
BEGIN
SELECT SUM(FECHA_EGRESO-FECHA_INGRESO) INTO suma
FROM RESERVA JOIN ASIGNA ON CODIGO_RES=CODIGO
WHERE (FECHA_INGRESO BETWEEN '01-JAN-10' AND '30-JUN-10' AND NUMERO_HAB=hab);
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
