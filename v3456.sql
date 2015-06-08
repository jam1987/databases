-- pregunta 13

select t1.ci
from frecuenta t1
where not exists (select *
                  from fuentessoda t2 natural join vende t3
                  where not exists (select *
                                    from gusta t4
                                    where t4.ci=t1.ci and t4.codbeb=t3.codbeb
                                    and exists (select *
                                                from frecuenta t5
                                                where t5.codfs=t3.codfs and
                                                t5.ci=t1.ci)) and
                   not exists (select *
                               from fuentessoda t7
                               where t7.codfs!=t3.codfs and
                               t7.codfs=t1.codfs and not exists (select *
                                                                 from bebida t8
                                                                 where t8.codbeb!=t3.codbeb)));

                        
-- pregunta 12
 
select t1.ci
from frecuenta t1
where not exists (select *
                  from fuentessoda t2 natural join gusta t3
                  where not exists (select *
                                    from  vende t4
                                    where t4.codfs=t1.codfs and t4.codbeb=t3.codbeb
                                    and not exists (select *
                                                    from vende t5
                                                    where t5.codfs
                                    
      