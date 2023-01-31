CREATE DATABASE pubs;

USE pubs;

CREATE TABLE localidades (
	cod_localidad VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE pubs (
	cod_pub VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
	licencia_fiscal VARCHAR(255) NOT NULL,
    domicilio  VARCHAR(255),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(4) CHECK (horario IN ('HOR1','HOR2','HOR3')),
    cod_localidad VARCHAR(255) NOT NULL,
    FOREIGN KEY (cod_localidad) REFERENCES localidades(cod_localidad)
);

CREATE TABLE titulares (
	dni_titular  VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    domicilio VARCHAR(255),
    cod_pub VARCHAR(255) NOT NULL,
    FOREIGN KEY (cod_pub) REFERENCES pubs(cod_pub)
);

CREATE TABLE empleados (
	dni_empleado VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    domicilio VARCHAR(255)
);

CREATE TABLE existencias (
	cod_articulo VARCHAR(255) PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    precio INT NOT NULL 
    CHECK (precio > 0),
    cod_pub VARCHAR(255) NOT NULL,
    FOREIGN KEY (cod_pub) REFERENCES pubs(cod_pub)
);

CREATE TABLE pub_empleado (
	cod_pub VARCHAR(255) NOT NULL,
    dni_empleado VARCHAR(255) NOT NULL,
    funcion VARCHAR(255) CHECK(funcion IN ('CAMARERO','SEGURIDAD','LIMPIEZA')),
    FOREIGN KEY (cod_pub) REFERENCES pubs(cod_pub),
    FOREIGN KEY (dni_empleado) REFERENCES empleados(dni_empleado),
    PRIMARY KEY (cod_pub, dni_empleado, funcion)
);