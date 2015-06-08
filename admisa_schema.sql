CREATE TABLE inmueblesfabi(
			id INT 	NOT NULL,
			superficie INT NOT NULL,
			cantUni  INT not null,
			idCompone INT not null,
			alicuotaCompone INT not null,
			dirCiu varchar(40) not null,
			dirUrb varchar(30) not null,
			dirCalle varchar(30) not null,
			dirNombre varchar(30) not null,
			dirCodPost varchar(6) not null,	
	constraint pk_inmueblesfabi Primary key (id),
	constraint fk_inmueblesfabi_inmueblesfabi Foreign key (idCompone) references inmueblesfabi(id)
	);

create table unidadfabi (
			idPertenece INT not null,
			nro INT not null,
			ciPosee char(10) not null,
			area INT not null,
			alicuota INT not null,
	constraint pk_unidadfabi Primary key(idPertenece,nro),
	constraint fk_unidadfabi Foreign key(idPertenece) references inmueblesfabi(id)
	);

create table proveedorfabi (
			rif char(10) not null,
			nombre varchar(40) not null,
			telefono INT not null,
			email varchar(40) not null,
			ramo varchar(30) not null,
			contacto varchar(40) not null,
	constraint pk_proveedorfabi Primary key(rif)
	);

create table gastofabi (
			codigo INT not null,	
			rif char(10) not null,
			fecha char(8) not null,
			concepto varchar(70) not null,
			monto INT not null,
			idGenera INT,
			idIncurre INT,
			nroIncurre INT,
	constraint pk_gastofabi Primary key(codigo),
	constraint fk_gastofabi Foreign key(rif) references proveedorfabi(rif),
	constraint fk_gastofabi1 Foreign key( idGenera) references inmueblesfabi(id),
    constraint fk_gastofabi2 Foreign key( idIncurre,nroIncurre) references unidadfabi(idPertenece,nro)
	);










