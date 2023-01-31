CREATE DATABASE empresa;

USE empresa;

CREATE TABLE empleados(
	dni_empleado VARCHAR(9) PRIMARY KEY UNIQUE,
    nombre  VARCHAR(10) NOT NULL,
    apellido1  VARCHAR(15) NOT NULL,
    apellido2  VARCHAR(15),
    direcc1  VARCHAR(25),
    direcc2 VARCHAR(20),
    ciudad  VARCHAR(20),
    provincia  VARCHAR(20),
    cod_postal VARCHAR(5),
    sexo ENUM('M','H'),
    fecha_nac DATE
);

CREATE TABLE universidades(
	univ_cod INT PRIMARY KEY AUTO_INCREMENT,
    nombre_univ VARCHAR(25) NOT NULL,
    ciudad VARCHAR(20),
    municipio VARCHAR(2),
    cod_postal VARCHAR(5)
);

CREATE TABLE departamentos(
	dpto_cod INT PRIMARY KEY AUTO_INCREMENT,
    nombre_dpto VARCHAR(30) NOT NULL UNIQUE,
    dpto_padre INT,
    presupuesto INT NOT NULL,
    pres_actual INT
);

CREATE TABLE estudios(
	empleado_dni VARCHAR(9),
    universidad INT,
    año INT,
    grado VARCHAR(3),
    especialidad VARCHAR(20),
    PRIMARY KEY (empleado_dni, universidad),
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni_empleado),
    FOREIGN KEY (universidad) REFERENCES universidades(univ_cod)
);


CREATE TABLE trabajos(
	trabajo_cod INT PRIMARY KEY,
    nombre_trab VARCHAR(20) NOT NULL UNIQUE,
    salario_min INT NOT NULL,
    salario_max INT NOT NULL
);

CREATE TABLE historial_laboral(
	empleado_dni VARCHAR(9),
    trabajo_cod INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    dpto_cod INT,
    supervisor_dni VARCHAR(9),
    PRIMARY KEY (empleado_dni, trabajo_cod),
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni_empleado),
    FOREIGN KEY (trabajo_cod) REFERENCES trabajos(trabajo_cod)
);

CREATE TABLE historial_salarial(
	empleado_dni VARCHAR(9) UNIQUE PRIMARY KEY,
    salario INT NOT NULL UNIQUE,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni_empleado)
);