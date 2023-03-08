USE instituto;

CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255)
);

CREATE TABLE localidad(
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);
CREATE TABLE familia(
	id_familia INT PRIMARY KEY AUTO_INCREMENT,
    tutor1 VARCHAR(255),
    tutor2 VARCHAR(255),
    direccion_postal VARCHAR(277),
    id_localidad INT,
    FOREIGN KEY(id_localidad) REFERENCES localidad(id_localidad)
);

CREATE TABLE nivel(
    id_nivel INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255)
);

CREATE TABLE especialidad(
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255)
);

CREATE TABLE profesor(
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    id_especialidad INT,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE grupo(
    id_grupo INT PRIMARY KEY auto_increment,
    nombre VARCHAR(255),
    id_profesor INT,
    id_nivel INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_nivel) REFERENCES nivel(id_nivel)
);

CREATE TABLE alumno(
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    id_grupo INT,
    id_familia INT,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
    FOREIGN KEY (id_familia) REFERENCES familia(id_familia) ON DELETE SET NULL
);

