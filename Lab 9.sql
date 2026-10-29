SELECT * FROM EMPLOYEE


--1. Display cities where total salary of employees greater than 20000.

SELECT CITY ,SUM(SALARY) FROM EMPLOYEE
GROUP BY CITY HAVING SUM(SALARY)>20000

--2. Display departments having average salary greater than 12000.

SELECT DEPARTMENT ,AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING AVG(SALARY)>12000

--3. Display departments having total salary greater than 20000.

SELECT DEPARTMENT ,SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING SUM(SALARY)>20000

--4. Display departments having number of employees greater than 2.

SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING COUNT(*) > 2

--5. Display cities where minimum salary less than 7000.

SELECT CITY ,MIN(SALARY) FROM EMPLOYEE
GROUP BY CITY HAVING MIN(SALARY)<7000

--6. Display cities where average salary less than 12000.

SELECT CITY ,AVG(SALARY) FROM EMPLOYEE
GROUP BY CITY HAVING AVG(SALARY)<12000

--7. Display departments where maximum salary greater than 14000.

SELECT DEPARTMENT ,MAX(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING MAX(SALARY)>14000

--8. Display cities where total salary greater than equal to 30000.

SELECT CITY , SUM(SALARY) FROM EMPLOYEE
GROUP BY CITY HAVING SUM(SALARY) >= 30000

--9. Display departments having number of employees equal to 2.

SELECT DEPARTMENT , COUNT(*) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING COUNT(*) = 2

--10. Display cities having number of female employees greater than equal to 1.

SELECT CITY , COUNT(*) FROM EMPLOYEE WHERE GENDER = 'FEMALE'
GROUP BY CITY HAVING COUNT(*) >= 1

--11. Display departments where minimum salary of male employees greater than 7000.

SELECT DEPARTMENT FROM EMPLOYEE WHERE GENDER = 'MALE'
GROUP BY DEPARTMENT HAVING MIN(SALARY) >= 7000

--12. Display cities where maximum salary of female employees less than 13000.

SELECT CITY FROM EMPLOYEE WHERE GENDER = 'FEMALE'
GROUP BY CITY HAVING MAX(SALARY) <= 13000

--13. Display departments where average salary greater than 10000 and less than 14000.

SELECT DEPARTMENT FROM EMPLOYEE WHERE GENDER = 'MALE'
GROUP BY DEPARTMENT HAVING AVG(SALARY) BETWEEN 10000 AND 14000

--14. Display cities where number of employees joined before 2023 greater than 1.

SELECT CITY FROM EMPLOYEE WHERE JOININGYEAR < 2023
GROUP BY CITY HAVING COUNT(*) > 1

--15. Display cities where total salary of male employees greater than 15000, ordered by total salary.

SELECT CITY , SUM(SALARY) FROM EMPLOYEE WHERE GENDER = 'MALE'
GROUP BY CITY HAVING SUM(SALARY) > 15000 ORDER BY SUM(SALARY)

--16. Display departments where maximum salary greater than 13000, ordered by max salary.

SELECT DEPARTMENT , MIN(SALARY) FROM EMPLOYEE 
GROUP BY DEPARTMENT HAVING MIN(SALARY) >= 13000 ORDER BY MAX(SALARY) 

--17. Display cities where total salary of male employees greater than 15000.

SELECT CITY , SUM(SALARY) FROM EMPLOYEE WHERE GENDER = 'MALE'
GROUP BY CITY HAVING SUM(SALARY) > 15000

--18. Display departments where employees joined after 2022 and count greater than 1.

SELECT DEPARTMENT FROM EMPLOYEE WHERE JOININGYEAR > 2022
GROUP BY DEPARTMENT HAVING COUNT(*) > 1

--19. Display departments where average salary of female employees greater than 8000.

SELECT DEPARTMENT , AVG(SALARY) FROM EMPLOYEE WHERE GENDER = 'FEMALE'
GROUP BY DEPARTMENT HAVING AVG(SALARY) > 8000

--20. Display departments having total salary greater than 20000 and less than 40000.

SELECT DEPARTMENT,SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING SUM(SALARY) BETWEEN 20000 AND 40000

--21. Display departments having total salary of employees joined after 2021 greater than 20000.

SELECT DEPARTMENT , SUM(SALARY) FROM EMPLOYEE WHERE JOININGYEAR > 2021
GROUP BY DEPARTMENT HAVING SUM(SALARY) > 20000

--22. Display cities where average salary of employees joined after 2022 greater than 10000.

SELECT CITY, AVG(SALARY) FROM EMPLOYEE WHERE JOININGYEAR > 2022
GROUP BY CITY HAVING AVG(SALARY) > 10000

--23. Display cities having number of distinct departments greater than 1.

SELECT CITY FROM EMPLOYEE
GROUP BY CITY HAVING COUNT(DISTINCT DEPARTMENT) > 1

--24. Display cities where maximum salary of employees joined before 2022 greater than 12000.

SELECT CITY , MAX(SALARY) FROM EMPLOYEE WHERE JOININGYEAR < 2022
GROUP BY CITY HAVING MAX(SALARY) > 12000

--25. Display departments where total salary of female employees less than 15000.

SELECT DEPARTMENT, SUM(SALARY) FROM EMPLOYEE WHERE GENDER = 'FEMALE'
GROUP BY DEPARTMENT HAVING SUM(SALARY) < 15000

--26. Display cities where number of male employees greater than female employees.

SELECT CITY FROM EMPLOYEE
GROUP BY CITY HAVING
    SUM(CASE WHEN GENDER = 'Male' THEN 1 ELSE 0 END) >
    SUM(CASE WHEN GENDER = 'Female' THEN 1 ELSE 0 END);

--27. Display departments having number of cities greater than 1.

SELECT DEPARTMENT,COUNT(CITY) FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING COUNT(CITY) > 1

--28. Display cities where total salary excluding IT department greater than 15000.

SELECT CITY , SUM(SALARY) FROM EMPLOYEE WHERE DEPARTMENT <> 'IT'
GROUP BY CITY HAVING SUM(SALARY)>15000

--29. Display departments where average salary excluding HR employees greater than 11000.

SELECT DEPARTMENT,AVG(SALARY) FROM EMPLOYEE WHERE DEPARTMENT<>'HR'
GROUP BY DEPARTMENT HAVING AVG(SALARY) > 11000

--30. Display departments where total salary of male employees greater than female employees. 

SELECT DEPARTMENT FROM EMPLOYEE
GROUP BY DEPARTMENT HAVING
    SUM(CASE WHEN GENDER = 'Male' THEN SALARY ELSE 0 END) >
    SUM(CASE WHEN GENDER = 'Female' THEN SALARY ELSE 0 END);



--------------------------------EXTRA-----------------------------------


CREATE TABLE Project_Assignments (
 Assignment_ID INT PRIMARY KEY,
 Employee_Name VARCHAR (50),
 Department VARCHAR (30),
 Hours_Worked INT
);

INSERT INTO Project_Assignments VALUES
(101,'Ayaan','AI',38),
(102,'Kiara','Cloud',45),
(103,'Neel','AI',42),
(104,'Meera','Security',31),
(105,'Rohan','Cloud',50),
(106,'Ishita','AI',29),
(107,'Dev','Security',47),
(108,'Sana','Cloud',36),
(109,'Arjun','Security',41),
(110,'Tara','AI',42)


SELECT * FROM Project_Assignments


--1) Display each department and the total hours worked.

