CREATE OR REPLACE PROCEDURE realiza_cierre (fecha_cierre CHAR)
IS
            monto consumo.monto%type;
	    tarif habita.tarifa%type;
	    total reserva_cierre.monto_total%type;

CURSOR cierre  IS
          SELECT *
          FROM reserva
          WHERE to_date(fecha_cierre) between fecha_ingreso and fecha_egreso ;

BEGIN
  FOR filas IN cierre LOOP


select sum(monto)
into  monto
from consumo c
where codigo_res = filas.codigo
and fecha_cierre = to_char(c.fecha_hora, 'DD-MON-YY');  

select sum(tarifa)
into tarif
from habita h join asigna a
on (a.numero_hab = h.numero)
where codigo_res = filas.codigo;

if monto is NULL then monto := 0; end if;

total:= monto + tarif;
insert into reserva_cierre values ( filas.codigo , to_date(fecha_cierre), total);

  END LOOP;

COMMIT;
END;
/
