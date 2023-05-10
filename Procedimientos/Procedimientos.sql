use circo;
drop procedure if exists artistas_getList;
-- Crea un procedimiento de nombre artistas_getList() que devuelva el nombre y apellidos 
-- de los artistas separados por coma con el formato: apellidos,nombre ordenados de forma descendente.
delimiter $$

create procedure artistas_getList()
begin
	select concat(apellidos,',', nombre) as nombrecompleto
    from artistas
    order by nombrecompleto desc;
end$$

delimiter ;

call artistas_getList();

-- Crea un procedimiento de nombre artistas_getListAnimales() que devuelva los nombres de los artistas 
-- junto con su nif así como el nombre y peso de los animales que están atendidos por los artistas, 
-- ordenados por nif del artista y nombre del animal.
drop procedure if exists artistas_getListAnimales;
delimiter $$

create procedure artistas_getListAnimales()
begin
	select a.nombre, a.nif, an.nombre, an.peso
    from artistas a
    inner join animales_artistas ana on a.nif = ana.nif_artista
    inner join animales an on an.nombre = ana.nombre_animal;
end$$

delimiter ;

call artistas_getListAnimales();

-- Crea un procedimiento de nombre atracciones_getListConAntiguedad5() que devuelva 
-- los datos de las atracciones que hayan comenzado hace 5 años con respecto a la fecha actual. 
-- Tendrás que hacer uso de alguna de las funciones Date Time. Intenta averiguar cual.

drop procedure if exists  atracciones_getListConAntiguedad5;
delimiter $$

create procedure atracciones_getListConAntiguedad5()
begin
	select * 
    from atracciones
    where timestampdiff(year, fecha_inicio, now()) > 5
    order by nombre;
end$$

delimiter ;

call atracciones_getListConAntiguedad5();


-- Crea un procedimiento de nombre animales_Leo_getPista() que muestre los datos de la pista donde trabaja el animal de nombre 'Leo'. 
-- Hacerlo empleando una variable local que guarde el nombre de la pista. 
-- Después consultar los datos de la pista empleando dicha variable local.

drop procedure if exists  animales_Leo_getPista;
delimiter $$

create procedure animales_Leo_getPista()
comment 'Devuelve los datos'

begin
	declare nombrePista varchar(50)  default '';
	select p.nombre
    into nombrepista
    from pistas p
    inner join animales a on a.nombre_pista = p.nombre and a.nombre = 'Leo';
    
    select *
    from pistas
    where nombre=nombrePista;
end$$

delimiter ;

call animales_Leo_getPista();

-- Crea un procedimiento de nombre atracciones_getUltima() que obtenga los datos de la última atracción 
-- celebrada (tabla ATRACCION_DIA), empleando variables locales. Para ello guarda en una variable 
-- el nombre de la última atracción celebrada y busca los datos de dicha atracción. 
-- Ten en cuenta limitar con LIMIT el número de filas que devuelva una consulta si no sabes con certeza 
-- que vaya a devolver una única fila y vas a guardar el datos en una variable.

drop procedure if exists  atracciones_getUltima;
delimiter $$

create procedure atracciones_getUltima()
comment 'Devuelve los datos de la ultima atraccion celebrada'

begin
	declare ultimatraccion varchar(50)  default '';
	select nombre_atraccion
    into ultimatraccion
    from atraccion_dia
    order by fecha desc
    limit 1;
    
    select *
    from atracciones
    where nombre = ultimatraccion;
end$$

delimiter ;

call atracciones_getUltima();

-- Crea un procedimiento de nombre atracciones_getArtistaUltima() que obtenga los datos de la atracción 
-- y del artista que trabaja en dicha atracción, cuya fecha de inicio ha empezado más tarde. 
-- Emplea dos variables. Una para guardar el nif del artista y otra para guardar el nombre de la atracción.

drop procedure if exists  atracciones_getArtistaUltima;
delimiter $$

create procedure atracciones_getArtistaUltima()
comment 'Devuelve los datos de la ultima atraccion celebrada'

begin
	declare ultimatraccion varchar(50)  default '';
    declare nifartista varchar(9);
    
	select nombre_atraccion, nif_artista
    into ultimatraccion, nifartista
    from atracciones_artistas
    order by fecha_inicio desc
    limit 1;
    
    
    select *
    from atracciones,artistas
    where atracciones.nombre = ultimatraccion and artistas.nif = nifartista;
end$$

delimiter ;

call atracciones_getArtistaUltima();