-- pregunta 34

select t1.codfs
from vende t1
where exists (select *
	      from bebida t2
	      where t2.nombrebeb='Malta' and
	      t2.codbeb=t1.codbeb and
	      t1.precio = (select min(i.precio)
	                   from vende i
	                   where i.codbeb=t2.codbeb));


-- pregunta 27

select t1.codbeb
from vende t1
where not exists (select *
                  from gusta t2, bebida t3
                  where t2.codbeb=t3.codbeb and
                  t3.nombrebeb='Malta' and
                  not exists (select *
                              from frecuenta t4
                              where t4.ci=t2.ci and
                              t4.codfs=t1.codfs));

-- pregunta 28

select t1.codbeb
from vende t1
where not exists (select *
                  from gusta t2, bebida t3
                  where t2.codbeb=t3.codbeb and
                  t3.nombrebeb!='Malta' and
                  not exists (select *
                              from frecuenta t4
                              where t4.ci=t2.ci and
                              t4.codfs=t1.codfs));

-- pregunta 29

select t1.codfs
from frecuenta t1
where exists (select *
              from gusta t2
              where t2.ci=t1.ci and
              exists (select *
                      from bebida t3
                      where t3.codbeb=t2.codbeb and
                      t3.nombrebeb='Malta')) and
      exists (select *
              from frecuenta t4, fuentessoda t5
              where t4.codfs=t5.codfs
              and t4.ci=t1.ci and t5.nombre='La Montana');

-- pregunta 30

select t1.codfs
from vende t1
where exists (select *
              from bebida t2
              where t2.codbeb=t1.codbeb and
              t2.nombrebeb='Malta') and
      not exists (select *
                  from fuentessoda t3
                  where t3.codfs in (select i.codfs
                                     from frecuenta i
                                     group by i.codfs
                                     having count(i.codfs)> all (select count(j.codfs)
                                                                 from frecuenta j
                                                                 where j.codfs=t1.codfs
                                                                 group by j.codfs)))