CREATE TABLE employee(
		employee_ID SERIAL PRIMARY KEY,
		name VARCHAR(100) NOT NULL,
		postiion VARCHAR(50),
		department VARCHAR(50),
		hire_date DATE,
		salary NUMERIC(10,2)		
);

SELECT * FROM employee;

INSERT INTO employee(name, position, department,hire_date, salary)
		VALUES('Soni', 'Data Analyst', 'Data Science', '2022-05-15', 75000.00),
		('Shweta', 'MLEngineer', 'AI/ML', '2026-09-16', 80000.00),
		('Chandu', 'Software Engineer', 'IT', '2025-01-01', 85000.00),
		('Nandu','HR Manager', 'Human Resources', '2028-01-01', 90000.00),
		('Aman', 'BDA', 'Salse', '2026-05-01', 45000.00);

ALTER TABLE employee
RENAME COLUMN postiion TO position;

TRUNCATE TABLE employee;

TRUNCATE TABLE employee RESTART IDENTITY;
 


		