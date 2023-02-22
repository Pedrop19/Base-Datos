-- Crear base de datos
CREATE DATABASE prueba;
-- Seleccionar base de datos
USE prueba;
-- Crear una tabla
CREATE TABLE tabla1 (
-- Crear una columna
    columna1 INT
);
-- Ejemplo1
CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    edad INT,
    salario DECIMAL(5,5)
);
-- Ejemplo2
CREATE TABLE estudiantes (
	id INT PRIMARY KEY,
    nombre VARCHAR(20),
    edad INT,
    nota_final INT,
    fecha_inscripcion DATE
);
-- Ejemplo3
CREATE TABLE empleados_2 (
	id_empleado INT PRIMARY KEY,
    nombre VARCHAR(20),
    edad INT,
    salario DECIMAL(5,5),
    fecha_contratacion DATE,
    tiene_beneficios BOOLEAN
);
-- Ejemplo 4
CREATE TABLE productos (
	id_productos INT PRIMARY KEY,
    nombre VARCHAR(20),
    precio DOUBLE,
    cantidad INT
);
-- Ejemplo 5
CREATE TABLE proyectos (
	id_proyecto INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
-- Ejemplo 6
CREATE TABLE amigos(
	amigo_id INT PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    fecha_nacimiento DATE,
    edad INT
);
-- Ejemplo 7
CREATE TABLE departamentos (
	departamento_id INT PRIMARY KEY,
    departamento_name VARCHAR(20)
);
-- Ejemplo 8
CREATE TABLE empleados_dep (
	empleado_dep_id INT PRIMARY KEY,
	nombre VARCHAR(20),
    apellido VARCHAR(20),
    fecha_contratacion DATE,
	salario DECIMAL(5,5),
    departamento_id_fk INT,
    FOREIGN KEY (departamento_id_fk) REFERENCES departamentos(departamento_id)
);
-- Ejemplo 9
CREATE TABLE ordenes (
	pedido_id INT PRIMARY KEY,
    pedido_fecha DATE,
    departamento_id INT,
    empleado_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id),
	FOREIGN KEY (empleado_id) REFERENCES empleados_dep(empleado_dep_id)
);
-- Ejemplo 10
CREATE TABLE coches (
	matricula INT PRIMARY KEY,
	marca VARCHAR(20) 	NOT NULL,
    modelo VARCHAR(20) UNIQUE,
    nuevo BOOLEAN DEFAULT(1),
	precio INT,
    CHECK (precio > 1000 & precio < 3000)
);
-- Ejemplo 11
CREATE DATABASE agencia;

USE agencia;

CREATE TABLE turistas (
	turista_id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
    primer_apellido VARCHAR(20) NOT NULL,
    segundo_apellido VARCHAR(20) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE hotel (
	hotel_id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    telefono INT NOT NULL,
	plazas INT NOT NULL
);

CREATE TABLE reserva (
	hotel_id INT NOT NULL,
	turista_id INT NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    PRIMARY KEY (turista_id, hotel_id),
    regimen VARCHAR(2),
    CHECK (regimen="PC" & regimen="MP"),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (turista_id) REFERENCES turistas(turista_id)
);
ALTER TABLE amigos ADD email CHAR(20);
-- Añadir una columna
ALTER TABLE empleados ADD direccion CHAR(20);
-- Cambiar el nombre de una columna
ALTER TABLE empleados CHANGE salario sueldo DECIMAL;
-- Forma alternativa de cambiar el nombre de una columna
-- ALTER TABLE empleados RENAME salario TO sueldo;
-- Eliminar una columna
ALTER TABLE empleados DROP COLUMN direccion;
-- Eliminar una tabla
DROP TABLE proyectos;





