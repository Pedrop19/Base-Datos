/*

		NOMBRE Y APELLIDOS: 
		
        Para facilitar el examen, tienes en este fichero las querys necesarias para la creación de las tablas.
		El archivo que tienes que entregar en la tarea, es este mismo con las respuestas ya incluidas, indicando tu nombre y apellidos.
        El archivo que tienes que entregar en la tarea, es ese mismo con las respuestas ya incluidas.
		Debe mantener el formato que tiene y hacer cada query en su lugar correspondiente, conservando la documentación que hay ya generada. 
        Si esto se incumple, no se evaluará el fichero

        
        Suerte!!


*/

CREATE DATABASE instituto_extremadura;
USE instituto_extremadura;
/*
	1.	Diseño físico de la BD. Lenguaje DDL (1 punto.)
*/

-- PROVINCIAS
CREATE TABLE PROVINCIAS (
	id_provincia int unsigned NOT NULL,
	provincia varchar(200) NOT NULL,
	PRIMARY KEY (id_provincia)
);

INSERT INTO PROVINCIAS VALUES 
(1,'Araba/Álava'),(2,'Albacete'),(3,'Alicante/Alacant'),(4,'Almería'),(5,'Ávila'),(6,'Badajoz'),
(7,'Balears, Illes'),(8,'Barcelona'),(9,'Burgos'),(10,'Cáceres'),(11,'Cádiz'),(12,'Castellón/Castelló'),
(13,'Ciudad Real'),(14,'Córdoba'),(15,'Coruña, A'),(16,'Cuenca'),(17,'Girona'),(18,'Granada'),(19,'Guadalajara'),(20,'Gipuzkoa'),(21,'Huelva'),(22,'Huesca'),
(23,'Jaén'),(24,'León'),(25,'Lleida'),(26,'Rioja, La'),(27,'Lugo'),(28,'Madrid'),(29,'Málaga'),(30,'Murcia'),(31,'Navarra'),(32,'Ourense'),(33,'Asturias'),
(34,'Palencia'),(35,'Palmas, Las'),(36,'Pontevedra'),(37,'Salamanca'),(38,'Santa Cruz de Tenerife'),(39,'Cantabria'),(40,'Segovia'),(41,'Sevilla'),(42,'Soria'),
(43,'Tarragona'),(44,'Teruel'),(45,'Toledo'),(46,'Valencia/València'),(47,'Valladolid'),(48,'Bizkaia'),(49,'Zamora'),(50,'Zaragoza'),(51,'Ceuta'),(52,'Melilla');


-- LOCALIDADES
CREATE TABLE LOCALIDADES (
	id_localidad int unsigned NOT NULL AUTO_INCREMENT,
	localidad varchar(200) NOT NULL,
	id_provincia int unsigned NOT NULL,
	FOREIGN KEY (id_provincia) REFERENCES PROVINCIAS(id_provincia),
	PRIMARY KEY (id_localidad)
);

INSERT INTO LOCALIDADES VALUES (1,'ACEDERA',6),(2,'MERIDA',6),(3,'ALMENDRALEJO',6),(4,'CACERES',10),(5,'CASAR DE CACERES',10),
(6,'MALPARTIDA',10),(7,'villalba de la Serena',6),(8,'Villanueva de la Serena',6),(9,'Valle del jerte',10),
(10,'El valle',10),(11,'Valle de la Serena',10),(12,'MALPARTIDA de la serena',10),(190,'ABADIA',10),(191,'ABERTURA',10),(192,'ACEBO',10);
/

-- ETAPAS
CREATE TABLE ETAPAS (
	id_etapa int unsigned NOT NULL AUTO_INCREMENT,
	etapa varchar(200) NOT NULL,
	PRIMARY KEY (id_etapa)
);

INSERT INTO ETAPAS VALUES (1,'ESO'),(2,'BACHILLERATO'),(3,'FP');


-- NIVELES
CREATE TABLE NIVELES (
	id_nivel int unsigned NOT NULL AUTO_INCREMENT,
	nivel varchar(200) NOT NULL,
	id_etapa int unsigned NOT NULL,
	FOREIGN KEY (id_etapa) REFERENCES ETAPAS(id_etapa),
	PRIMARY KEY (id_nivel)
);


INSERT INTO NIVELES VALUES 
(1,'Nivel 1 ',1),(2,'Nivel 2',1),(3,'Nivel 3 ',1),
(4,'Nivel 1 ',2),(5,'Nivel 2',2),(6,'Nivel 3 ',2),
(7,'Nivel 1 ',3),(8,'Nivel 2',3),(9,'Nivel 3 ',3);


