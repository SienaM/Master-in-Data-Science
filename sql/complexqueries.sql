SELECT 
    t1.country_name,npop,nairports,CAST(nairports AS FLOAT)/npop*1000 pc
FROM 
    (SELECT country_name, SUM(population) AS npop
    FROM optd_por_public
    WHERE population IS NOT NULL
    GROUP BY country_name) AS t1,
    (SELECT country_name,count(*) AS nairports
    FROM optd_por_public
    WHERE location_type in ('A','CA')
    GROUP BY country_name) AS t2
WHERE t1.country_name = t2.country_name
    AND npop > 0
ORDER BY pc DESC LIMIT 10;



SELECT 
    airports.country_name,npop,nairports
FROM population,airports
WHERE population.country_name = airports.country_name
ORDER BY npop DESC 
LIMIT 10;





SELECT 
    airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights a
LEFT OUTER JOIN optd_airlines  b
ON b."2char_code" = a.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;



SELECT 
    airline_code_2c, name, flight_freq
FROM optd_airlines a
LEFT OUTER JOIN  ref_airline_nb_of_flights  b
ON a."2char_code" = b.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;



SELECT 
    airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights a
RIGHT OUTER JOIN optd_airlines  b
ON b."2char_code" = a.airline_code_2c
;

--Nº de países con más de 3 ciudades con elevación superior a la media
SELECT 
    country_name, count(*) AS n
FROM optd_por_public
WHERE  elevation > (SELECT avg(elevation) FROM optd_por_public WHERE elevation IS NOT NULL AND location_type = 'C')
    AND location_type = 'C'
GROUP BY country_name
HAVING count(*) >= 3
;


--Nº de ciudades en cada país con elevación por encima de la media de ese país
--......
SELECT 
    country_name, count(*) AS n
FROM optd_por_public
WHERE  elevation > (SELECT avg(elevation),country_name FROM optd_por_public WHERE elevation IS NOT NULL AND location_type = 'C' GROUP BY country_name)
    AND location_type = 'C'
GROUP BY country_name
HAVING count(*) >= 3
;

SELECT country_name,count(*)
FROM optd_por_public a
LEFT JOIN 
    (SELECT avg(elevation),country_name 
    FROM optd_por_public 
    WHERE elevation IS NOT NULL AND location_type = 'C' 
    GROUP BY country_name) b
ON a.country_name = b.contry_name
