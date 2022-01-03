--9) Self JOIN

--1
SELECT COUNT(*)
FROM stops;

--2
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

--3
SELECT stops.id, stops.name
FROM stops 
JOIN route ON stops.id = route.stop
WHERE route.company = 'LRT'
AND route.num = 4
ORDER BY pos;

--4
SELECT company, num, COUNT(*)
FROM route 
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
  AND b.stop=149;

--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road';

--7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
  AND stopb.name='Leith';

--8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='Tollcross';

--9
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';

--10
SELECT r1.num, r1.company, shared_stop.name, r4.num,r4.company 
FROM route AS r1
JOIN route AS r2 ON (r1.num = r2.num AND r1.company = r2.company)
JOIN stops AS shared_stop ON (r2.stop = shared_stop.id)
JOIN route AS r3 ON (shared_stop.id = r3.stop)
JOIN route AS r4 ON (r3.num = r4.num  AND r3.company = r4.company)
WHERE r1.stop = (
  SELECT id 
  FROM stops 
  WHERE name='Craiglockhart')
AND r4.stop = (
  SELECT id 
  FROM stops 
  WHERE name ='Lochend')
ORDER BY r1.num, shared_stop.name, r4.num;





