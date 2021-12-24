drop database if exists venta_sofas;
CREATE DATABASE venta_sofas;

USE venta_sofas;

CREATE TABLE  Persona (
	codigo INTEGER PRIMARY KEY,
    fecha_de_nacimiento DATE,
    genero CHAR(1),
    direccion TEXT);
    

CREATE TABLE Nombre (
	codigo_persona INTEGER UNIQUE,
    nombres VARCHAR(30),
    primer_apellido VARCHAR(30),
    segundo_apellido VARCHAR(30),
    PRIMARY KEY (nombres, primer_apellido, segundo_apellido));
    

CREATE TABLE Usuarios (
	codigo_persona INTEGER PRIMARY KEY,
    usuario VARCHAR(30) UNIQUE,
    clave TEXT);


CREATE TABLE Proveedor (
	codigo INTEGER unique,
    nombre VARCHAR(30) PRIMARY KEY,
    direccion TEXT);


CREATE TABLE Ventas (
	usuario_c INTEGER,
    sofa_c INTEGER,
    fecha DATE,
    cantidad INTEGER,
    PRIMARY KEY (usuario_c, sofa_c));
    

CREATE TABLE Sofas (
	codigo INTEGER PRIMARY KEY,
    nombre VARCHAR(30),
    precio DECIMAL(10,2),
    codigo_proveedor integer,
    material VARCHAR(30));
    

CREATE TABLE Almacen (
	sofa_c INTEGER,
    oficina_c INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (sofa_c, oficina_c));
    

CREATE TABLE Oficina (
	codigo INTEGER PRIMARY KEY,
    pais VARCHAR(20),
    direccion TEXT);


CREATE TABLE Trabajadores (
	codigo_persona INTEGER PRIMARY KEY,
    sueldo DECIMAL(10,2),
    fecha_de_contrato DATE);
    

CREATE TABLE Jefe (
	codigo INTEGER PRIMARY KEY);
    

CREATE TABLE Empleado (
	codigo INTEGER,
    codigo_oficina INTEGER,
    PRIMARY KEY (codigo, codigo_oficina));
    

CREATE TABLE Gerente (
	codigo INTEGER PRIMARY KEY,
    usuario_g VARCHAR(30) UNIQUE,
    clave_g TEXT);


CREATE TABLE Extension (
	codigo INTEGER PRIMARY KEY,
    tipo VARCHAR(30),
    codigo_jefe INTEGER UNIQUE);
    

CREATE TABLE Matriz (
	codigo INTEGER PRIMARY KEY,
    codigo_gerente INTEGER UNIQUE);


-------------------------------------------------------------------------------------------


ALTER TABLE Persona ADD FOREIGN KEY (codigo) REFERENCES Nombre (codigo_persona);

ALTER TABLE Usuarios ADD FOREIGN KEY (codigo_persona) REFERENCES Persona (codigo);

ALTER TABLE Ventas ADD FOREIGN KEY (usuario_c) REFERENCES Usuarios (codigo_persona);
ALTER TABLE Ventas ADD FOREIGN KEY (sofa_c) REFERENCES Sofas (codigo);

ALTER TABLE Sofas ADD FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor (codigo);

ALTER TABLE Almacen ADD FOREIGN KEY (sofa_c) REFERENCES Sofas (codigo);
ALTER TABLE Almacen ADD FOREIGN KEY (oficina_c) REFERENCES Oficina (codigo);

ALTER TABLE Trabajadores ADD FOREIGN KEY (codigo_persona) REFERENCES Persona (codigo);

ALTER TABLE Gerente ADD FOREIGN KEY (codigo) REFERENCES Trabajadores (codigo_persona);
ALTER TABLE Jefe ADD FOREIGN KEY (codigo) REFERENCES Trabajadores (codigo_persona);
ALTER TABLE Empleado ADD FOREIGN KEY (codigo) REFERENCES Trabajadores (codigo_persona);
ALTER TABLE Empleado ADD FOREIGN KEY (codigo_oficina) REFERENCES Oficina (codigo);

ALTER TABLE Extension ADD FOREIGN KEY (codigo) REFERENCES Oficina (codigo);
ALTER TABLE Extension ADD FOREIGN KEY (codigo_jefe) REFERENCES Jefe (codigo);

