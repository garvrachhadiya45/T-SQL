SELECT * FROM PERSON
SELECT * FROM DEPARTMENT



--1. Combine information from Person and Department table using cross join or Cartesian product.

SELECT * FROM PERSON
CROSS JOIN DEPARTMENT;

--2. Find all persons with their department name

SELECT P.PERSONNAME, D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID;

--3. Find all persons with their department name & code.

SELECT P.PERSONNAME, D.DEPARTMENTNAME, D.DEPARTMENTCODE
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID;

--4. Find all persons with their department code and location.

SELECT P.PERSONNAME, D.DEPARTMENTNAME, D.LOCATION
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID;

--5. Find the detail of the person who belongs to Mechanical department.

SELECT * FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTNAME = 'MECHANICAL';

--6. Final person’s name, department code and salary who lives in Ahmedabad city.

SELECT P.PERSONNAME, P.SALARY, D.DEPARTMENTCODE
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE CITY = 'JAMNAGAR'

--7. Find the person's name whose department is in C-Block.

SELECT P.PERSONNAME, D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.LOCATION = 'C-BLOCK'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.

SELECT P.PERSONNAME, D.DEPARTMENTNAME, P.SALARY
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE CITY = 'JAMNAGAR'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.

SELECT * FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTNAME = 'CIVIL' AND P.JOININGDATE > '1-AUG-2001'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 25 years.

SELECT P.PERSONNAME, D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE YEAR(GETDATE()) - YEAR(JOININGDATE) > 25

--11. Find department wise person counts.

SELECT COUNT(*), D.DEPARTMENTNAME FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY DEPARTMENTNAME

--12. Give department wise maximum & minimum salary with department name.

SELECT MAX(P.SALARY) AS MAX,MIN(P.SALARY) AS MIN, D.DEPARTMENTNAME FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY DEPARTMENTNAME

--13. Find city wise total, average, maximum and minimum salary.

SELECT MAX(P.SALARY) AS MAX,MIN(P.SALARY) AS MIN,
SUM(P.SALARY) AS TOTAL,AVG(P.SALARY) AS AVG , P.CITY
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY CITY

--14. Find the average salary of a person who belongs to Ahmedabad city.

SELECT AVG(SALARY) AS AVG_SALARY
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE CITY = 'AHMEDABAD'
GROUP BY CITY

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)

SELECT P.PERSONNAME + ' lives in ' + P.CITY + 
' and works in ' + D.DEPARTMENTNAME + ' Department.' 
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID

--16. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly.(In single column)

SELECT P.PERSONNAME + ' earns ' + CAST(P.SALARY AS VARCHAR) + 
' from ' + D.DEPARTMENTNAME + ' Department monthly' 
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID

--17. Find city & department wise total, average & maximum salaries.

SELECT CITY, DEPARTMENT, SUM(SALARY) AS Total_Salary, 
AVG(SALARY) AS Average_Salary, MAX(SALARY) AS Max_Salary
FROM EMPLOYEE
GROUP BY CITY, DEPARTMENT

--18. Find all persons who do not belong to any department.

SELECT * FROM PERSON P
WHERE DEPARTMENTID IS NULL

--19. Find all departments whose total salary is exceeding 100000.

SELECT D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY DEPARTMENTNAME
HAVING SUM(SALARY) > 100000

--20. List all departments who have no person.

SELECT D.DEPARTMENTNAME
FROM PERSON P
RIGHT JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE PERSONNAME IS NULL

--21. List out department names in which more than two persons are working.

SELECT COUNT(*), D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY DEPARTMENTNAME
HAVING COUNT(*)>2

--22. Give a 10% increment in the computer department employee’s salary. (Use Update)

UPDATE P
SET P.SALARY = P.SALARY * 1.10
FROM PERSON P
JOIN DEPARTMENT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer'

SELECT * FROM PERSON