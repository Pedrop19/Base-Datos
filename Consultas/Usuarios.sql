create database	usuarios;

use usuarios;

create table tblUsuarios(
	id_usuario int primary key auto_increment,
    usuario varchar(20),
    nombre varchar(20),
    sexo varchar(1),
    nivel tinyint,
    email varchar(50),
    telefono varchar(20),
    marca varchar(20),
    compañia varchar(20),
    saldo float,
    activo boolean
);

INSERT INTO tblUsuarios (id_usuario,usuario, nombre, sexo, nivel, email, telefono,
marca, compañia, saldo,activo)
VALUES
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-
5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-
3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-
1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-
8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-
2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-
5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-
3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-
6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-
3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-
6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-
4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-
1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-
4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-
6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-
9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-
5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-
4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-
3935','MOTOROLA','AT&T','500','1');

-- 1. Listar los nombres de los usuarios
select nombre from tblUsuarios;
-- 2. Calcular el saldo máximo de los usuarios de sexo “Mujer”
select max(saldo) from tblUsuarios
where sexo = "M";
-- 3. Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
select nombre, telefono from tblUsuarios
where marca IN('NOKIA','BLACKBERRY','SONY');
-- 4. Contar los usuarios sin saldo o inactivos
select count(nombre) from tblUsuarios
where activo = false or saldo = 0;
-- 5. Listar el login de los usuarios con nivel 1, 2 o 3
select usuario from tblUsuarios
where nivel IN('1','2','3');
-- 6. Listar los números de teléfono con saldo menor o igual a 300
select telefono from tblUsuarios
where saldo <= 300;
-- 7. Calcular la suma de los saldos de los usuarios de la compañía telefónica NEXTEL
select sum(saldo) from tblUsuarios
where compañia = "NEXTEL";
-- 8. Contar el número de usuarios por compañía telefónica
SELECT compañia, count(compañia) 
FROM tblUsuarios
group BY compañia;
-- 9. Contar el número de usuarios por nivel
select nivel, count(nivel)
from tblUsuarios
group by nivel;
-- 10. Listar el login de los usuarios con nivel 2
select usuario from tblUsuarios
where nivel = 2;
-- 11. Mostrar el email de los usuarios que usan gmail
SELECT email FROM tblUsuarios
WHERE email LIKE "%gmail%";
-- 12. Listar nombre y y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
select nombre, telefono from tblUsuarios
where marca IN('LG','SAMSUNG','MOTOROLA');
-- Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG
select nombre, telefono from tblUsuarios
where compañia not in ("LG", "SAMSUNG");
-- Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL
select usuario, telefono from tblUsuarios
where compañia = "IUSACELL";
-- Listar el login y teléfono de los usuarios con compañía telefónica que no sea TELCEL
select nombre, telefono from tblUsuarios
where compañia != "TELCEL";
-- Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA
select avg(saldo) from tblUsuarios
where compañia = "IUSACELL";
-- Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL o AXEL
select usuario, telefono from tblUsuarios
where compañia IN("IUSACELL", "AXEL");
-- Mostrar el email de los usuarios que no usan yahoo
select nombre, telefono from tblUsuarios
where email not like "%yahoo%";
-- Listar el login y teléfono de los usuarios con compañía telefónica que no sea TELCEL o IUSACELL
select nombre, telefono from tblUsuarios
where compañia not in ("TENCEL", "IUSACELL");
-- Listar el login y teléfono de los usuarios con compañía telefónica UNEFON
select nombre, telefono from tblUsuarios
where compañia = "UNEFON";
-- Listar las diferentes marcas de celular en orden alfabético descendentemente
select distinct marca from tblUsuarios
order by marca desc;
-- Listar las diferentes compañías en orden alfabético aleatorio
select distinct compañia from tblUsuarios
order by rand();
-- Listar el login de los usuarios con nivel 0 o 2
select usuarios from tblUsuarios
where nivel in('0','2');
-- Calcular el saldo promedio de los usuarios que tienen teléfono marca LG
select avg(saldo) from tblUsuarios
where marca = "LG";

-- 1. Listar el login de los usuarios con nivel 1 o 3
select usuario from tblUsuarios
where nivel in('1','3');
-- 2. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY
select usuario, telefono from tblUsuarios
where marca != 'BLACKBERRY';
-- 3. Listar el login de los usuarios con nivel 3
select usuario from tblUsuarios
where nivel = '3';
-- 4. Listar el login de los usuarios con nivel 0
select usuario from tblUsuarios
where nivel = '0';
-- 5. Listar el login de los usuarios con nivel 1
select usuario from tblUsuarios
where nivel = '1';
-- 6. Contar el número de usuarios por sexo
SELECT sexo, count(sexo) 
FROM tblUsuarios
group BY sexo;
-- 7. Listar el login y teléfono de los usuarios con compañía telefónica AT&T
select usuario, telefono from tblUsuarios
where marca = 'AT&T';
-- 8. Listar las diferentes compañías en orden alfabético descendentemente
select compañia from tblUsuarios
order by compañia desc;
-- 9. Listar el login de los usuarios inactivos
select usuario, telefono from tblUsuarios
where activo = false;
-- 10. Listar los números de teléfono sin saldo
select telefono from tblUsuarios
where saldo <= 0;
-- 11. Calcular el saldo mínimo de los usuarios de sexo “Hombre”
select min(saldo) from tblUsuarios
where sexo = "H";
-- 12. Listar los números de teléfono con saldo mayor a 300
select telefono from tblUsuarios
where saldo > 300;

-- 1. Contar el número de usuarios por marca de teléfono
SELECT marca, usuario, count(usuario) 
FROM tblUsuarios
group BY marca;7
-- 2. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG
select usuario, telefono from tblUsuarios
where marca != 'LG';
-- 3. Listar las diferentes compañías en orden alfabético ascendentemente
select compañia from tblUsuarios
order by compañia;
-- 4. Calcular la suma de los saldos de los usuarios de la compañía telefónica UNEFON
select sum(saldo) from tblUsuarios
where compañia = "UNEFON";
-- 5. Mostrar el email de los usuarios que usan hotmail
select nombre, telefono from tblUsuarios
where email not like "%hotmail%";
-- 6. Listar los nombres de los usuarios sin saldo o inactivos
select nombre from tblUsuarios
where saldo <= 0 or activo = false;
-- 7. Listar el login y teléfono de los usuarios con compañía telefónica USACELL o TELCEL
select usuario, telefono from tblUsuarios
where compañia in('USACELL','TELCEL');
-- 8. Listar las diferentes marcas de celular en orden alfabético ascendentemente
select marca from tblUsuarios
order by marca;
-- 9. Listar las diferentes marcas de celular en orden alfabético aleatorio
select marca from tblUsuarios
order by rand();
-- 10. Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL o UNEFON
select usuario, telefono from tblUsuarios
where compañia in('USACELL','UNEFON');
-- 11. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTOROLA o NOKIA
select usuario, telefono from tblUsuarios
where compañia not in('MOTOROLA','NOKIA');
-- 12. Calcular la suma de los saldos de los usuarios de la compañía telefónica TELCE
select sum(saldo) from tblUsuarios
where compañia = "TELCE78";