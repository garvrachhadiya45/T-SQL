SELECT * FROM AUTHOR
SELECT * FROM BOOK
SELECT * FROM PUBLISHER


--1. List all books with their authors. 

SELECT B.TITLE, A.AUTHORNAME
FROM BOOK B
JOIN AUTHOR A
ON B.AUTHORID = A.AUTHORID

--2. List all books with their publishers.

SELECT B.TITLE, P.PUBLISHERNAME
FROM BOOK B
JOIN PUBLISHER P
ON B.AUTHORID = P.PUBLISHERID

--3. List all books with their authors and publishers.

SELECT B.TITLE, A.AUTHORNAME, P.PUBLISHERNAME
FROM BOOK B
JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID
JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price.

SELECT B.TITLE, A.AUTHORNAME, P.PUBLISHERNAME, B.PRICE
FROM BOOK B
JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID
JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID
WHERE B.PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written.

SELECT A.AUTHORNAME, COUNT(B.BOOKID) AS NumberOfBooks
FROM AUTHOR A
JOIN BOOK B ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--6. List all publishers and the total price of books they have published.

SELECT P.PUBLISHERNAME, SUM(B.PRICE) AS TotalPrice
FROM PUBLISHER P
JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME

--7. List authors who have not written any books.

SELECT A.AUTHORNAME
FROM AUTHOR A
LEFT JOIN BOOK B ON A.AUTHORID = B.AUTHORID
WHERE B.AUTHORID IS NULL

--8. Display the total number of books written by each author along with the average price of their books.

SELECT A.AUTHORNAME,
COUNT(B.BOOKID) AS TotalBooks,
AVG(B.PRICE) AS AveragePrice
FROM AUTHOR A
JOIN BOOK B ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest.

SELECT P.PUBLISHERNAME, COUNT(B.BOOKID) AS NumberOfBooks
FROM PUBLISHER P
JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY NumberOfBooks DESC

--10. Display number of books published each year.

SELECT B.PUBLICATIONYEAR, COUNT(B.BOOKID) AS NumberOfBooks
FROM BOOK B
GROUP BY B.PUBLICATIONYEAR
ORDER BY B.PUBLICATIONYEAR


--11. List the publishers whose total book prices exceed 500, ordered by the total price. 

SELECT P.PUBLISHERNAME, SUM(PRICE)
FROM PUBLISHER P
JOIN BOOK B ON B.PUBLISHERID = P.PUBLISHERID
GROUP BY PUBLISHERNAME
HAVING SUM(PRICE) > 500
ORDER BY SUM(PRICE) DESC

--12. List most expensive book for each author, sort it with the highest price. 

SELECT MAX(B.PRICE) , A.AUTHORNAME
FROM BOOK B 
JOIN AUTHOR A ON A.AUTHORID = B.AUTHORID
GROUP BY AUTHORNAME

--13. Display publisher name and difference between maximum and minimum book price. 

SELECT MAX(B.PRICE)-MIN(B.PRICE) , P.PUBLISHERNAME
FROM BOOK B 
JOIN PUBLISHER P ON P.PUBLISHERID = B.AUTHORID
GROUP BY PUBLISHERNAME

--14. List publisher name and total price of books published each year. 

SELECT SUM(B.PRICE) , P.PUBLISHERNAME , B.PUBLICATIONYEAR
FROM BOOK B 
JOIN PUBLISHER P ON P.PUBLISHERID = B.AUTHORID
GROUP BY PUBLISHERNAME,PUBLICATIONYEAR

--15. Display author name and total price of books sorted by highest total price.

SELECT A.AUTHORNAME, SUM(B.PRICE) AS TotalPrice
FROM AUTHOR A
JOIN BOOK B ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME
ORDER BY TotalPrice DESC




CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    ManagerNo VARCHAR(10) NULL,
    FOREIGN KEY (ManagerNo) REFERENCES EMPLOYEE_MASTER(EmployeeNo)
)

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', 'E02'),
('E02', 'Rohan', NULL),
('E03', 'Priya', 'E02'),
('E04', 'Milan', 'E01'),
('E05', 'Jay', 'E03'),
('E06', 'Anjana', 'E01');

SELECT * FROM EMPLOYEE_MASTER 



--16. Retrieve the names of employee along with their manager’s name from the Employee table. 

SELECT E.NAME AS EMPLOYEE , M.NAME AS MANAGER
FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M
ON E.ManagerNo = M.EmployeeNo 

--17. Display employees who are managers. 

SELECT DISTINCT E1.EmployeeNo, E1.Name AS ManagerName
FROM EMPLOYEE_MASTER E1
JOIN EMPLOYEE_MASTER E2
ON E1.EmployeeNo = E2.ManagerNo

--18. Display number of employees working under each manager. 

SELECT M.Name AS ManagerName, COUNT(E.EmployeeNo) AS NumberOfEmployees
FROM EMPLOYEE_MASTER E
JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo
GROUP BY M.Name

--19. Display the employee’s name along with their manager’s name and senior manager name. 

SELECT E.Name AS EmployeeName,
M.Name AS ManagerName,
S.Name AS SeniorManagerName
FROM EMPLOYEE_MASTER E
LEFT JOIN EMPLOYEE_MASTER M 
ON E.ManagerNo = M.EmployeeNo
LEFT JOIN EMPLOYEE_MASTER S
ON M.ManagerNo = S.EmployeeNo

--20. Display managers and count of employees under them in descending order.  

SELECT M.Name AS ManagerName, COUNT(E.EmployeeNo) AS NumberOfEmployees
FROM EMPLOYEE_MASTER E
JOIN EMPLOYEE_MASTER M ON E.ManagerNo = M.EmployeeNo
GROUP BY M.Name
ORDER BY NumberOfEmployees DESC

