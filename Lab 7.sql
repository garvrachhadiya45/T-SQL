--1. Display employees detail whose FIRSTNAME starts with ‘H’.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE 'H%'

--2. Display employees detail whose FIRSTNAME consists of exactly 5 characters.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '_____'

--3. Display employees detail whose CITY ends with ‘T’ and has 6 characters.

SELECT * FROM EMPLOYEE WHERE CITY LIKE '_____T' 

--4. Display employees detail whose LASTNAME ends with ‘EL’.

SELECT * FROM EMPLOYEE WHERE LASTNAME LIKE '%EL'

--5. Display employees detail whose FIRSTNAME starts with ‘R’ and ends with ‘A’.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE 'R%A'

--6. Display employees detail whose FIRSTNAME starts with ‘V’ and third character is ‘S’.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE 'V_S%'

--7. Display employees detail whose CITY is NULL and FIRSTNAME has 6 characters.

SELECT * FROM EMPLOYEE WHERE (FIRSTNAME LIKE '______') AND (CITY IS NULL)

--8. Display employees detail whose FIRSTNAME contains ‘AR’.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '%AR%'

--9. Display employees detail whose CITY starts with ‘R’ or ‘B’.

SELECT * FROM EMPLOYEE WHERE CITY LIKE 'R%' OR CITY LIKE 'B%'

--10. Display employees detail whose DEPARTMENT is NOT NULL.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT LIKE '%'

--11. Display employees detail whose FIRSTNAME starts from alphabet A to H.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '[ABCDEFGHabcdefgh]%'

--12. Display employees detail whose second character of FIRSTNAME is a vowel.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '_[AEIOUaeiou]%' 

--13. Display employees detail whose FIRSTNAME length ≥ 5.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '_____%'

--14. Display employees detail whose LASTNAME starts with ‘PA’.

SELECT * FROM EMPLOYEE WHERE LASTNAME LIKE 'PA%'

--15. Display employees detail whose CITY does not start with ‘B’.

SELECT * FROM EMPLOYEE WHERE CITY NOT LIKE 'B%'

--16. Display employees whose second character of FIRSTNAME is a not vowel.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME NOT LIKE '_[AEIOUaeiou]%' 

--17. Display employees whose JOINING YEAR last digit is 4 or 6.

SELECT * FROM EMPLOYEE WHERE JOININGYEAR LIKE '%6' OR JOININGYEAR LIKE '%4'

--18. Display employees detail whose FIRSTNAME starts with ‘H’, ends with ‘I’, and CITY contains ‘RA’.

SELECT * FROM EMPLOYEE WHERE LASTNAME LIKE 'PA%'

--19. Display employees detail whose FIRSTNAME contains ‘A’, CITY ends with ‘D’, and DEPARTMENT is NOT NULL.

SELECT * FROM EMPLOYEE WHERE LASTNAME LIKE '%A%' AND CITY LIKE '%D' AND DEPARTMENT IS NOT NULL

--20. Display employees whose second and third characters of FIRSTNAME are vowels and CITY starts with ‘R’.

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_[AEIOUaeiou][AEIOUaeiou]%' AND CITY LIKE 'R%'

--21. Display employees whose CITY contains ‘RA’ and salary less than 13000 and joining year last digit is 6.

SELECT * FROM EMPLOYEE WHERE CITY LIKE '%RA%' AND SALARY < 13000 AND JOININGYEAR LIKE '%6'

--22. Display employees whose SALARY between 10000 and 15000 and CITY name contains 'KO' and FIRSTNAME start with H.

SELECT * FROM EMPLOYEE WHERE CITY LIKE '%KO%' AND (SALARY BETWEEN 10000 AND 15000) AND FIRSTNAME LIKE 'H%'

--23. Display employees whose FIRSTNAME starts with ‘A’ or ‘D’ and SALARY greater than 12000.

SELECT * FROM EMPLOYEE WHERE CITY LIKE '%RA%' AND SALARY < 13000 AND JOININGYEAR LIKE '%6'

--24. Display employees whose CITY contains ‘N’ and SALARY less than 15000.

SELECT * FROM EMPLOYEE WHERE CITY LIKE '%N%' AND SALARY < 15000

--25. Display employees whose FIRSTNAME length = 6 and CITY ends with ‘AR’. 

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '______' AND CITY LIKE '%AR'

