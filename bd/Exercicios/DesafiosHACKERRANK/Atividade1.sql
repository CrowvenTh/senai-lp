-- https://www.hackerrank.com/challenges/select-all-sql/problem?isFullScreen=true
-- Exercício 1 --
SELECT * FROM CITY;

-- https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true
-- Exercício 2 --
SELECT * FROM CITY WHERE ID = 1661;

-- https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true
-- Exercício 3 --
SELECT CITY, STATE FROM STATION;

-- https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true
-- Exercício 4 --
SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';

-- https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
-- Exercício 5 --
SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

-- https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
-- Exercício 6 --
SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true
-- Exercício 7 --
SELECT CITY 
    FROM STATION WHERE 
        CITY LIKE 'A%' OR 
        CITY LIKE 'E%' OR 
        CITY LIKE 'I%' OR 
        CITY LIKE 'O%' OR 
        CITY LIKE 'U%';

-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
-- Exercício 8 --
SELECT DISTINCT CITY 
    FROM STATION WHERE
        CITY LIKE '%A' OR
        CITY LIKE '%E' OR
        CITY LIKE '%I' OR
        CITY LIKE '%O' OR
        CITY LIKE '%U';

-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true
-- Exercício 9 --
SELECT DISTINCT CITY 
    FROM STATION WHERE (
        CITY LIKE 'A%' OR 
        CITY LIKE 'E%' OR 
        CITY LIKE 'I%' OR 
        CITY LIKE 'O%' OR 
        CITY LIKE 'U%' )
        AND (
        CITY LIKE '%A' OR
        CITY LIKE '%E' OR
        CITY LIKE '%I' OR
        CITY LIKE '%O' OR
        CITY LIKE '%U' );
