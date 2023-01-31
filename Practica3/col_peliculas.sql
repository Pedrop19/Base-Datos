CREATE DATABASE col_peliculas;

USE col_peliculas;

CREATE TABLE generos(
	cod_genero INT PRIMARY KEY,
    genero VARCHAR(255),
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE directores(
	cod_director INT PRIMARY KEY,
    nombre_director VARCHAR(255),
    lugar_nacimiento VARCHAR(255),
    fecha_nacimiento DATE
);

CREATE TABLE peliculas(
	cod_pelicula INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    director INT,
    año INT,
    genero INT,
    FOREIGN KEY (genero) REFERENCES generos(cod_genero),
	FOREIGN KEY (director) REFERENCES directores(cod_director)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE actores(
	cod_actor INT PRIMARY KEY,
    nombre VARCHAR(255),
    lugar_nacimiento VARCHAR(255),
    fecha_nacimiento DATE,
    sexo ENUM('M','H')
);

CREATE TABLE actores_peliculas(
	cod_pelicula INT,
    cod_actor INT,
	PRIMARY KEY (cod_pelicula, cod_actor),
    personaje VARCHAR(255) NOT NULL,
    FOREIGN KEY (cod_pelicula) REFERENCES peliculas(cod_pelicula)
    ON DELETE CASCADE,
    FOREIGN KEY	(cod_actor) REFERENCES actores(cod_actor)
);