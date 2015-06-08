/*
script de actualizacion LAB BD taller 5*/
UPDATE departamento SET codigo='A1' WHERE codigo='01';
UPDATE empleado SET ci='v10101024' WHERE ci='V-10102001';
DELETE departamento WHERE codigo='01';
DROP TABLE departamento;
SELECT ci,codigo_dep FROM empleado;