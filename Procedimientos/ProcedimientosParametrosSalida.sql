/*Ejercicio 1
Crea un procedimiento de nombre pistas_getAforo al que se le pase 
el nombre de una pista y devuelve en forma de parámetro de salida su aforo.
*/
use circo;
drop procedure if exists  pistas_getAforo;
delimiter $$

create procedure pistas_getAforo(p_nombre varchar(50), OUT p_aforo smallint)
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

create procedure artistas_getNumAnimalesCuida(p_nif char(9), OUT p_cantidad int)
comment 'devuelve en forma de parámetro de salida su aforo'
begin
    
        select count(*)
        into p_cantidad
        from animales_artistas
        where nif_artista = p_nif;
    
end$$

delimiter ;

call artistas_getNumAnimalesCuida('11111111A', @p_cantidad);
select @p_cantidad;

/*
Ejercicio 3
Crea un procedimiento de nombre animales_getNombreAforo al que se le pase el nombre de un animal y devuelva, 
empleando un parámetro de salida y haciendo uso del procedimiento creado en el ejercicio 1, 
de una cadena con el formato: NombreAnimal:peso:pista:aforo
Pista: Emplea la función CONCAT*/

use circo;
drop procedure if exists animales_getNombreAforo;
delimiter $$

create procedure animales_getNombreAforo(p_nombre varchar(50), OUT p_cadena varchar(50))
comment 'devuelve en forma de parámetro de salida NombreAnimal:peso:pista:aforo'
begin
    declare v_peso float;
    declare v_aforo smallint;
    declare v_nombre_pista varchar(50);

    select peso, nombre_pista
    into v_peso, v_nombre_pista
    from animales
    where nombre=p_nombre;

    call pistas_getAforo(v_nombre_pista, v_aforo);

    set p_cadena = concat(p_nombre, ':', v_peso, ':', v_nombre_pista, ':', v_aforo);
end$$

delimiter ;

select * from animales;
use circo;
call animales_getNombreAforo('Berni', @datos);
select @datos;

/* Ejercicio 4
Crea un procedimiento de nombre artistas_getNumAtracAnimal al que se le pase los apellidos y nombre de un artista y devuelva,
empleando un parámetro de salida, el número de atracciones en las que trabaja y el número de animales que cuida 
(empleando el procedimiento del ejercicio 2) con el formato: nif:NumAtracciones:NumAnimales.
Nota: Suponemos que no hay artistas con el mismo nombre y apellidos. */
use circo;
drop procedure if exists artistas_getNumAtracAnimal;
delimiter $$

create procedure artistas_getNumAtracAnimal(p_nombre varchar(45), p_apellido VARCHAR(100), OUT p_cadena4 VARCHAR(50))
comment 'devuelve en forma de parámetro de salida su aforo'
begin
    declare v_nif char(9);
    declare v_animales tinyint;
    declare v_atracciones tinyint;

    select nif
    into v_nif
    from artistas
    where nombre=p_nombre
    and apellidos=p_apellido;

    call artistas_getNumAnimalesCuida(v_nif, v_animales);
    select count(*)
    into v_atracciones
    from atracciones_artistas
    where nif_artista = v_nif AND
    fecha_fin is null;
        


    set p_cadena4 = CONCAT(v_nif,':', v_animales, ':',v_atracciones)

  
end$$

delimiter ;
select * from artistas;

call artistas_getNumAtracAnimal('Juan', 'Lopez', @p_animal, @p_atracciones);
select @p_animal;