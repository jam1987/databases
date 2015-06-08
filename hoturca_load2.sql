REM
REM  Archivo:   hoturca-load2.sql
REM
REM  Contenido: Secuencia de comandos SQL para la carga inicial de datos de un estado de
REM             la base de datos relacional de HOTURCA. 
REM
REM  Autor:     Edna Ruckhaus y Maria Esther Vidal
REM
REM  Fecha de Creacion: 15 de marzo de 2011
REM
REM  Version:   1.1
REM
REM COMANDO PARA CAMBIAR EL FORMATO POR DEFECTO DE LA FECHA
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY HH:MIAM';
REM
REM     INSERCION DE HABITACIONES
REM
INSERT INTO HABITA VALUES ('A001', 80000.00);
INSERT INTO HABITA VALUES ('A002', 60000.00);
INSERT INTO HABITA VALUES ('A003',60000.00); 
INSERT INTO HABITA VALUES ('A004', 80000.00); 
INSERT INTO HABITA VALUES ('A005', 150000.00);
INSERT INTO HABITA VALUES ('A006', 150000.00);
INSERT INTO HABITA VALUES ('A007', 200000.00); 
INSERT INTO HABITA VALUES ('B001', 80000.00);
INSERT INTO HABITA VALUES ('B002', 60000.00);
INSERT INTO HABITA VALUES ('B003',60000.00); 
INSERT INTO HABITA VALUES ('B004', 80000.00); 
INSERT INTO HABITA VALUES ('B005', 150000.00);
INSERT INTO HABITA VALUES ('B006', 150000.00);
INSERT INTO HABITA VALUES ('B007', 200000.00);
INSERT INTO HABITA VALUES ('C001', 80000.00);
INSERT INTO HABITA VALUES ('C002', 60000.00);
INSERT INTO HABITA VALUES ('C003',60000.00); 
INSERT INTO HABITA VALUES ('C004', 80000.00); 
INSERT INTO HABITA VALUES ('C005', 150000.00);
INSERT INTO HABITA VALUES ('C006', 150000.00);
INSERT INTO HABITA VALUES ('C007', 200000.00);
INSERT INTO HABITA VALUES ('D001', 80000.00);
INSERT INTO HABITA VALUES ('D002', 60000.00);
INSERT INTO HABITA VALUES ('D003',60000.00); 
INSERT INTO HABITA VALUES ('D004', 80000.00); 
INSERT INTO HABITA VALUES ('D005', 150000.00);
INSERT INTO HABITA VALUES ('D006', 150000.00);
INSERT INTO HABITA VALUES ('D007', 200000.00);
 
  

REM
REM     INSERCION DE SERVICIOS
REM
INSERT INTO SERVICIO VALUES ( 'S001', 'Restaurant Girasol');
INSERT INTO SERVICIO VALUES ( 'S002', 'Bar La Tasca');
INSERT INTO SERVICIO VALUES ( 'S003', 'Gimnasio');
INSERT INTO SERVICIO VALUES ('S004', 'Tenis');
INSERT INTO SERVICIO VALUES ('S005', 'Habitacion');


REM
REM     INSERCION DE RESERVACIONES
REM


