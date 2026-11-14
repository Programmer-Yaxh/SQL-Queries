CREATE DATABASE xyz_company;
USE xyz_company;
CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
INSERT INTO employee
(id,name,salary)
VALUES
(111,"Yash",20000),
(112,"Aryan",15000),
(113,"Karan",17000),
(114,"Aashu",21000);
SELECT * FROM employee;

CREATE DATABASE college;
USE college;

CREATE TABLE student(
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101,"Yash",89,'B',"Delhi"),
(102,"Aryan",95,'A',"Delhi"),
(103,"Karan",85,'B',"Delhi"),
(104,"Suraj",80,'B',"Bihar"),
(105,"Aashu",76,'C',"Mumbai"),
(106,"Nitesh",90,'A',"Mumbai"),
(107,"Abhi",88,'B',"Bihar");

SELECT * FROM student;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

SELECT city
FROM student
WHERE grade='A'
GROUP BY city
HAVING MAX(marks)>=90
ORDER BY city ASC;

UPDATE student
SET grade='A'
WHERE rollno=101;

SELECT * FROM student;

ALTER TABLE student
CHANGE full_name name VARCHAR(50);

DELETE FROM student
WHERE marks<80;

ALTER TABLE student
DROP COLUMN grade;

SELECT name,marks
FROM student
WHERE marks >
(SELECT AVG(marks) FROM student);

SELECT name
FROM student
WHERE rollno IN
(SELECT rollno
FROM student
WHERE rollno%2=0);


-- LECTURE
CREATE DATABASE mydatabase;
USE mydatabase;

CREATE TABLE table1(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    score INT
);

INSERT INTO table1
(id,name,country,score)
VALUES
(1,"Maria","Germany",350),
(2,"John","USA",900),
(3,"Georg","UK",750),
(4,"Martin","Germany",500),
(5,"Peter","USA",0);

SELECT * FROM table1;

SELECT name,country
FROM table1;

--Where clause

SELECT name,score
FROM table1
WHERE score !=0;

SELECT * 
FROM table1
WHERE country="Germany";

--Order by clause

SELECT *
FROM table1
ORDER BY score DESC;

SELECT *
FROM table1
ORDER BY country ASC, score DESC;

--Group by clause
SELECT country,
sum(score) as total_scr
FROM table1
GROUP BY COUNTRY;

--Find the total score and total number of customers for ecah country
SELECT country,
SUM(score) as total
count(name) as no.