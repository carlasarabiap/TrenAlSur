create database tren;
use tren;

-- drop table if exists usuarios;

create  table if not exists usuarios (
	id int not null primary key auto_increment,
	nombre varchar(30),
    apellido varchar(30),
    fechaNac varchar(30),
    nacionalidad varchar(30),
    genero varchar(30),
    username varchar (75),
    password varchar (50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into usuarios (nombre, apellido, fechaNac, nacionalidad , genero, username, password) values
('Maria Alejandra', 'Fernandez Aquino', '15-11-1976', 'Venezolana', 'Femenino', 'mariafernandeza', '1234');


use tren;
select * from tren.usuarios;
select JSON_OBJECT('id',id,'nombre',nombre,'apellido',apellido,'fechaNac',fechaNac,'nacionalidad',nacionalidad,'genero',genero,'username',username,'password',password) from usuarios;
select JSON_ARRAYAGG(JSON_OBJECT('id',id,'nombre',nombre,'apellido',apellido,'fechaNac',fechaNac,'nacionalidad',nacionalidad,'genero',genero,'username',username,'password',password)) from usuarios;


-- select usuarios.id, usuarios.nombre, usuarios.apellido, usuarios.fechaNac, usuarios.nacionalidad, generos.genero, usuarios.username, usuarios.password
-- from usuarios
-- inner join generos on usuarios.id_genero = generos.id;

/* CREATE*/
-- insert into [nombre tabla] (campos) VALUES
-- (un valor para cada campo en el orden en que están);

/* READ*/
-- select * from usuarios;

/* UPDATE*/
-- update usuarios set [campo, ejm: nombre= 'José'], [campo, ejm: genero= 'Masculino'] where [condición, ejm: id=5];

/* DELETE*/
-- delete from usuarios where [condición, ejm: id = 5]

drop table if exists pasajeros;

create table if not exists pasajeros (
	id int not null primary key auto_increment,
	nombre varchar (30) not null,
    apellido varchar (30) not null,
    fechaNac varchar(30),
    nacionalidad varchar(30),
    -- id_genero int,
    genero varchar(30),
    id_usuario int,
    foreign key (id_usuario) references usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists pagos;

create table if not exists pagos (
	id int not null primary key auto_increment,
	pago varchar (30) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into pagos (pago) values
('Efectivo'),
('Débito'),
('Crédito'),
('Billetera Virtual');

drop table if exists descuentos;

create table if not exists descuentos (
	id int not null primary key auto_increment,
	edades varchar (30) not null,
    descuentos int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into descuentos (edades, descuentos) values
('< 3', 100),
('>2 y <13',25),
('>12 y <60',0),
('>59',50);

drop table if exists estaciones;

create table if not exists estaciones (
	id int not null primary key auto_increment,
	pais varchar (30) not null,
    ciudad varchar (30) not null,
    dia varchar (10) not null,
    salida varchar (5) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into estaciones (pais, ciudad, dia, salida) values
('Argentina', 'CABA', 'Sábado', '20:00'),
('Uruguay', 'Montevideo', 'Domingo', '20:00'),
('Paraguay', 'Asunción', 'Lunes', '20:00'),
('Brasil', 'Brasilia', 'Martes', '20:00'),
('Venezuela', 'Caracas', 'Miércoles', '20:00'),
('Colombia', 'Bogotá', 'Lunes', '20:00'),
('Ecuador', 'Quito', 'Martes', '20:00'),
('Perú', 'Lima', 'Miércoles', '20:00'),
('Bolivia', 'La Paz', 'Jueves', '20:00'),
('Chile', 'Santiago', 'Viernes', '20:00');

SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{', 
    '"id": "', id, '",', 
    '"pais": "', pais, '",', 
    '"ciudad": "', ciudad, '",', 
    '"dia": "', dia, '",', 
    '"salida": "', salida, '"}')), ']')  
INTO OUTFILE 'C:\Users\Microsoft\Documents\Programacion\estaciones.json'
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM estaciones;




drop table if exists ubicaciones;

create table if not exists ubicaciones (
	id int not null primary key auto_increment,
	ubicacion varchar(10),
    costo int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into ubicaciones (ubicacion, costo) values
('Ventana', 15000),
('Pasillo',	9000);

drop table if exists camarotes;

create table if not exists camarotes (
	id int not null primary key auto_increment,
	numero int unique,
    id_ubicacion int,
    status varchar (10) default 'Libre',
    foreign key (id_ubicacion) references ubicaciones(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into camarotes (numero, id_ubicacion) values
('1', 1),
('2', 2),
('3', 1),
('4', 2),
('5', 1),
('6', 2),
('7', 1),
('8', 2),
('9', 1),
('10', 2),
('11', 1),
('12', 2),
('13', 1),
('14', 2),
('15', 1),
('16', 2),
('17', 1),
('18', 2),
('19', 1),
('20', 2),
('21', 1),
('22', 2),
('23', 1),
('24', 2),
('25', 1),
('26', 2),
('27', 1),
('28', 2),
('29', 1),
('30', 2),
('31', 1),
('32', 2),
('33', 1),
('34', 2),
('35', 1),
('36', 2),
('37', 1),
('38', 2),
('39', 1),
('40', 2);

drop table if exists boletos;

create table if not exists boletos (
	id int not null primary key auto_increment,
	id_usuario int not null,
    id_pasajero int not null,
    id_estacion int not null,
    id_camarote int not null,
    id_descuento int not null,
    id_pago int not null,
    fechaViaje varchar(30) not null,
    foreign key (id_usuario) references usuarios(id),
    foreign key (id_estacion) references estaciones(id),
    foreign key (id_camarote) references camarotes(id),
    foreign key (id_pasajero) references pasajeros(id),
    foreign key (id_descuento) references descuentos(id),
    foreign key (id_pago) references pagos(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- insert into boletos (id_usuario, id_pasajero, id_estacion, id_camarote, id_descuento, id_pago, fechaViaje) values
-- (1, 1, 1, 1, 3, 3,'2024-07-15');



