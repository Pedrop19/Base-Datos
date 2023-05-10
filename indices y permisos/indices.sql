-- 1. Base de datos: Employees
-- Para optimizar la consulta SQL, se podría crear un índice en la columna "last_name" de la tabla "employees", ya que se está realizando una búsqueda basada en esta columna.
-- Para crear este índice, se puede utilizar el siguiente comando SQL:
CREATE INDEX idx_last_name ON employees (last_name);
-- Este índice permitirá que la consulta encuentre rápidamente las filas correspondientes a la condición "last_name = 'Koblick'", ya que el índice ordenará los valores de la columna "last_name" y permitirá que la búsqueda se realice de manera más eficiente.
-- 2. Base de datos: Jardinería
SHOW INDEX FROM producto;
EXPLAIN SELECT * FROM producto WHERE codigo_producto = 1234;
EXPLAIN SELECT * FROM producto WHERE gama = 1234;
-- 3. Tabla usuarios
-- 1. Crear una tabla: Supongamos que queremos crear una tabla llamada "usuarios"
-- con las siguientes columnas: id (entero autoincremental), nombre (cadena de texto),
-- edad (entero) y correo (cadena de texto).
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    correo VARCHAR(100)
);
-- 2. Crear un índice simple: Vamos a crear un índice en la columna "correo" de la
-- tabla "usuarios".
CREATE INDEX idx_correo ON usuarios (correo);
-- 3. Crear un índice compuesto: Vamos a crear un índice compuesto en las columnas
-- "nombre" y "edad" de la tabla "usuarios".
CREATE INDEX idx_nombre_edad ON usuarios (nombre, edad);
-- 4. Crear un índice único: Vamos a crear un índice único en la columna "id" de la
-- tabla "usuarios".
CREATE UNIQUE INDEX idx_id ON usuarios (id);
-- 5. Crear un índice de texto completo: Vamos a crear un índice de texto completo
-- en la columna "nombre" de la tabla "usuarios".
CREATE FULLTEXT INDEX idx_nombre ON usuarios (nombre);