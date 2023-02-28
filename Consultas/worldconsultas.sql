use world;
-- 1. Mostrar nombre de continente y número de países de ese continente(contar).
select count(*) as paises, continente
from pais
group by continente;

-- 2. Mostrar la población máxima (número de habitantes máximo) de la tabla país.
select max(poblacion) as poblacion
from pais;

-- 3. Mostrar los idiomas que se hablan en España (Spain) y el porcentaje
-- que se habla cada idioma. Ordenar de forma descendente por el campo porcentaje
select i.idioma, i.porcentaje
from idiomaspais i
inner join pais p
on i.cod_pais = p.codigo and p.nombre ='Spain';

-- 4. Mostrar todas las ciudades de España (Spain) junto a su población.
-- Debe mostrarse nombre de país, de ciudad y población de esta.
select c.nombre, c.poblacion, p.nombre as Pais
from ciudad c
inner join pais p
on c.codigo_pais = p.codigo and p.nombre ='Spain';

-- 5. Mostrar todas las ciudades de España (Spain) junto a su población.
-- Debe mostrarse nombre de país, población del país, nombre de ciudad y
-- población de esta. Añadir también el porcentaje que supone la población
-- de la ciudad con respecto a la del país.
select c.nombre, c.poblacion as pCiudad, p.nombre as Pais, p.poblacion as PoblacionPais, (c.poblacion/p.poblacion*100)
from ciudad c
inner join pais p
on c.codigo_pais = p.codigo and p.nombre ='Spain';

-- 6. Mostrar datos de los 10 países con mayor población. Nombre de país, continente, población
select nombre, continente, poblacion
from pais
order by poblacion desc
limit 10;

-- 7. Mostrar los datos del país de mayores habitantes de Europa (Europe).
select *
from pais
where continente = 'Europe'
order by poblacion desc
limit 1;

-- 8. Mostrar la media de la esperanza de vida por continente
select avg(esperanzaVida), continente
from pais
group by continente;

-- 9. Mostrar número de países por continente y región (contar)
select  count(nombre),continente,region
from pais
group by continente, region;

-- 10. Mostrar la densidad de población de los países de Europa (Europe).
-- La densidad de población se mide en habitantes por superficie (habitantes/superficie).
select (poblacion/superficie) as densidadPoblacion, nombre
from pais
where continente = 'Europe';

-- 11. Para cada uno de los continentes, ¿cuál es la suma de la superficie de los países que pertenecen al mismo?
select sum(superficie) as superficieContinente, continente
from pais
group by continente;

-- 12 Muestra la población que está sujeta en cada continente a cada una de las formas de gobierno
select sum(poblacion), continente, formagobierno
from pais
group by continente, formagobierno;

-- 13 Lista los continentes cuya suma de superficie de países es mayor de 5 millones
select sum(superficie), continente
from pais
group by continente
having sum(superficie) > 5000000;

-- 14. Capital de cada país
select c.nombre as nombreCapital, p.nombre as nombrePais
from pais p
inner join ciudad c on c.id = p.capital;

-- 15. Países con capital con más de tres millones de habitantes
select c.nombre as nombreCapital, p.nombre as nombrePais, c.poblacion as poblacionCapital
from pais p
inner join ciudad p on c.id = p.capital
where c.poblacion > 3000000;

-- 16. Obtener una lista de idiomas junto con el nombre del país en el que se hablan
select i.idioma, p.nombre
from pais p
inner join  idiomaspais i on i.cod_pais = p.codigo;

-- 17. Obtener una lista de idiomas junto con el nombre de la ciudad y país en que se hablan
select i.idioma, p.nombre, c.nombre
from pais p inner join idiomaspais i
on i.cod_pais = p.codigo 
inner join  ciudad c 
on c.codigo_pais = p.codigo;

-- 18. Obtener una lista de idiomas oficiales junto con el nombre de la ciudad y país en que se hablan
select i.idioma, p.nombre as Pais, c.nombre as Ciudad
from pais p 
inner join idiomaspais i on i.cod_pais = p.codigo and es_oficial = 't'
inner join  ciudad c  on c.codigo_pais = p.codigo;

-- 19. Lista las ciudades que están en continentes cuya esperanza de vida media es menor a 60 años
select c.nombre
from ciudad c
inner join pais p on c.codigo_pais = p.codigo
where p.continente in (
    select continente
    from pais
    group by continente
    having AVG(esperanzaVida) < 60
);

-- 20. Lista las capitales que tengan una población inferior a 10.000
select c.nombre as nombreCapital, p.nombre as nombrePais, c.poblacion as poblacion
from pais p
inner join ciudad c on c.id = p.capital
where c.poblacion < 10000;