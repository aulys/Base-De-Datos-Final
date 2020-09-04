
/*-------------  BASE DE DATOS PRODUCTO MINIMO VIABLE ----------------- */

-- CREAMOS LA BASE DE DATOS DEL SISTEMA DE PRESTAMSOS SOFTTECH
CREATE DATABASE prestamos_softtech;

-- SELECCIONAMOS LA BASE DE DATOS PARA REALIZAR CONSULTAS SQL SOBRE LA MISMA
USE prestamos_softtech;


/* -------- CREACION DE TODAS LAS TABLAS --------- */

-- CREAMOS LA TABLA CLIENTES
CREATE TABLE clientes (
  idcliente INT PRIMARY KEY IDENTITY(1,1),
  nombre varchar(50) NOT NULL,
  cedula varchar(50) NOT NULL,
  direccion varchar(100) DEFAULT NULL,
  telefono varchar(15) DEFAULT NULL,
  estado tinyint DEFAULT '1'
);

-- CREAMOS LA TABLA GASTOS
CREATE TABLE gastos (
  idgasto int PRIMARY KEY IDENTITY(1,1),
  idusuario int NOT NULL,
  fecha datetime NOT NULL,
  concepto varchar(50) NOT NULL,
  gasto decimal(16,2) NOT NULL
);

-- CREAMOS LA TABLA PAGOS
CREATE TABLE pagos (
  idpago int PRIMARY KEY IDENTITY(1,1),
  idprestamo int NOT NULL,
  usuario varchar(50) NOT NULL,
  fecha datetime NOT NULL,
  cuota decimal(16,2) NOT NULL
);

-- CREAMOS LA TABLA PERMISOS
CREATE TABLE permisos (
  idpermiso int PRIMARY KEY IDENTITY(1,1),
  permiso varchar(50) NOT NULL
);

-- CREAMOS LA TABLA PRESTAMOS
CREATE TABLE prestamos (
  idprestamo int PRIMARY KEY IDENTITY(1,1),
  idcliente int NOT NULL,
  usuario int NOT NULL,
  fprestamo datetime NOT NULL,
  monto decimal(16,2) NOT NULL,
  interes decimal(16,2) NOT NULL,
  saldo decimal(16,2) NOT NULL,
  formapago varchar(20) DEFAULT NULL,
  fpago datetime DEFAULT NULL,
  plazo varchar(20) DEFAULT NULL,
  fplazo datetime DEFAULT NULL,
  estado tinyint DEFAULT '1'
);

-- CREAMOS LA TABLA USUARIOPERMISO
CREATE TABLE usuariopermiso (
  idusuariopermiso int PRIMARY KEY IDENTITY(1,1),
  idusuario int DEFAULT NULL,
  idpermiso int DEFAULT NULL
);

-- CREAMOS LA TABLA USUARIOS
CREATE TABLE usuarios (
  idusuario int PRIMARY KEY IDENTITY(1,1),
  nombre varchar(50) NOT NULL,
  direccion varchar(100) DEFAULT NULL,
  telefono varchar(15) DEFAULT NULL,
  login varchar(20) NOT NULL,
  clave varchar(64) NOT NULL,
  imagen varchar(50) DEFAULT NULL,
  estado tinyint DEFAULT '1'
);


/* -------- RELACIONES ENTRE TODAS LAS TABLAS --------- */

-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE LA TABLA USUARIOS Y GASTOS
ALTER TABLE gastos 
	ADD CONSTRAINT fkgastosusuarios FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;


-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE LA TABLA PAGOS Y PRESTAMOS
ALTER TABLE pagos
  ADD CONSTRAINT fkPrestamos FOREIGN KEY (idprestamo) REFERENCES prestamos (idprestamo) ON DELETE NO ACTION ON UPDATE NO ACTION;


-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE LA TABLA PRETAMOS Y CLIENTES
ALTER TABLE prestamos
  ADD CONSTRAINT fkClientes FOREIGN KEY (idcliente) REFERENCES clientes (idcliente) ON DELETE NO ACTION ON UPDATE NO ACTION;


