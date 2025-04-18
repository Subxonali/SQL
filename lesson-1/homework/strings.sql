--Lesson 1: Introduction to SQL Server and SSMS

--Easy

--  1. Define the following terms: data, database, relational database, and table.

-- Data refers to raw facts, figures, or information

-- Database an organized collection of data

---A relational database is a type of database that stores data in tables with predefined relationships between them.

--A table is a set of data organized in rows and columns within a database.

-- 2. List five key features of SQL Server

/*Here are five key features of SQL Server:

1. Relational Database Engine
At its core, SQL Server uses a relational model to store and manage data. It supports Structured Query Language (SQL) to retrieve and manipulate data efficiently.

2. Security Features
SQL Server offers robust security, including:

Authentication & Authorization

Data Encryption

Row-Level Security

Transparent Data Encryption (TDE)

3. High Availability & Disaster Recovery (HA/DR)
Features like:

Always On Availability Groups

Failover Clustering

Log Shipping

Database Mirroring (deprecated but still used in some systems)
help ensure minimal downtime and data loss.

4. Business Intelligence (BI) Tools
SQL Server integrates with BI tools like:

SQL Server Reporting Services (SSRS)

SQL Server Integration Services (SSIS)

SQL Server Analysis Services (SSAS)
These help in reporting, data transformation, and advanced analytics.

5. Scalability & Performance Optimization
Includes features like:

Query Optimizer

Indexes

In-Memory OLTP (Hekaton)

Partitioning

Parallel Query Processing
to handle large volumes of data efficiently.*/

-- 3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

/*There are two main authentication modes available when connecting to SQL Server:

1. Windows Authentication
Uses your Windows user account to connect to SQL Server.

It's integrated with Active Directory and is generally considered more secure.

No need to enter a username/password in the app — it uses your current Windows login credentials.

✅ Best for enterprise environments where users are already authenticated on a domain.

2. SQL Server Authentication
Requires a separate SQL Server username and password (like sa user).

Credentials are managed within SQL Server, not tied to Windows accounts.

✅ Useful when Windows Authentication isn’t possible — for example, external apps or cross-platform connections.*/


/*
Medium
 4. Create a new database in SSMS named SchoolDB.
 5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
 6. Describe the differences between SQL Server, SSMS, and SQL.
*/


--4. Create a new database in SSMS named SchoolDB.

CREATE DATABASE SchoolDB

USE SchoolDB

CREATE TABLE Students (
   StudentID INT PRIMARY KEY,
   Name VARCHAR(50),
   Age INT
   )


--5.  Describe the differences between SQL Server, SSMS, and SQL.

--SQL Server = the engine (stores and processes data)

--SSMS = the tool (lets you work with SQL Server easily)

--SQL = the language (used to talk to the database)

-- Hard

--6.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
-- 7.Write a query to insert three records into the Students table.
-- 8.Create a backup of your SchoolDB database and restore it. (write its steps to submit)

--6. 

/*1. DQL – Data Query Language
🔍 Used to retrieve data from the database.



Command: SELECT

Example:

sql
Copy
Edit
SELECT * FROM Students;
2. DML – Data Manipulation Language
✏️ Used to insert, update, delete data in tables.

Commands: INSERT, UPDATE, DELETE

Examples:

sql
Copy
Edit
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Alice', 20);
UPDATE Students SET Age = 21 WHERE StudentID = 1;
DELETE FROM Students WHERE StudentID = 1;
3. DDL – Data Definition Language
🛠️ Used to define or modify database structure.

Commands: CREATE, ALTER, DROP

Examples:

sql
Copy
Edit
CREATE TABLE Students (...);
ALTER TABLE Students ADD Grade VARCHAR(5);
DROP TABLE Students;
4. DCL – Data Control Language
🔐 Used to control access to data.

Commands: GRANT, REVOKE

Examples:

sql
Copy
Edit
GRANT SELECT ON Students TO user1;
REVOKE SELECT ON Students FROM user1;
5. TCL – Transaction Control Language
🔄 Used to manage transactions (group of SQL operations).

Commands: COMMIT, ROLLBACK, SAVEPOINT

Examples:

sql
Copy
Edit
BEGIN TRANSACTION;
UPDATE Students SET Age = 22 WHERE StudentID = 2;
COMMIT;*/


INSERT INTO Students (StudentID, Name, Age) VALUES
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 19);


