CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE autores(
	cod_autor INT PRIMARY KEY,
    nombre VARCHAR(255),
    nacionalidad VARCHAR(255)
);

CREATE TABLE editoriales(
	cod_editorial INT PRIMARY KEY,
    nombre_editorial VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE socios(
	numero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    direccion VARCHAR(255),
    telefono INT 
    CHECK (60000000 > telefono < 999999999),
    DNI VARCHAR(9) NOT NULL UNIQUE
);

CREATE TABLE libros(
	isbn VARCHAR(13) PRIMARY KEY,
	titulo VARCHAR(255),
    autor INT,
    editorial INT,
    año_edicion INT
);

CREATE TABLE prestamos(
	cod_prestamo INT PRIMARY KEY,
    fecha DATE,
    socio INT,
    libro VARCHAR(13),
    FOREIGN KEY (socio) REFERENCES socios(numero),
    FOREIGN KEY (libro) REFERENCES libros(isbn)
);