-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE LA TABLA PRETAMOS Y USUARIOS
ALTER TABLE prestamos
  ADD CONSTRAINT fkusuarios FOREIGN KEY (usuario) REFERENCES usuarios (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;
  

-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE USUARIOPERMISO Y USUARIO
ALTER TABLE usuariopermiso
  ADD CONSTRAINT fkPermiso FOREIGN KEY (idpermiso) REFERENCES permisos (idpermiso) ON DELETE NO ACTION ON UPDATE NO ACTION;
  

-- CREAMOS LA RELACION (LLAVE FORANEA) ENTRE USUARIOPERMISO Y PERMISO
ALTER TABLE usuariopermiso
ADD CONSTRAINT fkUsuario FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;



/* -------- AGREGANDO REGISTROS A TODAS LAS TABLAS --------- */

-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA PERMISOS
INSERT INTO permisos (permiso) VALUES
('Escritorio'),
('Clientes'),
('Prestamos'),
('Pagos'),
('Usuarios'),
('Gastos'),
('Consultas'),
('Permisos'),
('Reportes'),
('Configuraciones');

-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA USUARIOS
INSERT INTO usuarios (nombre, direccion, telefono, login, clave, imagen, estado) VALUES
('Aulys', 'Santo Domingo', '346547454', 'aulys', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Starling', 'Villa Mella', '5683463', 'starling', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Juan', 'Centro 2', '8333333', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1),
('Lucas', 'Caobal', '2534546742', 'lucas', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Josefa', 'Cuchilla', '257674564', 'josefa', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Marcia', 'Villa Altagracia', '898753457', 'marcia', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('oym', 'Alcarrizos', '436546754', 'oym', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Michael', 'KM 25', '32675467', 'michael', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Gerald', 'Guananito', '23459456346', 'gerald', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1),
('Maria', 'El Puerto', '8042385252', 'maria', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1);

-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA CLIENTES
INSERT INTO clientes (nombre, cedula, direccion, telefono, estado) VALUES
('Aulis Reyes', '034254657', 'Villa Altagracia', '432545646', 1),
('Mario Casas', '103259878', 'Los Lagos', '214545', 1),
('Juan Camilo', '281-051089-0012s', 'Torres', '333333', 1),
('Jennifer Rodriguez', '3464574835', 'Los Cerros', '46554656', 1),
('Pedro Lopez', '896346374634', 'Maimon', '4575687', 1),
('Maria Jimenez', '45654686', 'Piedra Blanca', '36547567', 1),
('Ramiro Figueroa', '34957347347', 'Represa', '59834534853', 1),
('Cristobal Colon', '345689345634', 'Santo Domingo', '2348562345', 1),
('Starling Germosen', '2385239582352', 'Ensanche La Fe', '1249812374', 1),
('Ruth Cuevas', '89497534534', 'Zona Universitaria', '545734563456', 1),
('Lisset Arciniega', '23590875465', 'La Altagracia', '3485734735', 1);


-- INSETAMOS AL MENOS 10 REGISTROS EN LA TABLA GASTOS
INSERT INTO gastos (idusuario, fecha, concepto, gasto) VALUES
(1, '20200902', 'Papel de impresora', 600.80),
(1, '20200902', 'Tinta negra', 550.00),
(2, '20200903', 'Remas de papel', 300.90),
(4, '20200903', 'Tinta roja', 500.00),
(2, '20200903', 'Papel adhesivo', 1500.65),
(3, '20200904', 'Conmbustible', 900.30),
(6, '20200904', 'Viatico', 400.50),
(8, '20200904', 'Pasaje', 200.00),
(7, '20200904', 'Pasaje', 200.00),
(5, '20200903', 'Combustible', 800.60);


-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA USUARIOPERMISO
INSERT INTO usuariopermiso (idusuario, idpermiso) VALUES
(1, 1),
(2, 3),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 4),
(9, 2),
(10, 3);


-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA PRESTAMOS
INSERT INTO prestamos (idcliente, usuario, fprestamo, monto, interes, saldo, formapago, fpago, plazo, fplazo, estado) VALUES
(1, 3, '2020-09-02 00:00:00', '10000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(2, 2, '2020-09-02 00:00:00', '500.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(3, 6, '2020-09-02 00:00:00', '700.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(4, 5, '2020-09-02 00:00:00', '800.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(5, 1, '2020-09-02 00:00:00', '10000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(6, 10, '2020-09-02 00:00:00', '45000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(7, 8, '2020-09-02 00:00:00', '15000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(8, 4, '2020-09-02 00:00:00', '50000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(9, 7, '2020-09-02 00:00:00', '26000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1),
(10, 9, '2020-09-02 00:00:00', '20000.00', '20.00', '12000.00', 'Diario', '2020-09-03 00:00:00', 'Mes', '2020-10-03 00:00:00', 1);


-- INSERTAMOS AL MENOS 10 REGISTROS EN LA TABLA PAGOS
INSERT INTO pagos (idprestamo, usuario, fecha, cuota) VALUES
(2, 'starling', '2020-09-03 00:00:00', '500.00'),
(1, 'juan', '2020-09-03 00:00:00', '10000.00'),
(3, 'marcia', '2020-09-03 00:00:00', '700.00'),
(4, 'josefa', '2020-09-03 00:00:00', '800.00'),
(5, 'aulys', '2020-09-03 00:00:00', '10000.00'),
(6, 'maria', '2020-09-03 00:00:00', '45000.00'),
(7, 'michael', '2020-09-03 00:00:00', '15000.00'),
(8, 'lucas', '2020-09-03 00:00:00', '50000.00'),
(9, 'oym', '2020-09-03 00:00:00', '26000.00'),
(10, 'gerald', '2020-09-03 00:00:00', '20000.00');



/* HACEMOS CONSULTA A CADA UNA DE LAS TABLAS PARA VERIFICAR LOS DATOS INSERTADOS */

-- CONSULTA TABLA CLIENTES
SELECT * FROM clientes;

-- CONSULTA TABLA USUARIOS
SELECT * FROM usuarios;

-- CONSULTA TABLA PERMISOS
SELECT * FROM permisos;

-- CONSULTA TABLA USUARIOPERMISOS
SELECT * FROM usuariopermiso;


-- CONSULTA TABLA GASTOS
SELECT * FROM gastos;

-- CONSULTA TABLA PRESTAMOS
SELECT * FROM prestamos;

-- CONSULTA TABLA PAGOS
SELECT * FROM pagos;
