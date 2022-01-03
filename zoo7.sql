--7) More JOIN operations

--1
SELECT id, title
FROM movie
WHERE yr = 1962;

--2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--3
SELECT movie.id, movie.title, movie.yr
FROM movie
WHERE title like '%Star Trek%'
ORDER BY yr;

--4
SELECT actor.id
FROM actor
WHERE name = 'Glenn Close';

--5
SELECT movie.id
FROM movie
WHERE title = 'Casablanca';

--6
SELECT actor.name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE title = 'Casablanca';

--7
SELECT actor.name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE title = 'Alien';

--8
SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';

--9
SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND casting.ord <> 1;

--10
SELECT movie.title, actor.name
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962
AND casting.ord = 1;

--11
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

--12
SELECT movie.title, actor.name
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id 
WHERE movie.id IN (
  SELECT casting.movieid FROM casting
  WHERE casting.actorid = (
    SELECT actor.id FROM actor
    WHERE actor.name = 'Julie Andrews'))
AND casting.ord = 1;

--13
SELECT actor.name
FROM actor 
JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.ord) >=15;

--14
SELECT movie.title, COUNT(casting.actorid) AS num_of_actors
FROM movie
JOIN casting on movie.id = casting.movieid
WHERE yr = 1978
GROUP BY movie.title
ORDER BY num_of_actors DESC, movie.title;

--15 (skipped)
