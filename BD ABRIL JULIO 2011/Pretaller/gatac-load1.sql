REM

REM  Archivo:   cineca-load.sql

REM

REM  Contenido: Secuencia de comandos SQL para la carga inicial de datos de un estado de

REM             la base de datos relacional de CINECA. 

REM



REM  Autor:     Edna Ruckhaus

REM

REM  Fecha de Creacion: Julio 12 de 2002

REM

REM  Version:   1.0

REM

SPOOL gatac-load1.txt

REM     COMANDO PARA CAMBIAR EL FORMATO POR DEFECTO DE LA FECHA
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY HH:MIAM';
REM

REM	INSERCION DE CINES

REM


INSERT INTO CINE VALUES ('CCS01', 'Concresa', 4000.00, 4);

INSERT INTO CINE VALUES ('CCS02', 'Sambil', 5000.00, 5);

INSERT INTO CINE VALUES ('CCS03', 'Recreo', 4000.00, 3); 

INSERT INTO CINE VALUES ('VAL01', 'Trigal', 3500.00, 4); 



REM

REM	INSERCION DE SALA

REM

INSERT INTO SALA VALUES ( 'CCS01', 1, 150);

INSERT INTO SALA VALUES ( 'CCS01', 2, 100);
INSERT INTO SALA VALUES ( 'CCS01', 3, 100);
INSERT INTO SALA VALUES ( 'CCS01', 4, 200);
INSERT INTO SALA VALUES ( 'CCS02', 1, 150);
INSERT INTO SALA VALUES ( 'CCS02', 2, 150);
INSERT INTO SALA VALUES ( 'CCS02', 3, 150);
INSERT INTO SALA VALUES ( 'CCS02', 4, 150);
INSERT INTO SALA VALUES ( 'CCS02', 5, 150);
INSERT INTO SALA VALUES ( 'CCS03', 1, 100);
INSERT INTO SALA VALUES ( 'CCS03', 2, 200);
INSERT INTO SALA VALUES ( 'CCS03', 3, 100);
INSERT INTO SALA VALUES ( 'VAL01', 1, 100);
INSERT INTO SALA VALUES ( 'VAL01', 2, 200);
INSERT INTO SALA VALUES ( 'VAL01', 3, 150);
INSERT INTO SALA VALUES ( 'VAL01', 4, 150);








REM

REM	INSERCION DE PELICULAS

REM

INSERT INTO PELICULA VALUES ( 'P00001', 'Calculo Mortal', 'Accion', 'B', '19-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00002', 'Con Solo Mirarte', 'Romance', 'B', '19-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00003', 'Deseando Amar', 'Romance', 'C', '26-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00004', 'El Mensajero de la oscuridad', 'Terror', 'B', '26-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00005', 'El Misterio de la Libelula', 'Comedia', 'A', '03-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00006', 'El Pasado nos Condena', 'Drama', 'B', '03-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00007', 'Infidelidad', 'Drama', 'C', '03-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00008', 'Juana La Loca', 'Drama', 'B', '19-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00009', 'La Bella y la Bestia', 'Animacion', 'A', '10-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00010', 'La Suma de Todos Los Miedos', 'Accion', 'B', '19-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00011', 'Lilo y Stitch', 'Animacion', 'A', '26-JUN-02');
INSERT INTO PELICULA VALUES ( 'P00012', 'El Ataque de los Clones', 'Accion', 'A', '01-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00013', 'Acosada en Lunes de Carnaval', 'Drama', 'B', '03-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00014', 'Asustados', 'Comedia', 'B', '17-JUL-02');
INSERT INTO PELICULA VALUES ( 'P00015', 'Ali', 'Accion', 'B', '17-JUL-02');






REM

REM	INSERCION DE FUNCIONES

REM

