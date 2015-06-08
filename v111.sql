-- pregunta 30

select distinct t1.codbeb
from vende t1
where not exists (select *
                  from frecuenta t2, bebedor t3
                  where t2.ci=t3.ci and t3.nombre='Luis Perez' and
                  not exists (select *
                              from vende t4
                              where t4.codbeb=t1.codbeb and t4.codfs=t2.codfs))
        and
                  not exists (select *
                              from bebida t5
                              where t5.codbeb in (select i.codbeb
                                                  from vende i
                                                  group by i.codbeb
                                                  having count(i.codbeb)>all (select count(j.codbeb)
                                                                              from vende j
                                                                              where j.codbeb=t1.codbeb
                                                                              group by j.codbeb)));

-- pregunta 32

select distinct t1.ci
from gusta t1
where not exists (select *
                  from bebedor t2
                  where t2.ci in (select i.ci
                                      from gusta i
                                      group by i.ci
                                      having count(i.ci)> all (select count(j.ci)
                                                                   from gusta j
                                                                   where j.ci=t1.ci
                                                                   group by j.ci)))
     and not exists (select *
                     from bebedor t2
                     where t2.ci in (select i.ci
                                     from frecuenta i
                                     group by i.ci
                                     having count(i.ci) > all (select count(j.ci)
                                                               from frecuenta j
                                                               where j.ci=t1.ci
                                                               group by j.ci)));


-- pregunta 36

select t1.codbeb
from vende t1
where exists (select *
              from gusta t2
              where exists (select *
                            from bebedor t3
                            where t3.ci=t2.ci and
                            t3.nombre='Luis Perez' and
                            not exists (select *
                                        from vende t4
                                        where t4.codfs=t1.codfs and
                                        t4.codbeb=t2.codbeb)))
      and t1.precio=(select max(i.precio)
                     from vende i);

 -- pregunta 37

select distinct t1.ci
from gusta t1
where not exists (select *
                  from vende t2, bebida t3
                  where t2.codbeb=t3.codbeb and 
                  t3.nombrebeb='Malta' and
                  not exists (select *
                              from vende t4
                              where t4.codfs=t2.codfs
                              and t4.precio=(select max(i.precio)
                                             from vende i
                                             where i.codfs=t4.codfs)))
order by t1.ci;

-- pregunta 33

select t1.codbeb, count(distinct t2.ci), count(distinct t3.codfs)
from bebida t1 left join gusta t2 on (t1.codbeb=t2.codbeb)  left join vende t3 on (t1.codbeb=t3.codbeb) 
group by t1.codbeb;

-- pregunta 35

select avg(t1.precio)
from vende t1 natural join bebida t2
where t2.nombrebeb='Malta' and
t1.codfs in (select t3.codfs
            from frecuenta t3 natural join bebedor t4
            where t4.nombre='Luis Perez');


 -- pregunta 36

 -- pregunta 39

 select codbeb, avg(precio)
 from vende
 group by codbeb
 order by codbeb;

 -- pregunta 40

 select avg(precio)
 from vende
 where codbeb in (select codbeb
                  from bebida 
                  except
                  select codbeb
                  from bebedor natural join gusta
                  where nombre='Luis Perez')