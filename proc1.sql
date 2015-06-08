CREATE PROCEDURE realiza_cierre(fechacierre DATE) IS
DECLARE
preciohab  NUMBER;
CURSOR e1 IS SELECT CODIGO_RES, SUM(MONTO)
FROM CONSUMO
WHERE FECHA_HORA=fechacierre
GROUP BY CODIGO_RES
ORDER BY CODIGO_RES;
reg_cierre CONSUMO.%ROWTIPE;
BEGIN
	OPEN e1;
	FETCH e1 INTO reg_cierre;
	WHILE e1.%FOUND LOOP
	    SELECT TARIFA INTO preciohab; 
	    FROM HABITA
	    WHERE NUMERO=reg_cierre.NUMERO_HAB;
	    IF (reg_cierre.SUM(MONTO)==0) THEN
		INSERT INTO RESERVA_CIERRE VALUES(reg_cierre.CODIGO_RES,fechacierre,preciohab);
	    ELSE
		INSERT INTO RESERVA_CIERRE VALUES(reg_cierre.CODIGO_RES, fechacierre, preciohab+reg_cierre.SUM(MONTO));
	    END IF;
	END LOOP;
	CLOSE e1;
END;
/
        

 
