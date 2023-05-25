/* 1. Crear una vista que muestre el nombre del cliente, título del libro y fechas de préstamo y
devolución de todos los préstamos realizados. La vista debería ordenarse por el nombre del
cliente. */
create view prestamos as
select c.nombre, l.titulo, p.fecha_prestamo, p.fecha_devolucion
from clientes c
inner join prestamos p on c.id_cliente = p.id_cliente
inner join libros l on l.id_libro = p.id_libro
order by c.nombre;
/* 2. Vista que muestra la cantidad total de libros prestados por cada cliente. */
create view librosprestados as
select p.id_cliente, count(p.id_libro)
from clientes c
inner join prestamos p on c.id_cliente = p.id_cliente
group by p.id_cliente;
/* 3. Vista que muestra el total de compras realizadas por categoría. */
create view totalcompras as
select ca.id_categoria, ca.nombre, count(*)
from clientes c
inner join compras co on c.id_cliente = co.id_cliente
inner join libros l on l.id_libro = co.id_libro
inner join libro_categoria lc on lc.id_libro = l.id_libro
inner join categoria ca on ca.id_categoria = lc.id_categoria
group by co.id_compra;

/* 4. Crear un índice en la tabla "libros" para acelerar las búsquedas por título. */
create index titulos on libros(titulo);

/* 5. Crear un usuario “dam1” con permisos de solo lectura en todas las tablas de la base de
datos, y con contraseña “dam1” concatenando año actual (usa una función para esto) */
create user 'dam1';
set @password = concat('dam1', year(now()))
grant select on libreria.* to 'dam1';
/* 6. Crear un usuario “dam2” identificado por "contraseña", con permisos de escritura y lectura
en la tabla "libro_categoria" de la base de datos. */
create user 'dam2' identified by 'contrasenia';
grant select, update, insert, delete on libreria.libro_categoria to 'dam2'; 

/* 7. Revocar los permisos de escritura del usuario “dam2” de la tabla "libro_categoria" de la
base de datos. */
revoke update, insert, delete on libreria.libro_categoria to 'dam2';

/* 8. Crear un nuevo usuario en localhost “nuevo_usuario” con todos los permisos y permisos
para dar permisos. */
create user 'nuevo_usuario'@'localhost';
grant all PRIVILEGES on *.* to 'nuevo_usuario'@'localhost' with grant option;

/* 9. Listar todos los usuarios existentes en la base de datos y sus respectivos permisos. */
select * from mysql.server;

/* 1. Procedure-> ObtenerCantidadStock , recibe un parámetro de entrada "libro_id" que representa
el identificador del libro y tiene un parámetro de salida "stock" que almacenará la cantidad de stock
actual del libro. */
DELIMITER $$
CREATE PROCEDURE ObtenerCantidadStock(IN libro_id int, out stock int)
BEGIN
    -- Contar la cantidad de stock
    SELECT cantidad_stock
    INTO stock
    FROM libros
    WHERE id_libro = libro_id;

END $$
DELIMITER ;

call ObtenerCantidadStock(1, @stock);
select @stock;
/* 2. Procedure-> CalcularDescuento, recibe dos parámetros de entrada: "precio_unitario" que
representa el precio unitario de un producto y "cantidad" que indica la cantidad comprada. El
parámetro de salida "descuento" almacenará el descuento calculado según la cantidad comprada. */
DELIMITER $$
CREATE PROCEDURE CalcularDescuento(IN precio_unitario decimal(10,2))
BEGIN
    declare total decimal(10,2);

END $$
DELIMITER ;

call ObtenerCantidadStock(1);
/* 3. Procedure->VerificarDisponibilidad, recibe dos parámetros de entrada: "libro_id" que representa
el identificador del libro y "cantidad_solicitada" que indica la cantidad de libros solicitada.
El parámetro de salida "disponibilidad" indica si la cantidad solicitada está disponible o no. */
DELIMITER $$
CREATE PROCEDURE VerificarDisponibilidad(IN libro_id int, in cantidad_solicitada int, out disponibilidad varchar(250))
BEGIN
    declare stock_actual int;
    
    select cantidad_stock into stock_actual
    from libros
    where id_libro = libro_id;

    if stock_actual >= canttidad_solicitada THEN
    select 'DISPONIBLE'
    into disponibilidad
    else
    select 'NO DISPONIBLE'
    into disponibilidad
    end if;
END $$
DELIMITER ;