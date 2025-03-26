CREATE DATABASE lesson11

use lesson11

/*Task 1: Basic INNER JOIN
Question: Retrieve all employee names along with their corresponding department names. */

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);



INSERT INTO Employees VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');



SELECT*FROM Employees
SELECT*FROM Departments


SELECT EMP.Name, DEP.DepartmentName from Employees EMP

LEFT  JOIN Departments DEP ON EMP.DepartmentID=DEP.DepartmentID

/*Task 2: LEFT JOIN
Question: List all students along with their class names, including students who are not assigned to any class.*/

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    ClassID INT
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'John', 201),
(2, 'Emma', NULL),
(3, 'Liam', 202);

INSERT INTO Classes VALUES
(201, 'Math'),
(202, 'Science');


SELECT*FROM Students
SELECT*FROM Classes

SELECT S.StudentName,C.ClassName   FROM Students S

LEFT JOIN Classes C ON S.ClassID=C.ClassID


/*Task 3: RIGHT JOIN
Question: List all customers and their orders, including customers who haven’t placed any orders.*/


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Orders VALUES
(1, 301, '2024-11-01'),
(2, 302, '2024-11-05');

INSERT INTO Customers VALUES
(301, 'Alice'),
(302, 'Bob'),
(303, 'Charlie');

SELECT*FROM Orders
SELECT*FROM Customers

SELECT*FROM Orders o

right join Customers c on o.CustomerID=c.CustomerID

/*Task 4: FULL OUTER JOIN
Question: Retrieve a list of all products and their sales, including products with no sales and sales with invalid product references.*/


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);

INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Tablet'),
(3, 'Phone');

INSERT INTO Sales VALUES
(100, 1, 10),
(101, 2, 5),
(102, NULL, 8);

SELECT*FROM Products
SELECT*FROM Sales

SELECT*FROM Products p
full join Sales s on p.ProductID=s.ProductID


/*Task 5: SELF JOIN
Question: Find the names of employees along with the names of their managers.*/


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2);

SELECT A.EmployeeID,A.Name, b.Name AS 'ManagerName'  FROM Employees A
LEFT JOIN Employees B ON A.ManagerID=B.EmployeeID


/*Task 6: CROSS JOIN
Question: Generate all possible combinations of colors and sizes.
*/

CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(50)
);

CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(50)
);

INSERT INTO Colors VALUES
(1, 'Red'),
(2, 'Blue');

INSERT INTO Sizes VALUES
(1, 'Small'),
(2, 'Medium');

SELECT*FROM Colors
SELECT*FROM Sizes

SELECT*FROM Colors 
cross join Sizes 


/* Task 7: Join with WHERE Clause
Question: Find all movies released after 2015 and their associated actors.*/


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    Name VARCHAR(50),
    MovieID INT
);

INSERT INTO Movies VALUES
(1, 'Inception', 2010),
(2, 'Interstellar', 2014),
(3, 'Dune', 2021);

INSERT INTO Actors VALUES
(101, 'Leonardo DiCaprio', 1),
(102, 'Matthew McConaughey', 2),
(103, 'Timothйe Chalamet', 3);


SELECT*FROM Actors
SELECT*FROM Movies

SELECT*FROM Actors a
left join Movies m on a.MovieID=M.MovieID
WHERE M.ReleaseYear>2015

/*Task 8: MULTIPLE JOINS
Question: Retrieve the order date, customer name, and the product ID for all orders.
*/
DROP TABLE IF EXISTS Orders
DROP TABLE IF EXISTS Customers
DROP TABLE IF EXISTS OrderDetails

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT
);

INSERT INTO Orders VALUES
(1, 401, '2024-11-01'),
(2, 402, '2024-11-05');

INSERT INTO Customers VALUES
(401, 'Alice'),
(402, 'Bob');

INSERT INTO OrderDetails VALUES
(1001, 1, 501),
(1002, 2, 502);


SELECT*FROM Orders
SELECT*FROM Customers
SELECT*FROM OrderDetails

SELECT o.OrderDate, c.CustomerName,od.ProductID FROM Orders o
left join Customers c on o.CustomerID=c.CustomerID
left join OrderDetails od on o.OrderID=od.OrderID


/*Task 9: JOIN with Aggregation
Question: Calculate the total revenue generated for each product.*/


DROP TABLE IF EXISTS Sales
DROP TABLE IF EXISTS Products


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Sales VALUES
(1, 601, 3),
(2, 602, 5),
(3, 601, 2);

INSERT INTO Products VALUES
(601, 'TV', 500),
(602, 'Speaker', 150);

SELECT*FROM Sales
SELECT*FROM Products

SELECT s.ProductID,s.Quantity,p.ProductName,p.Price, s.Quantity*p.Price as 'TotalRevenue' from Sales s
left join Products p on s.ProductID=p.ProductID
