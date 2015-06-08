REM funcion booleana que calcula si un propietario es coherente o no coherente 

create function det_coherencia (CEDULA char)
return 
boolean 
is
numero NUMBER(3);
numero1 NUMBER(3);  
ischeck boolean DEFAULT TRUE;
begin

CURSOR e1 IS SELECT 
	       c.IDINMUEBLE,
	       c.nrounidad,
		COUNT(c.IDINMUEBLE) AS contador
		FROM
		CONDOMINIO c, UNIDAD u
		WHERE 
		u.CEDULAPROP=CEDULA AND
		c.IDINMUEBLE=u.IDINMUEBLE
		GROUP BY c.NROUNIDAD, c.INMUEBLE;


FOR reg1 IN e1 LOOP
  ischeck:=ischeck AND (reg1.contador>0);
END LOOP;






SELECT count(NUMERO) into numero
FROM UNIDAD 
WHERE  CEDULA=CEDULAPROP;



SELECT u.IDINMUEBLE, count(u.NUMERO) into  numero1
FROM UNIDAD u JOIN CONDOMINIO c
ON u.IDINMUEBLE=c.IDINMUEBLE  AND c.FECHAPAGO IS NULL AND CEDULA=u.CEDULAPROP 
GROUP BY u.IDINMUEBLE;


if numero=1 then
 return TRUE;
elsif numero1=0
return TRUE;
else return ischeck;
END if;






