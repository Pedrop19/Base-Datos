/*Ejercicio 1
Crea un procedimiento de nombre pistas_getAforo al que se le pase 
el nombre de una pista y devuelve en forma de parámetro de salida su aforo.
*/
use circo;
drop procedure if exists  pistas_getAforo;
delimiter $$

create procedure pistas_getAforo(p_nombre varchar(50), OUT p_aforo smallint UNSIGNED)
comment 'devuelve en forma de parámetro de salida su aforo'
begin
    set p_aforo = (
        SELECT aforo
        from pistas
        where nombre = p_nombre);
end$$

delimiter ;

call pistas_getAforo('La grande', @p_aforo);
select @p_aforo;
/*
Ejercicio 2
Crea un procedimiento de nombre artistas_getNumAnimalesCuida al que 
se le pase el nif de un artista y que devuelva en forma de 
parámetro de salida a cuantos animales cuida.
*/
use circo;
drop procedure if exists artistas_getNumAnimalesCuida;
delimiter $$

create procedure artistas_getNumAnimalesCuida(p_nif char(9), OUT p_cantidad int UNSIGNED)
comment 'devuelve en forma de parámetro de salida su aforo'
begin
    set p_cantidad = (
        select count(a.apellidos)
        from artistas a
        inner join animales_artistas ana on a.nif = ana.nif_artista
        and a.nif = p_nif
        GROUP BY a.apellidos
    );
end$$

delimiter ;

call artistas_getNumAnimalesCuida('11111111A', @p_cantidad);
select @p_cantidad;

/*
Ejercicio 3
Crea un procedimiento de nombre animales_getNombreAforo al que se le pase el nombre de un animal y devuelva, empleando un parámetro de salida y haciendo uso del procedimiento creado en el ejercicio 1, de una cadena con el formato: NombreAnimal:peso:pista:aforo
Pista: Emplea la función CONCAT*/

use circo;
drop procedure if exists animales_getNombreAforo;
delimiter $$

create procedure animales_getNombreAforo(p_nif char(9), OUT p_cantidad int UNSIGNED)
comment 'devuelve en forma de parámetro de salida su aforo'
begin
    set p_cantidad = (
        select count(a.apellidos)
        from artistas a
        inner join animales_artistas ana on a.nif = ana.nif_artista
        and a.nif = p_nif
        GROUP BY a.apellidos
    );
end$$

delimiter ;

call animales_getNombreAforo('11111111A', @p_cantidad);
select @p_cantidad;
/*
Ejercicio 4
Crea un procedimiento de nombre artistas_getNumAtracAnimal al que se le pase los apellidos y nombre de un artista y devuelva, empleando un parámetro de salida, el número de atracciones en las que trabaja y el número de animales que cuida (empleando el procedimiento del ejercicio 2) con el formato: nif:NumAtracciones:NumAnimales.

Nota: Suponemos que no hay artistas con el mismo nombre y apellidos.
*/