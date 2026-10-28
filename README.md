<div align="center">

# 🗄️ T-SQL Toolkit

### Practical Microsoft SQL Server queries and patterns, from `SELECT TOP` to window functions and stored procedures.

<p>
  <img src="https://img.shields.io/badge/T--SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="T-SQL"/>
  <img src="https://img.shields.io/badge/SQL_Server-2019%2B-A91D22?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server"/>
  <img src="https://img.shields.io/badge/SSMS-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="SSMS"/>
  <img src="https://img.shields.io/badge/Azure_Data_Studio-0078D4?style=for-the-badge&logo=azuredevops&logoColor=white" alt="Azure Data Studio"/>
</p>

<p>
  <img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="license"/>
  <img src="https://img.shields.io/badge/PRs-welcome-orange?style=flat-square" alt="PRs welcome"/>
  <img src="https://img.shields.io/badge/queries-tested-success?style=flat-square" alt="tested"/>
</p>

</div>

---

## 📖 About

A compact reference of **T-SQL** scripts for Microsoft SQL Server. Each topic has a short overview, performance notes, a query preview, and a link to the full script.

## 📑 Contents

<div align="center">

[![Schema](https://img.shields.io/badge/🧱_Schema-4B8BBE?style=for-the-badge)](#-schema)
[![Querying](https://img.shields.io/badge/🔎_Querying-8E44AD?style=for-the-badge)](#-querying)
[![Joins](https://img.shields.io/badge/🔗_Joins-E67E22?style=for-the-badge)](#-joins)
[![Aggregations](https://img.shields.io/badge/📊_Aggregations-16A085?style=for-the-badge)](#-aggregations)

[![CTEs](https://img.shields.io/badge/🪆_CTEs-27AE60?style=for-the-badge)](#-ctes)
[![Window Functions](https://img.shields.io/badge/🪟_Window_Functions-2C3E50?style=for-the-badge)](#-window-functions)
[![Indexes](https://img.shields.io/badge/⚡_Indexes-C0392B?style=for-the-badge)](#-indexes)
[![Transactions](https://img.shields.io/badge/🔐_Transactions-F39C12?style=for-the-badge)](#-transactions)

[![Procedures](https://img.shields.io/badge/🎭_Procedures-2980B9?style=for-the-badge)](#-procedures)
[![Cheat Sheet](https://img.shields.io/badge/🚀_Cheat_Sheet-555555?style=for-the-badge)](#-performance-cheat-sheet)

</div>

## 📂 Repo Structure

```
tsql-toolkit/
├── 01-schema.sql
├── 02-querying.sql
├── 03-joins.sql
├── 04-aggregations.sql
├── 05-ctes.sql
├── 06-window-functions.sql
├── 07-indexes.sql
├── 08-transactions.sql
├── 09-procedures.sql
├── sample-data.sql
└── README.md
```

---

## 🚀 Performance Cheat Sheet

| Operation | Typical Plan | Time |
|---|---|:---:|
| `WHERE` on indexed column | Index Seek | `O(log n)` |
| `WHERE` on unindexed column | Table / Clustered Index Scan | `O(n)` |
| `ORDER BY` without index | Sort | `O(n log n)` |
| Indexed join, small outer | Nested Loops | `O(n log m)` |
| Large unsorted join | Hash Match | `O(n + m)` |
| Pre-sorted join | Merge Join | `O(n + m)` |
| `INSERT` with indexes | Index maintenance | `O(log n)` per index |

<sub>Confirm with the actual execution plan (`Ctrl+M` in SSMS) or `SET STATISTICS IO, TIME ON`.</sub>

---

## 🧱 Schema

> Tables, keys, and constraints. T-SQL uses `IDENTITY` for auto-increment and `NVARCHAR` for Unicode text.

```sql
CREATE TABLE dbo.Employees (
    Id        INT IDENTITY(1,1) PRIMARY KEY,
    Name      NVARCHAR(100)  NOT NULL,
    DeptId    INT            NULL REFERENCES dbo.Departments(Id),
    Salary    DECIMAL(10,2)  CHECK (Salary > 0),
    HiredOn   DATE           DEFAULT CAST(GETDATE() AS DATE)
);
```

**Perf note:** a `PRIMARY KEY` creates a clustered index by default. Index foreign key columns to speed up joins.

[![Open script](https://img.shields.io/badge/📄_01--schema.sql-CC2927?style=for-the-badge)](01-schema.sql)

## 🔎 Querying

> `TOP`, `OFFSET/FETCH`, `CASE`, `LIKE`, and `IIF` cover most everyday filtering.

```sql
SELECT TOP (10) Name, Salary,
       IIF(Salary >= 100000, 'Senior', 'Standard') AS Level
FROM dbo.Employees
WHERE DeptId IN (10, 20)
ORDER BY Salary DESC;
```

**Perf note:** `LIKE 'abc%'` can seek an index; `LIKE '%abc'` forces a scan. Avoid `SELECT *`.

[![Open script](https://img.shields.io/badge/📄_02--querying.sql-CC2927?style=for-the-badge)](02-querying.sql)

## 🔗 Joins

> `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `CROSS`, and `CROSS APPLY` (T-SQL's lateral join).

```sql
SELECT d.Name AS Department, e.Name AS Employee
FROM dbo.Departments d
LEFT JOIN dbo.Employees e ON e.DeptId = d.Id;
```

**Perf note:** SQL Server picks Nested Loops, Hash Match, or Merge Join based on row counts and indexes.

[![Open script](https://img.shields.io/badge/📄_03--joins.sql-CC2927?style=for-the-badge)](03-joins.sql)

## 📊 Aggregations

> `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`, plus `STRING_AGG` for concatenation.

```sql
SELECT DeptId,
       COUNT(*)                AS Headcount,
       AVG(Salary)             AS AvgSalary,
       STRING_AGG(Name, ', ')  AS Members
FROM dbo.Employees
GROUP BY DeptId
HAVING COUNT(*) >= 5;
```

**Perf note:** filter with `WHERE` before grouping; use `HAVING` only for aggregate conditions.

[![Open script](https://img.shields.io/badge/📄_04--aggregations.sql-CC2927?style=for-the-badge)](04-aggregations.sql)

## 🪆 CTEs

> `WITH` names intermediate results and supports recursion for hierarchies.

```sql
WITH DeptAvg AS (
    SELECT DeptId, AVG(Salary) AS AvgSalary
    FROM dbo.Employees
    GROUP BY DeptId
)
SELECT e.Name, e.Salary
FROM dbo.Employees e
JOIN DeptAvg d ON d.DeptId = e.DeptId
WHERE e.Salary > d.AvgSalary;
```

**Perf note:** SQL Server inlines CTEs rather than caching them, so a CTE used twice is evaluated twice.

[![Open script](https://img.shields.io/badge/📄_05--ctes.sql-CC2927?style=for-the-badge)](05-ctes.sql)

## 🪟 Window Functions

> `ROW_NUMBER`, `RANK`, `LAG`, `LEAD`, and running totals without collapsing rows.

```sql
SELECT Name, DeptId, Salary,
       RANK() OVER (PARTITION BY DeptId ORDER BY Salary DESC) AS DeptRank,
       SUM(Salary) OVER (PARTITION BY DeptId ORDER BY HiredOn
                         ROWS UNBOUNDED PRECEDING)             AS RunningPayroll
FROM dbo.Employees;
```

**Perf note:** an index on `(PartitionCol, OrderCol)` can avoid the sort. Specify `ROWS` rather than the default `RANGE` frame for faster running totals.

[![Open script](https://img.shields.io/badge/📄_06--window--functions.sql-CC2927?style=for-the-badge)](06-window-functions.sql)

## ⚡ Indexes

> Clustered (the table itself, one per table) and nonclustered (a separate structure, many allowed).

```sql
CREATE NONCLUSTERED INDEX IX_Emp_Dept_Salary
    ON dbo.Employees (DeptId, Salary)
    INCLUDE (Name);
```

| Index | Lookup | Best For |
|---|:---:|---|
| Clustered | `O(log n)` | Range scans, primary lookups |
| Nonclustered | `O(log n)` | Selective filters |
| Covering (`INCLUDE`) | `O(log n)` | Avoiding key lookups |

[![Open script](https://img.shields.io/badge/📄_07--indexes.sql-CC2927?style=for-the-badge)](07-indexes.sql)

## 🔐 Transactions

> Atomic work with `TRY...CATCH`. Default isolation is `READ COMMITTED`.

```sql
BEGIN TRY
    BEGIN TRANSACTION;
        UPDATE dbo.Accounts SET Balance -= 500 WHERE Id = 1;
        UPDATE dbo.Accounts SET Balance += 500 WHERE Id = 2;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
```

**Perf note:** keep transactions short. Snapshot isolation (`READ_COMMITTED_SNAPSHOT`) reduces blocking between readers and writers.

[![Open script](https://img.shields.io/badge/📄_08--transactions.sql-CC2927?style=for-the-badge)](08-transactions.sql)

## 🎭 Procedures

> Reusable logic via stored procedures, views, and functions.

```sql
CREATE OR ALTER PROCEDURE dbo.GetDeptEmployees
    @DeptId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Name, Salary
    FROM dbo.Employees
    WHERE DeptId = @DeptId;
END;
GO

EXEC dbo.GetDeptEmployees @DeptId = 10;
```

**Perf note:** `SET NOCOUNT ON` trims network chatter; parameterized procedures get cached plans.

[![Open script](https://img.shields.io/badge/📄_09--procedures.sql-CC2927?style=for-the-badge)](09-procedures.sql)

---

## 🤝 Contributing

Fork, branch, follow the `NN-topic.sql` naming, test against `sample-data.sql`, and open a PR.

<div align="center">

[![Star](https://img.shields.io/badge/⭐_Star_this_Repo-FFD700?style=for-the-badge&logoColor=black)](../../stargazers)
[![Fork](https://img.shields.io/badge/🍴_Fork-lightgrey?style=for-the-badge)](../../fork)

<sub>Released under the MIT License.</sub>

</div>