INSERT INTO FUNCION VALUES ( 'CCS01', 1, '19-JUN-02 5:00pm', 'P00001', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '19-JUN-02 7:00pm', 'P00001', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '20-JUN-02 5:00pm', 'P00001', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '20-JUN-02 7:00pm', 'P00001', 400000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '19-JUN-02 5:00pm', 'P00001', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '20-JUN-02 5:00pm', 'P00001', 240000.00, 60);
INSERT INTO FUNCION VALUES ( 'VAL01', 1, '19-JUN-02 5:00pm', 'P00001', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'VAL01', 2, '20-JUN-02 5:00pm', 'P00001', 490000.00, 140);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '19-JUN-02 9:00pm', 'P00002', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '19-JUN-02 9:00pm', 'P00002', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '20-JUN-02 9:00pm', 'P00002', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '20-JUN-02 9:00pm', 'P00002', 400000.00, 50);
INSERT INTO FUNCION VALUES ( 'VAL01', 1, '26-JUN-02 5:00pm', 'P00004', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'VAL01', 1, '27-JUN-02 5:00pm', 'P00004', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '26-JUN-02 5:00pm', 'P00003', 500000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '27-JUN-02 5:00pm', 'P00003', 300000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '26-JUN-02 5:00pm', 'P00003', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '27-JUN-02 5:00pm', 'P00003', 240000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '03-JUL-02 5:00pm', 'P00005', 500000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '04-JUL-02 5:00pm', 'P00005', 300000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '03-JUL-02 5:00pm', 'P00006', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '04-JUL-02 5:00pm', 'P00006', 240000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '03-JUL-02 5:00pm', 'P00007', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '03-JUL-02 7:00pm', 'P00007', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 3, '03-JUL-02 5:00pm', 'P00007', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 4, '03-JUL-02 7:00pm', 'P00007', 800000.00, 200);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '03-JUL-02 9:00pm', 'P00007', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '04-JUL-02 9:00pm', 'P00007', 240000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS01', 3, '19-JUN-02 5:00pm', 'P00008', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 4, '19-JUN-02 7:00pm', 'P00008', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'VAL01', 3, '19-JUN-02 5:00pm', 'P00008', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'VAL01', 4, '20-JUN-02 5:00pm', 'P00008', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '10-JUL-02 9:00pm', 'P00009', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '11-JUL-02 9:00pm', 'P00009', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '10-JUL-02 5:00pm', 'P00009', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '11-JUL-02 7:00pm', 'P00009', 400000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '10-JUL-02 5:00pm', 'P00009', 500000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '11-JUL-02 5:00pm', 'P00009', 300000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS01', 3, '19-JUN-02 9:00pm', 'P00010', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 4, '19-JUN-02 9:00pm', 'P00010', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 3, '20-JUN-02 9:00pm', 'P00010', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 4, '20-JUN-02 9:00pm', 'P00010', 400000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '19-JUN-02 3:00pm', 'P00010', 500000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '26-JUN-02 3:00pm', 'P00011', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '27-JUN-02 3:00pm', 'P00011', 200000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 3, '27-JUN-02 3:00pm', 'P00011', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 4, '27-JUN-02 3:00pm', 'P00011', 800000.00, 200);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '01-JUL-02 3:00pm', 'P00012', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 2, '01-JUL-02 3:00pm', 'P00012', 250000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS03', 3, '01-JUL-02 3:00pm', 'P00012', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'VAL01', 3, '01-JUL-02 3:00pm', 'P00012', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 3, '03-JUL-02 11:00pm', 'P00013', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS01', 1, '17-JUL-02 3:00pm', 'P00014', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 2, '17-JUL-02 3:00pm', 'P00014', 250000.00, 50);
INSERT INTO FUNCION VALUES ( 'CCS01', 2, '17-JUL-02 7:00pm', 'P00015', 400000.00, 50);
INSERT INTO FUNCION VALUES ( 'VAL01', 1, '17-JUL-02 5:00pm', 'P00015', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'VAL01', 1, '18-JUL-02 5:00pm', 'P00015', 350000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '17-JUL-02 5:00pm', 'P00015', 500000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS02', 1, '18-JUL-02 5:00pm', 'P00015', 300000.00, 60);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '17-JUL-02 5:00pm', 'P00015', 400000.00, 100);
INSERT INTO FUNCION VALUES ( 'CCS03', 1, '18-JUL-02 5:00pm', 'P00015', 240000.00, 60);




REM

REM	INSERCION DE ESTRENOS

REM
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00001');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00001');
INSERT INTO SE_ESTRENA VALUES ('VAL01','P00001');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00002');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00003');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00003');
INSERT INTO SE_ESTRENA VALUES ('VAL01','P00004');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00005');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00006');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00007');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00007');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00008');
INSERT INTO SE_ESTRENA VALUES ('VAL01','P00008');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00009');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00009');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00010');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00010');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00010');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00011');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00012');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00012');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00012');
INSERT INTO SE_ESTRENA VALUES ('VAL01','P00012');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00013');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00014');
INSERT INTO SE_ESTRENA VALUES ('CCS01','P00015');
INSERT INTO SE_ESTRENA VALUES ('CCS02','P00015');
INSERT INTO SE_ESTRENA VALUES ('CCS03','P00015');
INSERT INTO SE_ESTRENA VALUES ('VAL01','P00015');





REM

REM Se indica al DBMS que haga efectivas las operaciones del script siempre

REM y cuando se hubiera cumplido la restriccion de clave foranea que fue

REM inhibida al principio del script

REM

COMMIT;

SPOOL OFF