-- ACTIVIDADES
CREATE TABLE ACTIVIDADES (
	id_actividad int unsigned NOT NULL AUTO_INCREMENT,
	actividad varchar(200) NOT NULL,
	PRIMARY KEY (id_actividad)
);

INSERT INTO ACTIVIDADES VALUES (1,'PESCA'),(2,'CORRER'),(3,'BICI'),(4,'RECICLAJE'),(5,'EXPRESION'),(6,'NADAR'),(7,'BAILAR');


-- DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
	id_departamento int unsigned NOT NULL AUTO_INCREMENT,
	departamento varchar(100) NOT NULL,
	id_jefe int(11) NOT NULL,
	PRIMARY KEY (id_departamento)
);

INSERT INTO DEPARTAMENTOS VALUES (1,'INFORMATICA',1),(2,'MATEMATICAS',2),(3,'LENGUA',3),(4,'INGLES',4);


-- PROFESORES
CREATE TABLE PROFESORES (
	id_profesor int unsigned NOT NULL PRIMARY KEY,
    DNI varchar(10),
    nombre varchar(200) not null,
    apellido1 varchar(200) not null,
    apellido2 varchar(200) not null,
    fecha_nacimiento date not null,
    antiguedad int unsigned not null,
    sexo enum('H','M') not null,
    id_departamento int unsigned not null,
    salario decimal(6,2) not null,
    domicilio varchar(200) not null,
    email varchar(100),
    id_localidad int unsigned not null,
    telefono int(10) unsigned not null,
    foreign key(id_departamento) references DEPARTAMENTOS(id_departamento),
    foreign key(id_localidad) references LOCALIDADES(id_localidad)
);

INSERT INTO PROFESORES VALUES 
(1,'55478987A','LOLA','MONTES','SANCHEZ','1970-02-02',2,'M',1,1100.00,'REAL,7','ddd@gmail.com',1,358784578),
(2,'78479987V','MARTA','PEREZ','LOPEZ','1984-03-02',12,'M',1,1100.00,'BECERRO,2','eee@gmail.com',4,696447755),
(3,'04579987K','RAQUEL','LOPEZ','MUÑOZ','1974-02-12',4,'H',3,1100.00,'LIMA,9','fff@gmail.com',5,696225588),
(4,'74578487D','LEANDRO','DIAZ','RAMOS','1972-04-12',5,'H',4,1100.00,'PERU,5','ggg@gmail.com',6,696887744),
(5,'47875845S','ALBERTO','COLLAZOS','SANCHEZ','1989-12-03',2,'M',1,1100.00,'MERIA,15','hhh@gmail.com',1,696888888);


-- GRUPOS
CREATE TABLE GRUPOS (
	id_grupo int unsigned NOT NULL AUTO_INCREMENT,
	grupo varchar(200) NOT NULL,
	id_tutor int unsigned NOT NULL,
	FOREIGN KEY (id_tutor) REFERENCES PROFESORES(id_profesor),
	id_nivel int unsigned NOT NULL,
	FOREIGN KEY (id_nivel) REFERENCES NIVELES(id_nivel),
	PRIMARY KEY (id_grupo)
);

INSERT INTO GRUPOS VALUES (1,'A',1,1), (2,'B',1,2), (3,'C',1, 3), (4,'A',2,3),
(5,'B',2,4),(6,'C ',2,5),(7,'A ',3,5),(8,'B',4,1),(9,'A',5,3);


-- FAMILIAS
CREATE TABLE FAMILIAS (
	id_familia int unsigned NOT NULL AUTO_INCREMENT,
	progenitorA_DNI varchar(10) NOT NULL,
	progenitorA_nombre varchar(50) NOT NULL,
	progenitorA_apellido1 varchar(50) NOT NULL,
	progenitorA_apellido2 varchar(50) NOT NULL,
	progenitorA_email varchar(100) NOT NULL,
	progenitorB_DNI varchar(10),
	progenitorB_nombre varchar(50),
	progenitorB_apellido1 varchar(50),
	progenitorB_apellido2 varchar(50),
	progenitorB_email varchar(100),
	domicilio varchar(200) NOT NULL,
	id_localidad int unsigned NOT NULL,
	FOREIGN KEY (id_localidad) REFERENCES LOCALIDADES(id_localidad),
	telefono int(10) unsigned NOT NULL,
	PRIMARY KEY (id_familia)
);

