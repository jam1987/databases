SET SERVEROUTPUT ON
ALTER SESSION SET NLS_DATE_FORMAT = 'MON-YYYY';
CREATE OR REPLACE PROCEDURE calcula_dif(idinm CHAR,nrouni NUMBER,mont NUMBER,anio NUMBER)
IS
year CHAR(2);
month CHAR(3); 
monthyear CHAR(8);
fechap DATE;
monto gasto.monto%type;
montop gasto.monto%type;
diferencia gasto.monto%type;
CURSOR e1 IS SELECT
	     monto
	     FROM
	     gasto
	     WHERE
	     ((incurre_u_id_inm=idinm AND
	      incurre_u_nro_unid=nrouni) OR
	      (incurre_i_id_inm=idinm)) AND
	      fecha=fechap;
	     
montototal condominio.monto%type;

BEGIN 
	montop:=0;
	IF mont=1 THEN
	  month:='JAN';
	END IF;
        IF mont=2 THEN
	  month:='FEB';
	END IF;
	IF mont=3 THEN
	  month:='MAR';
	END IF;
	IF mont=4 THEN
	  month:='APR';
	END IF;
	IF mont=5 THEN
	  month:='MAY';
	END IF;
	IF mont=6 THEN
	  month:='JUN';
	END IF;
	IF mont=7 THEN
	  month:='JUL';
	END IF;
	IF mont=8 THEN
	  month:='AUG';
	END IF;
	IF mont=9 THEN
	  month:='SEP';
	END IF;
	IF mont=10 THEN
	  month:='OCT';
	END IF;
	IF mont=11 THEN
	  month:='NOV';
	END IF;
	IF mont=12 THEN
	  month:='DEC';
	END IF;

	monthyear:=month || '-' || TO_CHAR(anio);
	fechap:=TO_DATE(monthyear);

	SELECT
	  monto
	INTO
	  montototal
	FROM
	  condominio c
	WHERE
	  c.idinmueble=idinm AND
	  c.nrounidad=nrouni AND
	  c.mes=mont AND
	  c.ano=anio;


	FOR reg1 IN e1 LOOP
	    montop:=montop+reg1.monto; 
	 
	END LOOP;

diferencia:=montototal-montop;
	
DBMS_OUTPUT.PUT_LINE('La diferencia es: ');
 DBMS_OUTPUT.PUT_LINE(diferencia);
	


END;
/

