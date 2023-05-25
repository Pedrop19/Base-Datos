-- Active: 1684864704451@@localhost@3306@burger
-- Pedro Rafael Lazaro Nevado
-- 1. Las 5 primeras hamburguesas cuyo valor calórico esté entre 350 y 500 calorías, ordenadas de
-- mayor a menor valor calórico.
-- Nombre Vista: top_5.
-- Columnas: Nombre hamburguesa, valor calórico. (0.5 puntos)
use burger;

create view top_5 as
select nombre as "nombre hamburguesa", valor_calorico as "valor calórico"
from hamburguesa
where 500 >= valor_calorico >= 350
order by valor_calorico desc
limit 5;

-- 2. El nombre de la hamburguesa y la media de puntos de las valoraciones que tiene dicha
-- hamburguesa ordenados descendente por la media.
-- Nombre Vista: media_hamb.
-- Columnas: Nombre hamburguesa, media puntos. (0.75 puntos)

create view media_hamb as
select h.nombre as "nombre hamburguesa", avg(vh.valoracion) as "media puntos"
from hamburguesa h, valoracion_hamburguesa vh
where h.id = vh.id_hamburguesa
group by h.nombre
order by avg(vh.valoracion) desc;
-- 3. El valor total en calorías de las hamburguesas de cada hamburguesería.
-- Nombre Vista: total_calorias.
-- Columnas: Nombre de la hamburguesería, el total de hamburguesas que pertenecen a esa
-- hamburguesería y el sumatorio de todas las calorías de dichas hamburguesas. (0.75 puntos)
create view total_calorias as
select ha.nombre as "Nombre de la hamburguesería", count(h.id) as "total de hamburguesas", sum(h.valor_calorico) as "todas las calorías"
from hamburguesa h, hamburgueseria ha
where h.id_hamburgueseria = ha.id
group by ha.id;

-- 1. Procedure-> crear_valoracion_hamburguesa (id_hamburguesa, cliente, comentario, valoracion),
-- siendo todos los anteriores parámetros de entrada. Inserta en la tabla de valoraciones una nueva
-- valoración para ello:
-- a. Comprueba que la hamburguesa existe.
-- b. Comprueba que no haya ya una valoración realizada por un cliente con el mismo nombre para
-- esa hamburguesa.
-- c. Si las dos condiciones anteriores se cumplen inserte un nuevo registro en valoración.
-- Invoca el procedimiento para comprobar que funciona correctamente.
-- (2.5 puntos).
drop procedure if exists  crear_valoracion_hamburguesa;
delimiter $$

create procedure crear_valoracion_hamburguesa(id_hamburguesa int, cliente varchar(150), comentario varchar(100), valoracion int)
comment 'Permite crear una valoracion para una hamburguesa'

begin

declare encontrar_hamburguesa int;
declare encontrar_comentario int;
-- Comprueba que la hamburguesa existe.
select count(*)
into encontrar_hamburguesa
from hamburguesa
where id = id_hamburguesa;

-- Comprueba que no haya ya una valoración realizada por un cliente con el mismo nombre para
-- esa hamburguesa.

select count(*)
into encontrar_comentario
from valoracion_hamburguesa
where id_hamburguesa = id_hamburguesa and nombre_cliente = cliente;

if (encontrar_hamburguesa = 0) then
    select "La hamburguesa no existe" as mensaje;
elseif (encontrar_comentario != 0) then
    select "Ya has hecho un comentario sobre esa hamburguesa" as mensaje;
else 
    insert into valoracion_hamburguesa(id_hamburguesa, nombre_cliente, opinion, valoracion) values (id_hamburguesa, cliente, comentario, valoracion);
end if;

end$$

delimiter ;
call crear_valoracion_hamburguesa(2, "Pedro Lazaro", "Increible", 10);
-- 2. Procedure -> actualiza_valor_calorico_hamburguesa, que actualiza el campo valor calórico de la
-- hamburguesa en función al de sus ingredientes, para ello:
-- a. Comprueba que existe una hamburguesa con el id que se le pasa como parámetro de entrada.
-- b. Calcula el valor calórico que debería tener la hamburguesa en función a la suma del
-- valor calórico de sus ingredientes.
-- c. Si el valor calórico actual de la hamburguesa es diferente al que debe tener, lo actualiza. Sino
-- no tiene que hacer nada. (2.5 puntos).
-- Invoca el procedimiento para comprobar que funciona correctamente.
drop procedure if exists  actualiza_valor_calorico_hamburguesa;
delimiter $$

create procedure actualiza_valor_calorico_hamburguesa(id_hamburguesa int)
comment 'Permite cambiar el valor calorico de una hamburguesa'

begin

declare encontrar_hamburguesa int;
declare ing_valor_calorico int;
declare ham_valor_calorico int;
-- Comprueba que la hamburguesa existe.
select count(*)
into encontrar_hamburguesa
from hamburguesa
where id = id_hamburguesa;

-- Calcula el valor calórico que debería tener la hamburguesa en función a la suma del
-- valor calórico de sus ingredientes.

select sum(i.valor_calorico)
into ing_valor_calorico
from ingrediente i, hamburguesa_ingredientes hi
where hi.id_hamburguesa = id_hamburguesa and i.id = hi.id_ingrediente;


select valor_calorico
into ham_valor_calorico
from hamburguesa
where id = id_hamburguesa;

-- Si el valor calórico actual de la hamburguesa es diferente al que debe tener, lo actualiza.
if (encontrar_hamburguesa = 0) then
    select "La hamburguesa no existe" as mensaje;
elseif (ham_valor_calorico != ing_valor_calorico) then
    update hamburguesa set valor_calorico = ing_valor_calorico
    where id = id_hamburguesa;
else
    select "No se ha cambiado nada" as mensaje
end if;

end$$

delimiter ;
select * from hamburguesa;
call actualiza_valor_calorico_hamburguesa(4);
-- 3. Gestión de permisos (3 puntos.)
-- 1. Crear al usuario “tester” con contraseña “12345”. Bórralo previamente si existe. Además, este
-- usuario tendrá acceso desde la IP 172.16.10.1. Además, por seguridad del sistema, debe de cambiar
-- la contraseña cada 2 días. Dale todos los permisos sobre la base de datos Burger, así como los
-- permisos para dar permisos. (1 punto)
create user 'tester'@'172.16.10.1'
set @password = '12345'
@password expire interval 2 day;
grant all PRIVILEGES on *.* to 'tester'@'172.16.10.1' with grant option;
-- 2. Crear el rol "cocineros" si no existe, que tendrá permisos de consulta, inserción y modificación
-- sobre la tabla "ingrediente", pero no tendrá permisos para borrar datos. Crear dos usuarios nuevos,
-- Alberto y Mario y asignar dicho rol. Ambos usuarios deben ser creados sin contraseña. (1 punto)
drop role if exists cocineros;

create role cocineros;
grant select, update, insert on ingrediente to cocineros;

create user 'Mario';
create user 'Alberto';

grant cocineros to Mario;
grant cocineros to Alberto;
-- 3. Quitar del rol "cocineros" al usuario Mario. Modificar el usuario Alberto para que solo pueda
-- acceder desde la dirección localhost y agregarle la contraseña "abc123". Modificar el rol "cocineros"
-- para quitarle el permiso de modificación en la tabla "ingrediente"
update mysql.user set host = 'localhost'
where user = "Alberto"; 
select * from mysql.user;
update mysql.user set password = 'abc123'
where user = "Alberto"; 

revoke cocineros from Mario;