use hoteldb_in4cm;
-- drop database hoteldb_in4cm;

-- INSERTS: CLIENTES (20 Registros)
insert into clientes (dpi, nacionalidad, telefono) values  
(1000000001, "guatemala", "50123456"),
(1000000002, "guatemala", "51234567"),
(1000000003, "mexico", "52345678"),
(1000000004, "guatemala", "53456789"),
(1000000005, "el salvador", "54567890"),
(1000000006, "guatemala", "55678901"),
(1000000007, "honduras", "56789012"),
(1000000008, "guatemala", "57890123"),
(1000000009, "costa rica", "58901234"),
(1000000010, "guatemala", "59012345"),
(1000000011, "estados unidos", "40123456"),
(1000000012, "guatemala", "41234567"),
(1000000013, "españa", "42345678"),
(1000000014, "guatemala", "43456789"),
(1000000015, "colombia", "44567890"),
(1000000016, "guatemala", "45678901"),
(1000000017, "guatemala", "46789012"),
(1000000018, "argentina", "47890123"),
(1000000019, "guatemala", "48901234"),
(1000000020, "canada", "49012345");

-- INSERTS: HABITACIONES (20 Registros)
insert into habitaciones (id_habitacion, piso, precio_noche, tipo_habitacion) values
("101A", "1", 45.00, "sencilla"),
("102A", "1", 45.00, "sencilla"),
("103B", "1", 75.00, "doble"),
("104B", "1", 75.00, "doble"),
("201A", "2", 50.00, "sencilla"),
("202A", "2", 50.00, "sencilla"),
("203B", "2", 80.00, "doble"),
("204C", "2", 120.00, "triple"),
("301A", "3", 55.00, "sencilla"),
("302B", "3", 85.00, "doble"),
("303C", "3", 130.00, "triple"),
("304D", "3", 200.00, "suite"),
("401B", "4", 90.00, "doble"),
("402B", "4", 90.00, "doble"),
("403C", "4", 140.00, "triple"),
("404D", "4", 250.00, "suite"),
("501C", "5", 150.00, "triple"),
("502C", "5", 150.00, "triple"),
("503D", "5", 300.00, "suite"),
("504D", "5", 350.00, "suite presidencial");

-- INSERTS: EMPLEADOS (20 Registros)
-- Nota: id_empleado se ajustó a un máximo de 8 caracteres respetando la FK de reservas
insert into empleados (id_empleado, nombre, cargo) values
("EMP01", "Carlos Gómez", "recepcionista"),
("EMP02", "Ana Martínez", "recepcionista"),
("EMP03", "Luis Rodas", "supervisor"),
("EMP04", "María López", "gerente"),
("EMP05", "Jorge Estrada", "recepcionista"),
("EMP06", "Sofía Paz", "botones"),
("EMP07", "Pedro Alva", "mantenimiento"),
("EMP08", "Elena Ríos", "recepcionista"),
("EMP09", "Miguel Cifuentes", "supervisor"),
("EMP10", "Laura Méndez", "recepcionista"),
("EMP11", "Andrés Guerra", "botones"),
("EMP12", "Lucía Fuentes", "mantenimiento"),
("EMP13", "Roberto Morales", "recepcionista"),
("EMP14", "Carmen Ortíz", "supervisor"),
("EMP15", "Diego Juárez", "recepcionista"),
("EMP16", "Estela Sosa", "seguridad"),
("EMP17", "Fernando Lima", "seguridad"),
("EMP18", "Gabriela Cruz", "recepcionista"),
("EMP19", "Héctor Maldonado", "administrador"),
("EMP20", "Ingrid Vásquez", "recepcionista");

