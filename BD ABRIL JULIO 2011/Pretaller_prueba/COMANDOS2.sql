REM     COMANDO PARA CAMBIAR EL FORMATO POR DEFECTO DE LA FECHA
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY HH:MIAM';

INSERT INTO CINE VALUES ('CCS05','Paraiso Cinex', 30.00, 3);

INSERT INTO SALA VALUES ('CCS05',1, 200);
INSERT INTO SALA VALUES ( 'CCS05', 2, 150);
INSERT INTO SALA VALUES ( 'CCS05', 3, 300);


INSERT INTO PELICULA VALUES ( 'PEL00017', 'Nemo', 'Animados', 'A', '05-JUL-11');

INSERT INTO FUNCION VALUES ( 'CCS05', 1, '05-JUL-11 7:00pm', 'PEL00017', NULL, NULL);
INSERT INTO FUNCION VALUES ( 'CCS05', 2, '05-JUL-11 7:00pm', 'PEL00017', NULL, NULL);
INSERT INTO FUNCION VALUES ( 'CCS05', 3, '05-JUL-11 7:00pm', 'PEL00017', NULL, NULL);



2.1
REM Para lograr el objetivo de violar temporalmente las reglas impuestas por los constraints, debemos crearlos de una forma especial, conocida como 
REM deferrable constraints. 
REM EL constrainst IMMEDIATE conlleva a la validación del constraint en forma simultánea con la modificación de los datos, pero al ser el
 REM constraint DEFERRABLE, se permite postergar la validación para casos especiales, que se habilitan con una sintaxis adicional. Veámoslo con el ejemplo.

REM Tenemos entonces en los deferrable constraints, una forma soportada de violar temporalmente las reglas que normalmente son validadas de inmediato, 
REM postergándolas hasta el momento en que concluímos la transacción (commit). Todo constraint puede ser postergado, pero en el caso particular del primary REM key y del unique, los índices que sirven para validar el cumplimiento de estos constraints son creados como índices no únicos, cuando normalmente son
REM únicos. Esto implica que ocuparán algo más de espacio y su mantenimiento requerirá de algo más de CPU, pero usualmente en tan pequeña magnitud que puede REM ser despreciado si lo comparamos con los eventuales beneficios.

