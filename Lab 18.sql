--1. Display the details of students whose SPI is greater than the average SPI.

SELECT * FROM STUDENT
WHERE SPI > 
	(
		SELECT AVG(SPI) FROM STUDENT
	)

--2. Display the names of students whose SPI is less than the average SPI.

SELECT SNAME FROM STUDENT
WHERE SPI < 
	(
		SELECT AVG(SPI) FROM STUDENT
	)

--3. Display the student details who has the highest SPI.

SELECT * FROM STUDENT
WHERE SPI = 
	(
		SELECT MAX(SPI) FROM STUDENT
	)

--4. Display the student details who has the lowest SPI.

SELECT * FROM STUDENT
WHERE SPI = 
	(
		SELECT MIN(SPI) FROM STUDENT
	)

--5. Display the students whose SPI is greater than SPI of student DHARMIK.

SELECT * FROM STUDENT
WHERE SPI > 
	(
		SELECT SPI FROM STUDENT
		WHERE SNAME='DHARMIK'
	)

--6. Display the students whose SPI is less than SPI of student RIYA.

SELECT * FROM STUDENT
WHERE SPI < 
	(
		SELECT SPI FROM STUDENT
		WHERE SNAME='RIYA'
	)

--7. Display the students who belong to the same branch as KRUNAL.

SELECT * FROM STUDENT
WHERE BRANCH = 
	(
		SELECT BRANCH FROM STUDENT
		WHERE SNAME='KRUNAL'
	)

--8. Display the students whose branch is different from HETVI.

SELECT * FROM STUDENT
WHERE BRANCH <> 
	(
		SELECT BRANCH FROM STUDENT
		WHERE SNAME='HETVI'
	)

--9. Display the second highest SPI from RESULT table.

SELECT MAX(SPI) FROM STUDENT
WHERE SPI <
	(
		SELECT MAX(SPI) FROM STUDENT
	)

--10. Display the second lowest SPI from RESULT table.

SELECT MIN(SPI) FROM STUDENT
WHERE SPI >
	(
		SELECT MIN(SPI) FROM STUDENT
	)

--11. Display the names of students whose SPI is above branch-wise average SPI.

SELECT * FROM STUDENT
WHERE SPI IN 
	(
		SELECT AVG(SPI) FROM STUDENT
		GROUP BY BRANCH	
	)

--12. Display the branch having maximum average SPI.

SELECT MAX(SPI),BRANCH FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = 
	(
		SELECT MAX(S) FROM
			(
				SELECT AVG(SPI) AS S FROM STUDENT
				GROUP BY BRANCH	
			) AS T
	)

--13. Display the branch having minimum average SPI.


SELECT MIN(SPI),BRANCH FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = 
	(
		SELECT MIN(S) FROM
			(
				SELECT AVG(SPI) AS S FROM STUDENT
				GROUP BY BRANCH	
			) AS T
	)

--14. Display the students whose SPI is greater than all students of ME branch.

SELECT * FROM STUDENT_INFO 
JOIN RESULT ON STUDENT_INFO.RNO = RESULT.RNO
WHERE SPI >
	(
		SELECT MAX(SPI) FROM RESULT
		INNER JOIN STUDENT_INFO ON RESULT.RNO = STUDENT_INFO.RNO
		WHERE STUDENT_INFO.BRANCH = 'ME'
	)


--15. Display the students whose SPI is less than any student of ME branch.

SELECT * FROM STUDENT_INFO 
JOIN RESULT ON STUDENT_INFO.RNO = RESULT.RNO
WHERE SPI <
	(
		SELECT MIN(SPI) FROM RESULT
		INNER JOIN STUDENT_INFO ON RESULT.RNO = STUDENT_INFO.RNO
		WHERE STUDENT_INFO.BRANCH = 'ME'
	)

--16. Display the student details whose SPI is not equal to any SPI of EC branch students.

SELECT * FROM STUDENT_INFO 
JOIN RESULT ON STUDENT_INFO.RNO = RESULT.RNO
WHERE SPI <>
	(
		SELECT SPI FROM RESULT
		INNER JOIN STUDENT_INFO ON RESULT.RNO = STUDENT_INFO.RNO
		WHERE STUDENT_INFO.BRANCH = 'EC'
	)