INSERT INTO FAMILIAS VALUES 
(1,'1','Maria','Rangel','Sanz','aaa@gmail.com',NULL,NULL,NULL,NULL,NULL,'Cervantes, 5',3,685451478),
(2,'1','Juan','Sanchez','Gil','bbb@gmail.com',NULL,NULL,NULL,NULL,NULL,'Real, 15',4,687841478),
(3,'2','Pedro','Palacio','Mora','ccc@gmail.com',NULL,NULL,NULL,NULL,NULL,'Lima, 25',6,698751777);


-- ALUMNOS 
CREATE TABLE ALUMNOS (
	id_alumno int unsigned NOT NULL AUTO_INCREMENT,
	DNI varchar(10),
	nombre varchar(50) NOT NULL,
	apellido1 varchar(50) NOT NULL,
	apellido2 varchar(50),
	sexo enum('H','M') NOT NULL DEFAULT 'H',
	email varchar(100),
	fecha_nacimiento date NOT NULL,
	id_familia int unsigned NOT NULL,
	FOREIGN KEY (id_familia) REFERENCES FAMILIAS(id_familia),
	id_grupo int unsigned NOT NULL,
	FOREIGN KEY (id_grupo) REFERENCES GRUPOS(id_grupo),
	PRIMARY KEY (id_alumno)
);

INSERT INTO ALUMNOS VALUES (1,'22222222M','Juan','Martinez','Lopez','H','mmm@gmail.com','1999-02-02',1,1),
(2,'33333333M','Ramon','Moreno','Lopez','H','ooo@gmail.com','2009-02-02',2,2),
(3,'78946512T','Alonso','Torres','Gil','H','abc@gmail.com','2009-12-02',3,2),
(4,'45784578P','Roberto','Hernandez','ortega','H','DEF@gmail.com','2009-12-02',1,3),
(5,'44444444Y','Miriam','Diez','Caballero','M','TTT@gmail.com','2001-10-02',3,5),
(6,'74747474U','Sara','Cano','Cortes','M','SSS@gmail.com','2009-12-02',2,4),
(7,'33333333M','Lucia','Martinez','Reyes','M','QQQ@gmail.com','2002-05-02',1,6),
(8,'55441122M','Raul','Mendez','Lopez','H',NULL,'1999-02-02',1,1),
(9,'44669955L','Olivia','Moreno','Lopez','M','ooo@gmail.com','2009-02-02',2,2),
(10,'78226512T','Raquel','Alonso','Gil','M',NULL,'2009-12-02',3,2),
(11,'42784578P','Carlos','Rodriguez','Gomez','H',NULL,'2009-12-02',1,3),
(12,'212747474U','Mamen','Coro','Cortes','M',NULL,'2009-12-02',2,4),
(13,'44112444Y','Ana','Diez','Martinez','M','TTT@gmail.com','2001-10-02',3,5),
(14,'31323333M','Leticia','Martinez','Diez','M','QQQ@gmail.com','2002-05-02',1,6);


-- MATERIAS
CREATE TABLE MATERIAS (
	id_materia int unsigned NOT NULL AUTO_INCREMENT,
	materia varchar(200) NOT NULL,
	id_nivel int unsigned NOT NULL,
	FOREIGN KEY (id_nivel) REFERENCES NIVELES(id_nivel),
	id_departamento int unsigned NOT NULL,
	PRIMARY KEY (id_materia)
);

INSERT INTO MATERIAS VALUES (1,'BBDD',1,1),(2,'PROGRAMACION',1,1),(3,'REDES',3,1),
(4,'INGLES',2,4),(5,'INGLES I',2,4),(6,'BBDD II ',9,1),(7,'BBDD III',3,1),
(8,'CALCULO',4,2),(9,'ESTADISTICAS',5,2);


-- MATRICULAS
CREATE TABLE MATRICULAS (
	id_alumno int unsigned NOT NULL,
	FOREIGN KEY (id_alumno) REFERENCES ALUMNOS(id_alumno),
	id_materia int unsigned NOT NULL,
	FOREIGN KEY (id_materia) REFERENCES MATERIAS(id_materia),
	PRIMARY KEY (id_alumno, id_materia)
);

INSERT INTO MATRICULAS VALUES (1,1),(1,2),(2,2),(1,3),(3,3),(4,4),(5,7),(6,7),(7,8),(7,9);


-- HORARIOS
CREATE TABLE HORARIOS (
	id_materia int  unsigned NOT NULL,
	FOREIGN KEY (id_materia) REFERENCES MATERIAS(id_materia),
	id_grupo int unsigned NOT NULL ,
	FOREIGN KEY (id_grupo) REFERENCES GRUPOS(id_grupo),
	id_profesor int unsigned NOT NULL,
	FOREIGN KEY (id_profesor) REFERENCES PROFESORES(id_profesor),
	PRIMARY KEY (id_materia,id_grupo,id_profesor)
);

