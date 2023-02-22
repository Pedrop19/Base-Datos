DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
-- 1. Devuelve una lista con el nombre del precio y nombre del fabricante de todos los productos de la base de datos
select p.nombre as nombreProd, p.precio, f.nombre as fabricante
from producto p, fabricante f
where p.codigo_fabricante = f.codigo;

-- 2. Devuelve una lista del producto, precio y nombre fabricante de todos los productos ordenados por nombre fabricante
select p.nombre as nombreProd, p.precio, f.nombre as fabricante
from producto p, fabricante f
where p.codigo_fabricante = f.codigo
order by f.nombre asc;

-- 3. Muestra una lista con el identificador del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos.
select p.codigo, p.nombre, f.codigo as codigo_fabricante, f.nombre as nombre_fabricante
from producto p, fabricante f;

-- 4. Muestra el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre, p.precio, f.nombre as nombre_fabricante
from producto p, fabricante f
where p.codigo_fabricante = f.codigo and p.precio=(select min(precio)
 from producto);

-- 5. Muestra el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, p.precio, f.nombre as nombre_fabricante
from producto p, fabricante f
where p.codigo_fabricante = f.codigo and  precio = (select max(precio) 
from producto);

-- 6. Muestra una lista de todos los productos del fabricante Crucial.
select nombre
from producto 
where codigo_fabricante in(
select codigo
from fabricante
where nombre = 'crucial');

-- 7. Muestra una lista de todos los productos del fabricante Lenovo que tengan un precio mayor que 300€.
select *
from producto
where codigo_fabricante in(
select codigo
from fabricante
where nombre ='lenovo' && precio >300);

-- 8. Muestra un listado con todos los productos de los fabricantes Hewlett-Packard y Asus. Sin utilizar IN.
select p.nombre, f.nombre as nombre_fabricante
from producto p, fabricante f
where p.codigo_fabricante = f.codigo and  f.nombre ='Hewlett-Packard' or f.nombre='asus';

-- 9. Muestra un listado con todos los productos de los fabricantes Hewlett-Packardy y Asus. Utilizando el operador IN.
select *
from producto
where codigo_fabricante in(
select codigo
from fabricante
where nombre ='Hewlett-Packard' or nombre='asus');

-- 10. Muestra un listado con el precio y el nombre de todos los productos de los fabricantes cuyo nombre termine por la vocal o.
select nombre, precio
from producto
where codigo_fabricante in(
select codigo
from fabricante
where nombre like '%o');

-- 11. Muestra un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter m en su nombre.
select nombre, precio
from producto
where codigo_fabricante in(
select codigo
from fabricante
where nombre like '%m%');

-- 12. Lista con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio inferior o igual a 500€. 
	-- Ordena descendente el resultado en primer lugar por el precio y ascendente en segundo lugar por el nombre.
 select p.nombre, p.precio, f.nombre
 from producto p, fabricante f
 where p.codigo_fabricante= f.codigo and p.precio <=500
 order by p.precio desc, p.nombre asc; 
    

-- 13. Muestra un listado con el nombre de fabricante y el identificador de sólo los fabricantes que tienen productos asociados.
select distinct f.nombre as nombre_fabricante, f.codigo as codigo_fabricante
from fabricante f, producto p
where p.codigo_fabricante = f.codigo;


-- 1. Listado con todos los productos del fabricante Asus. (Sin utilizar INNER JOIN).
select nombre
from producto
where codigo_fabricante in(
select codigo
from fabricante
where nombre='asus');

-- 2. Listado con todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Crucial. (Sin utilizar INNER JOIN).
select *
from producto
where precio = (
	select max(precio)
    from producto
    where codigo_fabricante = (
		select codigo
		from fabricante
		where nombre = 'crucial'));


-- 3. Devuelve el nombre del producto más caro del fabricante Asus.
select *
from producto
where codigo_fabricante = (
		select codigo
		from fabricante
		where nombre = 'asus');

-- 4. Lista el nombre del producto más barato del fabricante Lenovo.
select nombre
from producto
where codigo_fabricante =(
	select codigo
    from fabricante
    where nombre = 'lenovo')
    and producto.precio = (
	select  min(producto.precio)
    from producto);

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select * 
from producto 
where precio >=(
	select max(precio)
	from producto 
	where producto.codigo_fabricante = (
		select fabricante.codigo 
		from fabricante 
		where fabricante.nombre ='lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

select * 
from producto
where codigo_fabricante = (
	select codigo
	from fabricante
	where fabricante.nombre = 'asus')
	and producto.precio > (
		select avg(precio)
		from producto
		where codigo_fabricante =
			(select codigo from fabricante
			where fabricante.nombre = 'asus'));