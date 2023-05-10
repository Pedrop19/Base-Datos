-- 1. Crear al usuario gestor con contraseña contraseña. Este usuario tendrá
-- acceso desde la IP 172.16.10.1. Además, por seguridad del sistema, debe
-- de cambiar la contraseña cada 10 días. Dale todos los permisos sobre la
-- base de datos, así como los permisos para dar permisos.
CREATE USER 'gestor' identified by 'contrasenia';
GRANT ALL PRIVILEGES ON jardineria.* TO gestor;
GRANT GRANT OPTION ON jardineria.* TO gestor;
REVOKE ALL PRIVILEGES, GRANT OPTION FROM gestor;
GRANT ALL PRIVILEGES ON jardineria.* TO gestor@'172.16.10.1';
ALTER USER gestor PASSWORD EXPIRE INTERVAL 10 DAY;

-- 2. Crear el rol administradores, que tendrá únicamente permisos de
-- consulta, inserción, modificación y borrado de datos sobre la tabla pago
-- (Jardinería). Además, crear dos usuarios llamados “ángel” y “ana” con
-- acceso desde toda la red 10.0.0.0/8, pero se crearán inicialmente
-- bloqueados y sin contraseña. Meter a angel y a ana en el rol
-- administradores (Buscad la información necesaria en Internet)

CREATE ROLE administradores;
CREATE USER 'ángel'@'10.0.0.%' IDENTIFIED BY '';
CREATE USER 'ana'@'10.0.0.%' IDENTIFIED BY '';
GRANT administradores TO 'ángel'@'10.0.0.%';
GRANT administradores TO 'ana'@'10.0.0.%';

-- 3. Sobre lo creado anteriormente. Quitar a angel el rol de administradores.
-- Poner a angel la contraseña “1234”. Modificar el usuario ana para que
-- ahora tenga acceso desde la red 172.16.0.0/24. Desbloquear la cuenta de
-- ana. Modificar el rol de administradores para que no pueda realizar borrado
-- de datos de la tabla pago.

REVOKE administradores FROM 'ángel'@'10.0.0.%';
UPDATE mysql.user SET host='172.16.0.%' WHERE user='ana';
ALTER USER 'ana'@'172.16.0.%' ACCOUNT UNLOCK;
REVOKE DELETE ON Jardinería.pago FROM administradores;