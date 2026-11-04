--1. Display all students whose SPI is greater than 8. 

WITH SPI_8 AS (
    SELECT *
    FROM STUDENT
    WHERE SPI > 8
)
SELECT * FROM SPI_8 

--2. Display average SPI of all students. 

WITH AVG_SPI AS (
    SELECT AVG(SPI) AS AVERAGE 
    FROM STUDENT
)
SELECT * FROM AVG_SPI

--3. Display total number of students in each branch. 

WITH TOTAL AS (
    SELECT COUNT(SPI) AS TOTAL_STUDENT ,BRANCH
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT * FROM TOTAL

--4. Display students who belong to RAJKOT city. 

WITH RAJKOT AS (
    SELECT *
    FROM STUDENT
    WHERE CITY='RAJKOT'
)
SELECT * FROM RAJKOT

--5. Find branch names that appear more than once. 

WITH BRANCH AS (
    SELECT COUNT(SPI) AS TOTAL_STUDENT ,BRANCH
    FROM STUDENT
    GROUP BY BRANCH
    HAVING COUNT(SPI)>1
)
SELECT * FROM BRANCH

--6. Display row number for each student. 

WITH ROW_STUDENT AS (
    SELECT *,ROW_NUMBER() OVER(ORDER BY SPI) AS ROWNUMBER
    FROM STUDENT
)
SELECT * FROM ROW_STUDENT

--7. Display top 3 students based on SPI. 

WITH ROW_STUDENT AS (
    SELECT *,DENSE_RANK() OVER(ORDER BY SPI DESC) AS RANK_NUMBER
    FROM STUDENT
)
SELECT * FROM ROW_STUDENT
WHERE RANK_NUMBER <= 3

--8. Display students having maximum SPI. 

WITH MAX_SPI AS (
    SELECT MAX(SPI) AS MAX_VALUE
    FROM STUDENT
)
SELECT *
FROM STUDENT
WHERE SPI = (SELECT MAX_VALUE FROM MAX_SPI)

--9. Display students having minimum SPI. 

WITH MIN_SPI AS (
    SELECT MIN(SPI) AS MIN_VALUE
    FROM STUDENT
)
SELECT *
FROM STUDENT
WHERE SPI = (SELECT MIN_VALUE FROM MIN_SPI)

--10. Display branch -wise rank of students.  

WITH B_RANK AS (
    SELECT *,
    RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS R_BRANCH
    FROM STUDENT
)
SELECT *
FROM B_RANK

--11. Display students SPI average belonging to Computer branch.

	WITH COM_SPI AS( SELECT * FROM STUDENT
					 WHERE SPI < ( 
									SELECT AVG(SPI) AS AVG FROM STUDENT
									WHERE BRANCH = 'COMPUTER' ) )

	SELECT * FROM COM_SPI

--12. Display students whose SPI is greater than average SPI of his/her branch.

	WITH BRANCH_AVG AS (
						SELECT BRANCH, AVG(SPI) AS AVG_SPI
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT S.*
	FROM STUDENT S
	JOIN BRANCH_AVG B
	ON S.BRANCH = B.BRANCH
	WHERE S.SPI > B.AVG_SPI

--13. Display branch having more than 2 students.

	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH
							HAVING COUNT(STDID) > 2)

	SELECT * FROM STUDENT_COUNT

--14. Display branches having average SPI between 7 and 9 

	WITH AVG_SPI AS( SELECT BRANCH,AVG(SPI) AS AVG FROM STUDENT
					 GROUP BY BRANCH
					 HAVING AVG(SPI) BETWEEN 7 AND 9 )
									
	SELECT * FROM AVG_SPI

--15. Display students whose SPI is lower than overall average SPI.
	
	WITH LOW_SPI AS( SELECT * FROM STUDENT
					 WHERE SPI < ( SELECT AVG(SPI) AS AVG FROM STUDENT ) )

	SELECT * FROM LOW_SPI

--16. Display branches having exactly one student.
	
	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH
							HAVING COUNT(STDID) = 1 )

	SELECT * FROM STUDENT_COUNT

--17. Display branch having highest average SPI.

	WITH RANK_BRANCH AS (
						SELECT BRANCH,AVG(SPI) AS AVG_SPI,
						RANK() OVER (ORDER BY AVG(SPI) DESC) AS RN
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT * FROM RANK_BRANCH
	WHERE RN = 1

--18. Display branch having lowest average SPI.

	WITH RANK_BRANCH AS (
						SELECT BRANCH,AVG(SPI) AS AVG_SPI,
						RANK() OVER (ORDER BY AVG(SPI) ) AS RN
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT * FROM RANK_BRANCH
	WHERE RN = 1

--19. Display students whose SPI is lower than branch average SPI.

	WITH BRANCH_AVG AS (
						SELECT BRANCH, AVG(SPI) AS AVG_SPI
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT S.*
	FROM STUDENT S
	JOIN BRANCH_AVG B
	ON S.BRANCH = B.BRANCH
	WHERE S.SPI < B.AVG_SPI

--20. Display branches having maximum number of students. 

WITH RANK_BRANCH AS (
					SELECT BRANCH,COUNT(STDID) AS COUNT,
					RANK() OVER (ORDER BY COUNT(STDID) DESC) AS RN
					FROM STUDENT
					GROUP BY BRANCH )

SELECT * FROM RANK_BRANCH
WHERE RN = 1