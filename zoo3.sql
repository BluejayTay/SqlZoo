--3) Select from Nobel tutorial

--1
SELECT yr, subject, winner
  FROM nobel
WHERE yr = 1950;

--2
SELECT winner
  FROM nobel
WHERE yr = 1962
  AND subject = 'Literature';

--3
SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein';

--4
SELECT winner
  FROM nobel
WHERE yr >= 2000
  AND subject = 'Peace';

--5
SELECT *
  FROM nobel
WHERE yr BETWEEN 1980 AND 1989
  AND subject = 'Literature';

--6
SELECT * 
  FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

--7
SELECT winner 
  FROM nobel
WHERE winner like 'John%';

--8
SELECT * 
  FROM nobel
WHERE subject IN ('Physics') AND yr IN (1980) OR subject IN ('Chemistry') AND yr IN (1984);

--9
SELECT * 
  FROM nobel
WHERE yr IN (1980) AND subject NOT IN ('Chemistry', 'Medicine');

--10
SELECT * 
  FROM nobel
WHERE (yr < 1910 AND subject IN ('Medicine')) OR (yr >= 2004 AND subject IN ('Literature'));

--11
SELECT * 
  FROM nobel
WHERE winner = 'Peter Grünberg';

--12
SELECT * 
  FROM nobel
WHERE winner = 'Eugene O\'Neill';
'
--13
SELECT winner, yr, subject
  FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

--14
SELECT winner, subject FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;