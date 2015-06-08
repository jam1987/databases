
-- 1

-- SELECT CI
-- FROM BEBEDOR
-- WHERE NOT EXISTS (SELECT *
--		  FROM GUSTA
--		  WHERE EXISTS (SELECT *
--				FROM BEBIDAS
----				WHERE NOMBREBEB='MALTA' AND CODBEB=CODBEBIDA AND CI=CIP));
---- CORRECTO

---- 2
 
---- SELECT DISTINCT CODFS
---- FROM FUENTESSODA
---- WHERE NOT EXISTS (SELECT *
----		  FROM FRECUENTA
----		  WHERE EXISTS (SELECT *
----				FROM BEBEDOR
----				WHERE NOMBRE='Luis Perez' AND CI=CIPERSONA AND CODIGOFUENTE=CODFS));



---- CORRECTO

---- 3

---- SELECT DISTINCT CIP
---- FROM GUSTA
---- WHERE EXISTS ( SELECT *
----		FROM FRECUENTA
----		WHERE CIP=CIPERSONA);

---- CORRECTO

---- 4


---- SELECT DISTINCT CI, CODBEB
---- FROM BEBEDOR, BEBIDAS
---- WHERE NOT EXISTS ( SELECT *
----		FROM GUSTA
----		WHERE CI=CIP AND CODBEB=CODBEBIDA)
---- ORDER BY CI;

---- CORRECTO!!!

-- 5

--SELECT
--bebedor.ci, fuentessoda.codfs
--FROM
--public.bebedor,public.fuentessoda
--WHERE
--EXISTS (SELECT
--	*
--	FROM
--	public.vende v1
--	WHERE
--	v1.codigofs=fuentessoda.codfs AND
--	EXISTS (SELECT
--		*
--		FROM
--		public.gusta g1
--		WHERE
--		g1.cip=bebedor.ci
--		AND
--		g1.codbebida=v1.codigobeb AND
--		NOT EXISTS (SELECT
--			    *
--			    FROM
--			    public.bebidas
--			    WHERE
--			    EXISTS (SELECT
--				    *
--				    FROM
--				    public.vende v2
--				    WHERE
--				    v2.codigofs=v1.codigofs AND
--				    v2.codigobeb=bebidas.codbeb AND
--				    (bebedor.ci,v2.codigobeb) NOT IN (SELECT
--								      *
--								      FROM
--								      public.gusta g2))
--			    )));
--
--CORRECTO!!!

---- 6

-- CORRECTO!!!!				    
	    
---- 7

---- SELECT DISTINCT CI
---- FROM BEBEDOR t1
---- WHERE EXISTS ( SELECT *
----	       FROM BEBIDAS t2
---- 	       WHERE t2.NOMBREBEB='MALTA' AND EXISTS ( SELECT *
----						       FROM GUSTA t3
----						       WHERE t3.CODBEBIDA=t2.CODBEB AND t1.CI=t3.CIP AND NOT EXISTS ( SELECT *
----														      FROM GUSTA t4
----														      WHERE t4.CIP=t1.CI AND EXISTS ( SELECT *
---- FROM BEBIDAS t5
---- WHERE t5.CODBEB=t4.CODBEBIDA AND ((t5.NOMBREBEB='COCA COLA' AND t5.NOMBREBEB!='FRESCOLITA') OR (t5.NOMBREBEB!='COCA COLA' AND 
---- t5.NOMBREBEB='FRESCOLITA'))))));

---- CORRECTO!!! 

-- 8

--SELECT
--t1.ci
--FROM
--public.bebedor t1
--WHERE
--NOT EXISTS (SELECT 
--	    *
--	    FROM
--	    public.gusta t3
--	    WHERE
--	    t3.cip=t1.ci AND
--	    NOT EXISTS (SELECT
--			*
--			FROM 
--			public.bebedor t2
--			WHERE
--			t2.nombre='Luis Perez' AND
--			NOT EXISTS (SELECT
--				    *
--				    FROM
--				    public.gusta t4
--				    WHERE
--				    t4.cip=t2.ci AND
--				    t4.codbebida=t3.codbebida)));
--

-- CORRECTO!!!!!!

-- 9

-- CORRECTO!!!!!!!!

--10

--SELECT
--t1.ci
--FROM
--public.bebedor t1
--WHERE
--EXISTS (SELECT
--	*
--	FROM
--	public.frecuenta t2
--	WHERE
--	t2.cipersona=t1.ci AND
--	EXISTS (SELECT
--		*
--		FROM
--		public.bebedor t3
--		WHERE
--		t3.nombre='Luis Perez' AND
--		EXISTS (SELECT
--			*
--			FROM
--			public.frecuenta t4
--			WHERE
--			t4.cipersona=t3.ci AND
--			t4.codigofuente=t2.codigofuente AND
--			t1.ci!=t3.ci)));
--		
-- CORRECTO!!!!!!!!!

	
-- 11

