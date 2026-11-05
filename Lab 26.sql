--1. Create a table valued function to display all student records. 

CREATE OR ALTER FUNCTION dbo.GetAllStudents()
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
)
GO

SELECT * 
FROM dbo.GetAllStudents();

--2. Create a table valued function that accepts CITY and returns all students from that city. 

CREATE OR ALTER FUNCTION dbo.CITY_STUDENT(@C VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE CITY = @C
)
GO

SELECT * 
FROM dbo.CITY_STUDENT('RAJKOT');

--3. Create a table valued function that accepts BRANCH and returns all students of that branch. 

CREATE OR ALTER FUNCTION dbo.BRANCH_STUDENT(@B VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE BRANCH = @B
)
GO

SELECT * 
FROM dbo.BRANCH_STUDENT('COMPUTER');

--4. Create a table valued function that accepts SPI and returns students whose SPI is greater than entered SPI. 

CREATE OR ALTER FUNCTION dbo.SPI_STUDENT(@S DECIMAL(4,2))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE SPI > @S
)
GO

SELECT * 
FROM dbo.SPI_STUDENT(5);

--5. Create a table valued function that accepts MIN_SPI and MAX_SPI and returns students whose SPI lies between given range. 

CREATE OR ALTER FUNCTION dbo.MIN_MAX_SPI(@MIN DECIMAL(4,2),@MAX DECIMAL(4,2))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE SPI BETWEEN @MIN AND @MAX
)
GO

SELECT * 
FROM dbo.MIN_MAX_SPI(5,8);

--6. Create a table valued function that accepts STDID and returns details of that student. 

CREATE OR ALTER FUNCTION dbo.SID_STUDENT(@SID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE STDID = @SID
)
GO

SELECT * 
FROM dbo.SID_STUDENT(104);

--7. Create a table valued function that accepts CITY and returns students whose SPI is greater than 7 from that city. 

CREATE OR ALTER FUNCTION dbo.CITY_7(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE CITY = @CITY AND SPI > 7
)
GO

SELECT * 
FROM dbo.CITY_7('RAJKOT');

--8. Create a table valued function that accepts BRANCH and returns students whose SPI is less than 8 from that branch. 

CREATE OR ALTER FUNCTION dbo.BRANCH_8(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE BRANCH = @BRANCH AND SPI < 8
)
GO

SELECT * 
FROM dbo.BRANCH_8('EC');

--9. Create a table valued function that accepts TOPN and returns top N students based on SPI. 

CREATE OR ALTER FUNCTION dbo.TOP__N(@N INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@N) *
    FROM Student
    ORDER BY SPI DESC
)
GO

SELECT * 
FROM dbo.TOP__N(5);


--10. Create a table valued function that accepts BRANCH and returns highest SPI student from that branch. 

CREATE OR ALTER FUNCTION dbo.BRANCH_TOP(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 *
    FROM Student
    WHERE BRANCH = @BRANCH 
    ORDER BY SPI DESC
)
GO

SELECT * 
FROM dbo.BRANCH_TOP('COMPUTER');

--11. Create a table valued function that accepts CITY and returns total students from that city. 

CREATE OR ALTER FUNCTION dbo.CITY_7(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT CITY , COUNT(*) AS TOTAL
    FROM Student
    WHERE CITY = @CITY 
    GROUP BY CITY
)
GO

SELECT * 
FROM dbo.CITY_7('RAJKOT');

--12. Create a table valued function that accepts BRANCH and returns students ordered by SPI in descending order. 

CREATE OR ALTER FUNCTION dbo.SPI_ORDER(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Student
    WHERE BRANCH = @BRANCH
)
GO

SELECT * 
FROM dbo.SPI_ORDER('COMPUTER')
ORDER BY SPI DESC

--13. Create a table valued function that accepts CITY and returns top 3 student from that city based on SPI. 

CREATE OR ALTER FUNCTION dbo.TOP_3_CITY(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 3 *
    FROM Student
    WHERE CITY = @CITY 
    ORDER BY SPI DESC
)
GO

SELECT * 
FROM dbo.TOP_3_CITY('RAJKOT');

--14. Create a table valued function that accepts STDID and returns student rank based on SPI (RANK). 

CREATE OR ALTER FUNCTION dbo.SPI_RANK(@SID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM (SELECT * ,RANK() OVER(ORDER BY SPI DESC) AS RANK1
    FROM Student
    ) AS P
    WHERE STDID = @SID
    
)
GO

SELECT * 
FROM dbo.SPI_RANK(101);

--15. Create a table valued function that accepts BRANCH and returns students having second highest SPI from that branch. 

CREATE OR ALTER FUNCTION dbo.BRANCH_RANK(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM (SELECT * ,RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC) AS RANK1
    FROM Student
    ) AS P
    WHERE BRANCH = @BRANCH AND RANK1 = 2
)
GO

SELECT * 
FROM dbo.BRANCH_RANK('COMPUTER');
