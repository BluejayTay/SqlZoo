--8) Using Null

--1
SELECT teacher.name
FROM teacher
WHERE teacher.dept IS NULL;

--2
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON (teacher.dept = dept.id);

--3
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON (teacher.dept = dept.id);

--4
SELECT teacher.name, dept.name
FROM teacher 
RIGHT JOIN dept ON (teacher.dept = dept.id);

--5
SELECT teacher.name, COALESCE(teacher.mobile,'07986 444 2266')
FROM teacher;

--6
SELECT teacher.name, COALESCE(dept.name,'None')
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

--7
SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher;

--8
SELECT dept.name, COUNT(teacher.id)
FROM teacher 
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

--9
SELECT teacher.name, 
  CASE WHEN teacher.dept = 1 OR teacher.dept = 2
    THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher;

--10
SELECT teacher.name, 
  CASE WHEN teacher.dept = 1 OR teacher.dept = 2
    THEN 'Sci'
    WHEN teacher.dept = 3
    THEN 'Art'
    ELSE 'None'
  END
FROM teacher;



