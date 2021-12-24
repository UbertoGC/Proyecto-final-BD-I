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
CREATE  PROCEDURE `busqueda_articulo_gerente`(IN nom varchar(30), IN pre_mayor decimal(10,2),IN pre_menor decimal(10,2),in mate varchar(30), in proveedor_nombre varchar(30), in proveedor_direccion text, in cantidad_mayor integer, in cantidad_menor integer)
BEGIN
	if(pre_mayor=null) then
		set pre_mayor=0.0;
    end if;
    if(pre_menor=null) then
		set pre_menor=10000000.0;
    end if;
    if(cantidad_mayor=null) then
		set cantidad_mayor=-1;
    end if;
    if(cantidad_menor=null) then
		set cantidad_menor=10000000;
    end if;
    
	select s.codigo, s.nombre, s.precio, s.material, p.codigo, p.nombre, p.direccion, 
    (select sum(a.cantidad) from almacen a inner join Sofas s on a.sofa_c = s.codigo) as 'cantidad' from Sofas s
    inner join Proveedor p on p.codigo like s.codigo_proveedor where s.nombre like concat('%',nom, '%') and 
    pre_mayor<s.precio and pre_menor>s.precio and material like concat('%',mate, '%') and p.nombre like 
    concat(proveedor_nombre, '%') and  p.direccion like concat('%',proveedor_direccion, '%') and
    (select sum(a.cantidad) from almacen a inner join Sofas s on a.sofa_c = s.codigo)>cantidad_mayor and
    (select sum(a.cantidad) from almacen a inner join Sofas s on a.sofa_c = s.codigo)<cantidad_menor;
END;
//
DELIMITER ;