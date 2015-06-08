-- pregunta 48

select t0.codfs
from fuentessoda t0
where not exists (
select *
from gusta t1
where not exists (select *
		  from bebida t2
		  where t2.codbeb in (select i.codbeb
				      from gusta i
				      group by i.codbeb
				      having count(i.codbeb)>all(select count(j.codbeb)
								  from gusta j
								  where j.codbeb=t1.codbeb
								  group by j.codbeb)))
		and not exists (select *
		                from vende t7
		                where t7.codbeb=t1.codbeb and
		                t7.codfs=t0.codfs));