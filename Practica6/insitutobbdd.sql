drop database instituto;
create database instituto;
USE instituto;

CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE localidad(
    id_localidad INT PRIMARY KEY,
    nombre VARCHAR(255),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE familia(
	id_familia INT PRIMARY KEY,
    tutor1 VARCHAR(255),
    tutor2 VARCHAR(255),
    direccion_postal VARCHAR(277),
    id_localidad INT,
    FOREIGN KEY(id_localidad) REFERENCES localidad(id_localidad)
);

CREATE TABLE nivel(
    id_nivel INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE especialidad(
    id_especialidad INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE profesor(
    id_profesor INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    id_especialidad INT,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE grupo(
    id_grupo INT PRIMARY KEY,
    nombre VARCHAR(255),
    id_profesor INT,
    id_nivel INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_nivel) REFERENCES nivel(id_nivel)
);

CREATE TABLE alumno(
    id_alumno INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    id_grupo INT,
    id_familia INT,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
    FOREIGN KEY (id_familia) REFERENCES familia(id_familia) ON DELETE SET NULL
);

CREATE TABLE evaluacion (
	id_alumno int,
    id_profesor int,
    fecha date,
    nota float,
    primary key(id_alumno, id_profesor),
	FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

insert into `provincia` values ('0', 'Badajoz');
insert into `provincia` values ('1', 'Cáceres');
insert into `provincia` values ('2', 'Madrid');
insert into `provincia` values ('3', 'Albacete');
insert into `provincia` values ('4', 'Barcelona');
insert into `provincia` values ('5', 'Asturias');
insert into `provincia` values ('6', 'Avila');


insert into `localidad` values ('0', 'Mérida', '0');
insert into `localidad` values ('1', 'Abadía', '1');
insert into `localidad` values ('2', 'Alcobendas', '2');
insert into `localidad` values ('3', 'Alcadozo', '3');
insert into `localidad` values ('4', 'Alella', '4');
insert into `localidad` values ('5', 'Bimenes', '5');
insert into `localidad` values ('6', 'Aldeaseca', '6');


insert into `familia` values ('0', 'Jose', 'Maria', 'C/ Sin Nombre', '0');
insert into `familia` values ('7', 'Jose', 'Maria', 'C/ Sin Nombre', '0');
insert into `familia` values ('1', 'Pablo', 'Monica', 'C/ Sin Nombre', '1');
insert into `familia` values ('2', 'Luis', 'Paula', 'C/ Sin Nombre', '2');
insert into `familia` values ('3', 'Juan', 'Ines', 'C/ Sin Nombre', '3');
insert into `familia` values ('4', 'Raul', 'Rigoberta', 'C/ Sin Nombre', '4');
insert into `familia` values ('5', 'Eustaquio', 'Eulalia', 'C/ Sin Nombre', '5');
insert into `familia` values ('6', 'Pedro', 'Inma', 'C/ Sin Nombre', '6');


insert into `nivel` values ('0', 'Bajo');
insert into `nivel` values ('1', 'Intermedio');
insert into `nivel` values ('2', 'Alto');

insert into `especialidad` values ('0', 'Matematicas');
insert into `especialidad` values ('1', 'Lengua');
insert into `especialidad` values ('2', 'Fisica');
insert into `especialidad` values ('3', 'Informatica');
insert into `especialidad` values ('4', 'Historia');

insert into `profesor` values ('0', 'Jose', 'Hernandez', '0');
insert into `profesor` values ('1', 'Francisco', 'Perez', '2');
insert into `profesor` values ('2', 'Karen', 'Lazaro', '1');
insert into `profesor` values ('3', 'Pablo', 'Nevado', '1');
insert into `profesor` values ('4', 'Paula', 'Fernandez', '4');
insert into `profesor` values ('5', 'Luis', 'Piedra', '3');
insert into `profesor` values ('6', 'Carlos', 'Garrido', '3');

insert into `grupo` values ('0', 'Primero', '0', '0');
insert into `grupo` values ('1', 'Segundo', '1', '0');
insert into `grupo` values ('2', 'Tercero', '2', '1');
insert into `grupo` values ('3', 'Cuarto', '3', '1');
insert into `grupo` values ('4', 'Bachillerato1', '4', '2');
insert into `grupo` values ('5', 'Bachillerato2', '5', '2');
insert into `grupo` values ('6', 'FP', '6', '2');

insert into `alumno` values ('0', 'Jose', 'Perez', '0', '0');
insert into `alumno` values ('1', 'Paula', 'Lazaro', '1', '1');
insert into `alumno` values ('2', 'Hector', 'Nevado', '2', '2');
insert into `alumno` values ('3', 'Luis', 'Fernandez', '3', '3');
insert into `alumno` values ('4', 'Manuel', 'Hernandez', '4', '4');
insert into `alumno` values ('5', 'Mario', 'Gomera', '5', '5');
insert into `alumno` values ('6', 'Victor', 'Lopez', '6', '6');
insert into `alumno` values ('7', 'Wenderson', 'Dos Santos', '6', '6');
insert into `alumno` values ('8', 'Lucas', 'Vazquez', '6', '7');

insert into `evaluacion` values ('0', '0', '19/12/2023', '6');
insert into `evaluacion` values ('8', '4', '19/12/2023', '8');
insert into `evaluacion` values ('1', '1', '19/12/2023', '7');
insert into `evaluacion` values ('1', '2', '19/12/2023', '8');
insert into `evaluacion` values ('3', '3', '19/12/2023', '9');
insert into `evaluacion` values ('3', '4', '19/12/2023', '10');
insert into `evaluacion` values ('5', '5', '19/12/2023', '4');
insert into `evaluacion` values ('7', '0', '19/12/2023', '3');
insert into `evaluacion` values ('7', '2', '19/12/2023', '9');


