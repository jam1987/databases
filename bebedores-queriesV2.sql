-- CONSULTAS BEBEDORES VERSION CALCULO

-- PREGUNTA 1

SELECT t1.CI
FROM BEBEDOR t1
WHERE NOT EXISTS (SELECT *
		  FROM GUSTA t2, BEBIDA t3
		  WHERE t2.codbeb=t3.codbeb AND
		  t2.CI=t1.CI AND
		  t3.NOMBREBEB='Malta')
ORDER BY CI;

-- PREGUNTA 2

SELECT t1.CODFS
FROM FUENTESSODA t1
WHERE NOT EXISTS (SELECT *
		   FROM FRECUENTA t2, BEBEDOR t3
		   WHERE t2.CI=t3.CI AND
		   t1.CODFS=t2.CODFS AND
		   t3.NOMBRE='Luis Perez');

-- PREGUNTA 3

SELECT t1.CI
FROM BEBEDOR t1
WHERE EXISTS (SELECT *
	      FROM GUSTA t2
	      WHERE t2.CI=t1.CI AND
	      EXISTS (SELECT *
		      FROM FRECUENTA t3
		      WHERE t3.ci=t1.ci))
ORDER BY CI;

-- PREGUNTA 4

SELECT t1.CI, t2.CODBEB
FROM BEBEDOR t1, BEBIDA t2
WHERE NOT EXISTS (SELECT *
		  FROM GUSTA t3
		  WHERE t3.CI=t1.CI AND
		  t3.CODBEB=t2.CODBEB);

-- PREGUNTA 5

select t1.ci
from gusta t1
where exists (select *
	      from bebida t2
	      where t2.codbeb=t1.codbeb and
	      t2.nombrebeb='Malta') and  
      not exists (select *
                  from gusta t3
                  where t3.ci=t1.ci and
                  exists (select *
                          from bebida t4
                          where t4.codbeb=t3.codbeb and
                          t4.nombrebeb='Frescolita')) and
     not exists (select *
                  from gusta t3
                  where t3.ci=t1.ci and
                  exists (select *
                          from bebida t4
                          where t4.codbeb=t3.codbeb and
                          t4.nombrebeb='CocaCola'))

-- PREGUNTA 6

SELECT DISTINCT t1.CI
FROM GUSTA t1
WHERE NOT EXISTS (SELECT *
		  FROM GUSTA t2, BEBEDOR t3
		  WHERE t2.CI=t3.CI AND
		  t3.NOMBRE='Luis Perez' AND
		  NOT EXISTS (SELECT *
			      FROM GUSTA t4
			      WHERE t4.CI=t1.CI AND
			      t4.CODBEB=t2.CODBEB))

ORDER BY CI;

-- PREGUNTA 7

SELECT DISTINCT t1.CI
FROM FRECUENTA t1
WHERE NOT EXISTS (SELECT *
		  FROM FRECUENTA t2, BEBEDOR t3
		  WHERE t2.CI=t3.CI AND
		  t3.NOMBRE='Luis Perez' AND
		  NOT EXISTS (SELECT *
			      FROM FRECUENTA t4
			      WHERE t4.CI=t1.CI AND
			      t4.CODFS=t2.CODFS))

ORDER BY CI;

-- PREGUNTA 8

SELECT DISTINCT t1.CI
FROM FRECUENTA t1
WHERE EXISTS (SELECT *
	      FROM FRECUENTA t2, BEBEDOR t3
	      WHERE t2.CI=t3.CI AND
	      t2.CODFS=t1.CODFS AND
	      t3.NOMBRE='Luis Perez')

ORDER BY CI;

-- PREGUNTA 9

SELECT DISTINCT t1.CI
FROM FRECUENTA t1
WHERE t1.CODFS  IN (SELECT t2.CODFS
	      FROM FRECUENTA t2, BEBEDOR t3
	      WHERE t2.CI=t3.CI AND
	      t3.NOMBRE='Luis Perez' AND
	      t1.CODFS=t2.CODFS)   
     AND NOT EXISTS (SELECT *
		  FROM FRECUENTA t2, BEBEDOR t3
		  WHERE t2.CI=t3.CI AND
		  t3.NOMBRE='Luis Perez' AND
		  NOT EXISTS (SELECT *
			      FROM FRECUENTA t4
			      WHERE t4.CI=t1.CI AND
			      t4.CODFS=t2.CODFS))


      
ORDER BY t1.CI;

-- PREGUNTA 10

SELECT DISTINCT t1.CI
FROM FRECUENTA t1
WHERE EXISTS (SELECT *
	      FROM VENDE t2
	      WHERE t2.CODFS=t1.CODFS AND
	      EXISTS (SELECT *
		      FROM GUSTA t3
		      WHERE t3.CI=t1.CI AND
		      t3.CODBEB=t2.CODBEB))

ORDER BY CI;

-- PREGUNTA 11

SELECT t1.CI
FROM FRECUENTA t1
WHERE NOT EXISTS (SELECT *
		  FROM GUSTA t2
		  WHERE NOT EXISTS (SELECT *
				    FROM GUSTA t3, VENDE t4
				    WHERE t3.CODBEB=t2.CODBEB AND
				    t3.CODBEB=t4.CODBEB AND
				    t4.CODFS=t1.CODFS AND
				    t3.CI=t1.CI));

-- PREGUNTA 12

SELECT t1.CI
FROM BEBEDOR t1
WHERE NOT EXISTS (SELECT *
		  FROM FRECUENTA t2
		  WHERE NOT EXISTS (SELECT *
				    FROM FRECUENTA t3
				    WHERE t3.CI=t1.CI AND t3.CODFS=t2.CODFS AND
				    NOT EXISTS (SELECT *
						FROM GUSTA t4
						WHERE NOT EXISTS (SELECT *
								  FROM GUSTA t5, VENDE t6
								  WHERE t4.CODBEB=t6.CODBEB AND 
								  t5.CODBEB=t4.CODBEB AND 
								  t5.CI=t1.CI AND t6.CODFS=t3.CODFS ))))

