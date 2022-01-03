--4) Select within SELECT

--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

--2
SELECT name FROM world
  WHERE continent = 'Europe' AND (GDP/population) >
     (SELECT GDP/population FROM world
      WHERE name ='United Kingdom');

--3
SELECT name, continent 
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;

--4
SELECT name, population 
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland') 

--5
SELECT name, CONCAT(ROUND((
  population/(SELECT population FROM world WHERE name = 'Germany')*100)), '%') AS percentage
FROM world
WHERE continent = 'Europe';

--6
SELECT name
  FROM world
WHERE gdp > ALL(SELECT GDP FROM world WHERE gdp IS NOT NULL AND continent = 'Europe');

--(7->10 skipped)


