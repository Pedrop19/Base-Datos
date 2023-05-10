/* Ejercicio 1
Crea un procedimiento de nombre artistas_getAnimalesPorNif que devuelva los animales que cuida un artista. 
Llevará como parámetro el nif de artista. */
drop procedure if exists  atracciones_getAnimalesPorNif;
delimiter $$

create procedure atracciones_getAnimalesPorNif(p_nif varchar(9))
comment 'Devuelve los animales que cuida un artista'

begin
	select animales.*
    from animales
    inner join animales_artistas on animales.nombre = animales_artistas.nombre_animal
    where animales_artistas.nif_artista = p_nif
    order by nombre;
end$$

delimiter ;

call atracciones_getAnimalesPorNif('11111111A');

/* Ejercicio 2
Crea un procedimiento de nombre artistas_getAnimalesPorNombreApel que devuelva los animales 
que cuida un artista. Llevará como parámetro el nombre y apellidos del artista. 
Utiliza una variable local para obtener el nif del artista que necesitas para obtener los animales del artista. */

drop procedure if exists  artistas_getAnimalesPorNombreApel;
delimiter $$

create procedure artistas_getAnimalesPorNombreApel(p_nombre varchar(45), p_apellido varchar(100))
comment 'Devuelve los animales que cuida un artista'

begin

	declare nifartista varchar(9);
    select nif
    into nifartista
    from artistas
    where nombre = p_nombre and apellidos = p_apellido;
    
	select animales.*
    from animales
    inner join animales_artistas on animales.nombre = animales_artistas.nombre_animal
    where animales_artistas.nif_artista = nifartista
    order by nombre;
end$$

delimiter ;

call artistas_getAnimalesPorNombreApel('Luis', 'Sanchez');

/* Ejercicio 3
Crea un procedimiento de nombre atracciones_getListConAntiguedad que devuelva los datos de las atracciones 
que hayan comenzado hace un número de años con respecto a la fecha actual. 
Tendrás que hacer uso de alguna de las funciones Date Time. Intenta averiguar cual. */

drop procedure if exists  atracciones_getListConAntiguedad;
delimiter $$

create procedure atracciones_getListConAntiguedad(p_anios int)
comment 'Devuelve los datos de las atracciones que hayn comenzado hace un numero de anios con respecto a la fecha actual'
begin
	select * 
    from atracciones
    where timestampdiff(year, fecha_inicio, now()) > p_anios
    order by nombre;
end$$

delimiter ;

call atracciones_getListConAntiguedad(4);

/* Ejercicio 4
Crea un procedimiento de nombre artistas_getListMasAnimalesCuida que devuelva los datos 
de los artistas que cuidan a más animales de los indicados (parámetro que se le envía).*/
use circo;
drop procedure if exists artistas_getListMasAnimalesCuida;

delimiter $$

create procedure artistas_getListMasAnimalesCuida(p_animales int)
comment 'Devuelve los datos de los artistas que cuidan a más animales de los indicados'
begin
	select a.*
    from artistas a
    inner join animales_artistas ana on a.nif = ana.nif_artista
    group by a.nif
    having count(a.nif) > p_animales;
end$$

delimiter ;

call artistas_getListMasAnimalesCuida(1);


/* Ejercicio 5
Crea un procedimiento de nombre atracciones_getListPorFecha que devuelva los datos 
de las atracciones que han comenzado a partir de la fecha indicada.
Pista: Recordar que las fechas son tratadas como cadenas...y tener en cuenta el formato.
Añade una nueva atracción con la fecha de inicio actual.
Llama al procedimiento empleando la fecha actual menos 3 días 
(haz uso de la función DATE_SUB y curdate) */

drop procedure if exists atracciones_getListPorFecha;
comment 'Devuelve los datos de las atracciones que han comenzado a partir de la fecha indicada'
delimiter $$

create procedure atracciones_getListPorFecha(p_fecha date)
begin
	select *
    from atracciones
	where fecha_inicio > p_fecha;
end$$

delimiter ;

call atracciones_getListPorFecha('2000-01-01');

insert into atracciones values ('El unico', '2023-05-05', 2000.1);

call atracciones_getListPorFecha(date_sub(curdate(), interval 3 day));

/* Ejercicio 6
Crea un procedimiento de nombre pistas_add y que añada una nueva pista.
Se puede hacer uso de la función ROW_COUNT() para saber cuantas filas fueron añadidas, borradas o modificadas.
Importante: Los parámetros deben de tener el mismo tipo de dato y tamaño que el que está definido a nivel de columnas en la tabla PISTAS.*/
use circo;
drop procedure if exists pistas_add;
delimiter $$

create procedure pistas_add(v_nombre varchar(50), v_aforo smallint(6))
comment 'Crea una nueva pista'
begin
	insert into pistas values(v_nombre, v_aforo);
end$$

delimiter ;

call pistas_add('pista01', 4);

/* Ejercicio 7
Crea un procedimiento de nombre atracciones_update que permita modificar los datos de una atracción (no se permite actualizar su clave primaria).
Modifica la fecha de inicio de la atracción 'El gran felino' y ponla un día después de la que tiene ahora mismo.*/

drop procedure if exists atracciones_update;
delimiter $$

create procedure atracciones_update(v_nombre varchar(50), v_fecha date, v_ganancias decimal(8,2))
begin

update atracciones
set fecha_inicio=v_fecha, 
	ganancias=v_ganancias
	where nombre=v_nombre;
    
select * from atracciones;
end$$

delimiter ;

select ganancias, fecha_inicio
into @ganancias, @fechainicio
from atracciones
where nombre = 'La espectacular';

call atracciones_update('La espectacular',date_add(@fechainicio, interval 1 day), @ganancias);

/* Ejercicio 8
Crea un procedimiento de nombre pistas_delete que borre una pista por su nombre. Haz que borre en base al patrón nombre% (empleando el Like).
Borra la atracción que hayas añadido en el ejercicio 6 mandando las primeras letras. */

use circo;
drop procedure if exists pistas_delete;
delimiter $$

create procedure pistas_delete(p_nombre varchar(50))
begin
	declare v_nombre varchar (50);
	select nombre
    into v_nombre
    from pistas
    where nombre like 'v_nombre$';
	drop table v_nombre;
end$$

delimiter ;

call pistas_delete('pista01', 4);