Use lesson6
--Homework

--Puzzle 1

/*Question: Explain at least two ways to find distinct values based on two columns. */

CREATE TABLE InputTbl (col1 VARCHAR(1), col2 VARCHAR(1))
INSERT INTO InputTbl VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c',  'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

SELECT DISTINCT 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

--Puzzle 2
/*Counting 'a' for Different Types
Question: Count occurrences of 'a' in columns Value1, Value2, and Value3 for different Typs. */

CREATE TABLE GroupbyMultipleColumns ( ID INT, Typ VARCHAR(1), Value1 VARCHAR(1), Value2 VARCHAR(1), Value3 VARCHAR(1) );

INSERT INTO GroupbyMultipleColumns(ID, Typ, Value1, Value2, Value3) VALUES (1, 'I', 'a', 'b', ''), (2, 'O', 'a', 'd', 'f'), (3, 'I', 'd', 'b', ''), (4, 'O', 'g', 'l', ''), (5, 'I', 'z', 'g', 'a'), (6, 'I', 'z', 'g', 'a');

SELECT 
    Typ, 
    SUM(CASE WHEN Value1 = 'a' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN Value2 = 'a' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN Value3 = 'a' THEN 1 ELSE 0 END) AS a_count
FROM GroupbyMultipleColumns
GROUP BY Typ;

--Puzzle 3
/* Finding Duplicate Values
Question: Find values that appear more than once in the table.*/

CREATE TABLE TESTDuplicateCount ( ID INT, EmpName VARCHAR(100), EmpDate DATETIME );

INSERT INTO TESTDuplicateCount(ID,EmpName,EmpDate) VALUES (1,'Pawan','2014-01-05'), (2,'Pawan','2014-03-05'), (3,'Pawan','2014-02-05'), (4,'Manisha','2014-07-05'), (5,'Sharlee','2014-09-05'), (6,'Barry','2014-02-05'), (7,'Jyoti','2014-04-05'), (8,'Jyoti','2014-05-05');

Select*from TESTDuplicateCount

SELECT EmpName,
       SUM(CASE WHEN EmpName IS NOT NULL THEN 1 ELSE 0 END) AS duplicate_count
FROM TESTDuplicateCount
GROUP BY EmpName
HAVING SUM(CASE WHEN EmpName IS NOT NULL THEN 1 ELSE 0 END) > 1;
