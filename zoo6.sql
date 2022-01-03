--6) THE JOIN operation

--1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

--2
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

--3
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER';

--4
SELECT team1, team2, player
  FROM game JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%';

--5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on goal.teamid = eteam.id
WHERE gtime<=10;

--6
SELECT mdate, teamname
  FROM game JOIN eteam on game.team1 = eteam.id
WHERE coach = 'Fernando Santos';

--7
SELECT player
  FROM goal JOIN game ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

--8
SELECT DISTINCT player
  FROM game JOIN goal ON goal.matchid = game.id 
    WHERE (goal.teamid != 'GER') AND (game.team1 = 'GER' OR game.team2 = 'GER');

--9
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON eteam.id=goal.teamid
GROUP BY teamname;

--10
SELECT game.stadium, COUNT(*)
  FROM game JOIN goal ON game.id=goal.matchid
GROUP BY stadium;

--11
SELECT game.id, game.mdate, COUNT(goal.teamid)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE game.team1 = 'POL' OR game.team2='POL'
GROUP BY game.id, game.mdate;

--12
SELECT goal.matchid, game.mdate, COUNT(*)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid, game.mdate;

--13
SELECT game.mdate,
  game.team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, 
  game.team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game 
LEFT JOIN goal ON goal.matchid = game.id
GROUP BY game.mdate, goal.matchid, game.team1, game.team2
ORDER BY game.mdate, goal.matchid, game.team1, game.team2;