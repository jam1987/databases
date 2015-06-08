









REM D	
REM (d) Insertar la habitación B008 con la tarifa de la habitación A001

INSERT INTO HABITA
	VALUES ('B008', (SELECT TARIFA 
					 	FROM HABITA 
						WHERE(NUMERO='A001')
					)
	)
