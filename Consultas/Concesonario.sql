CREATE DATABASE concesionario;

USE concesionario;

CREATE TABLE coches(
	id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(20),
    modelo VARCHAR(20)
);

-- TODAS LAS MARCAS CUYO MODELO SEA IGUAL A FOCUS
SELECT marca FROM coches 
WHERE modelo = "Focus";
-- TODAS LAS MARCAS DONDE MODELOS TIENEN UNA O
SELECT marca, modelo FROM coches
WHERE modelo LIKE "%o%";
-- MARCA ORDENADAS POR MODELO
SELECT marca, modelo FROM coches
ORDER BY modelo;