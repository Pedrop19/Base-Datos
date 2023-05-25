/*Ejercicio1
Crea un procedimiento de nombre getAnimalesPistas que devuelva los animales (nombre)
que trabajen en la pista indicada. En caso de que no haya animales deberá devolver NO HAY ANIMALES  
y en el caso de que no exista la pista, LA PISTA NO EXISTE.*/
use circo;
DELIMITER $$
CREATE PROCEDURE getAnimalesPistas(IN pista VARCHAR(50))
BEGIN
    DECLARE animal_count INT;
    
    -- Verificar si la pista existe
    SELECT COUNT(*) INTO animal_count FROM animales WHERE nombre_pista = pista;
    
    IF animal_count = 0 THEN
        SELECT 'LA PISTA NO EXISTE' AS mensaje;
    ELSE
        -- Buscar los animales en la pista indicada
        SELECT nombre FROM animales WHERE pista = pista;
    END IF;
END $$
DELIMITER ;
select * from pistas;
call getAnimalesPistas("Psta");
/*Ejercicio 2
Crea un procedimiento de nombre getNumeroPorFechaAtracciones que devuelva el número de atracciones que se celebraron en la fecha 
indicada. En caso de que no hubiera atracciones ese día debe devolver el número -1. Emplea un parámetro de salida para retorna el -1.*/
use circo;
DELIMITER $$
CREATE PROCEDURE getNumeroPorFechaAtracciones(IN fecha DATE, OUT numeroAtracciones INT)
BEGIN
    -- Verificar si hay atracciones en la fecha indicada
    SELECT COUNT(*) INTO numeroAtracciones FROM atracciones WHERE fecha_inicio = fecha;
    
    IF numeroAtracciones = 0 THEN
        SET numeroAtracciones = -1;
    END IF;
END $$
DELIMITER ;

select * from atracciones;

SET @resultado = 0;
CALL getNumeroPorFechaAtracciones('1999-11-03', @resultado);
SELECT @resultado;
