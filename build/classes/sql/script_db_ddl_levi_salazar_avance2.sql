-- Leví Salazar Muñoz - 2026039 - IN4CM

-- drop database if exists hoteldb_in4cm;

create database if not exists hoteldb_in4cm; 
use hoteldb_in4cm;

-- DDL
-- creacion de tablas

-- CLIENTES 
create table clientes(
dpi bigint primary key, 
nacionalidad varchar(100) default "guatemala", 
telefono varchar(15) not null
);
describe clientes; 

-- HABITACIONES 
create table habitaciones(
	id_habitacion varchar(15) not null primary key, 
	piso varchar(5) not null,
	precio_noche decimal(10,2) not null, 
	tipo_habitacion varchar(100) not null 
);
describe habitaciones;

-- EMPLEADOS 
create table empleados(
	id_empleado varchar(9) not null primary key, 
	nombre varchar(100) not null, 
	cargo varchar(100) default "supervisor" 
);
describe empleados;

-- RESERVAS 
create table reservas(
	id_reservas varchar(100) not null primary key, 
	fecha_inicio timestamp not null,
	fecha_fin timestamp not null, 
-- llaves foraneas 
	dpi bigint, 
	id_empleado varchar(8),

	constraint fk_cliente foreign key (dpi) references clientes(dpi),
	constraint fk_empleado foreign key (id_empleado) references empleados(id_empleado)
);
describe reservas;

-- HABITACION_RESERVAS
create table habitacion_reservas(
	id_habitacion_reservas varchar(100) not null primary key, 
	id_habitacion varchar(15),
	id_reservas varchar(100),

	constraint fk_habitacion foreign key (id_habitacion) references habitaciones(id_habitacion),
	constraint fk_reserva foreign key (id_reservas) references reservas(id_reservas)
); 
describe habitacion_reservas;

-- VISTAS -- CREACION

-- 1. Vista para Clientes
create view vw_clientes as 
select dpi, nacionalidad, telefono 
from clientes;

-- 2. Vista para Habitaciones
create view vw_habitaciones as 
select id_habitacion, piso, precio_noche, tipo_habitacion 
from habitaciones;

-- 3. Vista para Empleados
create view vw_empleados as 
select id_empleado, nombre, cargo 
from empleados;

-- 4. Vista para Reservas
create view vw_reservas as 
select id_reservas, fecha_inicio, fecha_fin, dpi, id_empleado 
from reservas;

-- 5. Vista para Habitacion_Reservas 
create view vw_habitacion_reservas as 
select id_habitacion_reservas, id_habitacion, id_reservas 
from habitacion_reservas;

-- VISTAS COMPLETAS
create view vw_detalle_reservas_ as
select 
    r.id_reservas as 'ID Reserva',
    r.fecha_inicio as 'Fecha Inicio',
    r.fecha_fin as 'Fecha Fin',
    c.dpi as 'DPI Cliente',
    c.nacionalidad as 'Nacionalidad Cliente',
    e.nombre as 'Empleado que Atendió',
    e.cargo as 'Cargo Empleado'
from reservas r
inner join clientes c on r.dpi = c.dpi
inner join empleados e on r.id_empleado = e.id_empleado;

-- 2. Vista del desglose de habitaciones por reserva
create view vw_habitaciones_por_reserva as
select 
    hr.id_habitacion_reservas as 'ID Registro',
    hr.id_reservas as 'ID Reserva',
    h.id_habitacion as 'Habitación',
    h.piso as 'Piso',
    h.tipo_habitacion as 'Tipo',
    h.precio_noche as 'Precio por Noche'
from habitacion_reservas hr
inner join habitaciones h on hr.id_habitacion = h.id_habitacion;

-- 3. Vista Global (Maestro-Detalle): Une todas las tablas en una sola consulta
create view vw_reporte_general_hotel as
select 
    r.id_reservas as 'ID Reserva',
    r.fecha_inicio as 'Fecha Inicio',
    r.fecha_fin as 'Fecha Fin',
    c.dpi as 'DPI Cliente',
    c.telefono as 'Telefono Cliente',
    h.id_habitacion as 'Habitación',
    h.tipo_habitacion as 'Tipo Habitación',
    h.precio_noche as 'Precio por Noche',
    e.nombre as 'Empleado Atendió'
