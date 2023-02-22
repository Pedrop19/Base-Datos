DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine CHARACTER SET utf8mb4;
USE cine;

USE cine;


CREATE TABLE peliculas (
	codigo_pelicula int primary key auto_increment,
	nombre varchar(255) not null,
    calificacion_edad int
);

CREATE TABLE salas (
	codigo_sala int primary key auto_increment,
    nombre varchar(255) not null,
    codigo_pelicula int,
	FOREIGN KEY (codigo_pelicula) REFERENCES peliculas(codigo_pelicula)
);


INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('1', 'Pelicula 1', '0');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`) VALUES ('2', 'Pelicula 2');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('3', 'Pelicula 3', '7');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('4', 'Pelicula 4', '12');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('5', 'Pelicula 5', '18');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('6', 'Pelicula 6', '18');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`) VALUES ('7', 'Pelicula 7');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('8', 'Pelicula 8', '12');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('9', 'Pelicula 9', '7');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('10', 'Pelicula 10', '0');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('11', 'Pelicula 11', '0');
INSERT INTO `peliculas` (`codigo_pelicula`, `nombre`, `calificacion_edad`) VALUES ('12', 'Pelicula 12', '18');

INSERT INTO `salas` (`codigo_sala`, `nombre`) VALUES ('1', 'Sala A');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('2', 'Sala B', '1');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('3', 'Sala C', '1');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('4', 'Sala D', '3');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('5', 'Sala E', '4');
INSERT INTO `salas` (`codigo_sala`, `nombre`) VALUES ('6', 'Sala F');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('7', 'Sala G', '1');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('8', 'Sala H', '2');
INSERT INTO `salas` (`codigo_sala`, `nombre`, `codigo_pelicula`) VALUES ('9', 'Sala I', '10');

select * from peliculas;
select * from salas;

-- 3. Lista las distintas calificaciones de edad que existen.
select distinct calificacion_edad from peliculas;
-- 4. Lista todas las películas que no tienen calificación.
select * from peliculas
where calificacion_edad is null;
-- 5. Muestra la información de todas las salas. En caso de que se proyecte una película en la sala,
-- muestra también la información de la película.
select * from salas s, peliculas p
where s.codigo_pelicula = p.codigo_pelicula;
-- 6. Muestra la información de las distintas películas que se proyectan en salas.
select p.* from peliculas p, salas s
where s.codigo_pelicula = p.codigo_pelicula;
-- 7. Listar los nombres de las películas que no se proyectan en ninguna sala.
select distinct nombre
from peliculas
where codigo_pelicula not in (
select codigo_pelicula
from salas
where codigo_pelicula is not null);
-- 8. Inserta una nueva película “El menú”, para mayores de 18 años.
INSERT INTO `peliculas` (`nombre`, `calificacion_edad`) VALUES ('El menú', '18');
-- 9. Asegura que todas las películas no calificadas se ponen como no recomendadas menores de 13 años.
UPDATE peliculas 
SET calificacion_edad = 13
WHERE calificacion_edad IS NULL;
-- 10. ¿Cuántas películas hay para cada calificación de edad?
select calificacion_edad, count(nombre) from peliculas
group by calificacion_edad;
-- 11. ¿Cuántas películas hay para cada calificación de edad que se visualicen en las salas?
select calificacion_edad, count(nombre) from peliculas
where codigo_pelicula in (select codigo_pelicula from salas where codigo_pelicula is not null)
group by calificacion_edad;
-- 12. Elimina todas las salas que proyectan películas recomendadas para todos los públicos. (calificacion_edad = 0)
DELETE FROM salas
WHERE codigo_pelicula in (select codigo_pelicula from peliculas where calificacion_edad = 0);