DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10, 2) CHECK (salary > 0),
	joining_date DATE NOT NULL,
	age INT CHECK (age >= 18)
);

SELECT * FROM employees;

INSERT INTO employees (first_name, last_name, department,salary, joining_date, age)
	VALUES ('Shweta', 'Kumari', 'IT', '60000.00', '2022-05-01', 21),
	('Neha', 'kumari', 'HR', '55000.00', '2021-05-01', 32),
	('Soni', 'Kumari', 'Finance', '70000.00', '2020-01-05', 25),
	('Ravi', 'Verma', 'IT', '80000.00', '2024-02-05', 35),
	('Suresh', 'Reddy', 'Operation', '50000.00', '2023-01-05', 28);

-- Assignment Questions
--Q1: Retrieve all employees’ first_name and their departments.

SELECT first_name, department from employees;

--Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%.

UPDATE employees
SET salary=salary + (salary*0.1)
WHERE department ='IT';

--Q3: Delete all employees who are older than 34 years.

DELETE FROM employees
WHERE age>34;

--Q4: Add a new column `email` to the `employees` table.

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

--Q5: Rename the `department` column to `dept_name`.

ALTER TABLE employees
RENAME COLUMN department TO dept_name;

--Q6: Retrieve the names of employees who joined after January 1, 2021.

SELECT first_name, last_name, joining_date FROM employees
WHERE joining_date > '2021-01-01';
--Q7: Change the data type of the `salary` column to `INTEGER`.

ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;
--Q8: List all employees with their age and salary in descending order of salary.

SELECT first_name, age, salary FROM employees ORDER BY salary DESC;

--Q9: Insert a new employee with the following details:
-- ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30)

INSERT INTO employees(first_name, last_name, dept_name, salary, joining_date, age)
VALUES('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);

--Q10: Update age of employee +1 to every employee 

UPDATE employees
SET age=age+1;
SELECT * FROM employees;