SELECT DEPARTMENT , SUM(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT 

--2) Show departments where the total hours worked are greater than 120.

SELECT DEPARTMENT , SUM(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING SUM(Hours_Worked) > 120

--3) Find the average hours worked in each department and display them from highest to lowest average.

SELECT DEPARTMENT , AVG(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT ORDER BY AVG(Hours_Worked) DESC

--4) Display departments having more than 3 employees.

SELECT DEPARTMENT , COUNT(*) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING COUNT(*) > 3

--5) Show departments whose maximum hours worked exceed 45.

SELECT DEPARTMENT , MAX(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING MAX(Hours_Worked) > 45

--6) Find departments where the minimum hours worked is less than 30 and sort by minimum hours.

SELECT DEPARTMENT , MIN(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING MIN(Hours_Worked) < 30 ORDER BY MIN(Hours_Worked)

--7) Display each department with employee count and total hours. Show only departments having an average greater than 40.

SELECT DEPARTMENT ,COUNT(*), SUM(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING SUM(Hours_Worked) > 40

--8) Find departments where total hours are between 100 and 170. Display them in descending order of total hours.

SELECT DEPARTMENT ,COUNT(*), SUM(Hours_Worked) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING SUM(Hours_Worked) BETWEEN 100 AND 170 
ORDER BY SUM(Hours_Worked) DESC 

--9) Display departments having at least 3 employees. Sort first by employee count (descending), then by department name (ascending).

SELECT DEPARTMENT ,COUNT(*) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING COUNT(*)>3
ORDER BY COUNT(*) DESC 

SELECT DEPARTMENT ,COUNT(*) FROM Project_Assignments 
GROUP BY DEPARTMENT HAVING COUNT(*)>3
ORDER BY Department

--10) Display each department with:
--• Number of employees
--• Total hours worked
--• Average hours worked

SELECT DEPARTMENT ,COUNT(*) AS Number_of_employees ,
SUM(Hours_Worked) AS Total_hours_worked,
AVG(Hours_Worked) AS Average_hours_worked
FROM Project_Assignments GROUP BY DEPARTMENT 

--Show only departments where:
--• Total hours are greater than 110
--• Average hours are greater than 38
--Sort by average hours (descending) and then department name.

SELECT DEPARTMENT,
SUM(Hours_Worked) AS Total_hours,
AVG(Hours_Worked) AS Average_hours
FROM Project_Assignments GROUP BY DEPARTMENT 
HAVING SUM(Hours_Worked) > 110 AND
AVG(Hours_Worked) > 38
ORDER BY AVG(Hours_Worked) DESC


SELECT DEPARTMENT,
SUM(Hours_Worked) AS Total_hours,
AVG(Hours_Worked) AS Average_hours
FROM Project_Assignments GROUP BY DEPARTMENT 
HAVING SUM(Hours_Worked) > 110 AND
AVG(Hours_Worked) > 38
ORDER BY Department