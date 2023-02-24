-- 1. Mostrar nombre de continente y número de países de ese continente (contar).
select continente, count(nombre) from pais
group by continente;
-- 2. Mostrar la población máxima (número de habitantes máximo) de la tabla país.
-- 3. Mostrar los idiomas que se hablan en España (Spain) y el porcentaje que se habla cada idioma. Ordenar de forma descendente por el campo
-- porcentaje
-- 4. Mostrar todas las ciudades de España (Spain) junto a su población. Debe mostrarse nombre de país, de ciudad y población de esta.
-- 5. Mostrar todas las ciudades de España (Spain) junto a su población. Debe mostrarse nombre de país, población del país, nombre de ciudad y
-- población de esta. Añadir también el porcentaje que supone la población de la ciudad con respecto a la del país.
-- 6. Mostrar datos de los 10 países con mayor población. Nombre de país, continente, población.
-- 7. Mostrar los datos del país de mayores habitantes de Europa (Europe).
-- 8. Mostrar la media de la esperanza de vida por continente
-- 9. Mostrar número de países por continente y región (contar).
-- 10. Mostrar la densidad de población de los países de Europa (Europe). La densidad de población se mide en habitantes por superficie
-- 11. Para cada uno de los continentes, ¿cuál es la suma de la superficie de los países que pertenecen al mismo?
-- 12 Muestra la población que está sujeta en cada continente a cada una de las formas de gobierno
-- 13 Lista los continentes cuya suma de superficie de países es mayor de 5 millones
-- 14. Capital de cada país
-- 15. Países con capital con más de tres millones de habitantes
-- 16. Obtener una lista de idiomas junto con el nombre del país en el que se hablan
-- 17. Obtener una lista de idiomas junto con el nombre de la ciudad y país en que se hablan
-- 18. Obtener una lista de idiomas oficiales junto con el nombre de la ciudad y país en que se hablan
-- 19. Lista las ciudades que están en continentes cuya esperanza de vida media es menor a 60 años
-- 20. Lista las capitales que tengan una población inferior a 10.000