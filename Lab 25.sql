--1. Implement scalar function to return "Welcome to DBMS Lab".

CREATE OR ALTER FUNCTION WELCOME()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'Welcome to DBMS Lab'
END
GO

SELECT dbo.WELCOME() AS WELCOME

--2. Implement scalar function to calculate simple interest. 

CREATE OR ALTER FUNCTION INTEREST
(
    @Principal DECIMAL(18,2) = 0.0,
    @Rate DECIMAL(18,2) = 0.0,
    @Time DECIMAL(18,2) = 0.0
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN (@Principal * @Rate * @Time / 100);
END
GO

SELECT dbo.INTEREST(10000, 5, 2) AS SimpleInterest

--3. Implement scalar function to find difference in days between two dates. 

CREATE OR ALTER FUNCTION DATE_DIFF
(
    @D1 DATE,
    @D2 DATE
)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @D1, @D2)
END
GO

SELECT dbo.DATE_DIFF('2024-01-01', '2025-01-15') AS DATE_DIFF

--4. Implement scalar function to check whether number is odd or even. 

CREATE OR ALTER FUNCTION ODD_EVEN
(
    @NUM INT
)
RETURNS VARCHAR(10)
AS
BEGIN
    IF @NUM%2=0 
        BEGIN    
            RETURN 'EVEN'
        END
        
        RETURN 'ODD'
END
GO

SELECT dbo.ODD_EVEN(5) AS ODD_EVEN
SELECT dbo.ODD_EVEN(8) AS ODD_EVEN

--5. Implement scalar function to print numbers from 1 to N. 

CREATE OR ALTER FUNCTION dbo.TO_N (@NUM INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @I INT = 1
    DECLARE @A VARCHAR(100) = '';

    WHILE @I <= @NUM
    BEGIN
        SET @A = @A + ' ' + CAST(@I AS VARCHAR) 
        SET @I = @I + 1
    END

    RETURN @A
END;
GO

SELECT dbo.TO_N(5) AS ODD_EVEN

--6. Implement scalar function to calculate factorial of given number. 

CREATE OR ALTER FUNCTION fact
(
    @NUM INT
)
RETURNS INT
AS
BEGIN
    DECLARE @counter INT = 1
    DECLARE @ANS INT = 1

    WHILE @counter <= @NUM
    BEGIN
        SET @ANS = @ANS * @counter
        SET @counter = @counter + 1
    END

    RETURN @ANS
END
GO

SELECT dbo.fact(7) AS FACTORIAL

--7. Implement scalar function to check palindrome number. 

CREATE OR ALTER FUNCTION palindrome
(
    @NUM INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @TEMP INT = @NUM
    DECLARE @ANS INT = 0

    WHILE @TEMP > 0
    BEGIN
        SET @ANS = (@ANS * 10) + (@TEMP%10)
        SET @TEMP = @TEMP/10
    END

    IF(@ANS = @NUM)
    BEGIN 
        RETURN 'PALINDROME'
    END

    RETURN 'NOT PALINDROME'
END
GO

SELECT dbo.palindrome(120) AS palindrome

--8. Implement scalar function to find maximum of three numbers. 

CREATE OR ALTER FUNCTION maximum
(
    @A INT,
    @B INT,
    @C INT
)
RETURNS INT
AS
BEGIN
    
    IF(@A > @B)
    BEGIN 
        IF(@A > @C)
        BEGIN
            RETURN @A
        END

        RETURN @C
    END

    
    IF(@B > @A)
    BEGIN 
        IF(@B > @C)
        BEGIN
            RETURN @B
        END

        RETURN @C
    END

    RETURN @A
END
GO

SELECT dbo.maximum(10,45,30) AS maximum

--9. Implement scalar function to calculate square and cube of a number. 

CREATE OR ALTER FUNCTION SQUARE_CUBE
(
    @NUM INT
)
RETURNS INT
AS
BEGIN
    
    DECLARE @SQUARE INT

    RETURN @NUM * @NUM
END
GO

SELECT dbo.SQUARE_CUBE(7) AS SQUARE_CUBE

--10. Implement scalar function to return employee full details using EID. 

CREATE OR ALTER FUNCTION dbo.EMP_EID(@EID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM EMPLOYEE
    WHERE EID = @EID 
)
GO

SELECT * 
FROM dbo.EMP_EID(104);

--11. Implement scalar function to return highest salary from a given department. 

CREATE OR ALTER FUNCTION dbo.HIGH_SALARY(@DEPT VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT MAX(SALARY) AS MAX
    FROM EMPLOYEE
    WHERE DEPARTMENT = @DEPT 
    GROUP BY DEPARTMENT
)
GO

SELECT * 
FROM dbo.HIGH_SALARY('HR');

--12. Implement scalar function to count total employees in EMPLOYEE table. 

CREATE OR ALTER FUNCTION dbo.EMP_COUNT()
RETURNS TABLE
AS
RETURN
(
    SELECT COUNT(*) AS COUNT
    FROM EMPLOYEE 
)
GO

SELECT * 
FROM dbo.EMP_COUNT();

--13. Implement scalar function to find total experience of employee using JoiningYear. 

CREATE FUNCTION dbo.Experience
(
    @JoiningYear INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Experience INT;

    SET @Experience = YEAR(GETDATE()) - @JoiningYear;

    RETURN @Experience;
END;
GO

SELECT dbo.Experience(2018) AS TotalExperience;

--14. Implement scalar function to return total number of employees in a given department. 

CREATE OR ALTER FUNCTION dbo.EMP_DEPT(@DEPT VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT COUNT(*) AS COUNT
    FROM EMPLOYEE 
    WHERE DEPARTMENT = @DEPT
)
GO

SELECT * 
FROM dbo.EMP_DEPT('IT');

--15. Implement scalar function to count total employees from a given city.

CREATE OR ALTER FUNCTION dbo.EMP_CITY(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT COUNT(*) AS COUNT
    FROM EMPLOYEE 
    WHERE CITY = @CITY
)
GO

SELECT * 
FROM dbo.EMP_CITY('RAJKOT');

