--1. Display rank of students based on SPI. 

SELECT *, 
RANK() OVER (ORDER BY SPI DESC) AS Rank
FROM STUDENT

--2. Display dense rank of students based on SPI. 

SELECT *, 
DENSE_RANK() OVER (ORDER BY SPI DESC) AS DENSE_R
FROM STUDENT

--3. Display sequential number for each student record. 

SELECT *, 
ROW_NUMBER() OVER (ORDER BY SPI DESC) AS ROW_NUM
FROM STUDENT

--4. Display branch-wise rank of students. 

SELECT *, 
RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS Rank
FROM STUDENT

--5. Display branch-wise dense ranking of students. 

SELECT *, 
DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS Rank
FROM STUDENT

--6. Display branch-wise sequential numbering of students. 

SELECT *, 
ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS Rank
FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI. 

SELECT SNAME,SPI, 
LAG(SPI) OVER (ORDER BY SPI) AS PREV,
SPI-LAG(SPI) OVER (ORDER BY SPI) AS DIFF
FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  
 
SELECT SNAME,SPI, 
LEAD(SPI) OVER (ORDER BY SPI DESC) AS PREV,
SPI-LEAD(SPI) OVER (ORDER BY SPI DESC) AS DIFF
FROM STUDENT

--9. Display top 3 students based on SPI. 

SELECT SNAME, SPI
FROM 
    (
        SELECT SNAME, SPI,
        RANK() OVER (ORDER BY SPI DESC) AS Rank
        FROM STUDENT
    ) AS R
WHERE Rank <= 3

--10. Display top 2 students from each branch. 

SELECT SNAME, SPI , BRANCH
FROM 
    (
        SELECT SNAME, SPI, BRANCH,
        RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS Rank
        FROM STUDENT
    ) AS R
WHERE Rank <= 2

--11. Display 5th highest SPI. 

SELECT *
FROM 
    (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY SPI DESC) AS Rank
        FROM STUDENT
    ) AS R
WHERE Rank = 5

--12. Display 6th highest SPI. 

SELECT *
FROM 
    (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY SPI DESC) AS Rank
        FROM STUDENT
    ) AS R
WHERE Rank = 6

--13. Display students having same ranking. 

SELECT *
FROM 
    (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY SPI DESC) AS Rank
        FROM STUDENT
    ) AS R


--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI. 



--15. Display topper of each branch. 



--16. Display students whose SPI is greater than the previous student and less than the next student. 



--17. Display branch-wise second topper students. 



--18. Display students whose rank and dense rank are different. 



--19. Display consecutive students having same branch ordered by SPI. 



--20. Display students whose SPI difference with previous student is maximum. 