from habitacion_reservas hr
inner join reservas r on hr.id_reservas = r.id_reservas
inner join clientes c on r.dpi = c.dpi
inner join habitaciones h on hr.id_habitacion = h.id_habitacion
inner join empleados e on r.id_empleado = e.id_empleado;

-- CRUD DE TABLAS -- 
-- ---------------------------------------------------
-- CREAR -- CLIENTES 
-- ---------------------------------------------------
delimiter // 
create procedure sp_crear_categoria(
in _dpi bigint ,
in _nacionalidad varchar(100),
in _telefono varchar(15))
begin 
	insert into clientes(dpi, nacionalidad, telefono) values 
	(_dpi, _nacionalidad, _telefono);
end //
delimiter ;

-- LISTAR -- CLIENTES
delimiter //
create procedure sp_listar_clientes()
begin
		select dpi as DPI, nacionalidad as NACIONALIDAD, telefono as TELEFONO
		from clientes;
end //
delimiter ;
call sp_listar_clientes();
    
-- BUSCAR -- CLIENTES
delimiter // 
create procedure sp_buscar_cliente(in _dpi bigint)
begin
	select dpi, nacionalidad, telefono from clientes where dpi = _dpi;
end // 
delimiter ; 

-- UPDATE -- CLIENTES 
delimiter // 
create procedure sp_actualizar_Clientes(in _dpi bigint, 
_nacionalidad varchar(100), 
_telefono varchar(15)) 
begin 
	update clientes set nacionalidad = _nacionaliad, telefono = _telefono where dpi = _dpi; 
end //
delimiter ; 

-- DELETE -- CLIENTES 
delimiter // 
create procedure sp_eliminar_cliente(in _dpi bigint)
begin 
	delete from clientes where dpi = _dpi; 
end // 
delimiter ; 

-- --------------------------------------------------------
-- CREAR --HABITACIONES 
-- --------------------------------------------------------
delimiter //
create procedure sp_crear_habitacion(in _id varchar(15),
 in _piso varchar(5),
 in _precio decimal(10,2), 
 in _tipo varchar(100))
begin
	insert into habitaciones(id_habitacion, piso, precio_noche, tipo_habitacion) values (_id, _piso, _precio, _tipo);
end //
delimiter ;

-- LISTAR -- HABITACIONES 
delimiter //
create procedure sp_listar_habitaciones()
begin
    select id_habitacion as 'ID HABITACION', piso as PISO, precio_noche as PRECIO, tipo_habitacion as TIPO 
    from habitaciones;
end //
delimiter ;


-- BUSCAR -- HABITACIONES 
delimiter //
create procedure sp_buscar_habitacion(in _id varchar(15))
begin
	select id_habitacion, piso, precio_noche, tipo_habitacion from habitaciones where id_habitacion = _id;
end //
delimiter ;

-- UPDATE -- HABITACIONES 
delimiter //
create procedure sp_actualizar_habitacion(in _id varchar(15),
 in _piso varchar(5),
 in _precio decimal(10,2), 
 in _tipo varchar(100))
begin
	update habitaciones set piso = _piso, precio_noche = _precio, tipo_habitacion = _tipo where id_habitacion = _id;
end //
delimiter ;

-- DELETE -- HABITACIONES 
delimiter //
create procedure sp_eliminar_habitacion(in _id varchar(15))
begin
	delete from habitaciones where id_habitacion = _id;
end //
delimiter ;

-- -----------------------------------------------------------------
-- CREAR -- EMPLEADOS 
-- -----------------------------------------------------------------
delimiter //
create procedure sp_crear_empleado(in _id varchar(9),
 in _nombre varchar(100),
 in _cargo varchar(100))
begin
	insert into empleados(id_empleado, nombre, cargo) values (_id, _nombre, _cargo);
end //
delimiter ;

-- LISTAR -- EMPLEADOS
delimiter //
create procedure sp_listar_empleados()
begin
	select id_empleado as ID, nombre as 'NOMBRE EMPLEADO', cargo as CARGO 
    from empleados;
end //
delimiter ;

