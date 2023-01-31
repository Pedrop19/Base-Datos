USE prueba;

-- Tabla usuario con clave primaria id y otra columna que sea nombre.
CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY,
    nombre VARCHAR(255)
);
-- Queremos modificar la columna nombre para que pueda almacenar 50 caracteres y además que sea NOT NULL. 
ALTER TABLE usuarios MODIFY nombre VARCHAR(50) NOT NULL;
-- . Queremos renombrar el nombre de la columna nombre como nombre_usuario,
-- que pueda almacenar 30 caracteres y además que sea NOT NULL. ¿Se podría hacer con
-- otra instrucción distinta a la que has usado? 
ALTER TABLE usuarios CHANGE nombre nombre_usuario VARCHAR(30) NOT NULL;
-- Se podria hacer con la orden Change en ver de Modify
-- Borra la columna nombre. 
ALTER TABLE usuarios DROP COLUMN nombre_usuario;
-- Borra la columna id. ¿Puedes explicar qué está pasando?
ALTER TABLE usuarios DROP COLUMN id_usuario;
-- No se puede eliminar la columna id_usuario porque es la ultima columna existente en la tabla