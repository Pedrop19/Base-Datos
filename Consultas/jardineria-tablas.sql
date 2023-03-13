create database jardineria;

use jardineria;

create table gama_producto(
	gama varchar(50) primary key,
    descripcion_text text,
    descripcion_html text,
    imagen varchar(256)
);
create table producto(
	codigo_producto varchar(15) primary key,
	nombre varchar(70),
    gama varchar(50),
    dimensiones varchar(25),
    proveedor varchar(50),
    descripcion text,
    cantidad_en_stock smallint(6),
    precio_venta decimal(15,2),
    precio_proveedor decimal(15,2),
    foreign key (gama) references gama_producto(gama)
);
create table oficina(
	codigo_oficina varchar(10) primary key,
    ciudad varchar(30),
    pais varchar(50),
    region varchar(50),
    codigo_postal varchar(10),
    telefono varchar(20),
    linea_direccion1 varchar(50),
    linea_direccion2 varchar(50)
);
create table empleado(
	codigo_empleado int primary key,
    nombre varchar(50),
    apellido1 varchar(50),
	apellido2 varchar(50),
    extension varchar(10),
    email varchar(100),
    codigo_oficina varchar(10),
    codigo_jefe int,
    puesto varchar(50),
    foreign key (codigo_oficina) references oficina(codigo_oficina)
);
create table cliente(
	codigo_cliente int primary key,
    nombre_cliente varchar(50),
    nombre_contacto varchar(30),
    apellido_contacto varchar(30),
    telefono varchar(15),
    fax varchar(15),
    linea_direccion1 varchar(50),
    linea_direccion2 varchar(50),
    ciudad varchar(50),
    region varchar(50),
    pais varchar(50),
    codigo_postal varchar(10),
    codigo_empleado_rep_ventas int,
    limite_credito decimal (12,5),
    foreign key (codigo_empleado_rep_ventas) references empleado(codigo_empleado)
);
create table pago (
	codigo_cliente int,
    forma_pago varchar(40),
    id_transaccion varchar(50) primary key,
    fecha_pago date,
    total decimal(15,2),
    foreign key (codigo_cliente) references cliente(codigo_cliente)
);
create table pedido (
	codigo_pedido int primary key,
    fecha_pedido date,
    fecha_esperada date,
    fecha_entrega date,
    estado varchar(15),
    comentarios text,
    codigo_cliente int,
    foreign key (codigo_cliente) references cliente(codigo_cliente)
);
create table detalle_pedido (
	codigo_pedido int,
    codigo_producto varchar(15),
    cantidad int,
    precio_unidad decimal(15,2),
    numero_linea smallint(6),
    primary key (codigo_pedido, codigo_producto),
    foreign key (codigo_pedido) references pedido(codigo_pedido),
    foreign key (codigo_producto) references producto(codigo_producto)
);