-- BUSCAR -- EMPLEADOS 
delimiter //
create procedure sp_buscar_empleado(in _id varchar(9))
begin
	select id_empleado, nombre, cargo from empleados where id_empleado = _id;
end //
delimiter ;

-- UPDATE -- EMPLEADOS 
delimiter //
create procedure sp_actualizar_empleado(in _id varchar(9),
 in _nombre varchar(100),
 in _cargo varchar(100))
begin
	update empleados set nombre = _nombre, cargo = _cargo where id_empleado = _id;
end //
delimiter ;

-- DELETE -- CLIENTES
delimiter //
create procedure sp_eliminar_empleado(in _id varchar(9))
begin
	delete from empleados where id_empleado = _id;
end //
delimiter ;

-- -----------------------------------------------------------------------------
-- CREAR -- RESERVAS
-- -----------------------------------------------------------------------------
delimiter //
create procedure sp_crear_reserva(in _id varchar(100), 
in _inicio timestamp, 
in _fin timestamp,
 in _dpi bigint, 
 in _id_emp varchar(8))
begin
	insert into reservas(id_reservas, fecha_inicio, fecha_fin, dpi, id_empleado)
    values (_id, _inicio, _fin, _dpi, _id_emp);
end //
delimiter ;

-- LISTAR -- RESERVAS
delimiter //
create procedure sp_listar_reservas()
begin
	select id_reservas as ID, fecha_inicio as INICIO, fecha_fin as FIN, dpi as DPI, id_empleado as 'ID EMPLEADO'
    from reservas;
end //
delimiter ;

-- BUSCAR -- RESERVAS
delimiter //
create procedure sp_buscar_reserva(in _id varchar(100))
begin
	select id_reservas, fecha_inicio, fecha_fin, dpi, id_empleado
    from reservas
    where id_reservas = _id;
end //
delimiter ;

-- UPDATE RESERVAS
delimiter //
create procedure sp_actualizar_reserva(in _id varchar(100), in _inicio timestamp, in _fin timestamp, in _dpi bigint, in _id_emp varchar(8))
begin
	update reservas 
    set fecha_inicio = _inicio, fecha_fin = _fin, dpi = _dpi, id_empleado = _id_emp 
    where id_reservas = _id;
end //
delimiter ;

-- DELETE RESERVAS
delimiter //
create procedure sp_eliminar_reserva(in _id varchar(100))
begin
	delete from reservas 
    where id_reservas = _id;
end //
delimiter ;


-- -----------------------------------------------------------------------------
-- CREAR -- HABITACION_RESERVAS
-- -----------------------------------------------------------------------------
delimiter //
create procedure sp_crear_habitacion_reserva(in _id varchar(100), 
in _id_hab varchar(15), 
in _id_res varchar(100))
begin
	insert into habitacion_reservas(id_habitacion_reservas, id_habitacion, id_reservas)
    values (_id, _id_hab, _id_res);
end //
delimiter ;

-- LISTAR -- HABITACION_RESERVAS
delimiter //
create procedure sp_listar_habitacion_reservas()
begin
	select id_habitacion_reservas, id_habitacion , id_reservas 
    from habitacion_reservas;
end //
delimiter ;

-- BUSCAR -- HABITACION_RESERVAS
delimiter //
create procedure sp_buscar_habitacion_reserva(in _id varchar(100))
begin
	select id_habitacion_reservas, id_habitacion, id_reservas
    from habitacion_reservas
    where id_habitacion_reservas = _id;
end //
delimiter ;

-- UPDATE -- HABITACION_RESERVAS
delimiter //
create procedure sp_actualizar_habitacion_reserva(in _id varchar(100),
 in _id_hab varchar(15),
 in _id_res varchar(100))
begin
	update habitacion_reservas set id_habitacion = _id_hab, id_reservas = _id_res 
    where id_habitacion_reservas = _id;
end //
delimiter ;

-- DELETE -- HABITACION_RESERVAS
delimiter //
create procedure sp_eliminar_habitacion_reserva(in _id varchar(100))
begin
	delete from habitacion_reservas 
    where id_habitacion_reservas = _id;
end //
delimiter ;

call sp_listar_clientes();
call sp_listar_habitaciones();
call sp_listar_empleados();
call sp_listar_reservas();
call sp_listar_habitacion_reservas();





