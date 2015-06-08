CREATE TABLE ci339133.inmueble ( id NUMBER(4),
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

ALTER TABLE inmueble

ADD CONSTRAINT PK_INMUEBLES PRIMARY KEY (id);



ADD CONSTRAINT FK_inmueble_inmueble FOREIGN KEY (id_compone) REFERENCES inmueble;

ADD CONSTRAINT DOM_sup CHECK (superficie>0);

ADD CONSTRAINT DOM_cant_u CHECK (cant_uni>0);



    
                           
