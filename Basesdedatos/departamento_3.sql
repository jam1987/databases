DROP TABLE empleado;
DROP TABLE departamento;

CREATE TABLE departamento(
	codigo CHAR(2),
	nombre VARCHAR(30),
	ubicacion VARCHAR(60),
	numero_empleados NUMBER(4),
	telefono CHAR(11),
	CONSTRAINT pk_departamento PRIMARY KEY (codigo),
	CONSTRAINT ak_departamento UNIQUE (nombre));
	
CREATE TABLE empleado(
	numero NUMBER(3), 
	ci CHAR(10),
	nombre VARCHAR(50),
	codigo_dep CHAR(2),
	CONSTRAINT pk_empleado PRIMARY KEY(numero),
	CONSTRAINT ak_empleado UNIQUE (ci),
	CONSTRAINT fk_empleado_departamento FOREIGN KEY (codigo_dep) REFERENCES departamento (codigo),
	CONSTRAINT DOM_empleado_ci CHECK(REGEXP_LIKE(ci,'^[vVeE]-[[:digit:]]{8}$'))
);

INSERT INTO departamento VALUES('01','bebe','2do piso',0,'04246701530');
INSERT INTO departamento VALUES('02','electronica','2dopiso',0,'04246701532');      
INSERT INTO departamento VALUES('03','joyas','2do piso',0,'04246701533');
INSERT INTO departamento VALUES('04','farmacia','2do piso',0,'04246701534');
INSERT INTO departamento VALUES('05','deportes','2do piso',0,'04246701535');

INSERT INTO empleado VALUES (1,'V-10102001','Carlos Chacal','01');
INSERT INTO empleado VALUES (1,'E-14102001','Angelie Jomy','01');


INSERT INTO empleado VALUES(1,'V-11102001','Karel Minogue','02');
INSERT INTO empleado VALUES(1,'E-12102001','David Viral','02');
INSERT INTO empleado VALUES(1,'V-13102001','Enrique Pleais','02');

INSERT INTO empleado VALUES (1,'V-10102002','Kiti Penizi','03');

INSERT INTO empleado VALUES (1,'V-10102003','Mare Quartet','04');
INSERT INTO empleado VALUES (1,'E-10102004','Caramel Camila','04');
INSERT INTO empleado VALUES (1,'V-10102005','Teresa Saenz','04');

INSERT INTO empleado VALUES (1,'V-10102001','Juan C Garcia F','05');