INSERT INTO RESERVA VALUES ( 'R001', '01-JUN-10', '04-JUN-10','V111111','PEDRO PEREZ', 1);
INSERT INTO RESERVA VALUES ( 'R002', '01-JUN-10', '09-JUN-10','V999999','MARTA SANCHEZ', 1);
INSERT INTO RESERVA VALUES ( 'R003', '02-JUN-10', '10-JUN-10','V222222','MARIA MATOS', 1);
INSERT INTO RESERVA VALUES ( 'R004', '05-JUN-10', '06-JUN-10','V333333','RODRIGO PINO', 1);
INSERT INTO RESERVA VALUES ( 'R005', '08-JUN-10', '15-JUN-10','V444444','LUZ OVIEDO', 1);
INSERT INTO RESERVA VALUES ( 'R006', '16-JUN-10', '18-JUN-10','V555555','MARCOS MILLAN', 1);
INSERT INTO RESERVA VALUES ( 'R007', '16-JUN-10', '19-JUN-10','V666666','OSCAR LUNA', 1);
INSERT INTO RESERVA VALUES ( 'R008', '17-JUN-10', '19-JUN-10','V777777','JESUS HERNANDEZ', 1);
INSERT INTO RESERVA VALUES ( 'R009', '17-JUN-10', '18-JUN-10','V111111','PEDRO PEREZ', 1);
INSERT INTO RESERVA VALUES ( 'R010', '19-JUN-10', '22-JUN-10','V111111','PEDRO PEREZ', 1);
INSERT INTO RESERVA VALUES ( 'R011', '19-JUN-10', '23-JUN-10','V111111','PEDRO PEREZ', 1);
INSERT INTO RESERVA VALUES ( 'R012', '19-JUN-10', '23-JUN-10','V999999','MARTA SANCHEZ', 1);
INSERT INTO RESERVA VALUES ( 'R013', '22-JUN-10', '23-JUN-10','V222222','MARIA MATOS', 1);
INSERT INTO RESERVA VALUES ( 'R014', '24-JUN-10', '26-JUN-10','V333333','RODRIGO PINO', 1);
INSERT INTO RESERVA VALUES ( 'R015', '24-JUN-10', '27-JUN-10','V444444','LUZ OVIEDO', 1);
INSERT INTO RESERVA VALUES ( 'R016', '28-JUN-10', '30-JUN-10','V555555','MARCOS MILLAN', 1);
INSERT INTO RESERVA VALUES ( 'R017', '19-JUN-10', '21-JUN-10','V666666','OSCAR LUNA', 1);
INSERT INTO RESERVA VALUES ( 'R018', '24-JUN-10', '27-JUN-10','V777777','JESUS HERNANDEZ', 1);
INSERT INTO RESERVA VALUES ( 'R019', '27-JUN-10', '28-JUN-10','V111111','PEDRO PEREZ', 1);
INSERT INTO RESERVA VALUES ( 'R020', '29-JUN-10', '30-JUN-10','V111111','PEDRO PEREZ', 1);

INSERT INTO RESERVA VALUES ( 'R021', '27-JUN-10', '28-JUN-10','V999999','MARTA SANCHEZ', 1);
INSERT INTO RESERVA VALUES ( 'R022', '28-JUN-10', '29-JUN-10','V333333','RODRIGO PINO', 1);
INSERT INTO RESERVA VALUES ( 'R023', '29-JUN-10', '30-JUN-10','V999999','OSCAR LUNA', 1);

REM
REM     INSERCION DE ASIGNACIONES DE HABITACIONES
REM

