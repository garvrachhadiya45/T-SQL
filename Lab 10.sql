--1. Display the result of 5 multiply by 30.

SELECT 5*30 AS RESULT

--2. Find out the absolute value of -25, 25, -50 and 50.

SELECT ABS(-25) AS RESULT
SELECT ABS(-50) AS RESULT
SELECT ABS(25) AS RESULT
SELECT ABS(50) AS RESULT

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.

SELECT CEILING(25.2) AS RESULT1,
CEILING(25.7) AS RESULT2,
CEILING(-25.2) AS RESULT3

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.

SELECT FLOOR(25.2) AS RESULT1,
FLOOR(25.7) AS RESULT2,
FLOOR(-25.2) AS RESULT3

--5. Find out remainder of 5 divided 2 and 5 divided by 3.

SELECT 5%2 AS RESULT1 , 5%3 AS RESULT2

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.

SELECT POWER(3,2) AS RESULT1 , POWER(4,3) AS RESULT2

--7. Find out the square root of 25, 30 and 50.

SELECT SQRT(25) AS RESULT1 , SQRT(30) AS RESULT2 , SQRT(50) AS RESULT3

--8. Find out the square of 5, 15, and 25.

SELECT SQUARE(5) AS RESULT1 , SQUARE(15) AS RESULT2 , SQUARE(25) AS RESULT3

--9. Find out the value of PI.

SELECT PI() AS PI_VALUE

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 

SELECT ROUND(157.73 , 2) AS RESULT1,
ROUND(157.73 , 0) AS RESULT2,	
ROUND(157.73 , -2) AS RESULT3	

--11. Find out exponential value of 2 and 3.

SELECT EXP(2) AS RESULT1,
EXP(3) AS RESULT2

--12. Find out logarithm having base e of 10 and 2.

SELECT LOG(2) AS RESULT1,
LOG(10) AS RESULT2

--13. Find logarithm base 10 of 5 and 100

SELECT LOG(5,10) AS RESULT1,
LOG(100,10) AS RESULT2

--14. Find sine, cosine and tangent of 3.1415.

SELECT SIN(3.1415) AS RESULT1,
COS(3.1415) AS RESULT2,
TAN(3.1415) AS RESULT3

--15. Find sign of -25, 0 and 25.

SELECT SIGN(-25) AS RESULT1,
SIGN(0) AS RESULT2,
SIGN(25) AS RESULT3

--16. Generate random number using function. 

SELECT RAND() AS RESULT



------------------------------------------------------------------------------------------------

--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank

SELECT LEN(NULL) AS LENGTH , 
LEN('HELLO') AS LENGTH,
LEN('') AS LENGTH

--2. Display your name in lower & upper case.

SELECT UPPER('Garv') AS UP,
LOWER('Garv') AS LW

--3. Display first three characters of your name.

SELECT LEFT('GARV',3) AS THREE

--4. Display 3rd to 10th character of your name.

SELECT SUBSTRING('GARV RACHHADIYA',3,7) AS LENGTH

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.

SELECT REPLACE('abc123efg' , '123' , 'XYZ') AS REP1,
REPLACE('abcabcabc' , 'c' , '5') AS REP2

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.

SELECT ASCII('a') AS a,ASCII('A') AS A,ASCII('z') AS z,
ASCII('Z') AS Z,ASCII(0) AS _0_,ASCII(9) AS _9_

--7. Write a query to display character based on number 97, 65,122,90,48,57.

SELECT CHAR(97) AS _97_ , CHAR(65) AS _65_ , CHAR(122) AS _122_ ,
CHAR(90) AS _90_ , CHAR(48) AS _48_ , CHAR(57) AS _57_ 

--8. Write a query to remove spaces from left of a given string ‘ hello world ‘.

SELECT LTRIM('		hello world')

--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.

SELECT RTRIM('hello world		')

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.

SELECT LEFT('SQL Server',4),
RIGHT('SQL Server',5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).

SELECT CONVERT(VARCHAR,1234.56)

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).

SELECT CONVERT(INT,10.58)

--13. Put 10 space before your name using function.

SELECT SPACE(10)+'GARV'

--14. Combine two strings using + sign as well as CONCAT ().

SELECT ('DARSHAN' + ' UNIVERSITY'),
CONCAT('DARSHAN',' UNIVERSITY')

--15. Find reverse of “Darshan”.

SELECT REVERSE('DARSHAN')

--16. Repeat your name 3 times.

SELECT REPLICATE('GARV  ',3)

--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase.

SELECT LOWER(FIRSTNAME) AS FIRSTNAME,
UPPER(LASTNAME) AS LASTNAME FROM EMPLOYEE

--18. Display full name by combining FIRSTNAME and LASTNAME.

SELECT CONCAT(FIRSTNAME ,'  ', LASTNAME) AS FULLNAME FROM EMPLOYEE

--19. Display FIRSTNAME with first 3 characters only.

SELECT LEFT(FIRSTNAME,3) FROM EMPLOYEE

--20. Display LASTNAME with last 2 characters only.

SELECT RIGHT(LASTNAME,2) FROM EMPLOYEE

--21. Display length of each employee’s FIRSTNAME.

SELECT LEN(FIRSTNAME) FROM EMPLOYEE

--22. Display FIRSTNAME after replacing ‘A’ with ‘@’.

SELECT REPLACE(FIRSTNAME,'A','@') FROM EMPLOYEE

--23. Display FIRSTNAME and LASTNAME with - between them using CONCAT. 

SELECT CONCAT(FIRSTNAME,'-',LASTNAME) FROM EMPLOYEE

--24. Display FIRSTNAME without first and last character.

SELECT SUBSTRING(FIRSTNAME,2,LEN(FIRSTNAME)-2) FROM EMPLOYEE

--25. Display FIRSTNAME after replacing vowels with '*'.

SELECT FIRSTNAME,TRANSLATE(FIRSTNAME,'AEIOU','*****') AS NEWNAME FROM EMPLOYEE

--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10.

SELECT * FROM EMPLOYEE
WHERE LEN(CONCAT(FIRSTNAME,LASTNAME))>10

--27. Display FIRSTNAME and its reverse.

SELECT FIRSTNAME , REVERSE(FIRSTNAME) FROM EMPLOYEE

--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT()

SELECT * FROM EMPLOYEE
WHERE LEFT(FIRSTNAME,1) = LEFT(LASTNAME,1)