INSERT INTO HORARIOS VALUES (1,1,1),(2,2,1),(8,2,3),(3,3,1),(4,4,2),(5,7,4),(6,7,5),(7,8,2),(9,9,5);


-- EVALUACIONES
CREATE TABLE EVALUACIONES (
	id_alumno int unsigned NOT NULL,
	FOREIGN KEY (id_alumno) REFERENCES ALUMNOS(id_alumno),
	id_profesor int unsigned NOT NULL,
	FOREIGN KEY (id_profesor) REFERENCES PROFESORES(id_profesor),
	id_materia int unsigned NOT NULL,
	FOREIGN KEY (id_materia) REFERENCES MATERIAS(id_materia),
	evaluacion int unsigned NOT NULL,
	nota int unsigned NOT NULL,
	PRIMARY KEY (id_alumno,id_materia,evaluacion)
);



INSERT INTO EVALUACIONES VALUES (1,1,1,1,10),(1,1,1,2,10),
(2,2,1,1,5),(2,2,3,2,5),(2,5,2,1,8),(2,5,1,2,4), (2,5,4,1,10),(2,5,3,1,7),
(3,1,2,3,7),(3,3,3,1,2),(3,3,3,2,2),
(4,2,1,3,2), (4,4,2,1,4),(4,4,2,2,8),
(5,5,2,1,8),(5,5,1,2,4), (5,5,4,1,10),(5,5,3,1,7),
(6,5,2,1,8),(6,5,1,2,4), (6,5,4,1,10),(6,5,3,1,2);


-- INSCRIPCION_ACTIVIDADES
CREATE TABLE INSCRIPCION_ACTIVIDADES (
	id_alumno int unsigned NOT NULL,
	FOREIGN KEY (id_alumno) REFERENCES ALUMNOS(id_alumno),
	id_actividad int unsigned NOT NULL,
	FOREIGN KEY (id_actividad) REFERENCES ACTIVIDADES(id_actividad),
	PRIMARY KEY (id_alumno, id_actividad)
);

INSERT INTO INSCRIPCION_ACTIVIDADES VALUES (5,1),(7,1),(6,2),(4,3),(2,4),(3,5),(1,7);



/*	
		2.	Consultas sobre la BD. Lenguaje DQL. (9 puntos.)

*/

-- 1.	Obtén un listado del nombre y apellido1 de los alumnos del grupo 1, 3 y 5, ordenados por apellido y nombre, ambos ascendentes (0.3 ptos)
select nombre, apellido1 from alumnos
where id_grupo = 1 or id_grupo = 3 or id_grupo = 5
order by apellido1 desc, nombre desc;
-- 2.	Localiza el nombre  de los 3 alumnos más jóvenes. (0.3 ptos)
select nombre, fecha_nacimiento from alumnos
order by fecha_nacimiento desc
limit 3;

-- 3.   Calcula la nota máxima, media y mínima obtenidas en la primera evaluación.(0.3 ptos)
select min(nota) as "nota minima", max(nota) as "nota maxima", avg(nota) as "nota media" from evaluaciones
where evaluacion = 1;

-- 4.	Obtén el listado de las etapas, niveles de esa etapa, grupos de esos niveles y nombre del tutor para las etapas de las ESO. (0.6 ptos)
select e.id_etapa, n.id_nivel, g.id_grupo, p.nombre from etapas e
inner join niveles n on e.id_etapa = n.id_etapa
inner join grupos g on n.id_nivel = g.id_nivel
inner join profesores p on g.id_tutor = p.id_profesor
where e.etapa = "ESO";
-- 5.	Escribe la sentencia SQL para aumentar el sueldo en 100 euros a los que son tutores. (0.3 ptos)

select distinct p.id_profesor from profesores p
inner join grupos g on p.id_profesor = g.id_tutor;
update profesores set salario = salario+100
where id_profesor = 1 or id_profesor = 2 or id_profesor = 3 or id_profesor = 4 or id_profesor = 5;

-- 6. 	Alumnos (nombre y apellidos) que no están apuntados en ninguna actividad (0.6 ptos)
select a.nombre, a.apellido1, a.apellido2 from alumnos a
inner join inscripcion_actividades ia on a.id_alumno = ia.id_alumno
inner join actividades ac on ia.id_actividad = ac.id_actividad
where ia.id_alumno is null;

