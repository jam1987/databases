REM ESTE PROCEDIMIENTO ES USADO PARA PROBAR LA FUNCION FCLAS_HAB.
REM RECIBE COMO PARAMETRO AL NUMERO DE HABITACION COMO CARACTER
REM PARA QUE LUEGO SEA PASADO COMO PARAMETRO A LA FUNCION FCLAS_HAB.
REM EL RESULTADO LO IMPRIME POR PANTALLA.

SPOOL func1.txt
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE pclas_hab(hab CHAR) IS
	clashab CHAR(3);
        BEGIN
        /* AQUI SE APLICA LA FUNCION FCLAS_HAB AL PARAMETRO HAB. */
	SELECT fclas_hab(hab) INTO clashab FROM DUAL;
        DBMS_OUTPUT.PUT_LINE(clashab);
        END;

/

EXEC pclas_hab('A001');
EXEC pclas_hab('A002');
EXEC pclas_hab('D007');


SPOOL OFF