-- INSERTS: RESERVAS (20 Registros)
insert into reservas (id_reservas, fecha_inicio, fecha_fin, dpi, id_empleado) values  
("RES01", "2026-06-01 14:00:00", "2026-06-03 11:00:00", 1000000001, "EMP01"),
("RES02", "2026-06-01 15:00:00", "2026-06-05 11:00:00", 1000000002, "EMP01"),
("RES03", "2026-06-02 12:00:00", "2026-06-04 11:00:00", 1000000003, "EMP02"),
("RES04", "2026-06-03 14:00:00", "2026-06-06 11:00:00", 1000000004, "EMP05"),
("RES05", "2026-06-04 16:00:00", "2026-06-05 11:00:00", 1000000005, "EMP02"),
("RES06", "2026-06-05 14:00:00", "2026-06-10 11:00:00", 1000000006, "EMP08"),
("RES07", "2026-06-06 13:00:00", "2026-06-08 11:00:00", 1000000007, "EMP10"),
("RES08", "2026-06-07 14:00:00", "2026-06-09 11:00:00", 1000000008, "EMP13"),
("RES09", "2026-06-07 15:00:00", "2026-06-12 11:00:00", 1000000009, "EMP05"),
("RES10", "2026-06-08 14:00:00", "2026-06-11 11:00:00", 1000000010, "EMP01"),
("RES11", "2026-06-10 11:00:00", "2026-06-15 11:00:00", 1000000011, "EMP15"),
("RES12", "2026-06-11 14:00:00", "2026-06-13 11:00:00", 1000000012, "EMP18"),
("RES13", "2026-06-12 16:00:00", "2026-06-14 11:00:00", 1000000013, "EMP20"),
("RES14", "2026-06-15 14:00:00", "2026-06-17 11:00:00", 1000000014, "EMP15"),
("RES15", "2026-06-16 15:00:00", "2026-06-20 11:00:00", 1000000015, "EMP02"),
("RES16", "2026-06-18 14:00:00", "2026-06-19 11:00:00", 1000000016, "EMP08"),
("RES17", "2026-06-19 12:00:00", "2026-06-25 11:00:00", 1000000017, "EMP10"),
("RES18", "2026-06-20 14:00:00", "2026-06-22 11:00:00", 1000000018, "EMP13"),
("RES19", "2026-06-22 15:00:00", "2026-06-26 11:00:00", 1000000019, "EMP18"),
("RES20", "2026-06-25 14:00:00", "2026-06-30 11:00:00", 1000000020, "EMP20");

-- INSERTS: HABITACION_RESERVAS (20 Registros)
insert into habitacion_reservas (id_habitacion_reservas, id_habitacion, id_reservas) values
("HR01", "101A", "RES01"),
("HR02", "102A", "RES02"),
("HR03", "103B", "RES03"),
("HR04", "104B", "RES04"),
("HR05", "201A", "RES05"),
("HR06", "202A", "RES06"),
("HR07", "203B", "RES07"),
("HR08", "204C", "RES08"),
("HR09", "301A", "RES09"),
("HR10", "302B", "RES10"),
("HR11", "303C", "RES11"),
("HR12", "304D", "RES12"),
("HR13", "401B", "RES13"),
("HR14", "402B", "RES14"),
("HR15", "403C", "RES15"),
("HR16", "404D", "RES16"),
("HR17", "501C", "RES17"),
("HR18", "502C", "RES18"),
("HR19", "503D", "RES19"),
("HR20", "504D", "RES20");

-- Clientes
call sp_crear_categoria(2026039, "guatemala", "53881542");

-- Habitaciones
call sp_crear_habitacion("25B", "3", 35.60, "sencilla");

-- Empleados
call sp_crear_empleado("EMP21", "Andre Zabala", "supervisor");

-- Reservas
call sp_crear_reserva("zy89", "2026-05-08 09:24:00", "2026-05-08 12:00:00", 2026039, "EMP21");

-- Habitacion_Reservas
call sp_crear_habitacion_reserva("HR21", "25B", "zy89");


-- -----------------------------
--  INVOCACIÓN DE VISTAS
-- -----------------------------
-- VISTAS SIMPLES 
select * from vw_clientes;
select * from vw_habitaciones;
select * from vw_empleados;
select * from vw_reservas;
select * from vw_habitacion_reservas;

-- VISTAS COMPLETAS
select * from vw_detalle_reservas_;
select * from vw_habitaciones_por_reserva;
select * from vw_reporte_general_hotel;