-- 7. 	Saca un listado con las siguientes columnas: "Nombre alumno", "Apellido 1", 
-- 		"Actividad que practica" de alumnos de Cáceres matriculados en la actividad “Correr” (0.6 ptos)
select a.nombre as "Nombre alumno", a.apellido1 as "Apellido 1", ac.actividad as "Actividad que practica" from alumnos a
inner join inscripcion_actividades ia on a.id_alumno = ia.id_alumno
inner join familias f on f.id_familia = a.id_familia
inner join localidades l on l.id_localidad = f.id_localidad
inner join actividades ac on ia.id_actividad = ac.id_actividad
where ac.actividad = "Correr" && l.localidad = "CACERES";

-- 8.	Número de materias que imparte cada departamento y nombre del departamento. (0.6 ptos)
select count(m.materia) as "Numero de materias", d.departamento from materias m
inner join departamentos d on d.id_departamento = m.id_departamento
group by d.id_departamento;

-- 9.	Localiza el nombre de la alumna y su nota media que está matriculada en la etapa de la ESO 
-- 		y recibe clase de un profesor cuyo primer apellido es “MONTES”. 
-- 		Además, la alumna tiene una nota media es mayor de 6.  (0.6 ptos)

select a.nombre, avg(e.nota) as notamedia from alumnos a
inner join matriculas ma on ma.id_alumno = a.id_alumno
inner join materias m on ma.id_materia = m.id_materia
inner join departamentos d on d.id_departamento = m.id_departamento
inner join profesores p on p.id_departamento = d.id_departamento
inner join evaluaciones e on e.id_alumno = a.id_alumno
inner join niveles n on n.id_nivel = m.id_nivel
inner join etapas et on et.id_etapa = n.id_etapa
where et.etapa = "ESO" && p.apellido1 = "MONTES" && a.sexo = "M"
having notamedia > 6;

-- 10. 	Lista el nombre de los alumnos con el nombre de las actividades que realizan, 
-- 		Muestra también aquellos alumnos que no hagan ninguna actividad (0.6 ptos)
select a.nombre, ac.actividad from alumnos a
left join inscripcion_actividades ia on a.id_alumno = ia.id_alumno
inner join actividades ac on ac.id_actividad = ia.id_actividad;

-- 11.	Escribe las sentencias SQL para obtener el nombre de los alumnos/as que hayan
-- 		suspendido los exámenes de la segunda evaluación. (0.6 ptos)
select a.nombre from alumnos a
inner join evaluaciones e on e.id_alumno = a.id_alumno
where e.nota < 5 && e.evaluacion = 2;

-- 12. 	Alumnos/as (nombre y apellidos) que están apuntados en más de una actividad (0.6 ptos)
select a.nombre, a.apellido1, a.apellido2, ac.actividad from alumnos a
inner join inscripcion_actividades ia on a.id_alumno = ia.id_alumno
inner join actividades ac on ia.id_actividad = ac.id_actividad
group by a.nombre;

-- 13. 	Escribe las sentencias SQL para calcular cuántos alumnos tienen solo un progenitor (0.6 ptos)
select count(a.id_alumno), f.progenitorB_DNI from alumnos a
inner join familias f on a.id_familia = f.id_familia
where progenitorB_DNI is null;

-- 14. 	Nombre de alumnos de Almendralejo que practican la actividad “Pesca” (0.6 ptos)
select a.nombre from alumnos a
inner join inscripcion_actividades ia on a.id_alumno = ia.id_alumno
inner join actividades ac on ia.id_actividad = ac.id_actividad
inner join familias f on f.id_familia = a.id_familia
inner join localidades l on f.id_localidad = f.id_localidad
where l.localidad = "Almendralejo" && ac.actividad = "Pesca";

-- 15. 	Nombre de profesores que no tienen departamentos (0.6 ptos)
select p.nombre from profesores p
inner join departamentos d on d.id_departamento = p.id_departamento
where p.id_departamento is null;

-- 16. 	Obtén el nombre, la nota máxima y mínima para cada alumno del grupo 1  (0.6 ptos)
select max(e.nota), min(e.nota), a.nombre from alumnos a
inner join grupos g on g.id_grupo = a.id_grupo
inner join evaluaciones e on e.id_alumno = a.id_alumno
where g.grupo = 1;

-- 17.	Escribe las sentencias SQL para mostrar el nombre y salario de la profesora que gana más que cualquier profesor varón  (0.6 ptos)
select nombre, max(salario) from profesores
where sexo = "M";