-- CORRECTO!!!!!!!!

---- 12

---- SELECT CI
---- FROM BEBEDOR
---- WHERE EXISTS ( SELECT *
----		FROM FRECUENTA
----		WHERE CI=CIPERSONA AND EXISTS ( SELECT *
----						FROM VENDE
----						WHERE CODIGOFS=CODIGOFUENTE AND EXISTS ( SELECT *
----											 FROM GUSTA
----											 WHERE CODBEBIDA=CODIGOBEB AND CI=CIP)));

---- CORRECTO!!!

-- 13

-- CORRECTO!!!!!!!
		

---- 14

---- SELECT CI
---- FROM BEBEDOR t1
---- WHERE EXISTS ( SELECT * 
----	       FROM FRECUENTA t2
----	       WHERE t1.CI= t2.CIPERSONA AND EXISTS ( SELECT *
----			      		   		FROM VENDE t3
----			      				WHERE T2.CODIGOFUENTE=t3.CODIGOFS AND EXISTS ( SELECT *
----													FROM GUSTA t4
----													WHERE t4.CIP=t1.CI AND t4.CODBEBIDA=t3.CODIGOBEB))   
---- AND NOT EXISTS( SELECT *
----	    FROM FRECUENTA t5
----	    WHERE t5.CIPERSONA=t1.CI AND t2.CODIGOFUENTE!=t5.CODIGOFUENTE));

---- REVISAR!!!

---- 15

---- SELECT t1.CI
---- FROM BEBEDOR t1
---- WHERE EXISTS (SELECT *
----	      FROM FRECUENTA t2
----	      WHERE t1.CI=t2.CIPERSONA AND EXISTS (SELECT *
----						   FROM VENDE t3
----						   WHERE t2.CODIGOFUENTE=t3.CODIGOFS AND EXISTS (SELECT *
----												 FROM GUSTA t4
----												 WHERE t4.CIP=t1.CI  AND NOT EXISTS ( SELECT * 
----																      FROM BEBIDAS t5
----																      WHERE EXISTS (SELECT *
----																      FROM VENDE t6
----																      WHERE 
---- t6.CODIGOBEB=t5.CODBEB AND t6.CODIGOFS=t2.CODIGOFUENTE AND (t1.CI,t5.CODBEB) NOT IN (SELECT CIP, CODBEBIDA
----										     FROM GUSTA)))) AND NOT EXISTS (SELECT *
----								                                                   FROM FRECUENTA t6
----								                                                   WHERE t6.CIPERSONA=t1.CI AND 
---- t6.CODIGOFUENTE!=t2.CODIGOFUENTE)));

---- CORRECTO!!!!	

---- 16

---- SELECT CI
---- FROM BEBEDOR
---- WHERE NOT EXISTS (SELECT *
----		  FROM FRECUENTA
----		  WHERE CIPERSONA=CI AND EXISTS ( SELECT *
----						  FROM VENDE
----						  WHERE CODIGOFS=CODIGOFUENTE AND NOT EXISTS ( SELECT *
----												FROM BEBIDAS
----												WHERE CODBEB=CODIGOBEB AND EXISTS ( SELECT *
----																    FROM GUSTA
----																    WHERE CI=CIP AND CODBEB!
---- =CODBEBIDA AND CODIGOBEB=CODBEB))));

---- CORRECTO!!!!


---- 18

---- SELECT CI
---- FROM BEBEDOR
---- WHERE EXISTS ( SELECT *
----	       FROM GUSTA
----	       WHERE CI=CIP AND EXISTS ( SELECT *
----					 FROM VENDE
----					 WHERE CODBEBIDA=CODIGOBEB AND EXISTS ( SELECT *
----										FROM FRECUENTA
----										WHERE CIPERSONA=CI AND CODIGOFS=CODIGOFUENTE)));

---- REVISAR!!!


---- 19

---- SELECT t1.CI
---- FROM BEBEDOR t1
---- WHERE EXISTS ( SELECT *
----		FROM GUSTA t2
----		WHERE t1.CI=t2.CIP AND EXISTS ( SELECT *
----					  FROM VENDE t3
----					  WHERE t2.CODBEBIDA=t3.CODIGOBEB AND EXISTS ( SELECT *
----										 FROM FRECUENTA t4
----										 WHERE t3.CODIGOFS=t4.CODIGOFUENTE AND t4.CIPERSONA= t1.CI AND NOT EXISTS  
---- ( SELECT * FROM BEBIDAS t5
---- WHERE EXISTS (SELECT *
----	      FROM VENDE t6
----	      WHERE t6.CODIGOBEB=t5.CODBEB AND t6.CODIGOFS=t4.CODIGOFUENTE AND (t1.CI,t5.CODBEB) NOT IN (SELECT CIP, CODBEBIDA
----													 FROM GUSTA))))));

