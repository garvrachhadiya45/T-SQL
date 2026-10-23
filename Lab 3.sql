--1. Retrieve all data from table STUDENT. 

SELECT * FROM STUDENT

--2. Display Student Name and City from STUDENT.

SELECT SNAME,CITY FROM STUDENT 

--3. Display student details of all students who belongs to COMPUTER branch.

SELECT * FROM STUDENT WHERE BRANCH = 'COMPUTER'

--4. Display names of students whose ID is less than 105 from STUDENT table. 

SELECT * FROM STUDENT WHERE STDID < 105

--5. Give Student Name, City and SPI of student whose SPI is greater than 6.50.

SELECT SNAME, CITY, SPI FROM STUDENT WHERE SPI > 6.5

--6. Give name of Student whose branch is COMPUTER and SPI is greater than 8.00. 

SELECT SNAME FROM STUDENT WHERE BRANCH = 'COMPUTER' AND SPI > 8

--7. Give names of students whose ID is greater than 103 and belongs to Rajkot city. 

SELECT SNAME FROM STUDENT WHERE STDID > 103 AND CITY = 'RAJKOT'

--8. Display names of students who belong to either ‘RAJKOT’ or ‘SURAT’ city (USE OR & IN). 

SELECT SNAME FROM STUDENT WHERE CITY = 'RAJKOT' OR CITY = 'SURAT'
SELECT SNAME FROM STUDENT WHERE CITY IN ('RAJKOT' , 'SURAT')

--9. Display names of students with branch whose SPI is greater than 8.0 and ID is less than 105. 

SELECT SNAME, BRANCH FROM STUDENT WHERE STDID < 105 AND SPI > 8

--10. Find all students whose SPI is greater than or equal to 7.0 and less than or equal to 9.0 (USE AND & BETWEEN).

SELECT * FROM STUDENT WHERE SPI <= 9 AND SPI >= 7
SELECT * FROM STUDENT WHERE SPI BETWEEN 7 AND 9
 
--11. Find all students who do not belong to ‘COMPUTER’ branch. 

SELECT * FROM STUDENT WHERE BRANCH != 'COMPUTER'

--12. Display Student ID, Name & SPI of students who belong to ‘COMPUTER’, ‘CIVIL’ or ‘CHEMICAL’ branch and ID is less than 104.
 
SELECT SNAME, SPI, STDID FROM STUDENT WHERE STDID < 104 AND (BRANCH = 'COMPUTER' OR BRANCH = 'CIVIL' OR BRANCH = 'CHEMICAL') 

--13. Display all student IDs and names who do not belong to ‘COMPUTER’ or ‘CIVIL’ branch (USE NOT IN). 

SELECT STDID , SNAME FROM STUDENT WHERE BRANCH NOT IN ('COMPUTER' , 'CIVIL')

--14. Display all student names other than ‘DEEP’ from STUDENT table (USE NOT, <>, !=). 

SELECT SNAME FROM STUDENT WHERE SNAME NOT IN ('DEEP')

--15. Display student names whose branch is not available (NULL) in STUDENT table. 

SELECT SNAME FROM STUDENT WHERE BRANCH IS NULL

--16. Retrieve all unique branches name from STUDENT table. 

SELECT DISTINCT BRANCH FROM STUDENT 

--17. Retrieve first 50% records from STUDENT table. 

SELECT TOP 50 PERCENT * FROM STUDENT 

--18. Retrieve first five student IDs from STUDENT table. 

SELECT TOP 5 STDID FROM STUDENT

--19. Display all the details of first five students from STUDENT table. 

SELECT TOP 5 * FROM STUDENT

--20. Display all the details of first three students whose SPI is greater than 8.0. 

SELECT TOP 3 * FROM STUDENT WHERE SPI > 8

--21. Display Student ID, Name of first five students whose branch does not belong to ‘COMPUTER’ branch. 

SELECT TOP 5 STDID , SNAME FROM STUDENT WHERE BRANCH != 'COMPUTER'

--22. Select all details with student IDs not in the range 105 to 109. 

SELECT * FROM STUDENT WHERE STDID NOT BETWEEN 105 AND 109

--23. Select all records from STUDENT where SPI is greater than 7.0 and less than or equal to 9.0, and student ID is between 102 and 108. 

SELECT * FROM STUDENT WHERE SPI > 7 AND SPI <= 9 AND STDID BETWEEN 102 AND 108 

--24. Display all details of students who have SPI more than 8.5 without using * from STUDENT table.

SELECT STDID , SNAME , CITY , SPI , BRANCH FROM STUDENT WHERE SPI > 8.5

--25. Retrieve names of students whose city is ‘RAJKOT’ and SPI is less than 8.00. 

SELECT SNAME FROM STUDENT WHERE CITY = 'RAJKOT' AND SPI < 8

--26. Retrieve records from STUDENT table where SPI is greater than 8.0 and student ID is less than 105. 

SELECT * FROM STUDENT WHERE SPI > 8 AND STDID < 105

--27. Retrieve records from STUDENT table where SPI is greater than 7.5 and student ID is between 100 and 110 and city is ‘RAJKOT’ or ‘SURAT’. 

SELECT * FROM STUDENT WHERE (SPI > 7.5) AND (STDID BETWEEN 100 AND 110) AND (CITY = 'RAJKOT' OR CITY = 'SURAT')

--28. Display details of students who belong to ‘CIVIL’ or ‘MECHANICAL’ branch and SPI is greater than 8.0. 

SELECT * FROM STUDENT WHERE (BRANCH = 'CIVIL' OR BRANCH = 'MECHANICAL') AND (SPI > 8)