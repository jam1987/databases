INSERT INTO INMUEBLE(id, superficie, cantUni, idCompone,dirCiu, dirUrb,dirCalle,dirNombre, dirCodpost)
values(1234, 1600.00,8,null,'Villacara','El Borde', 'Av. Rio', 'Res. Dency', '9090-Z');
INSERT INTO INMUEBLE(id, superficie, cantUni, idCompone,dirCiu, dirUrb,dirCalle,dirNombre, dirCodpost)
values(5678,0800.00,4,1234,'Villacara','El Borde', 'Av. Rio','Villa A','9090-Z');
INSERT INTO INMUEBLE(id, superficie, cantUni, idCompone,dirCiu, dirUrb,dirCalle,dirNombre, dirCodpost)
values(9012, 0800.00,4,1234,'Villacara','El Borde', 'Av. Rio', 'Villa B','9090-Z');

INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (5678,1,'E-99999999',200.00,25.00);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (5678,2,'V-77777777',200.00,25.00);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (5678,3,'V-88888888',200.00,25.00);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (5678,4,'V-88888888',200.00,25.00);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (9012,1,'E-99999999',300.00,37.50);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (9012,2,'V-88888888',100.00,12.50);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (9012,3,'V-77777777',300.00,37.50);
INSERT INTO UNIDAD(idPertenece, nro, ciPosee, area,alicuota)
values (9012,4,'E-99999999',100.00,12.50);

