-- pregunta 43

select t1.ci
from bebedor t1
where not exists (select *
                  from frecuenta t2
                  where t2.ci=t1.ci and
                  exists (select *
                          from vende t3 natural join gusta t4
                          where t3.codfs=t2.codfs and
                          t4.ci=t1.ci));


-- pregunta 26

select t1.codbeb
from vende t1
where exists (select *
              from frecuenta t2 natural join bebedor t3
              where t3.nombre='Luis Perez' and
              t2.codfs=t1.codfs)
group by t1.codbeb
having count(t1.codbeb)>=2;

-- pregunta 16

select distinct t1.ci
from gusta t1
where not exists (select *
                  from frecuenta t2 natural join vende t3
                  where not exists (select *
                                    from gusta t4
                                    where t4.codbeb=t3.codbeb and t4.ci=t2.ci and
                                    t4.ci=t1.ci))
                                
                      
                              