--26. Display employees whose FIRSTNAME ends with a vowel, department name start with vowel, and SALARY is between 10000 and 15000.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '%[AEIOUaeiou]' AND DEPARTMENT LIKE '[AEIOUaeiou]%' AND (SALARY BETWEEN 10000 AND 15000)

--27. Display employees whose LASTNAME contains ‘A’ at least twice, gender is male, and SALARY is not equal to 14000. 

SELECT * FROM EMPLOYEE WHERE LASTNAME LIKE '%A%A%' AND GENDER LIKE 'MALE' AND (SALARY <> 15000)

--28. Display employees whose FIRSTNAME second character is vowel and LASTNAME ends with ‘R’ and SALARY less than 12000.

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '_[AEIOUaeiou]%' AND LASTNAME LIKE '%R' AND (SALARY <12000)

--29. Display employees whose CITY is NOT NULL and FIRSTNAME does not start with vowel and DEPARTMENT not in (‘HR’, ‘IT’).

SELECT * FROM EMPLOYEE WHERE FIRSTNAME NOT LIKE '[AEIOUaeiou]%' AND DEPARTMENT NOT LIKE '["IT", "HR"]%' AND CITY IS NOT NULL

--30. Display employees whose CITY is not NULL, FIRSTNAME ends with vowels, and DEPARTMENT is neither ‘HR’ nor ‘IT’. 

SELECT * FROM EMPLOYEE WHERE FIRSTNAME LIKE '%[AEIOUaeiou]' AND DEPARTMENT NOT LIKE '["IT", "HR"]%' AND CITY IS NOT NULL



CREATE TABLE PatientRecords (
	RecordID INT PRIMARY KEY,
	PatientName VARCHAR(100),
	DiagnosisCode VARCHAR(50),
	TreatmentPlan VARCHAR(250)
);

INSERT INTO PatientRecords (RecordID, PatientName, DiagnosisCode,
TreatmentPlan) VALUES
(201, 'Amy Smith', 'ABC-123', 'Take vitamin pills daily.'),
(202, 'Bob Jones', 'abc-999', 'Rest and drink water.'),
(203, 'Cody Miller', 'XYZ-450', 'Take antibiotics daily.'),
(204, 'Dan_Webb', 'E11', 'Check blood sugar.'),
(205, '1st_Test', 'XYZ-%', 'Emergency care.');

SELECT * FROM PatientRecords

--1. Find all records where the PatientName starts with 'A' and ends with 'h'.

SELECT * FROM PatientRecords WHERE PatientName LIKE 'A%h'

--2. Find all records where the DiagnosisCode starts with 'abc' and ends with '9'.

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE 'abc%9'

--3. Find all records where the PatientName starts with 'C' and is exactly 11 characters long.

SELECT * FROM PatientRecords WHERE PatientName LIKE 'C__________'

--4. Find all records where the DiagnosisCode ends with a literal percent sign %.

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE '%[%]'

--5. Find all records where the TreatmentPlan ends with a period ‘.’.

SELECT * FROM PatientRecords WHERE TreatmentPlan LIKE '%[.]'

--6. Find all records where the PatientName begins with any letter from A through C.

SELECT * FROM PatientRecords WHERE PatientName LIKE '[ABC]%'

--7. Find all records where the DiagnosisCode starts with a letter between X and Z.

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE '[XYZ]%'

--8. Find all records where the DiagnosisCode contains a 3-digit number starting with 4 (i.e., 400 to 499).

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE '%4__%'

--9. Find all records where the PatientName does NOT start with any letter between A and C.

SELECT * FROM PatientRecords WHERE PatientName LIKE '%4__%'

--10. Find all records where the PatientName starts with a number.

SELECT * FROM PatientRecords WHERE PatientName LIKE '[0-9]%'

--11. Find all records where the second letter of the PatientName is a lowercase vowel (a, e, i, o, u).

SELECT * FROM PatientRecords WHERE PatientName LIKE '_[aeiou]%'

--12. Find all records where the DiagnosisCode starts with a letter, followed immediately by two digits.

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE '[A-Z][0-9][0-9]%'

--13. Find all records where the last character of the DiagnosisCode is not a letter or a number.

SELECT * FROM PatientRecords WHERE DiagnosisCode LIKE '%[^A-Z0-9]'

--14. Find all records where the PatientName contains a literal underscore ‘_’ anywhere inside it.

SELECT * FROM PatientRecords WHERE PatientName LIKE '%[_]%'