ALTER TABLE Matriz ADD FOREIGN KEY (codigo) REFERENCES Oficina (codigo);
ALTER TABLE Matriz ADD FOREIGN KEY (codigo_gerente) REFERENCES Gerente (codigo);
/*INSERCCION DE VALORES*/
insert into Nombre values(1,'Lina Mina','Anastasha','Konaha');
insert into Persona values(1,'2001-08-16','F','Calle Fosefall 201');
insert into Trabajadores values(1,1050.50,'2010-10-28');
insert into Gerente values(1,'Minalima','Lissira');
insert into Usuarios values(1,'Limina','12345');
/*Oficina*/
insert into oficina values(1,'Peru','Av. Lima 102, Lima');
insert into oficina values(2,'Peru','Calle Saul 12, Arequipa');
insert into oficina values(3,'Peru','Av. Jorge 25, Ayacucho');
insert into oficina values(4,'Peru','Calle Hindun 33, Lima');
insert into oficina values(5,'Peru','Av. Moar 45, Ica');
insert into oficina values(6,'Peru','Calle Koin 67, Amazonas');
insert into oficina values(7,'Peru','Av. Lima 102, Puno');
insert into oficina values(8,'Peru','Calle Saul 12, Huancayo');
insert into oficina values(9,'Peru','Av. Jorge 25, Moquegua');
insert into oficina values(10,'Peru','Calle Hindun 33, Tacna');
insert into oficina values(11,'Chile','Av. La Mar 102, Santiago');
insert into oficina values(12,'Chile','Calle Jose 12, Choquimbo');
insert into oficina values(13,'Chile','Av. Venezuela 25, Aconcagua');
insert into oficina values(14,'Chile','Calle Firulais 33, Colchagua');
insert into oficina values(15,'Chile','Av. Mahoma 45, Maule');
insert into oficina values(16,'Chile','Calle Kain 67, Concepción');
insert into oficina values(17,'Chile','Av. La plaza 102, Valdivia');
insert into oficina values(18,'Chile','Calle Marruecos 12, Chiloé');
/*almacen*/
insert into almacen values(1,1,100);
insert into almacen values(1,2,152);
insert into almacen values(1,10,20);
insert into almacen values(2,1,170);
insert into almacen values(2,11,14);
insert into almacen values(3,10,120);
insert into almacen values(3,11,90);
insert into almacen values(4,1,109);
insert into almacen values(4,10,100);
insert into almacen values(4,14,87);
insert into almacen values(4,18,70);
insert into almacen values(5,2,135);
insert into almacen values(6,2,50);
insert into almacen values(6,10,20);
insert into almacen values(7,3,13);
insert into almacen values(7,4,200);
insert into almacen values(7,5,87);
insert into almacen values(8,8,120);
insert into almacen values(8,7,141);
insert into almacen values(9,7,119);
insert into almacen values(9,13,24);
insert into almacen values(9,17,170);
insert into almacen values(10,9,510);
insert into almacen values(11,11,20);
insert into almacen values(12,16,110);
insert into almacen values(12,14,50);
insert into almacen values(13,16,45);
insert into almacen values(13,11,70);
insert into almacen values(14,9,95);
insert into almacen values(14,1,147);
insert into almacen values(14,10,100);
insert into almacen values(14,18,113);
insert into almacen values(15,18,140);
/*Sofas*/
insert into sofas values(1,'Sofa de dos plazas',100.50,1,'cuero');
insert into sofas values(2,'Sofa comodidad',150.00,1,'cuero');
insert into sofas values(3,'Sofa libertad',200.50,2,'cuero');
insert into sofas values(4,'Sofa Detray',125.00,2,'cuero');
insert into sofas values(5,'Milano de algodon',175.50,3,'algodon');
insert into sofas values(6,'Sofa chair',120.00,3,'algodon');
insert into sofas values(7,'Mizano',180.50,4,'algodon');
insert into sofas values(8,'Sofa Oveja',130.00,4,'lana');
insert into sofas values(9,'Sofa de dos plazas',170.50,5,'lana');
insert into sofas values(10,'Sofa de dos Sofa',107.00,5,'cuerina');
insert into sofas values(11,'Sofa familiar',180.00,6,'cuerina');
insert into sofas values(12,'Sofa chair',195.50,6,'cuerina');
insert into sofas values(13,'Sofa familiar',225.50,7,'sintetico');
insert into sofas values(14,'Sofa de dos plazas',150.00,7,'sintetico');
insert into sofas values(15,'Sofa chair',100.00,8,'sintetico');
/*Proveedor*/
insert into proveedor values(1,'Tecnologia Moderna','Av. Kiron 105');
insert into proveedor values(2,'Vivienda Comoda','Calle Aeon 15');
insert into proveedor values(3,'Vida Saludable','Av. Thomas 10');
insert into proveedor values(4,'Tecnologia de Hogares','Calle Santos 54');
insert into proveedor values(5,'El Cojin del cielo','Av. Mirror 28');
insert into proveedor values(6,'Elegancia Hogareña','Av. Antoanet 47');
insert into proveedor values(7,'Cazando Comodidad','Av. Limad 10');
insert into proveedor values(8,'Vida Agradable','Av. Jilklost 6');
insert into proveedor values(9,'Sperlight','Calle Asther 14');
insert into proveedor values(10,'Nogiro','Calle Asta 7');
insert into proveedor values(11,'Nostable','Calle Limodead 19');
insert into proveedor values(12,'Casa Almohada','Calle Thorner 23');
insert into proveedor values(13,'Space House','Calle Kirshat 33');
insert into proveedor values(14,'Cagirtul','Calle Thuraliu 78');
insert into proveedor values(15,'Essence of House','Av. Antares 49');
/*PROCESOS DE ALMACENAMIENTO*/
DELIMITER //
drop procedure if exists `existencia`;//
CREATE  PROCEDURE `existencia`(IN usuario CHAR(30), 
				IN contrasena text)
