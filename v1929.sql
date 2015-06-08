-- pregunta 45

select distinct t1.codfs
from frecuenta t1
where exists (select *
              from bebedor t7, bebida t8
              where t7.ci=t1.ci and 
              not exists (select *
                          from gusta t9
                          where t9.ci=t1.ci and 
                          exists (select *
                                  from vende t10
                                  where t10.codfs=t1.codfs and t10.codbeb=t8.codbeb))) and
not exists (select *
            from frecuenta f
            where f.codfs=t1.codfs and
not exists (select *
                  from vende t2
                  where t2.codfs=f.codfs and
                  not exists (select *
                              from gusta t4
                              where t4.ci=f.ci and
                              t4.codbeb=t2.codbeb)));

