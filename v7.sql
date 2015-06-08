-- PREGUNTa 15

select t1.ci
from bebedor t1
where not exists (select *
		  from gusta t2, bebedor t3
		  where t3.nombre='Luis Perez' and
		  t2.ci=t3.ci and
		  not exists (select *
		  from vende t4
		  where t4.codbeb=t2.codbeb and
		  not exists (select *
			      from frecuenta t5
			      where (t5.codfs!=t4.codfs or 
			      t1.ci!=t5.ci))))
order by ci