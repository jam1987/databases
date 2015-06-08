REM procedimiento que prueba la funcion1 y determina si es coherente el propietario.

DROP PROCEDURE prueba;
CREATE OR REPLACE PROCEDURE prueba(cedula char) 
IS
coherencia boolean default true;
BEGIN 
SELECT det_coherencia(cedula) INTO coherencia FROM DUAL;
IF coherencia =TRUE then
DBMS_OUTPUT.PUT_LINE('COHERENTE');
ELSE coherencia =FALSE then
DBMS_OUTPUT.PUT_LINE('NO COHERENTE');
END;
/