BEGIN
	if (SELECT u.codigo_persona FROM usuarios u WHERE u.usuario=usuario AND u.clave=contrasena) then
		SELECT u.codigo_persona, n.nombres, n.primer_apellido, n.segundo_apellido, 2 as 'status' FROM usuarios u inner join nombre n on n.codigo_persona=u.codigo_persona WHERE u.usuario=usuario AND u.clave=contrasena;
	else
		SELECT g.codigo, n.nombres, n.primer_apellido, n.segundo_apellido, 1 as 'status' FROM gerente g inner join nombre n on n.codigo_persona=g.codigo WHERE g.usuario_g=usuario AND g.clave_g=contrasena;
	end if;
END;
//
DELIMITER ;
DELIMITER //
drop procedure if exists `busqueda_articulo_gerente`;//
CREATE  PROCEDURE `busqueda_articulo_gerente`(nom varchar(30), pre_mayor decimal(10,2), pre_menor decimal(10,2), mate varchar(30), proveedor_nombre varchar(30), proveedor_direccion text, cantidad_mayor integer, cantidad_menor integer)
BEGIN
    if ISnull(nom) then
		set nom='';
    end if;
    if ISnull(mate) then
		set mate='';
    end if;
    if ISnull(proveedor_nombre) then
		set proveedor_nombre='';
    end if;
    if ISnull(proveedor_direccion) then
		set proveedor_direccion='';
    end if;
	select s.codigo, s.nombre, s.precio, s.material, p.codigo, p.nombre, p.direccion, 
    sum(a.cantidad) as 'cantidad' from sofas s
    inner join proveedor p on p.codigo like s.codigo_proveedor inner join almacen a on a.sofa_c=s.codigo 
    where s.nombre like concat(nom,'%') and
    p.nombre like concat(proveedor_nombre,'%') and
    s.material like concat(mate,'%') and
    p.direccion like concat('%',proveedor_direccion,'%') and 
    pre_mayor < s.precio and s.precio < pre_menor
    
    group by s.codigo having sum(a.cantidad)>cantidad_mayor and sum(a.cantidad)<cantidad_menor order by s.codigo ;
END;
//
DELIMITER ;
DELIMITER //
drop procedure if exists `busqueda_ventas_gerente`;//
CREATE  PROCEDURE `busqueda_ventas_gerente`(comprador_nombre varchar(30), comprador_apellido1 varchar(30)
, comprador_apellido2 varchar(30), sofa_nombre varchar(30), preunitario_mayor decimal(10,2),  preunitario_menor decimal(10,2), total_mayor decimal(10,2), total_menor decimal(10.2), cantidad_mayor integer, cantidad_menor integer)
BEGIN
    if ISnull(comprador_nombre) then
		set comprador_nombre='';
    end if;
    if ISnull(comprador_apellido1) then
		set comprador_apellido1='';
    end if;
    if ISnull(comprador_apellido2) then
		set comprador_apellido2='';
    end if;
    if ISnull(sofa_nombre) then
		set sofa_nombre='';
    end if;
	select n.*, s.codigo, s.nombre, s.precio, v.cantidad, s.precio*v.cantidad as 'total' from nombre n 
    inner join ventas v on v.usuario_c = n.codigo_persona inner join sofas s on s.codigo=v.sofa_c
    where n.nombres like concat(comprador_nombre,'%') and 
    n.primer_apellido like concat(comprador_apellido1,'%') and
    n.segundo_apellido like concat(comprador_apellido2,'%') and
    preunitario_mayor < s.precio and s.precio < preunitario_menor and
    cantidad_mayor < v.cantidad and v.cantidad < cantidad_menor and
    total_mayor < s.precio*v.cantidad and s.precio*v.cantidad < total_menor
    order by s.codigo;
END;
//
DELIMITER ;
call busqueda_ventas_gerente('Sofa',0.0,10000.00,null,null,null,100,300);
