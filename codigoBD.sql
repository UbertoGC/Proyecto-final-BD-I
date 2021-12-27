drop database if exists venta_sofas;
CREATE DATABASE venta_sofas;

USE venta_sofas;

CREATE TABLE  Persona (
	codigo INTEGER auto_increment primary KEY,
    fecha_de_nacimiento DATE,
    genero CHAR(1),
    direccion TEXT,
    pais varchar(30),
    departamento varchar(30));
    
CREATE TABLE Nombre (
	codigo_persona INTEGER auto_increment UNIQUE,
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
    direccion TEXT,
    departamento varchar(30),
    pais varchar(30));

CREATE TABLE Ventas (
	usuario_c INTEGER,
    sofa_c INTEGER,
    fecha DATE,
    cantidad INTEGER,
    PRIMARY KEY (usuario_c, sofa_c, fecha));
    
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
    direccion TEXT, 
    departamento varchar(30));

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
-------------------------------------------------------------------------------------------
/*INSERCCION DE VALORES*/
-------------------------------------------------------------------------------------------
/*NOMBRES*/

INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (1, "Roy Angel", "Choquehuanca", "Anconeyra");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (2, "Moises Alejandro", "Casaverde", "Aleman");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (3, "Uberto", "Garcia", "Caceres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (4, "Diego Jorge", "Claverias", "Gonzales");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (5, "Ariana Lucia", "Mendoza", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (6, "Maria Fernanda", "Gonzales", "Belizario");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (7, "Mauricio Alejandro", "Farfan", "Huayta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (8, "Alisson", "Medina", "Fuentes");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (9, "Ancel Liar", "Elmer", "Votkan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (10, "Bryan Blizzard", "Acosta", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (11, "Elias", "Quispe", "Huanca");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (12, "Sonia Mary", "Linares", "Caceres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (13, "Christie Alexandra", "Jimenez", "Alvarez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (14, "Fabricio Alejandro", "Leonel", "Humpiri");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (15, "Ricardo Manuel", "Herrera", "Rodriguez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (16, "Tahiz Arlet", "Butron", "Mendoza");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (17, "Mine Lia", "Arley", "Mendran");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (18, "Tai", "Shoka", "Minz");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (19, "Rodrigo Gustavo", "Vildoso", "Richer");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (20, "Mark Edward", "Alvarez", "Zoprano");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (21, "Miguel", "Hernandez", "Coronel");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (22, "Martín Miguel", "González", "Aleman");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (23, "Isaac", "Garcia", "Rodríguez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (24, "Emmanuel Jorge", "Fernández", "Gonzales");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (25, "Ariana Erica", "Mendoza", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (26, "Maria Nina", "Gonzales", "Martínez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (27, "Patricio Alejandro", "Sánchez", "Huayta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (28, "Jaina", "Medina", "Pérez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (29, "Zera Liar", "Gómez", "Votkan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (30, "Daniel Leon", "Martin", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (31, "Valentino", "Ruiz", "Jiménez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (32, "Cristóbal Alejandro", "Carmona", "Arias");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (33, "César", "Crespo", "Ruiz");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (34, "Mario Jorge", "Claverias", "Gonzales");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (35, "Kimberly Fernanda", "Vicente", "Benítez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (36, "Alisson Fernanda", "Santiago", "Ferrer");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (37, "Dylan César", "Farfan", "Hidalgo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (38, "Kimberly", "Hidalgo", "Fuentes");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (39, "Bautista Matthew", "Elmer", "Montero");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (40, "Bryan Oscar", "Campos", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (41, "Jonathan", "Hernandez", "Campos");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (42, "Pedro Alejandro", "Casaverde", "Carrasco");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (43, "Anthony", "Garcia", "Caballero");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (44, "Hugo Ricardo", "Claverias", "Herrera");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (45, "Reina Lucia", "Mendoza", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (46, "Ancela Reina", "Caballero", "Herrera");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (47, "Mauricio Alejandro", "Peña", "Huayta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (48, "Aliara", "Medina", "Peña");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (49, "Arturo Sho", "Peña", "Herrera");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (50, "Hugo Mauricio", "Acosta", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (51, "Oscar", "Aleman", "Castillo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (52, "Moises Guerrero", "Acosta", "Aleman");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (53, "Gallego", "Torres", "Hernandez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (54, "Gallego Guerrero", "Claverias", "Gallego");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (55, "Lisa Galina", "Gallego", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (56, "Maria Jink", "Cano", "Belizario");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (57, "Oscar Guerrero", "Cano", "Castillo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (58, "Reina", "Medina", "Guerrero");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (59, "Cano Liar", "Guerrero", "Castillo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (60, "Jerónimo Cano", "Garrido", "Prieto");


INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (61, "Cano", "Rubio", "Ortiz");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (62, "Humberto Sebastián", "Ortiz", "Ortiz");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (63, "Simón", "Ortiz", "Caceres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (64, "Juan Sebastián", "Claverias", "Ortiz");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (65, "Ariana Lucia", "Castro", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (66, "Maria Fernanda", "Gonzales", "Castro");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (67, "Ortega Moises", "Delgado", "Rubio");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (68, "Jink", "Medina", "Delgado");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (69, "Agustín Liar", "Ortega", "Votkan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (70, "Bryan Agustín", "Acosta", "Domínguez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (71, "Joshua", "Domínguez", "Gil");
INSERT into nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (72, "Moises Alejandro", "Vázquez", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (73, "David", "Garcia", "Vázquez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (74, "Diego Kevin", "Gil", "Gonzales");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (75, "Ariana Rosa", "Domínguez", "Lopez");

INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (76, "Rosa Jink", "Alonso", "Acosta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (77, "Christopher Kevin", "Farfan", "Huayta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (78, "Yeni", "Álvarez", "Fuentes");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (79, "Kevin Lion", "Alonso", "Gonzales");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (80, "Bryan Christopher", "Gonzales", "Álvarez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (81, "Jerónimo", "Hernandez", "Lorenzo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (82, "Erick Emilio", "Lorenzo", "Reyes");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (83, "Javier", "Garcia", "Caceres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (84, "Javier Jorge", "Claverias", "Vega");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (85, "Ariana Ana", "Reyes", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (86, "Maria Fernanda", "Vega", "Lorenzo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (87, "Aaron Alejandro", "Farfan", "Huayta");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (88, "Lisa", "Campos", "Fuentes");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (89, "Javier Erick", "Campos", "Votkan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (90, "Bryan Leon", "Acosta", "Torres");

INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (91, "Erick", "Reyes", "Vega");
INSERT into nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (92, "Cristian Andrés", "Casaverde", "Farfan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (93, "Rodrigo", "Garcia", "Carrasco");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (94, "Andrés Damian", "Garcia", "Caceres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (95, "Ariana Maria", "Montero", "Lopez");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (96, "Rosa Fernanda", "Gonzales", "Farfan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (97, "Lucas Andrés", "Farfan", "Montero");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (98, "Ana", "Peña", "Cabrera");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (99, "Andrés Lucas", "Elmer", "Farfan");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (100, "Jerónimo Leon", "Cabrera", "Torres");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (101, "Santiago", "Rojas", "Sáez");
INSERT into nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (102, "Adrián Nicolás", "Esteban", "Gallardo");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (103, "Nicolás", "Garcia", "Rojas");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (104, "Mateo Adrián", "Bravo", "Esteban");
INSERT INTO nombre(codigo_persona, nombres, primer_apellido, segundo_apellido)
VALUES (105, "Rosa Kina", "Esteban", "Bravo");

-------------------------------------------------------------------------------------------
/*PERSONA*/
INSERT INTO persona
VALUES (1, "2001-05-01", "M", "Algerie Jr. Min Lt. 3A Mz. 14",'Peru','Lima');
INSERT INTO persona
VALUES (2, "1995-07-12", "M", "Ilin Jr. Nine & Bettsuan Lt. 2A",'Peru','Lima');
INSERT INTO persona
VALUES (3, "1997-11-24", "M", "C.Lime Av. Volate Lt. 1A",'Chile', 'Santiago');
INSERT INTO persona
VALUES (4, "1999-02-13", "M", "Ilin Jr. Eulic Lt. 2C",'Chile', 'Santiago');
INSERT INTO persona
VALUES (5, "2002-11-20", "F", "Khel City Av. Nouone Lt. 3C Mz. 20 Zn. B",'Colombia', 'Bogotá');
INSERT INTO persona
VALUES (6, "2001-10-14", "F", "C.Lime Av. Bonavier Lt. 4A",'Colombia', 'Bogotá');
INSERT INTO persona
VALUES (7, "2000-12-14", "M", "Ilin Jr. Circle Mz. 11",'Venezuela', 'Caracas');
INSERT INTO persona
VALUES (8, "1998-02-14", "F", "NewVine Av. Littorie Zn. 3A",'Venezuela', 'Caracas');
INSERT INTO persona
VALUES (9, "1996-04-05", "M", "C.Lime Av. Oniu Lt. 3D",'España', 'Madrid');
INSERT INTO persona
VALUES (10, "1993-02-02", "M", "Algerie Jr. Beware Lt. 4A Mz. 05",'España', 'Madrid');
INSERT INTO persona
VALUES (11, "2001-09-05", "M", "Ilin Jr. Berter Lt. 2B",'Argentina', 'Buenos Aires');
INSERT INTO persona
VALUES (12, "1996-10-25", "F", "Green Circle Av. Minei Lt. 1A Mz. 23",'Argentina', 'Buenos Aires');
INSERT INTO persona
VALUES (13, "1992-07-13", "F", "Ilin Jr. Arise & Baker Lt. 2A",'Mexico', 'Mexico');
INSERT INTO persona
VALUES (14, "2000-12-12", "M", "Khel City Av. Opeinen Lt. 3A Zn. B",'Mexico', 'Mexico');
INSERT INTO persona
VALUES (15, "1999-03-01", "M", "C.Lime Av. Listening Lt. 1A Zn. 3",'Honduras', 'Tegucigalpa');
INSERT INTO persona
VALUES (16, "2000-01-29", "F", "Green Circle Jr. Killer Mz. 02",'Honduras', 'Tegucigalpa');
INSERT INTO persona
VALUES (17, "1999-03-14", "F", "NewVine Av. Venetto Zn. 3C",'Bolivia', 'La Paz');
INSERT INTO persona
VALUES (18, "1999-12-05", "M", "C.Lime Av. Larker Lt. 3E",'Bolivia', 'La Paz');
INSERT INTO persona
VALUES (19, "1998-10-08", "M", "Algerie Jr. Neander Lt. 4A Mz. 07",'Guatemala', 'Guatemala');
INSERT INTO persona
VALUES (20, "2000-09-09", "M", "Ilin Jr. Berter Lt. 2A Mz. 23",'Guatemala', 'Guatemala');
INSERT INTO persona
VALUES (21, "2002-11-14", "M", "C.Lime Av. Rising Lt. 3B",'Ecuador', 'Quito');
INSERT INTO persona
VALUES (22, "1999-07-05", "M", "C.Lime Av. Rising Lt. 3B",'Ecuador', 'Quito');
INSERT INTO persona
VALUES (23, "2000-09-09", "M", "Ilin Jr. Berter Lt. 2A Mz. 23",'Nicaragua', 'Managua');
INSERT INTO persona
VALUES (24, "2000-10-01", "M", "Algerie Jr. Neander Lt. 4A Mz. 07",'Nicaragua', 'Managua');
INSERT INTO persona
VALUES (25, "1999-07-13", "F", "C.Lime Av. Larker Lt. 3E",'EE.UU.', 'Washington D.C.');
INSERT INTO persona
VALUES (26, "1999-10-13", "F", "NewVine Av. Venetto Zn. 3C",'EE.UU.', 'Washington D.C.');
INSERT INTO persona
VALUES (27, "2000-07-01", "M", "Green Circle Jr. Killer Mz. 02",'Inglaterra', 'Londres');
INSERT INTO persona
VALUES (28, "1999-07-01", "F", "C.Lime Av. Listening Lt. 1A Zn. 3",'Inglaterra', 'Londres');
INSERT INTO persona
VALUES (29, "1993-03-02", "F", "Khel City Av. Opeinen Lt. 3A Zn. B",'Puerto Rico', 'San Juan');
INSERT INTO persona
VALUES (30, "1992-07-13", "M", "Berter Jr. NewVine & Baker Lt. 2A",'Puerto Rico', 'San Juan');
INSERT INTO persona
VALUES (31, "1996-10-13", "M", "Green Baker Av. Ilin Lt. 1A Mz. 23",'Peru', 'Arequipa');
INSERT INTO persona
VALUES (32, "2001-09-02", "M", "Ilin Jr. Berter Lt. 2B",'Peru', 'Arequipa');
INSERT INTO persona
VALUES (33, "1993-12-13", "M", "Algerie Jr. Beware Lt. 4A Mz. 05",'Peru', 'Ayacucho');
INSERT INTO persona
VALUES (34, "2001-12-25", "M", "C.Bettsuan Av. Baker Lt. 3D",'Peru', 'Ayacucho');
INSERT INTO persona
VALUES (35, "1993-02-25", "F", "NewVine Av. Bonavier Zn. 3A",'Peru', 'Lima');
INSERT INTO persona
VALUES (36, "2000-05-05", "F", "Circle Jr. Green Mz. 11",'Peru', 'Lima');
INSERT INTO persona
VALUES (37, "2001-02-12", "M", "Green Circle Av. Minei Lt. 1A Mz. 23",'Colombia', 'Bolívar');
INSERT INTO persona
VALUES (38, "1998-02-12", "F", "C.Minei Av. Ilin Lt. 4A",'Colombia', 'Bolívar');
INSERT INTO persona
VALUES (39, "1996-05-14", "M", "Bonavier Jr. NewVine Lt. 3A Mz. 14",'Colombia', 'Córdoba');
INSERT INTO persona
VALUES (40, "1998-05-14", "M", "Ilin Jr. Beware & Bettsuan Lt. 2A",'Colombia', 'Córdoba');
INSERT INTO persona
VALUES (41, "1992-01-27", "M", "Lima Baker Av. Are Lt. 1A Mz. 23",'Venezuela', 'Aragua');
INSERT INTO persona
VALUES (42, "1993-02-27", "M", "Ilin Jr. Sur Lt. 2B",'Venezuela', 'Aragua');
INSERT INTO persona
VALUES (43, "1992-01-27", "M", "Berter Jr. Juen Lt. 4A Mz. 05",'Venezuela', 'Barinas');
INSERT INTO persona
VALUES (44, "1992-12-18", "M", "C.Juen V Av. Kion Lt. 3D",'Venezuela', 'Barinas');
INSERT INTO persona
VALUES (45, "1993-05-18", "F", "Juen Av. Purple Zn. 3A",'Chile', 'Antofagasta');
INSERT INTO persona
VALUES (46, "1992-02-18", "F", "Purple Jr. Kion Mz. 11",'Chile', 'Antofagasta');
INSERT INTO persona
VALUES (47, "1993-12-23", "M", "Purple Square Av. Zehara Lt. 1A Mz. 23",'Chile', 'Tarapacá');
INSERT INTO persona
VALUES (48, "1998-02-23", "F", "C.Zehara Av. Lomas Lt. 4A",'Chile', 'Tarapacá');
INSERT INTO persona
VALUES (49, "1992-12-23", "M", "Lomas Jr. Mikas Lt. 3A Mz. 14",'Chile', 'Maule');
INSERT INTO persona
VALUES (50, "1993-02-16", "M", "Are Jr. Mij & Dilaj Lt. 2A",'Chile', 'Maule');
INSERT INTO persona
VALUES (51, "1987-10-21", "M", "Mekn Baker Av. Shota Lt. 1A Mz. 23",'España', 'Badajoz');
INSERT INTO persona
VALUES (52, "1993-09-15", "M", "Ilin Jr. Filt Lt. 2B",'España', 'Badajoz');
INSERT INTO persona
VALUES (53, "2003-10-11", "M", "Filt Jr. Mihdar Lt. 4A Mz. 05",'Argentina', 'Catamarca');
INSERT INTO persona
VALUES (54, "2003-09-21", "M", "C.Roca V Av. Filt Lt. 3D",'Argentina', 'Catamarca');
INSERT INTO persona
VALUES (55, "2003-07-15", "F", "Geos Av. Mihdar Zn. 3A",'Mexico', 'Campeche');
INSERT INTO persona
VALUES (56, "2003-05-21", "F", "Mihdar Jr. Geos Mz. 11",'Mexico', 'Campeche');
INSERT INTO persona
VALUES (57, "1987-07-11", "M", "Geos Filt Av. Shota Lt. 1A Mz. 23",'Honduras', 'Colón');
INSERT INTO persona
VALUES (58, "1987-05-15", "F", "C.Shota Av. Roca Lt. 4A",'Honduras', 'Colón');
INSERT INTO persona
VALUES (59, "2001-07-23", "M", "Roca Jr. Ninar Lt. 3A Mz. 14",'Bolivia', 'Santa Cruz');
INSERT INTO persona
VALUES (60, "2003-05-11", "M", "Filt Jr. Ninar & Geos Lt. 2A",'Bolivia', 'Santa Cruz');


INSERT INTO persona
VALUES (61, "1986-01-28", "M", "Shota Mekn Av. Ninar Lt. 1A Mz. 23",'Peru', 'Arequipa');
INSERT INTO persona
VALUES (62, "1986-01-30", "M", "Shota Jr. Ninar Lt. 2B",'Peru', 'Ayacucho');
INSERT INTO persona
VALUES (63, "1986-01-16", "M", "Mekn Jr. Ninar Lt. 4A Mz. 05",'Peru', 'Lima');
INSERT INTO persona
VALUES (64, "1986-11-28", "M", "C.Roca V Av. Shota Lt. 3D",'Colombia', 'Bolívar');
INSERT INTO persona
VALUES (65, "1991-11-22", "F", "Mekn Av. Shota Zn. 3A",'Colombia', 'Córdoba');
INSERT INTO persona
VALUES (66, "1985-11-28", "F", "Hon Jr. Mekn Mz. 11",'Venezuela', 'Aragua');
INSERT INTO persona
VALUES (67, "1991-11-17", "M", "Shota Hon Av. Mihdar Lt. 1A Mz. 23",'Venezuela', 'Barinas');
INSERT INTO persona
VALUES (68, "1988-07-24", "F", "C.Shota Av. Mihdar Lt. 4A",'Chile', 'Antofagasta');
INSERT INTO persona
VALUES (69, "1988-06-28", "M", "Mihdar Jr. Roca Lt. 3A Mz. 14",'Chile', 'Tarapacá');
INSERT INTO persona
VALUES (70, "1987-07-30", "M", "Mihdar Jr. Mekn & Roca Lt. 2A",'Chile', 'Maule');
INSERT INTO persona
VALUES (71, "1984-01-28", "M", "Ursot Mekn Av. Konor Lt. 1A Mz. 23",'España', 'Badajoz');
INSERT INTO persona
VALUES (72, "1987-01-30", "M", "Isuha Jr. Polono Lt. 2B",'Argentina', 'Catamarca');
INSERT INTO persona
VALUES (73, "1987-01-16", "M", "Dehar Jr. Roja Lt. 4A Mz. 05",'Mexico', 'Campeche');
INSERT INTO persona
VALUES (74, "1984-11-28", "M", "C.Roja V Av. Isuha Lt. 3D",'Honduras', 'Colón');
INSERT INTO persona
VALUES (75, "1984-11-22", "F", "Isuha Av. Roja Zn. 3A",'Bolivia', 'Santa Cruz');

INSERT INTO persona
VALUES (76, "1992-11-28", "F", "Roja Jr. Ursot Mz. 11",'Peru','Lima');
INSERT INTO persona
VALUES (77, "1991-11-17", "M", "Ursot Rexxar Av. Dehar Lt. 1A Mz. 23",'Chile', 'Santiago');
INSERT INTO persona
VALUES (78, "1984-07-24", "F", "C.Konor Av. Ursot Lt. 4A",'Colombia', 'Bogotá');
INSERT INTO persona
VALUES (79, "1990-06-28", "M", "Polono Jr. Roca Lt. 3A Mz. 14",'Venezuela', 'Caracas');
INSERT INTO persona
VALUES (80, "1990-07-30", "M", "Isuha Jr. Polono & Dehar Lt. 2A",'España', 'Madrid');
INSERT INTO persona
VALUES (81, "1990-01-26", "M", "Rexxar Mekn Av. Konor Lt. 1A Mz. 23",'Argentina', 'Buenos Aires');
INSERT INTO persona
VALUES (82, "1990-11-29", "M", "Konor Jr. Ursot Lt. 2B",'Mexico', 'Mexico');
INSERT INTO persona
VALUES (83, "1987-10-11", "M", "Ursot Jr. Konor Lt. 4A Mz. 05",'Honduras', 'Tegucigalpa');
INSERT INTO persona
VALUES (84, "1984-01-28", "M", "C.Roja V Av. Rexxar Lt. 3D",'Bolivia', 'La Paz');
INSERT INTO persona
VALUES (85, "1984-11-16", "F", "Rexxar Av. Roja Zn. 3A",'Guatemala', 'Guatemala');
INSERT INTO persona
VALUES (86, "1984-10-11", "F", "Roja Jr. Ursot Mz. 11",'Ecuador', 'Quito');
INSERT INTO persona
VALUES (87, "1988-10-17", "M", "Mijae Rexxar Av. Mijae Lt. 1A Mz. 23",'Nicaragua', 'Managua');
INSERT INTO persona
VALUES (88, "1988-01-29", "F", "C.Mijae Av. Roja Lt. 4A",'EE.UU.', 'Washington D.C.');
INSERT INTO persona
VALUES (89, "1988-11-11", "M", "Dehar Jr. Konor Lt. 3A Mz. 14",'Inglaterra', 'Londres');
INSERT INTO persona
VALUES (90, "1990-08-29", "M", "Rexxar Jr. Ursot & Dehar Lt. 2A"'Peru','Puerto Rico', 'San Juan');

INSERT INTO persona
VALUES (91, "1993-03-30", "M", "Lican Genex Av. Turalion Lt. 1A Mz. 23",'Honduras', 'Colón');
INSERT INTO persona
VALUES (92, "1991-06-16", "M", "Genex Jr. Ursot Lt. 2B",'Mexico', 'Campeche');
INSERT INTO persona
VALUES (93, "1996-08-16", "M", "Turalion Jr. Genex Lt. 4A Mz. 05",'Argentina', 'Catamarca');
INSERT INTO persona
VALUES (94, "1991-02-09", "M", "C.Yellow V Av. Rexxar Lt. 3D",'España', 'Badajoz');
INSERT INTO persona
VALUES (95, "1988-06-09", "F", "Turalion Av. Yellow Zn. 3A",'Chile', 'Maule');
INSERT INTO persona
VALUES (96, "1988-02-04", "F", "Mijae Jr. Turalion Mz. 11",'Chile', 'Tarapacá');
INSERT INTO persona
VALUES (97, "1988-08-04", "M", "Ursot Yellow Av. Lican Lt. 1A Mz. 23",'Chile', 'Antofagasta');
INSERT INTO persona
VALUES (98, "1992-06-27", "F", "C.Lican Av. Jikleo Lt. 4A",'Venezuela', 'Barinas');
INSERT INTO persona
VALUES (99, "1990-06-04", "M", "Ursot Jr. Lican Lt. 3A Mz. 14",'Venezuela', 'Aragua');
INSERT INTO persona
VALUES (100, "1990-08-11", "M", "Genex Jr. Jikleo & Lican Lt. 2A",'Colombia', 'Córdoba');
INSERT INTO persona
VALUES (101, "1994-03-30", "M", "Pedro Genex Av. Eduardo Lt. 1A Mz. 23",'Colombia', 'Bolívar');
INSERT INTO persona
VALUES (102, "1986-06-16", "M", "Aeon Jr. Chino Lt. 2B",'Peru', 'Lima');
INSERT INTO persona
VALUES (103, "1986-08-16", "M", "Carlos Jr. Aeon Lt. 4A Mz. 05",'Peru', 'Ayacucho');
INSERT INTO persona
VALUES (104, "1986-02-09", "M", "C.Gira V Av. Aeon Lt. 3D",'Peru', 'Arequipa');
INSERT INTO persona
VALUES (105, "1995-06-09", "F", "Aeon Av. Gira Zn. 3A",'Bolivia', 'Santa Cruz');
-------------------------------------------------------------------------------------------
/*USUARIOS*/
INSERT INTO usuarios
VALUES (91, "eribega", "20132013");
INSERT INTO usuarios
VALUES (92, "cristiancf", "software");
INSERT INTO usuarios
VALUES (93, "rcarras", "edunomolon");
INSERT INTO usuarios
VALUES (94, "adamianwaynexd", "25espacace");
INSERT INTO usuarios
VALUES (95, "gigantemina", "lagrande10");
INSERT INTO usuarios
VALUES (96, "florhermosa", "gohanmylove");
INSERT INTO usuarios
VALUES (97, "traidorofandres", "faro20ro");
INSERT INTO usuarios
VALUES (98, "anaperal", "147hola2002");
INSERT INTO usuarios
VALUES (99, "licantropos", "gaaa2010n13");
INSERT INTO usuarios
VALUES (100, "emprendelion", "258noes");
INSERT INTO usuarios
VALUES (101, "sataniega", "96aez10");
INSERT INTO usuarios
VALUES (102, "ricolas", "007gerardo");
INSERT INTO usuarios
VALUES (103, "ricolas2", "roswellverdad");
INSERT INTO usuarios
VALUES (104, "bravocompa", "farfan1000");
INSERT INTO usuarios
VALUES (105, "atoseban", "7451sebas");
-------------------------------------------------------------------------------------------
/*TRABAJADORES*/
INSERT INTO trabajadores
VALUES (1, 900.50,"2018-05-27");
INSERT INTO trabajadores
VALUES (2, 900.50,"2018-11-30");
INSERT INTO trabajadores
VALUES (3, 900.50,"2018-06-21");
INSERT INTO trabajadores
VALUES (4, 1000.00,"2020-10-19");
INSERT INTO trabajadores
VALUES (5, 1000.00,"2020-07-13");
INSERT INTO trabajadores
VALUES (6, 1000.00,"2020-09-02");
INSERT INTO trabajadores
VALUES (7, 1000.50,"2019-08-08");
INSERT INTO trabajadores
VALUES (8, 1000.50,"2019-01-10");
INSERT INTO trabajadores
VALUES (9, 1000.50,"2019-02-15");
INSERT INTO trabajadores
VALUES (10, 1000.50,"2019-03-26");

INSERT INTO trabajadores
VALUES (11, 900.50,"2017-01-12");
INSERT INTO trabajadores
VALUES (12, 900.50,"2017-03-09");
INSERT INTO trabajadores
VALUES (13, 900.50,"2017-04-15");
INSERT INTO trabajadores
VALUES (14, 850.00,"2016-02-18");
INSERT INTO trabajadores
VALUES (15, 850.00,"2019-05-21");
INSERT INTO trabajadores
VALUES (16, 850.00,"2019-06-06");
INSERT INTO trabajadores
VALUES (17, 850.50,"2019-07-03");
INSERT INTO trabajadores
VALUES (18, 975.50,"2016-08-01");
INSERT INTO trabajadores
VALUES (19, 975.50,"2017-09-24");
INSERT INTO trabajadores
VALUES (20, 975.50,"2016-10-28");

INSERT INTO trabajadores
VALUES (21, 1000.50,"2021-10-30");
INSERT INTO trabajadores
VALUES (22, 925.50,"2021-09-28");
INSERT INTO trabajadores
VALUES (23, 925.50,"2021-08-19");
INSERT INTO trabajadores
VALUES (24, 1000.00,"2020-07-21");
INSERT INTO trabajadores
VALUES (25, 1000.00,"2020-06-17");
INSERT INTO trabajadores
VALUES (26, 925.00,"2020-05-13");
INSERT INTO trabajadores
VALUES (27, 925.50,"2020-04-11");
INSERT INTO trabajadores
VALUES (28, 940.50,"2019-03-07");
INSERT INTO trabajadores
VALUES (29, 940.50,"2019-02-09");
INSERT INTO trabajadores
VALUES (30, 970.50,"2019-01-31");

INSERT INTO trabajadores
VALUES (31, 1000.50,"2016-12-31");
INSERT INTO trabajadores
VALUES (32, 925.50,"2016-11-27");
INSERT INTO trabajadores
VALUES (33, 925.50,"2016-10-23");
INSERT INTO trabajadores
VALUES (34, 1000.00,"2017-09-19");
INSERT INTO trabajadores
VALUES (35, 1000.00,"2017-08-15");
INSERT INTO trabajadores
VALUES (36, 925.00,"2017-07-11");
INSERT INTO trabajadores
VALUES (37, 925.50,"2017-06-07");
INSERT INTO trabajadores
VALUES (38, 940.50,"2018-05-03");
INSERT INTO trabajadores
VALUES (39, 940.50,"2018-04-08");
INSERT INTO trabajadores
VALUES (40, 970.50,"2018-03-14");

INSERT INTO trabajadores
VALUES (41, 980.50,"2020-12-05");
INSERT INTO trabajadores
VALUES (42, 980.50,"2020-11-08");
INSERT INTO trabajadores
VALUES (43, 860.50,"2020-10-11");
INSERT INTO trabajadores
VALUES (44, 980.00,"2020-09-14");
INSERT INTO trabajadores
VALUES (45, 980.00,"2019-08-17");
INSERT INTO trabajadores
VALUES (46, 860.00,"2019-07-20");
INSERT INTO trabajadores
VALUES (47, 860.50,"2019-06-23");
INSERT INTO trabajadores
VALUES (48, 960.50,"2017-05-26");
INSERT INTO trabajadores
VALUES (49, 1000.50,"2017-04-29");
INSERT INTO trabajadores
VALUES (50, 960.50,"2017-03-02");
INSERT INTO trabajadores
VALUES (51, 1000.50,"2019-03-30");
INSERT INTO trabajadores
VALUES (52, 930.50,"2019-04-28");
INSERT INTO trabajadores
VALUES (53, 990.50,"2019-05-25");
INSERT INTO trabajadores
VALUES (54, 990.00,"2018-06-22");
INSERT INTO trabajadores
VALUES (55, 1000.00,"2018-07-19");
INSERT INTO trabajadores
VALUES (56, 930.00,"2018-08-16");
INSERT INTO trabajadores
VALUES (57, 930.50,"2016-09-13");
INSERT INTO trabajadores
VALUES (58, 890.50,"2016-10-10");
INSERT INTO trabajadores
VALUES (59, 890.50,"2016-11-07");
INSERT INTO trabajadores
VALUES (60, 1050.50,"2016-12-04");

INSERT INTO trabajadores
VALUES (61, 4500.50,"2005-04-01");
INSERT INTO trabajadores
VALUES (62, 4500.50,"2005-03-05");
INSERT INTO trabajadores
VALUES (63, 5000.50,"2005-05-09");
INSERT INTO trabajadores
VALUES (64, 5000.00,"2005-06-13");
INSERT INTO trabajadores
VALUES (65, 4500.00,"2006-07-17");
INSERT INTO trabajadores
VALUES (66, 4500.00,"2006-08-21");
INSERT INTO trabajadores
VALUES (67, 5000.50,"2006-09-25");
INSERT INTO trabajadores
VALUES (68, 5000.50,"2007-10-29");
INSERT INTO trabajadores
VALUES (69, 4750.50,"2007-11-01");
INSERT INTO trabajadores
VALUES (70, 4750.50,"2007-12-05");
INSERT INTO trabajadores
VALUES (71, 4750.50,"2007-01-09");
INSERT INTO trabajadores
VALUES (72, 4800.50,"2004-02-13");
INSERT INTO trabajadores
VALUES (73, 4800.50,"2004-03-17");
INSERT INTO trabajadores
VALUES (74, 4650.00,"2004-04-21");
INSERT INTO trabajadores
VALUES (75, 4650.00,"2004-12-25");

INSERT INTO trabajadores
VALUES (76, 2000.50,"2010-02-10");
INSERT INTO trabajadores
VALUES (77, 2000.50,"2010-04-07");
INSERT INTO trabajadores
VALUES (78, 1900.50,"2010-06-04");
INSERT INTO trabajadores
VALUES (79, 1900.00,"2010-08-02");
INSERT INTO trabajadores
VALUES (80, 2000.00,"2009-10-05");
INSERT INTO trabajadores
VALUES (81, 2000.00,"2009-12-08");
INSERT INTO trabajadores
VALUES (82, 1800.50,"2009-01-11");
INSERT INTO trabajadores
VALUES (83, 1800.50,"2009-03-14");
INSERT INTO trabajadores
VALUES (84, 1800.50,"2011-05-17");
INSERT INTO trabajadores
VALUES (85, 2100.50,"2011-07-20");
INSERT INTO trabajadores
VALUES (86, 2100.50,"2011-09-23");
INSERT INTO trabajadores
VALUES (87, 2100.50,"2012-11-26");
INSERT INTO trabajadores
VALUES (88, 1750.50,"2012-02-29");
INSERT INTO trabajadores
VALUES (89, 1750.00,"2012-04-21");
INSERT INTO trabajadores
VALUES (90, 1750.00,"2008-12-25");
-------------------------------------------------------------------------------------------
/*JEFE*/
INSERT INTO jefe
VALUES (76);
INSERT INTO jefe
VALUES (77);
INSERT INTO jefe
VALUES (78);
INSERT INTO jefe
VALUES (79);
INSERT INTO jefe
VALUES (80);
INSERT INTO jefe
VALUES (81);
INSERT INTO jefe
VALUES (82);
INSERT INTO jefe
VALUES (83);
INSERT INTO jefe
VALUES (84);
INSERT INTO jefe
VALUES (85);
INSERT INTO jefe
VALUES (86);
INSERT INTO jefe
VALUES (87);
INSERT INTO jefe
VALUES (88);
INSERT INTO jefe
VALUES (89);
INSERT INTO jefe
VALUES (90);
-------------------------------------------------------------------------------------------
/*GERENTE*/
INSERT INTO gerente
VALUES (61, "blancorubio", "14ortiz");
INSERT INTO gerente
VALUES (62, "humanosebas", "segundoortiz");
INSERT INTO gerente
VALUES (63, "simbague", "simon147");
INSERT INTO gerente
VALUES (64, "juanchocal", "s12s12s12");
INSERT INTO gerente
VALUES (65, "anatro", "lop198");
INSERT INTO gerente
VALUES (66, "mariagonles", "202017");
INSERT INTO gerente
VALUES (67, "ortegordo", "1realice47");
INSERT INTO gerente
VALUES (68, "izmeda", "456jokna124");
INSERT INTO gerente
VALUES (69, "augustga", "144tan");
INSERT INTO gerente
VALUES (70, "mentessta", "fwe17fenngr");
INSERT INTO gerente
VALUES (71, "oshuauez", "gilnosoy");
INSERT INTO gerente
VALUES (72, "mosocasaz", "torreta");
INSERT INTO gerente
VALUES (73, "dailingarce10", "recargua");
INSERT INTO gerente
VALUES (74, "toronigol", "onza41");
INSERT INTO gerente
VALUES (75, "Aria14uez", "478dh");
-------------------------------------------------------------------------------------------
/*Oficina*/
insert into oficina values(1,'Peru','Av. Lima 102','Lima');
insert into oficina values(2,'Chile','Av. La Mar 102', 'Santiago');
insert into oficina values(3,'Colombia','Av. Jorge 25', 'Bogotá');
insert into oficina values(4,'Venezuela','Calle Hindun 33', 'Caracas');
insert into oficina values(5,'España','Av. Francisco 201', 'Madrid');
insert into oficina values(6,'Argentina','Calle Martín 12', 'Buenos Aires');
insert into oficina values(22,'Mexico','Av. Picante 25', 'Mexico');
insert into oficina values(23,'Honduras','Calle Heartmed 33', 'Tegucigalpa');
insert into oficina values(24,'Bolivia','Av. Moar 45', 'La Paz');
insert into oficina values(25,'Guatemala','Calle Koin 67', 'Guatemala');
insert into oficina values(26,'Ecuador','Av. Jaguar 102', 'Quito');
insert into oficina values(27,'Nicaragua','Calle Saul 12', 'Managua');
insert into oficina values(28,'EE.UU.','Av. Roswell 25', 'Washington D.C.');
insert into oficina values(29,'Inglaterra','Av. Wirshton 25', 'Londres');
insert into oficina values(30,'Puerto Rico','Av. Barch 102', 'San Juan');

insert into oficina values(7,'Peru','Calle Mercaderes 12', 'Arequipa');
insert into oficina values(8,'Peru','Av. Quia 25', 'Ayacucho');
insert into oficina values(9,'Peru','Calle Zera 33', 'Lima');
insert into oficina values(10,'Colombia','Calle Djirta 67', 'Bolívar');
insert into oficina values(11,'Colombia','Av. Lia 98', 'Córdoba');
insert into oficina values(12,'Venezuela','Av. Kijsl 57', 'Aragua');
insert into oficina values(13,'Venezuela','Calle Vildull 76', 'Barinas');
insert into oficina values(14,'Chile','Calle Jose 91', 'Antofagasta');
insert into oficina values(15,'Chile','Av. Venezuela 25', 'Tarapacá');
insert into oficina values(16,'Chile','Calle Firulais 33', 'Maule');
insert into oficina values(17,'España','Av. Mahoma 45', 'Badajoz ');
insert into oficina values(18,'Argentina','Calle Jairman 67', 'Catamarca');
insert into oficina values(19,'Mexico','Av. La plaza 102', 'Campeche');
insert into oficina values(20,'Honduras','Calle Marruecos 89', 'Colón');
insert into oficina values(21,'Bolivia','Calle Los Santos 89', 'Santa Cruz');
/*matriz*/
insert into matriz values(1,61);
insert into matriz values(2,62);
insert into matriz values(3,63);
insert into matriz values(4,64);
insert into matriz values(5,65);
insert into matriz values(6,66);
insert into matriz values(22,67);
insert into matriz values(23,68);
insert into matriz values(24,69);
insert into matriz values(25,70);
insert into matriz values(26,71);
insert into matriz values(27,72);
insert into matriz values(28,73);
insert into matriz values(29,74);
insert into matriz values(30,75);
/*extension*/
insert into extension values(7,"Sucursal",76);
insert into extension values(8,"Sucursal",77);
insert into extension values(9,"Agencia",78);
insert into extension values(10,"Sucursal",79);
insert into extension values(11,"Agencia",80);
insert into extension values(12,"Sucursal",81);
insert into extension values(13,"Agencia",82);
insert into extension values(14,"Sucursal",83);
insert into extension values(15,"Agencia",84);
insert into extension values(16,"Agencia",85);
insert into extension values(17,"Sucursal",86);
insert into extension values(18,"Sucursal",87);
insert into extension values(19,"Sucursal",88);
insert into extension values(20,"Sucursal",89);
insert into extension values(21,"Sucursal",90);
/*Proveedor*/
insert into proveedor values(1,'Tecnologia Moderna','Av. Kiron 105', 'Lima', 'Peru');
insert into proveedor values(2,'Vivienda Comoda','Calle Aeon 15', 'Bogota', 'Colombia');
insert into proveedor values(3,'Vida Saludable','Av. Thomas 10', 'Caracas', 'Venezuela');
insert into proveedor values(4,'Tecnologia de Hogares','Calle Santos 54', 'La Paz', 'Bolivia');
insert into proveedor values(5,'El Cojin del cielo','Av. Mirror 28', 'Santiago', 'Chile');
insert into proveedor values(6,'Elegancia Hogareña','Av. Antoanet 47', 'Madrid', 'España');
insert into proveedor values(7,'Cazando Comodidad','Av. Limad 10', 'Buenos Aires', 'Argentina');
insert into proveedor values(8,'Vida Agradable','Av. Jilklost 6', 'Mexico', 'Mexico');
insert into proveedor values(9,'Sperlight','Calle Asther 14', 'Tegucigalpa', 'Honduras');
insert into proveedor values(10,'Nogiro','Calle Asta 7', 'Guatemala', 'Guatemala');
insert into proveedor values(11,'Nostable','Calle Limodead 19', 'Quito', 'Ecuador');
insert into proveedor values(12,'Casa Almohada','Calle Thorner 23', 'Managua', 'Nicaragua');
insert into proveedor values(13,'Space House','Calle Kirshat 33', 'Washington D.C.', 'EE.UU.');
insert into proveedor values(14,'Cagirtul','Calle Thuraliu 78', 'Londres', 'Inglaterra');
insert into proveedor values(15,'Essence of House','Av. Antares 49','San Juan', 'Puerto Rico');
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
insert into almacen values(1,11,100);
insert into almacen values(1,12,152);
insert into almacen values(1,30,20);
insert into almacen values(2,21,170);
insert into almacen values(3,21,90);
insert into almacen values(4,19,100);
insert into almacen values(4,17,87);
insert into almacen values(4,16,70);
insert into almacen values(5,15,135);
insert into almacen values(6,14,50);
insert into almacen values(6,13,20);
insert into almacen values(7,12,13);
insert into almacen values(7,11,200);
insert into almacen values(7,10,87);
insert into almacen values(8,9,120);
insert into almacen values(9,6,24);
insert into almacen values(9,22,170);
insert into almacen values(10,23,510);
insert into almacen values(11,24,20);
insert into almacen values(12,25,110);
insert into almacen values(12,26,50);
insert into almacen values(13,27,45);
insert into almacen values(13,28,70);
insert into almacen values(14,29,95);
insert into almacen values(14,30,147);
insert into almacen values(14,17,100);
insert into almacen values(15,2,140);
/*VENTAS*/
INSERT INTO ventas
VALUES (91, 14, "2019-01-21",2);
INSERT INTO ventas
VALUES (92, 13, "2018-04-19",3);
INSERT INTO ventas
VALUES (93, 12, "2016-06-11",4);
INSERT INTO ventas
VALUES (94, 11, "2018-08-13",3);
INSERT INTO ventas
VALUES (95, 10, "2017-09-15",1);
INSERT INTO ventas
VALUES (96, 9, "2015-04-07",1);
INSERT INTO ventas
VALUES (96, 5, "2015-08-27",2);
INSERT INTO ventas
VALUES (97, 8, "2012-10-20",2);
INSERT INTO ventas
VALUES (97, 4, "2016-09-18",1);
INSERT INTO ventas
VALUES (98, 7, "2016-11-29",3);
INSERT INTO ventas
VALUES (99, 6, "2014-07-04",1);
INSERT INTO ventas
VALUES (100, 5, "2017-12-24",2);
INSERT INTO ventas
VALUES (101, 4, "2020-12-20",4);
INSERT INTO ventas
VALUES (101, 15, "2019-02-23",2);
INSERT INTO ventas
VALUES (102, 3, "2010-12-25",3);
INSERT INTO ventas
VALUES (102, 10, "2014-05-25",4);
INSERT INTO ventas
VALUES (103, 2, "2010-05-14",5);
INSERT INTO ventas
VALUES (103, 7, "2016-11-23",2);
INSERT INTO ventas
VALUES (103, 3, "2019-10-17",4);
INSERT INTO ventas
VALUES (104, 1, "2008-06-28",5);
INSERT INTO ventas
VALUES (104, 2, "2012-01-19",1);
INSERT INTO ventas
VALUES (104, 9, "2015-12-15",2);
INSERT INTO ventas
VALUES (105, 15, "2021-09-14",1);
-------------------------------------------------------------------------------------------
/*EMPLEADOS*/
INSERT INTO empleado
VALUES (1,1);
INSERT INTO empleado
VALUES (2, 1);
INSERT INTO empleado
VALUES (3, 2);
INSERT INTO empleado
VALUES (4, 2);
INSERT INTO empleado
VALUES (5, 3);
INSERT INTO empleado
VALUES (6, 3);
INSERT INTO empleado
VALUES (7, 4);
INSERT INTO empleado
VALUES (8, 4);
INSERT INTO empleado
VALUES (9, 5);
INSERT INTO empleado
VALUES (10, 5);
INSERT INTO empleado
VALUES (11, 6);
INSERT INTO empleado
VALUES (12, 6);
INSERT INTO empleado
VALUES (13, 22);
INSERT INTO empleado
VALUES (14, 22);
INSERT INTO empleado
VALUES (15, 23);
INSERT INTO empleado
VALUES (16, 23);
INSERT INTO empleado
VALUES (17, 24);
INSERT INTO empleado
VALUES (18, 24);
INSERT INTO empleado
VALUES (19, 25);
INSERT INTO empleado
VALUES (20, 25);
INSERT INTO empleado
VALUES (21, 26);
INSERT INTO empleado
VALUES (22, 26);
INSERT INTO empleado
VALUES (23, 27);
INSERT INTO empleado
VALUES (24, 27);
INSERT INTO empleado
VALUES (25, 28);
INSERT INTO empleado
VALUES (26, 28);
INSERT INTO empleado
VALUES (27, 29);
INSERT INTO empleado
VALUES (28, 29);
INSERT INTO empleado
VALUES (29, 30);
INSERT INTO empleado
VALUES (30, 30);
INSERT INTO empleado
VALUES (31, 7);
INSERT INTO empleado
VALUES (32, 7);
INSERT INTO empleado
VALUES (33, 8);
INSERT INTO empleado
VALUES (34, 8);
INSERT INTO empleado
VALUES (35, 9);
INSERT INTO empleado
VALUES (36, 9);
INSERT INTO empleado
VALUES (37, 10);
INSERT INTO empleado
VALUES (38, 10);
INSERT INTO empleado
VALUES (39, 11);
INSERT INTO empleado
VALUES (40, 11);
INSERT INTO empleado
VALUES (41, 12);
INSERT INTO empleado
VALUES (42, 12);
INSERT INTO empleado
VALUES (43, 13);
INSERT INTO empleado
VALUES (44, 13);
INSERT INTO empleado
VALUES (45, 14);
INSERT INTO empleado
VALUES (46, 14);
INSERT INTO empleado
VALUES (47, 15);
INSERT INTO empleado
VALUES (48, 15);
INSERT INTO empleado
VALUES (49, 16);
INSERT INTO empleado
VALUES (50, 16);
INSERT INTO empleado
VALUES (51, 17);
INSERT INTO empleado
VALUES (52, 17);
INSERT INTO empleado
VALUES (53, 18);
INSERT INTO empleado
VALUES (54, 18);
INSERT INTO empleado
VALUES (55, 19);
INSERT INTO empleado
VALUES (56, 19);
INSERT INTO empleado
VALUES (57, 20);
INSERT INTO empleado
VALUES (58, 20);
INSERT INTO empleado
VALUES (59, 21);
INSERT INTO empleado
VALUES (60, 21);
................................................................................................................................................................................................................................................................................................................................................................................................................
/*PROCESOS DE ALMACENAMIENTO*/
DELIMITER //
drop procedure if exists `existencia`;//
CREATE  PROCEDURE `existencia`(IN usuario CHAR(30), 
				IN contrasena text)
BEGIN
	if (SELECT u.codigo_persona FROM usuarios u WHERE u.usuario=usuario AND u.clave=contrasena) then
		SELECT u.codigo_persona, n.nombres, n.primer_apellido, n.segundo_apellido, 2 as 'status' FROM usuarios u inner join nombre n on n.codigo_persona=u.codigo_persona WHERE u.usuario=usuario AND u.clave=contrasena;
	else
		SELECT n.*, 1 as 'status' FROM gerente g inner join 
        nombre n on n.codigo_persona=g.codigo inner join persona p on p.codigo=n.codigo_persona WHERE g.usuario_g=usuario AND g.clave_g=contrasena;
	end if;
END;
//
DELIMITER ;
DELIMITER //
drop procedure if exists `actualizar_cantidad`;//
CREATE  PROCEDURE `actualizar_cantidad`(oficina_2 integer, sofas_2 integer, cantidad_2 integer)
BEGIN
	if((select count(*) from almacen a where a.sofa_c=sofas_2 and a.oficina_c=oficina_2)>0) then
		update almacen a set a.cantidad=cantidad_2 where a.sofa_c=sofas_2 and a.oficina_c=oficina_2;
    else
		insert into almacen values(sofas_2,oficina_2,cantidad_2);
    end if;
END;
//
DELIMITER ;
DELIMITER //
drop procedure if exists `actualizar_usuario`;//
CREATE  PROCEDURE `actualizar_usuario`(codigo_2 integer,nombre_persona_2 varchar(30), primer_apellido_2 varchar(30), 
segundo_apellido_2 varchar(30), usuario_2 varchar(30), clave_2 text, pais_2 varchar(30), departamento_2 varchar(30), genero_2 varchar(1), direccion_2 text, fecha_de_nacimiento_2 date)
BEGIN
    if ((select count(*) from nombre where nombres = nombre_persona_2 and 
    primer_apellido = primer_apellido_2 and segundo_apellido = segundo_apellido_2)=0) then
		if ((select count(*) from usuarios where usuario like usuario_2)=0) then
			update nombre n set n.nombres=nombre_persona_2,
            n.primer_apellido = primer_apellido_2,
            n.segundo_apellido = segundo_apellido_2 where n.codigo_persona=codigo_2;
            update persona p set p.fecha_de_nacimiento=fecha_de_nacimiento_2, p.genero=genero_2, 
            p.direccion=direccion_2, p.pais=pais_2, p.departamento=departamento_2 where p.codigo=codigo_2;
            update usuarios u set u.usuario=usuario_2, u.usuario=clave_2
            where u.codigo_persona=codigo_2;
		end if;
    end if;
END;
//
DELIMITER;
DELIMITER //
drop procedure if exists `registrar_usuario`;//
CREATE  PROCEDURE `registrar_usuario`(nombre_persona_2 varchar(30), primer_apellido_2 varchar(30), 
segundo_apellido_2 varchar(30), usuario_2 varchar(30), clave_2 text, pais_2 varchar(30), departamento_2 varchar(30), genero_2 varchar(1), direccion_2 text, fecha_de_nacimiento_2 date)
BEGIN
	declare c integer;
	set c=(select max(n.codigo_persona)+1 as 'maximo' from nombre n);
    if ((select count(*) from nombre where nombres = nombre_persona_2 and 
    primer_apellido = primer_apellido_2 and segundo_apellido = segundo_apellido_2)=0) then
		if ((select count(*) from usuarios where usuario like usuario_2)=0) then
			insert into nombre values(c, nombre_persona_2, primer_apellido_2, segundo_apellido_2);
			insert into persona values(c, fecha_de_nacimiento_2, genero_2, direccion_2, pais_2, departamento_2);
			insert into usuarios values(c, usuario_2, clave_2);
		end if;
    end if;
END;
//
DELIMITER;
DELIMITER //
drop procedure if exists `comprar_sofa`;//
CREATE  PROCEDURE `comprar_sofa`(codigo_persona_2 integer, codigo_sofa_2 integer, cantidad_2 integer, codigo_oficina integer)
BEGIN
	declare f date;
	declare d integer;
    set d=(select a.cantidad from almacen a 
    where a.sofa_c = codigo_sofa_2 and a.oficina_c=codigo_oficina);
    if (d>=cantidad_2) then
        update almacen set cantidad=d-cantidad_2 where oficina_c=codigo_oficina and sofa_c=codigo_sofa_2;
        set f= now();
        if((select count(*) from ventas where
        usuario_c=codigo_persona_2 and sofa_c=codigo_sofa_2 and fecha like f)<>0 ) then
			update ventas set cantidad=cantidad+cantidad_2 where usuario_c=codigo_persona_2 and sofa_c=codigo_sofa_2;
		else 
			insert into ventas values(codigo_persona_2,codigo_sofa_2,f, cantidad_2);
		end if;
    end if;
END;
//
DELIMITER ;

DELIMITER //
drop procedure if exists `registrar_sofa`;//
CREATE  PROCEDURE `registrar_sofa`(nombre_2 varchar(30), precio_2 decimal(10,2), 
material_2 varchar(30), codigo_proveedor integer)
BEGIN
	declare c integer;
    set c=(select max(s.codigo) as 'maximo' from sofas s)+1;
    insert into sofas values(c,nombre_2, precio_2,codigo_proveedor,material_2);
END;
//
DELIMITER ;

DELIMITER //
drop procedure if exists `actualizar_sofa`;//
CREATE  PROCEDURE `actualizar_sofa`(codigo_2 integer, nombre_2 varchar(30), precio_2 decimal(10,2), 
material_2 varchar(30), codigo_proveedor_2 integer)
BEGIN
    update sofas set nombre=nombre_2, precio=precio_2, codigo_proveedor=codigo_proveedor_2, material=material_2
    where codigo=codigo_2;
END;
//
DELIMITER ;

DELIMITER //
drop procedure if exists `busqueda_usuario_gerente`;//
CREATE  PROCEDURE `busqueda_usuario_gerente`(nombre_persona_2 varchar(30), primer_apellido_2 varchar(30), 
segundo_apellido_2 varchar(30), genero_usuario varchar(1), direccion_usuario text,
pais_2 varchar(30), departamento_2 varchar(30))
BEGIN
    if ISnull(nombre_persona_2) then
		set nombre_persona_2='';
    end if;
    if ISnull(primer_apellido_2) then
		set primer_apellido_2='';
    end if;
    if ISnull(segundo_apellido_2) then
		set segundo_apellido_2='';
    end if;
    if ISnull(genero_usuario) then
		set genero_usuario='';
    end if;
    if ISnull(direccion_usuario) then
		set direccion_usuario='';
    end if;
    if ISnull(pais_2) then
		set pais_2='';
    end if;
    if ISnull(departamento_2) then
		set departamento_2='';
    end if;
	select n.*, p.genero, p.direccion, p.fecha_de_nacimiento, p.pais, p.departamento from nombre n inner join
    persona p on p.codigo = n.codigo_persona inner join usuarios u on u.codigo_persona=n.codigo_persona
    where n.nombres like concat(nombre_persona_2,'%') and
    n.primer_apellido like concat(primer_apellido_2,'%') and
    n.segundo_apellido like concat(segundo_apellido_2,'%') and
    p.genero like concat('%',genero_usuario,'%') and
    p.direccion like concat('%',direccion_usuario,'%') and
    p.pais like concat(pais_2,'%') and
    p.departamento like concat(departamento_2,'%')
    order by n.codigo_persona ;
END;
//
DELIMITER ;


DELIMITER //
drop procedure if exists `busqueda_articulo_gerente`;//
CREATE  PROCEDURE `busqueda_articulo_gerente`(nom varchar(30), pre_mayor decimal(10,2), pre_menor decimal(10,2), 
mate varchar(30), proveedor_nombre varchar(30), proveedor_direccion text, proveedor_pais varchar(30), proveedor_departamento varchar(30),
 cantidad_mayor integer, cantidad_menor integer)
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
    if ISnull(proveedor_pais) then
		set proveedor_pais='';
    end if;
    if ISnull(proveedor_departamento) then
		set proveedor_departamento='';
    end if;
	select s.codigo, s.nombre, s.precio, s.material, p.codigo, p.nombre, p.direccion, p.pais, p.departamento, 
    sum(a.cantidad) as 'cantidad' from sofas s
    inner join proveedor p on p.codigo like s.codigo_proveedor inner join almacen a on a.sofa_c=s.codigo 
    where s.nombre like concat(nom,'%') and
    p.nombre like concat(proveedor_nombre,'%') and
    s.material like concat(mate,'%') and
    p.direccion like concat('%',proveedor_direccion,'%') and 
    p.pais like concat(proveedor_pais,'%') and
    p.departamento like concat(proveedor_departamento,'%') and
    pre_mayor < s.precio and s.precio < pre_menor
    
    group by s.codigo having sum(a.cantidad)>cantidad_mayor and sum(a.cantidad)<cantidad_menor order by s.codigo ;
END;
//
DELIMITER ;


DELIMITER //
drop procedure if exists `busqueda_venta_gerente`;//
CREATE  PROCEDURE `busqueda_venta_gerente`(comprador_nombre varchar(30), comprador_apellido1 varchar(30)
, comprador_apellido2 varchar(30), sofa_nombre varchar(30), sofa_material varchar(30), preunitario_mayor decimal(10,2),  preunitario_menor decimal(10,2), 
 cantidad_mayor integer, cantidad_menor integer, total_mayor decimal(10,2), total_menor decimal(10.2))
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
    if ISnull(sofa_material) then
		set sofa_material='';
    end if;
	select n.*, s.codigo, s.nombre, s.material, s.precio, v.cantidad, s.precio*v.cantidad as 'total' from nombre n 
    inner join ventas v on v.usuario_c = n.codigo_persona inner join sofas s on s.codigo=v.sofa_c
    where n.nombres like concat(comprador_nombre,'%') and 
    n.primer_apellido like concat(comprador_apellido1,'%') and
    n.segundo_apellido like concat(comprador_apellido2,'%') and
    s.nombre like concat(sofa_nombre,'%') and
    s.material like concat(sofa_material,'%') and
    preunitario_mayor < s.precio and s.precio < preunitario_menor and
    cantidad_mayor < v.cantidad and v.cantidad < cantidad_menor and
    total_mayor < (s.precio*v.cantidad) and (s.precio*v.cantidad) < total_menor
    order by n.codigo_persona;
END;
//
DELIMITER ;