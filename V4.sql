-- PREGUNTA 22

SELECT t1.CI
FROM BEBEDOR t1
WHERE NOT EXISTS (SELECT *
		  FROM GUSTA t2
		  WHERE t2.CI=t1.CI AND
		  EXISTS (SELECT *
			  FROM FRECUENTA t3
			  WHERE t3.CI=t1.CI));

-- PREGUNTA 23

SELECT t1.CI, t2.CODFS, t3.codbeb
from bebedor t1, fuentessoda t2 , bebida t3
where not exists (select *
		  from gusta t4, frecuenta t5
		  where t4.ci=t1.ci and t4.codbeb=t3.codbeb and
		  t5.codfs=t2.codfs);

-- Pregunta 24

select t1.codbeb, t1.ci, t2.codfs
from gusta t1, vende t2
where t1.codbeb=t2.codbeb;

-- pregunta 25

select t1.codbeb
from bebida t1
where not exists (select *
		  from gusta t2
		  where t2.codbeb=t1.codbeb and
		  exists (select *
		          from vende t3
		          where t3.codbeb=t1.codbeb));

