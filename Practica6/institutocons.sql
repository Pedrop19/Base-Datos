-- a) Muestra el nombre y apellidos de todos los alumnos que son de la provincia de Badajoz y que han obtenido más de un 5
-- de nota media en todas sus evaluaciones.
select a.nombre, a.apellidos, avg(e.nota) as media from alumno a
inner join familia f on a.id_familia = f.id_familia
inner join localidad l on f.id_localidad = l.id_localidad
inner join provincia pr on l.id_provincia = pr.id_provincia
inner join evaluacion e on e.id_alumno = a.id_alumno and pr.nombre = 'Badajoz' 
group by a.id_alumno
having avg(e.nota) > 5;
-- b) Nombre del grupo que tiene más alumnos.
select g.nombre from grupo g, alumno a
where a.id_grupo = g.id_grupo
order by a.id_alumno desc
limit 1;
-- c) Escribe la sentencia SQL para averiguar de qué 3 localidades son los alumnos con mejor nota media.
select l.nombre, avg(e.nota) as media from localidad l
inner join familia f on l.id_localidad = f.id_localidad
inner join alumno a on f.id_familia = a.id_familia
inner join evaluacion e on e.id_alumno = a.id_alumno
group by l.id_localidad
order by media desc
limit 3;
-- d) Nota media por nivel educativo.
select n.nombre, avg(e.nota) from evaluacion e
inner join profesor p on p.id_profesor = e.id_profesor
inner join grupo g on p.id_profesor = g.id_profesor
inner join nivel n on n.id_nivel = g.id_nivel
group by n.id_nivel;