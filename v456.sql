-- pregunta 41

select distinct t1.ci
from frecuenta t1
where exists (select *
              from vende t2
              where t2.codfs=t1.codfs and
              exists (select *
                      from gusta t3
                      where t3.ci=t1.ci and t3.codbeb=t2.codbeb))
group by t1.ci
having count(t1.ci)>=3
order by t1.ci;

-- pregunta 42

select distinct t1.codfs
from frecuenta t1
where t1.ci in (select j.ci
                from gusta j
                where exists (select *
                              from vende t2
                              where t2.codbeb=j.codbeb and
                              t2.codfs=t1.codfs)
               group by j.ci
               having count(j.ci)>=3)
group by t1.codfs
having count(t1.codfs)>=2
order by t1.codfs;

-- pregunta 44

select distinct t1.codfs
from vende t1
where not exists (select *
                  from vende t2
                  where t2.codfs=t1.codfs and
                  exists (select *
                          from frecuenta t3
                          where t3.codfs=t2.codfs and
                          not exists (select *
                                      from gusta t4
                                      where t4.codbeb=t2.codbeb and t4.ci=t3.ci)));

-- pregunta 46

select distinct t1.codfs
from frecuenta t1
where not exists (select *
                  from bebedor t3
                  where t3.ci in (select  i.ci
                                  from gusta i
                                  group by i.ci
                                  having count(i.ci)>all (select count(j.ci)
                                                          from gusta j
                                                          where j.ci=t1.ci
                                                          group by j.ci)))
order by t1.codfs;

-- pregunta 49

select distinct t1.codbeb
from vende t1
where not exists (select *
                  from fuentessoda t2
                  where t2.codfs in (select i.codfs
                                     from frecuenta i
                                     group by i.codfs
                                     having count(i.codfs)>all(select count(j.codfs)
                                                               from frecuenta j
                                                               where j.codfs=t1.codfs))) and
     exists (select *
             from gusta t3
             where t3.codbeb=t1.codbeb and
             not exists (select *
                         from bebedor t4
                         where t4.ci in (select y.ci
                                        from gusta y
                                        group by y.ci
                                        having count(y.ci)>all(select count(*)
                                                               from gusta z
                                                               where z.ci=t3.ci))));

-- pregunta 50


select distinct t1.codbeb
from vende t1
where not exists (select *
                  from fuentessoda t2
                  where t2.codfs in (select i.codfs
                                     from frecuenta i
                                     group by i.codfs
                                     having count(i.codfs)>all(select count(j.codfs)
                                                               from frecuenta j
                                                               where j.codfs=t1.codfs))) and
      exists (select *
              from gusta t3
              where not exists (select *
                                from bebida t4
                                where t4.codbeb in (select y.codbeb
                                                    from gusta y
                                                    group by y.codbeb
                                                    having count(y.codbeb)<all(select count(*)
                                                                               from gusta z
                                                                               where z.codbeb=t1.codbeb))));

-- pregunta 21

select distinct t1.ci
from bebedor t1
where exists (select *
              from gusta t2
              where t2.ci!=t1.ci and
              exists (select *
                      from gusta t3, bebedor t4
                      where t3.ci=t4.ci and t4.nombre!='Luis Perez' and
                      t3.codbeb=t2.codbeb and
                      t4.ci in (select i.ci
                                from gusta i
                                group by i.ci
                                having count(i.ci)>=2)))
  order by t1.ci
		

