﻿-- PREGUNTA 1

-- DAR LOS BEBEDORES QUE NO LES GUSTA LA MALTA

SELECT DISTINCT CI
FROM BEBEDOR
WHERE CI NOT IN (SELECT CI
		 FROM GUSTA NATURAL JOIN BEBIDA
		 WHERE NOMBREBEB='Malta')
ORDER BY CI;

-- PREGUNTA 2

-- LAS FUENTES DE SODA QUE NO SON FRECUENTADAS POR LUIS PEREZ

SELECT CODFS
FROM FUENTESSODA
WHERE CODFS NOT IN ( SELECT CODFS
		      FROM BEBEDOR NATURAL JOIN FRECUENTA
		      WHERE NOMBRE='Luis Perez');

-- PREGUNTA 3

-- LOS BEBEDORES QUE FRECUENTAN AL MENOS UNA FUENTE DE SODA Y QUE LES GUSTA AL MENOS UNA BEBIDA

SELECT DISTINCT g.CI
FROM GUSTA g, FRECUENTA f
WHERE g.CI=f.CI
ORDER BY CI;

-- PREGUNTA 4

-- PARA CADA BEBEDOR, LAS BEBIDAS QUE NO LES GUSTA

SELECT CI, CODBEB
FROM BEBEDOR, BEBIDA
EXCEPT
SELECT *
FROM GUSTA
ORDER BY CI;

-- PREGUNTA 5

-- LOS BEBEDORES QUE LES GUSTA LA MALTA Y QUE NO LES GUSTA LA FRESCOLITA NI LA COCACOLA

SELECT CI
FROM BEBEDOR
WHERE CI IN (SELECT CI
	     FROM GUSTA NATURAL JOIN BEBIDA
	     WHERE NOMBREBEB = 'Malta')
      AND CI NOT IN ( SELECT CI
		      FROM GUSTA NATURAL JOIN BEBIDA
		      WHERE NOMBREBEB = 'Frescolita')
     AND CI NOT IN ( SELECT CI
		      FROM GUSTA NATURAL JOIN BEBIDA
		      WHERE NOMBREBEB = 'CocaCola');

-- PREGUNTA 6

-- LOS BEBEDORES QUE NO LES GUSTAN LAS BEBIDAS QUE LES GUSTA A LUIS PEREZ

SELECT CI
FROM BEBEDOR
WHERE CI NOT IN (
	SELECT CI
	FROM GUSTA
	WHERE CODBEB IN (SELECT CODBEB
			  FROM GUSTA NATURAL JOIN BEBEDOR
			  WHERE NOMBRE='Luis Perez')
	GROUP BY CI
	HAVING COUNT(CI)=(SELECT COUNT(*)
			  FROM GUSTA NATURAL JOIN BEBEDOR
			  WHERE NOMBRE='Luis Perez'))
ORDER BY CI;

-- PREGUNTA 7

-- LOS BEBEDORES QUE FRECUENTAN LAS FUENTES DE SODA QUE FRECUENTA LUIS PEREZ

SELECT CI
FROM BEBEDOR
WHERE CI IN ( SELECT CI
              FROM FRECUENTA
              WHERE CODFS IN (SELECT CODFS
			       FROM FRECUENTA NATURAL JOIN BEBEDOR
			       WHERE NOMBRE = 'Luis Perez')
	      GROUP BY CI
	      HAVING COUNT(CI) = (SELECT COUNT(*)
				  FROM FRECUENTA NATURAL JOIN BEBEDOR
				  WHERE NOMBRE='Luis Perez'));

-- PREGUNTA 8

-- LOS BEBEDORES QUE FRECUENTAN ALGUNAS FUENTES DE SODA QUE FRECUENTA LUIS PEREZ

SELECT DISTINCT CI
FROM FRECUENTA
WHERE CODFS IN (SELECT CODFS
		FROM FRECUENTA NATURAL JOIN BEBEDOR
		WHERE NOMBRE='Luis Perez')
ORDER BY CI;

-- PREGUNTA 9

-- LOS BEBEDORES QUE FRECUENTAN SOLO LAS FUENTES DE SODA QUE FRECUENTA LUIS PEREZ

(SELECT CI
FROM FRECUENTA
WHERE CODFS IN (SELECT CODFS
		FROM FRECUENTA NATURAL JOIN BEBEDOR
		WHERE NOMBRE='Luis Perez') AND
      CI NOT IN ( SELECT CI
		  FROM BEBEDOR
		  WHERE NOMBRE='Luis Perez')
GROUP BY CI
HAVING COUNT(CI) = (SELECT COUNT(*)
		    FROM FRECUENTA NATURAL JOIN BEBEDOR
		    WHERE NOMBRE='Luis Perez'))
EXCEPT
SELECT CI
FROM FRECUENTA
WHERE CODFS NOT IN (SELECT CODFS
		FROM FRECUENTA NATURAL JOIN BEBEDOR
		WHERE NOMBRE='Luis Perez');

-- PREGUNTA 10

-- LOS BEBEDORES QUE FRECUENTAN ALGUNA FUENTE DE SODA QUE SIRVE ALGUNA BEBIDA QUE LES GUSTE

SELECT DISTINCT g.CI
FROM GUSTA g, Frecuenta f, VENDE v
WHERE g.ci=f.ci AND g.codbeb=v.codbeb AND f.codfs=v.codfs
ORDER BY g.CI;

-- PREGUNTA 11

-- LOS BEBEDORES QUE FRECUENTAN FUENTES DE SODA QUE VENDEN AL MENOS TODAS LAS BEBIDAS QUE LES GUSTA

SELECT CI
FROM FRECUENTA f
WHERE CODFS IN (SELECT CODFS
		FROM VENDE
		WHERE CODBEB IN (SELECT CODBEB
				 FROM GUSTA g
				 WHERE f.CI=g.CI)
		GROUP BY CODFS
		HAVING COUNT(CODFS) = (SELECT COUNT(*)
					FROM GUSTA g
					WHERE g.CI=f.CI
					GROUP BY g.CI))
ORDER BY CI;

-- PREGUNTA 12

-- LOS BEBEDORES QUE SOLO FRECUENTAN LAS FUENTES DE SODA QUE SIRVEN AL MENOS LAS BEBIDAS QUE LES GUSTA

SELECT CI
FROM BEBEDOR b
WHERE CI IN (
SELECT f.CI
FROM FRECUENTA f
WHERE f.CI=b.CI AND 
     CODFS IN (SELECT CODFS
		FROM VENDE
		WHERE CODBEB IN (SELECT CODBEB
				 FROM GUSTA g
				 WHERE f.CI=g.CI)
		GROUP BY CODFS
		HAVING COUNT(CODFS) = (SELECT COUNT(*)
					FROM GUSTA g
					WHERE g.CI=f.CI
					GROUP BY g.CI)))
GROUP BY CI
HAVING COUNT(CI)= (
SELECT COUNT(*)
FROM FRECUENTA f
WHERE f.CI=b.CI AND 
     CODFS IN (SELECT CODFS
		FROM VENDE
		WHERE CODBEB IN (SELECT CODBEB
				 FROM GUSTA g
				 WHERE f.CI=g.CI)
		GROUP BY CODFS
		HAVING COUNT(CODFS) = (SELECT COUNT(*)
					FROM GUSTA g
					WHERE g.CI=f.CI
					GROUP BY g.CI))
GROUP BY CODFS)
ORDER BY CI;