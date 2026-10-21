DROP TABLE IF EXISTS employee2;

CREATE TABLE employee2(
	employee_id	INT	PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(100),
	department VARCHAR(20),	
	salary NUMERIC(10,2),	
	joining_date DATE,	
	age	INT	
);

SELECT * FROM employee2;

COPY
employee2 (employee_id, first_name, last_name, email, department,  salary, joining_date, age)
--FROM 'C:\Users\dell\Desktop\DATA ANALYTICS COURSE\3. SQL\ST - SQL ALL PRACTICE FILES SD61\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\employee_data.csv'
FROM 'E:\employee_data.csv'
DELIMITER','
CSV HEADER;

-- OPERATOR

-- Retrive the first_name, salary, and calculate a 10% bonus on the salary?

SELECT first_name, salary, (salary*0.10) AS Bonus
FROM employee2;

-- Calculate the annual salary and salary increment by 5% - show the monthly new salary as well?

SELECT first_name, last_name, salary,
-- Annual salary
	(salary*12) AS annual_salary,
-- increment salary by 5%
	(salary*0.05) AS increment_salary,
-- new salary
	(salary + salary*0.05) AS new_salary,
-- another way to calculate salary
	(salary *1.05) AS new_salary2
FROM employee2;

SELECT * FROM employee2;
-- Comparison Operaors

-- matches age 30
SELECT * FROM employee2
WHERE age=30;

-- matches all expect 30
SELECT first_name, age FROM employee2
WHERE age!=30;

-- salary greather than 50000
SELECT first_name, salary FROM employee2
WHERE salary<=50000;

-- logical operators
-- using AND operator
SELECT * FROM employee2
WHERE age>=45 AND salary >=50000;

-- using OR operator

SELECT * FROM employee2
WHERE age>60 OR salary >=90000;

-- using NOT operator

SELECT * FROM employee2
WHERE NOT (department='IT');

-- Between, Like and IN Operator
/*  1 retrive employees whose salary is between 40,000 and 60,000. - use BETWEEN Operators
	2 find employees whose email addresses end with gmail.com. - use LIKE Operators
	3 retrive employees who belong to either the 'Finance' on 'Marketing' on departments. - use IN Operator 
*/

-- 1.
SELECT first_name, last_name, salary
FROM employee2
WHERE salary BETWEEN 40000 AND 60000;
-- 2.
SELECT first_name, last_name, email
FROM employee2
WHERE email LIKE '%@gmail.com';
-- only J later 
SELECT first_name FROM employee2
WHERE first_name LIKE 'J%';
-- any name which contains a letter
SELECT first_name FROM employee2
WHERE first_name LIKE '%a%';

-- 3 .
SELECT first_name, last_name, department 
FROM employee2
WHERE department IN  ('Finance', 'Marketing');

-- IS NULL Operator, ORDER BY Operator, LIMIT Operator & DISTINCT Oerator.

/* 1 find employees where the email column is NULL  (if applicable).
	2 List employees Sorted by salary in DESCENDING order.
	3 Retrive the top 5 highest_paid employees.
	4 Retrive a List of unique departments
*/

-- 1.
SElect first_name, last_name, email
FROM employee2
WHERE email IS NULL;

-- 2.
SElect first_name, last_name, salary
FROM employee2
ORDER BY salary DESC;

--3.
SElect first_name, last_name, salary
FROM employee2
ORDER BY salary DESC
LIMIT 5;

-- 4.
SELECT DISTINCT department 
FROM employee2;
-- another way as unique count
SELECT COUNT (DISTINCT department) AS DEP_UNIQUE_COUNT
FROM employee2;


