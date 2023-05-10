 -- Se requerirá la creación de una vista.
 -- Se requerirá la creación de dos usuarios.
 -- Gestión de permisos para esos usuarios.
 -- Enunciado que implique el empleo de alguna técnica de optimización de consultas.
 
-- ENUNCIADO

 -- Crea una base de datos para una tienda de tecnologia teniendo en cuenta que deberas crear una 
 -- vista que muestre los nombres de los clientes junto con el total de ventas que 
 -- han realizado en los últimos 3 meses,  utilizando la técnica de indexación de columnas para optimizar 
 -- la consulta. 
 -- Además, deberas crear dos usuarios y otórgales permisos para acceder a la vista, uno con permisos de 
 -- lectura y el otro con permisos de lectura y escritura.

-- CREACION DE LA BASE DE DATOS DE UNA TIENDA DE TECNOLOGIA
DROP DATABASE IF EXISTS techshop;
CREATE DATABASE techshop CHARACTER SET utf8mb4;
USE techshop;

CREATE TABLE clientes(
	id_cliente int primary key,
	nombre_cliente varchar(255)
);

CREATE TABLE pedidos(
	id_pedido int primary key,
    fecha_pedido date,
    id_cliente int,
    cantidad int,
    foreign key(id_cliente) references clientes(id_cliente)
);

INSERT INTO clientes VALUES (0, "Jose");
INSERT INTO clientes VALUES (1, "Juan");
INSERT INTO clientes VALUES (2, "Alberto");
INSERT INTO clientes VALUES (3, "Fernando");

INSERT INTO pedidos VALUES (0, "2023-01-01", 0, 50);
INSERT INTO pedidos VALUES (1, "2023-01-01", 0, 100);
INSERT INTO pedidos VALUES (2, "2023-01-01", 1, 150);
INSERT INTO pedidos VALUES (3, "2023-01-01", 1, 100);
INSERT INTO pedidos VALUES (4, "2023-01-01", 1, 200);
INSERT INTO pedidos VALUES (5, "2023-01-01", 2, 25);
INSERT INTO pedidos VALUES (6, "2023-01-01", 2, 250);
INSERT INTO pedidos VALUES (7, "2023-01-01", 2, 500);
INSERT INTO pedidos VALUES (8, "2023-01-01", 3, 100);
INSERT INTO pedidos VALUES (9, "2023-01-01", 3, 20);

-- CREACION DE LA VISTA
CREATE VIEW ventas_ultimos_tres_meses AS
SELECT c.nombre_cliente, SUM(p.cantidad) AS total_ventas
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.fecha_pedido >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
GROUP BY c.id_cliente;

-- CREACION DE USUARIOS
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contraseña';
CREATE USER 'usuario_escritura'@'localhost' IDENTIFIED BY 'contraseña';

-- DAR PERMISOS A USUARIOS
GRANT SELECT ON techshop.ventas_ultimos_tres_meses TO 'usuario_lectura'@'localhost';
GRANT SELECT, INSERT ON techshop.ventas_ultimos_tres_meses TO 'usuario_escritura'@'localhost';

-- CREACION DE UN INDICE
CREATE INDEX idx_fecha_pedido ON pedidos (fecha_pedido);