--17. Display the names of students who scored higher SPI than student of RNO 103.

SELECT NAME FROM STUDENT_INFO 
JOIN RESULT ON STUDENT_INFO.RNO = RESULT.RNO
WHERE SPI >
	(
		SELECT SPI FROM RESULT
		INNER JOIN STUDENT_INFO ON RESULT.RNO = STUDENT_INFO.RNO
		WHERE STUDENT_INFO.RNO = 103
	)

--18. Display the students whose SPI is greater than average SPI of their own branch.

SELECT * FROM STUDENT_INFO S 
JOIN RESULT R ON S.RNO = R.RNO
WHERE SPI >
	(
		SELECT AVG(SPI) FROM RESULT
		INNER JOIN STUDENT_INFO S1 ON RESULT.RNO = S1.RNO
		WHERE S.BRANCH = S1.BRANCH
	)
	 
--19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the maximum SPI of ME branch.

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI > (
    SELECT AVG(R2.SPI)
    FROM RESULT R2
    INNER JOIN STUDENT_INFO S2 ON R2.RNO = S2.RNO
    WHERE S2.BRANCH = 'CE'
)
AND R.SPI > (
    SELECT MAX(R3.SPI)
    FROM RESULT R3
    INNER JOIN STUDENT_INFO S3 ON R3.RNO = S3.RNO
    WHERE S3.BRANCH = 'ME'
);


--20. Display the branch names whose average SPI is greater than the overall average SPI.

SELECT S.BRANCH FROM STUDENT_INFO S 
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY BRANCH
HAVING AVG(SPI) > 
	(
		SELECT AVG(SPI) FROM RESULT
	)


--21. Display the students who have maximum SPI in their respective branch.

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI = 
	(
		SELECT MAX(R2.SPI)
		FROM RESULT R2
		INNER JOIN STUDENT_INFO S2 ON R2.RNO = S2.RNO
		WHERE S2.BRANCH = S.BRANCH
	)

--22. Display the students whose SPI is greater than their average SPI of their branch and greater than overall average SPI.

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI > 
	(
		SELECT AVG(R2.SPI)
		FROM RESULT R2
		INNER JOIN STUDENT_INFO S2 ON R2.RNO = S2.RNO
		WHERE S2.BRANCH = S.BRANCH
	)
AND R.SPI > 
	(
		SELECT AVG(R3.SPI)
		FROM RESULT R3
	)

--23. Display the students whose SPI is greater than at least one student of every branch.

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE NOT EXISTS 
	(
		SELECT 1
		FROM STUDENT_INFO S2
		INNER JOIN RESULT R2 ON S2.RNO = R2.RNO
		GROUP BY S2.BRANCH
		HAVING MIN(R2.SPI) >= R.SPI
	)

--24. Display the students whose SPI is less than all students of CE branch.

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI < 
	(
		SELECT MIN(R.SPI)
		FROM RESULT R
		INNER JOIN STUDENT_INFO S2 ON R.RNO = S2.RNO
		WHERE BRANCH = 'CE'
	)

--25. Display the branch that contains the student with highest SPI.

SELECT BRANCH FROM STUDENT_INFO 
JOIN RESULT ON STUDENT_INFO.RNO = RESULT.RNO
WHERE SPI =
	(
		SELECT MAX(SPI) FROM RESULT
		INNER JOIN STUDENT_INFO ON RESULT.RNO = STUDENT_INFO.RNO
	)

--26. Display the students whose SPI is less than the SPI of every student in CE branch and greater than every student in ME branch

SELECT S.NAME, S.BRANCH, R.SPI
FROM STUDENT_INFO S
INNER JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI < 
	(
		SELECT MIN(R2.SPI)
		FROM RESULT R2
		INNER JOIN STUDENT_INFO S2 ON R2.RNO = S2.RNO
		WHERE S2.BRANCH = 'CE'
	)
	AND R.SPI > 
	(
		SELECT MAX(R3.SPI)
		FROM RESULT R3
		INNER JOIN STUDENT_INFO S3 ON R3.RNO = S3.RNO
		WHERE S3.BRANCH = 'ME'
	)