INSERT INTO ASIGNA VALUES ( 'A001', 'R001',2,1);
INSERT INTO ASIGNA VALUES ( 'A002', 'R002',1,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R003',2,0);
INSERT INTO ASIGNA VALUES ( 'A004', 'R004',2,0);
INSERT INTO ASIGNA VALUES ( 'A001', 'R005',2,0);
INSERT INTO ASIGNA VALUES ( 'A001', 'R006',1,0);
INSERT INTO ASIGNA VALUES ( 'A005', 'R007',1,0);
INSERT INTO ASIGNA VALUES ( 'A002', 'R008',1,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R009',2,1);
INSERT INTO ASIGNA VALUES ( 'A004', 'R009',2,1);
INSERT INTO ASIGNA VALUES ( 'A006', 'R009',2,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R010',2,1);
INSERT INTO ASIGNA VALUES ( 'A004', 'R010',2,1);
INSERT INTO ASIGNA VALUES ( 'A001', 'R011',2,1);
INSERT INTO ASIGNA VALUES ( 'A002', 'R012',1,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R013',2,0);
INSERT INTO ASIGNA VALUES ( 'A004', 'R014',2,0);
INSERT INTO ASIGNA VALUES ( 'A001', 'R015',2,0);
INSERT INTO ASIGNA VALUES ( 'A001', 'R016',1,0);
INSERT INTO ASIGNA VALUES ( 'A005', 'R017',1,0);
INSERT INTO ASIGNA VALUES ( 'A002', 'R018',1,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R019',2,1);
INSERT INTO ASIGNA VALUES ( 'A004', 'R019',2,1);
INSERT INTO ASIGNA VALUES ( 'A006', 'R019',2,0);
INSERT INTO ASIGNA VALUES ( 'A003', 'R020',2,1);
INSERT INTO ASIGNA VALUES ( 'A004', 'R020',2,1);
INSERT INTO ASIGNA VALUES ( 'B003', 'R021',1,0);
INSERT INTO ASIGNA VALUES ( 'B004', 'R022',1,0);
INSERT INTO ASIGNA VALUES ( 'B003', 'R023',1,0);



REM
REM     INSERCION DE CONSUMOS 
REM
INSERT INTO CONSUMO VALUES ( 'A001', 'R011','S001','C',58000.00,'19-JUN-10 5:00pm','F001');
INSERT INTO CONSUMO VALUES ( 'A001', 'R011','S001','E',30000.00,'19-JUN-10 9:00am','F002');
INSERT INTO CONSUMO VALUES ( 'A001', 'R011','S003','C',25000.00,'19-JUN-10 10:00am','F003');
INSERT INTO CONSUMO VALUES ( 'A001', 'R011','S002','C',230000.00,'19-JUN-10 10:00pm','F004');
INSERT INTO CONSUMO VALUES ( 'A002', 'R012','S001','C',58000.00,'19-JUN-10 5:00pm','F005');
INSERT INTO CONSUMO VALUES ( 'A002', 'R012','S001','T',30000.00,'19-JUN-10 9:00am','F006');
INSERT INTO CONSUMO VALUES ( 'A002', 'R012','S003','T',50000.00,'19-JUN-10 10:00am','F007');
INSERT INTO CONSUMO VALUES ( 'A002', 'R012','S002','T',35000.00,'19-JUN-10 10:00pm','F008');
INSERT INTO CONSUMO VALUES ( 'A003', 'R013','S001','E',58000.00,'22-JUN-10 5:00pm','F009');
INSERT INTO CONSUMO VALUES ( 'A003', 'R013','S001','E',30000.00,'22-JUN-10 9:00am','F010');
INSERT INTO CONSUMO VALUES ( 'A004', 'R014','S003','E',30000.00,'24-JUN-10 10:00am','F011');
INSERT INTO CONSUMO VALUES ( 'A004', 'R014','S002','T',30000.00,'24-JUN-10 10:00pm','F012');
INSERT INTO CONSUMO VALUES ( 'A001', 'R015','S001','T',58000.00,'19-JUN-10 5:00pm','F013');
INSERT INTO CONSUMO VALUES ( 'A001', 'R015','S001','C',30000.00,'19-JUN-10 9:00am','F014');
INSERT INTO CONSUMO VALUES ( 'A001', 'R016','S003','T',30000.00,'28-JUN-10 10:00am','F015');
INSERT INTO CONSUMO VALUES ( 'A001', 'R016','S002','C',30000.00,'28-JUN-10 10:00pm','F016');
INSERT INTO CONSUMO VALUES ( 'A001', 'R017','S001','C',258000.00,'19-JUN-10 5:00pm','F017');
INSERT INTO CONSUMO VALUES ( 'A001', 'R017','S001','E',30000.00,'19-JUN-10 9:00am','F018');
INSERT INTO CONSUMO VALUES ( 'A001', 'R017','S003','C',30000.00,'19-JUN-10 10:00am','F019');
INSERT INTO CONSUMO VALUES ( 'A001', 'R017','S002','C',30000.00,'19-JUN-10 10:00pm','F020');
INSERT INTO CONSUMO VALUES ( 'A002', 'R018','S001','C',58000.00,'24-JUN-10 5:00pm','F021');
INSERT INTO CONSUMO VALUES ( 'A002', 'R018','S001','T',245000.00,'24-JUN-10 9:00am','F022');
INSERT INTO CONSUMO VALUES ( 'A002', 'R018','S003','T',60000.00,'24-JUN-10 10:00am','F023');
INSERT INTO CONSUMO VALUES ( 'A002', 'R018','S002','T',30000.00,'24-JUN-10 10:00pm','F024');
INSERT INTO CONSUMO VALUES ( 'A003', 'R019','S001','E',58000.00,'27-JUN-10 5:00pm','F025');
INSERT INTO CONSUMO VALUES ( 'A004', 'R019','S001','E',30000.00,'27-JUN-10 9:00am','F026');
INSERT INTO CONSUMO VALUES ( 'A006', 'R019','S001','E', 130000.00,'27-JUN-10 9:00am','F027');

INSERT INTO CONSUMO VALUES ( 'A003', 'R009','S001','E',58000.00,'19-JUN-10 5:00pm','F070');
INSERT INTO CONSUMO VALUES ( 'A004', 'R009','S001','E',30000.00,'19-JUN-10 9:00am','F071');
INSERT INTO CONSUMO VALUES ( 'A006', 'R009','S001','E', 130000.00,'19-JUN-10 9:00am','F072');


INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','C',58000.00,'27-JUN-10 5:00pm','F028');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','E',30000.00,'27-JUN-10 9:00am','F029');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S003','C',25000.00,'27-JUN-10 10:00am','F030');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S002','C',230000.00,'27-JUN-10 10:00pm','F031');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S001','C',58000.00,'28-JUN-10 5:00pm','F032');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S001','T',30000.00,'28-JUN-10 9:00am','F033');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S003','T',50000.00,'28-JUN-10 10:00am','F034');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S002','T',35000.00,'28-JUN-10 10:00pm','F035');
INSERT INTO CONSUMO VALUES ( 'C003', 'R023','S001','E',58000.00,'29-JUN-10 5:00pm','F036');
INSERT INTO CONSUMO VALUES ( 'C003', 'R023','S001','E',30000.00,'29-JUN-10 9:00am','F037');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','T',58000.00,'27-JUN-10 5:00pm','F040');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','C',30000.00,'27-JUN-10 9:00am','F041');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S003','T',30000.00,'26-JUN-10 10:00am','F042');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S002','C',30000.00,'27-JUN-10 10:00pm','F043');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','C',258000.00,'27-JUN-10 5:00pm','F044');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S001','E',30000.00,'27-JUN-10 9:00am','F045');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S003','C',30000.00,'27-JUN-10 10:00am','F046');
INSERT INTO CONSUMO VALUES ( 'C001', 'R021','S002','C',30000.00,'27-JUN-10 10:00pm','F047');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S001','C',58000.00,'28-JUN-10 5:00pm','F048');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S001','T',245000.00,'28-JUN-10 9:00am','F049');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S003','T',60000.00,'28-JUN-10 10:00am','F050');
INSERT INTO CONSUMO VALUES ( 'C002', 'R022','S002','T',30000.00,'28-JUN-10 10:00pm','F051');
INSERT INTO CONSUMO VALUES ( 'C003', 'R023','S001','E',58000.00,'29-JUN-10 5:00pm','F052');
INSERT INTO CONSUMO VALUES ( 'C003', 'R023','S001','E',30000.00,'29-JUN-10 9:00am','F053');
INSERT INTO CONSUMO VALUES ( 'C003', 'R023','S001',NULL, 130000.00,'29-JUN-10 9:00am','F054');



REM
REM Se indica al DBMS que haga efectivas las operaciones del script 
REM
COMMIT;