---- CORRECTO!!!

---- 20

---- SELECT  DISTINCT CODBEBIDA
---- FROM GUSTA t1
---- WHERE EXISTS (SELECT *
----	      FROM GUSTA t2
----	      WHERE t1.CIP=t2.CIP AND EXISTS (SELECT *
----					      FROM BEBIDAS
----					      WHERE NOMBREBEB='MALTA' AND CODBEB=t2.CODBEBIDA AND CODBEB!=t1.CODBEBIDA));

---- CORRECTO!!!!!

---- 21

---- SELECT CODFS
---- FROM FUENTESSODA
---- WHERE EXISTS (SELECT *
----	      FROM FRECUENTA
----	      WHERE CODFS=CODIGOFUENTE AND EXISTS (SELECT *
--						   FROM GUSTA
--						   WHERE CIPERSONA=CIP  AND EXISTS (SELECT *
--											     FROM BEBIDAS
--											     WHERE NOMBREBEB='MALTA' AND CODBEB=CODBEBIDA)));

-- CORRECTO!!!!! 

-- 22

-- SELECT CODFS
-- FROM FUENTESSODA t1
-- WHERE NOT EXISTS (SELECT *
--		  FROM VENDE t2
--		  WHERE t1.CODFS=t2.CODIGOFS AND EXISTS (SELECT *
--							 FROM BEBIDAS t3
--							 WHERE t3.CODBEB=t2.CODIGOBEB AND EXISTS (SELECT *
--												  FROM VENDE t4
--												  WHERE t4.CODIGOBEB=t3.CODBEB AND EXISTS (SELECT *
--																	   FROM FRECUENTA t5
--																	   WHERE 
-- t5.CODIGOFUENTE=t4.CODIGOFS AND t4.CODIGOFS!=t1.CODFS AND t5.CODIGOFUENTE!=t1.CODFS AND EXISTS (SELECT *
--					                                                        FROM BEBEDOR t6
--					                                                         WHERE t6.NOMBRE='Luis Perez' AND t6.CI=t5.CIPERSONA)))));
-- CORRECTO!!!!!

-- 23

-- SELECT CI
-- FROM BEBEDOR
-- WHERE EXISTS (SELECT *
--					   FROM FRECUENTA
--					   WHERE CI=CIPERSONA AND NOT EXISTS (SELECT *
--		  FROM GUSTA
--		  WHERE CIP=CI));
		

-- 24

-- SELECT CI, CODFS, CODBEB
-- FROM BEBEDOR, FUENTESSODA, BEBIDAS
-- WHERE NOT EXISTS (SELECT *
--		  FROM FRECUENTA
--		  WHERE CIPERSONA=CI AND CODFS=CODIGOFUENTE) 
--      AND NOT EXISTS ( SELECT *
--			FROM GUSTA
--			WHERE CI=CIP AND CODBEB=CODBEBIDA);

-- CORRECTO!!!


-- 25

-- SELECT CODBEB, CI, CODFS
-- FROM BEBIDAS, BEBEDOR, FUENTESSODA
-- WHERE EXISTS (SELECT *
--	      FROM GUSTA
--	      WHERE CI=CIP AND CODBEB=CODBEBIDA AND EXISTS (SELECT *
--						            FROM VENDE
--						            WHERE CODIGOFS=CODFS AND CODIGOBEB=CODBEBIDA));

-- CORRECTO!!!!

-- 26

-- SELECT CODBEB
-- FROM BEBIDAS
-- WHERE EXISTS (SELECT *
--	      FROM VENDE
--	      WHERE CODBEB=CODIGOBEB AND NOT EXISTS (SELECT *
--							FROM BEBEDOR
--							WHERE EXISTS (SELECT *
--								      FROM GUSTA
--								      WHERE CI=CIP AND CODBEBIDA=CODBEB)));

-- CORRECTO!!!

-- 27

