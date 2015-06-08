CREATE TABLE inmueblesfabi(
			id number(4) 	NOT NULL,
			superficie NUMBER(5,2) NOT NULL,
			cantUni  number(10) not null,
			idCompone number(4) not null,
			alicuotaCompone number (4,0) not null,
			dirCiu varchar(40) not null,
			dirUrb varchar(30) not null,
			dirCalle varchar(30) not null,
			dirNombre varchar(30) not null,
			dirCodPost varchar(6) not null,	
	constraint pk_inmueblesfabi Primary key (id),
	constraint fk_inmueblesfabi_inmueblesfabi Foreign key (idCompone) references inmueblesfabi(id)
	);

create table unidadfabi (
			idPertenece number(4) not null,
			nro number(19) not null,
			ciPosee char(10) not null,
			area number(10,2) not null,
			alicuota number(4,0) not null,
	constraint pk_unidadfabi Primary key(idPertenece,nro),
	constraint fk_unidadfabi Foreign key(idPertenece) references inmueblesfabi(id)
	);

create table proveedorfabi (
			rif char(10) not null,
			nombre varchar(40) not null,
			telefono number(11) not null,
			email varchar(40) not null,
			ramo varchar(30) not null,
			contacto varchar(40) not null,
	constraint pk_proveedorfabi Primary key(rif)
	);

create table gastofabi (
			codigo number(4) not null,	
			rif char(10) not null,
			fecha char(8) not null,
			concepto varchar(70) not null,
			monto number(10,2) not null,
			idGenera number(4),
			idIncurre number(4),
			nroIncurre number(19),
	constraint pk_gastofabi Primary key(codigo),
	constraint fk_gastofabi Foreign key(rif) references proveedorfabi(rif),
	constraint fk_gastofabi1 Foreign key( idGenera) references inmueblesfabi(id),
    constraint fk_gastofabi2 Foreign key( idIncurre,nroIncurre) references unidadfabi(idPertenece,nro)
	);










