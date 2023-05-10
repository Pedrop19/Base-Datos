-- 1. Los clientes y sus representantes.
-- Nombre Vista: ClientesYRepresentantes.
-- Columnas que debe obtener: El código de cliente, nombre de cliente,
-- teléfono, nombre de representante, puesto de representante.
CREATE VIEW ClientesYRepresentantes AS
SELECT c.codigo_cliente, c.nombre_cliente, c.telefono, e.nombre, e.puesto
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2. Listado de clientes con más de 10 pedidos realizados.
-- Nombre vista: Clientes10
-- Columnas: Codigo Cliente, Nombre Cliente, Total Pedidos
CREATE VIEW Clientes10 AS
SELECT p.codigo_cliente, c.nombre_cliente, COUNT() AS total_pedidos
FROM pedido p
JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
GROUP BY p.codigo_cliente
HAVING COUNT() > 10;
-- 3. Listado de número de pedidos al mes de cada año, ordenados
-- descendente por año y mes.
-- Nombre vista: PedidosMes.
-- Columnas: Año, Mes, Nº Pedidos
CREATE VIEW PedidosMes AS
SELECT YEAR(p.fecha_pedido) AS anio, MONTH(p.fecha_pedido) AS mes, COUNT(*) AS num_pedidos
FROM pedido p
GROUP BY YEAR(p.fecha_pedido), MONTH(p.fecha_pedido)
ORDER BY YEAR(p.fecha_pedido) DESC, MONTH(p.fecha_pedido) DESC;
-- 4. Listado Jefes.
-- Nombre vista: Jefes.
-- Columnas: Codigo Empleado, Nombre, Apellido1, Puesto.
CREATE VIEW Jefes AS
SELECT e.codigo_empleado, e.nombre, e.apellido1, e.puesto
FROM empleado e
WHERE e.codigo_empleado = (SELECT codigo_jefe FROM empleado WHERE codigo_empleado = e.codigo_empleado);
-- 5. Listado de pagos >10.000€
-- Nombre vista: Pagos10K
CREATE VIEW Pagos10K AS
SELECT c.nombre_cliente, pg.forma_pago, pg.fecha_pago, pg.total
FROM pago pg
JOIN cliente c ON pg.codigo_cliente = c.codigo_cliente
WHERE pg.total > 10000;
-- Columnas: Nombre Cliente, Forma Pago, Fecha Pago, Total
-- 6. Listado Empleados
-- Nombre vista: EmpleadosOficina.
-- Columnas: Codigo Empleado, Nombre, Email, Puesto, Teléfono
-- Oficina, Nombre Jefe, Puesto Jefe, País Oficina Jefe, Ciudad Oficina Jefe.
CREATE VIEW EmpleadosOficina AS
SELECT e.codigo_empleado, e.nombre, e.email, e.puesto, e.telefono, 
       o.codigo_oficina AS codigo_oficina_empleado, 
       j.codigo_empleado AS codigo_jefe, 
       j.nombre AS nombre_jefe, 
       j.puesto AS puesto_jefe, 
       jo.pais AS pais_jefe, 
       jo.ciudad AS ciudad_jefe
FROM empleado e
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
LEFT JOIN oficina jo ON j.codigo_oficina = jo.codigo_oficina;