-- SELECT t1.CODBEB
-- FROM BEBIDAS t1
-- WHERE EXISTS (SELECT *
--	      FROM VENDE t2
--	      WHERE t2.CODIGOBEB=t1.CODBEB AND EXISTS (SELECT *
--						       FROM FRECUENTA t3
--						       WHERE t3.CODIGOFUENTE=t2.CODIGOFS AND EXISTS (SELECT *
--												     FROM GUSTA t4
--												     WHERE t4.CIP=t3.CIPERSONA AND EXISTS (SELECT *
--																	   FROM BEBIDAS t5
--																	   WHERE 
-- t5.NOMBREBEB='MALTA' AND t5.CODBEB=t4.CODBEBIDA))));

-- CORRECTO!!!!!

-- 28

-- SELECT DISTINCT CODIGOBEB
-- FROM VENDE
-- WHERE EXISTS (SELECT *
--	      FROM FRECUENTA
--	      WHERE CODIGOFUENTE=CODIGOFS AND EXISTS (SELECT *
--						      FROM BEBEDOR
--						      WHERE CI=CIPERSONA AND NOT EXISTS (SELECT *
--											 FROM GUSTA
--											 WHERE CIP=CI AND EXISTS (SELECT *
--														  FROM BEBIDAS
--														  WHERE NOMBREBEB='MALTA' AND 
-- CODBEB=CODBEBIDA))));

-- CORRECTO!!!!

-- 29

-- SELECT DISTINCT t1.CODIGOFUENTE
-- FROM FRECUENTA t1
-- WHERE EXISTS (SELECT *
--	      FROM GUSTA t2
--	      WHERE t2.CIP=t1.CIPERSONA AND EXISTS (SELECT *
--						    FROM BEBIDAS t3
--						    WHERE t3.NOMBREBEB='MALTA' AND t3.CODBEB=t2.CODBEBIDA AND EXISTS (SELECT *
--														      FROM FRECUENTA t4
--														      WHERE t4.CIPERSONA=t1.CIPERSONA AND
--															    EXISTS (SELECT *
--																    FROM FUENTESSODA t5
--																    WHERE 
-- t5.NOMBREFS='LA MONTANA' AND t5.CODFS=t4.CODIGOFUENTE))));

-- CORRECTO!!!!

-- 30

-- SELECT CODFS
-- FROM FUENTESSODA
-- WHERE EXISTS (SELECT *
--	      FROM VENDE 
--	      WHERE CODFS=CODIGOFS AND EXISTS (SELECT *
--					       FROM GUSTA t1
--					       WHERE t1.CODBEBIDA=CODIGOBEB AND EXISTS (SELECT *
--										     FROM BEBEDOR t3
--										     WHERE t3.NOMBRE='Jose Perez' AND t3.CI=t1.CIP AND NOT EXISTS (SELECT *
--																	  FROM GUSTA t2
--																	  WHERE 
-- t2.CODBEBIDA=t1.CODBEBIDA AND EXISTS (SELECT *
--				      FROM BEBEDOR t4
--				      WHERE t4.NOMBRE='Luis Perez' AND t4.CI=t2.CIP)))));

-- CORRECTO!!!!

-- 31

-- SELECT CI
-- FROM BEBEDOR
-- WHERE NOT EXISTS (SELECT *
--              FROM FRECUENTA
--	      WHERE CI=CIPERSONA AND EXISTS (SELECT *
--					     FROM VENDE
--					     WHERE CODIGOFS=CODIGOFUENTE AND EXISTS (SELECT *
--										     FROM GUSTA
--										     WHERE CIP=CI AND CODBEBIDA=CODIGOBEB)));
--

-- CORRECTO!!!!!

-- 32

-- SELECT CODFS
-- FROM FUENTESSODA
-- WHERE NOT EXISTS (SELECT *
--		  FROM VENDE 
--		  WHERE CODFS=CODIGOFS AND NOT EXISTS (SELECT *
--						       FROM GUSTA
--						       WHERE CODIGOBEB=CODBEBIDA AND EXISTS (SELECT *
--											     FROM FRECUENTA
--											     WHERE CIPERSONA=CIP AND CODIGOFUENTE=CODFS)));
--

-- CORRECTO!!!!
-- 33

-- SELECT DISTINCT t1.CODIGOFUENTE
-- FROM FRECUENTA t1
-- WHERE NOT EXISTS (SELECT *
--		  FROM GUSTA t2
--		  WHERE t2.CIP=t1.CIPERSONA AND EXISTS (SELECT *
--							FROM VENDE t3
--							WHERE t3.CODIGOFS=t1.CODIGOFUENTE AND t3.CODIGOBEB=t2.CODBEBIDA AND NOT EXISTS (SELECT *
--																	FROM FRECUENTA t4
--																	WHERE 
-- t4.CIPERSONA=t1.CIPERSONA AND t4.CODIGOFUENTE!=t1.CODIGOFUENTE)));
-- CORRECTO!!!
