-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado
-- deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
select apellido1, apellido2, nombre from alumno
order by apellido1, apellido2, nombre desc;
-- 2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
select nombre, apellido1 from alumno
where telefono is null;
-- 3. Devuelve el listado de los alumnos que nacieron en 1999.
select nombre, apellido1 from alumno
where year(fecha_nacimiento) = 1999; 
-- 4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y
-- además su nif termina en K.
select nombre, apellido1, nif from profesor
where telefono is null and nif like '%k';
-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del
-- grado que tiene el identificador 7
select a.nombre from asignatura a
inner join grado g on a.id_grado = g.id and g.id = 7 and a.cuatrimestre = 1;
-- 6. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
select a.nombre from asignatura a
inner join grado g on a.id_grado = g.id and g.nombre = "Grado en Ingeniería Informática (Plan 2015)";
-- 7. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados.
-- El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento.
-- El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
select  p.apellido1, p.apellido2, p.nombre, d.nombre from profesor p
inner join departamento d on p.id_departamento = d.id
order by p.apellido1, p.apellido2, p.nombre desc;
-- 8. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select distinct a.nombre from asignatura a
inner join profesor p on a.id_profesor != p.id;
-- 9. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M
-- 10. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten
-- alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
-- 11. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados.
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado.
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
-- 12. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2015/2016.
-- 13. Devuelve un listado con los departamentos que no tienen profesores asociados.
-- 14. Devuelve un listado con los datos de sólo las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
-- 15. Devuelve un listado con los id profesores que no imparten ninguna asignatura.
-- 16. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos.
-- Ten en cuenta que pueden existir departamentos que no tienen profesores asociados.
-- Estos departamentos también tienen que aparecer en el listado.