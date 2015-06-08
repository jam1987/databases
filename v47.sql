-- pregunta 47

select distinct t1.codbeb
from gusta t1
where not exists (select *
		  from bebida t2
		  where t2.codbeb in (select i.codbeb
				      from gusta i
				      group by i.codbeb
				      having count(i.codbeb)>all(select count(j.codbeb)
								  from gusta j
								  where j.codbeb=t1.codbeb
								  group by j.codbeb)));


-- pregunta 48

select t1.codfs
from vende t1
where not exists (  select *
		    from gusta t2
                    where exists (select *
		    from bebida t3
		    where t3.codbeb in (select i.codbeb
				        from gusta i
				        group by i.codbeb
				        having count(i.codbeb)>all(select count(j.codbeb)
							       	  from gusta j
								  where j.codbeb=t2.codbeb
								  group by j.codbeb)))     
	                and not exists (select *
			       from vende t6
			       where t6.codbeb=t2.codbeb
			       and t6.codfs=t1.codfs))
			       



								  