CREATE TABLE ci339133.inmueble (id NUMBER(4),
                           	superficie NUMBER(6,2),
                           	cant_uni NUMBER(4),
                           	id_compone NUMBER(4),
                           	alicuotaCompone NUMBER(4,3),
                           	dir_ciu VARCHAR2 (40),
                           	dir_urb VARCHAR2 (30),
                           	dir_calle VARCHAR2 (30),
                           	dir_nombre VARCHAR2 (30),
                           	dir_cod_post VARCHAR2 (6))
				TABLESPACE USERS;

ALTER TABLE ci339133.inmueble ADD CONSTRAINT PK_inmueble PRIMARY KEY (id);
ALTER TABLE ci339133.inmueble ADD CONSTRAINT FK_inmueble_inmueble FOREIGN KEY (id_compone) REFERENCES inmueble;
ALTER TABLE ci339133.inmueble ADD CONSTRAINT DOM_sup CHECK (superficie>0);
ALTER TABLE ci339133.inmueble ADD CONSTRAINT DOM_cant_u CHECK (cant_uni>0);

CREATE TABLE ci339133.unidad(   id_pertenece NUMBER(4),
				nro NUMBER(6),
				ci_posee VARCHAR2(10),
				area NUMBER(10,2),
				alicuota (1,4))
				TABLESPACE USERS;

ALTER TABLE ci339133.unidad ADD CONSTRAINT PK_unidad PRIMARY KEY (id_pertenece,nro);
ALTER TABLE ci339133.unidad ADD CONSTRAINT FK_inmueble_inmueble FOREIGN KEY (id_compone) REFERENCES inmueble;
ALTER TABLE ci339133.unidad ADD CONSTRAINT DOM_sup CHECK (superficie>0);
ALTER TABLE ci339133.unidad ADD CONSTRAINT DOM_cant_u CHECK (cant_uni>0);


CREATE TABLE ci339133.proveedor(rif VARCHAR2(9),
				nombre VARCHAR2(40),
				telefono NUMBER(11),
				email VARCHAR2(40),
				ramo VARCHAR2(30),
				contacto VARCHAR2(40))
				TABLESPACE USERS;

CREATE TABLE ci339133.gasto(	codigo NUMBRE(4),
				rif VARCHAR2(9),
				fecha CHAR(8),
				concepto VARCHAR2(70),
				monto NUMBER(10,2),
				id_genera NUMBER(4),
				id_incurre NUMBER(4),
				nro_incurre NUMBER(4))
				TABLESPACE USERS;


