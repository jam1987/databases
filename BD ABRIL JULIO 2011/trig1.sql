CREATE OR REPLACE TRIGGER CHECGASTO 
BEFORE INSERT ON GASTO
FOR EACH ROW
DECLARE
  fecha1 DATE;
  fecha2 DATE;
  fechaexcep EXCEPTION;
BEGIN
SELECT 
  fechacont
INTO 
  fecha1
FROM
  inmueble
WHERE
  ID=:new.incurre_u_id_inm OR
  ID=:new.incurre_i_id_inm;

IF (:new.fecha<fecha1) THEN
  RAISE fechaexcep;
END IF;

EXCEPTION
  WHEN fechaexcep THEN
    raise_application_error (-20300, 'Fecha' ||TO_CHAR(:new.fecha)||'Fuera de rango');
END;
/

CREATE OR REPLACE TRIGGER CHECKNUMBERUNITS
BEFORE INSERT ON UNIDAD
FOR EACH ROW 
DECLARE 
numunids NUMBER;
numfilas NUMBER;
unidadesnocoincidentes EXCEPTION;
BEGIN
SELECT
COUNT(IDINMUEBLE)
INTO
numfilas
FROM
unidad
WHERE
IDINMUEBLE=:new.IDINMUEBLE
GROUP BY IDINMUEBLE;

SELECT 
nrounids
INTO
numunids
FROM
INMUEBLE
WHERE
ID=:new.IDINMUEBLE;
numfilas:=numfilas+1;
IF numunids!=numfilas THEN
RAISE unidadesnocoincidentes;
END IF;
EXCEPTION
  WHEN unidadesnocoincidentes THEN
    raise_application_error (-20301,'Numero de unidad se sobrepasa ');
END;
/




