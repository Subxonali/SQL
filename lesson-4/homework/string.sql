CREATE DATABASE lesson4

USE lesson4

--Homework 1

CREATE TABLE salespeople(salesman_id INT,name VARCHAR(50),city VARCHAR(50),commision DECIMAL(4,2))

INSERT INTO salespeople VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

--Task 1

SELECT*FROM salespeople WHERE city in('Paris','Rome')

--Task 2

SELECT*FROM salespeople WHERE city='Paris' or city='Rome'

--Task 3

SELECT*FROM salespeople WHERE city NOT in('Paris','Rome')

--Task 4

CREATE TABLE customers (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO customers VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT*FROM customers

WHERE customer_id in(3007,3008,3009)


--Task 5

SELECT*FROM salespeople

WHERE commision between 0.12 and 0.14 


--Task 6

CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders  VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

SELECT*FROM orders

WHERE purch_amt between 500 and 4000
and purch_amt NOT IN(948.50,1983.43)


--Task 7

SELECT*FROM salespeople

WHERE name >='B' and name<'L'

--Task 8

SELECT*FROM salespeople

WHERE name < 'A' OR name >= 'N'

--Task 9

SELECT*FROM customers

WHERE cust_name like 'B%'

--Task 10

SELECT*FROM customers

WHERE cust_name like '%n'

--Task 11

SELECT*FROM salespeople

WHERE name like 'N__l%'

--Task 20

SELECT*FROM customers

WHERE grade is null


--Task 21

SELECT*FROM customers

WHERE grade is not null

--Task 22

CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);


INSERT INTO emp_details VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);

SELECT*FROM emp_details

WHERE EMP_LNAME like 'D%'
