-- Creating employees table
CREATE TABLE Employees3n(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_n
	)

SELECT * FROM Departments;
-- Left JOIN
SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id, d.department_name
FROM Employees3 e
LEFT JOIN
Departments d
ON e.department_id=d.department_id;

-- Right JOIN
SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id, d.department_name
FROM Employees3 e
RIGHT JOIN
Departments d
ON e.department_id=d.department_id;

-- FULL OUTER JOIN
SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id, d.department_name
FROM Employees3 e
FULL OUTER JOIN
Departments d
ON e.department_id=d.department_id;

-- CROSS JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM Employees3 e
CROSS JOIN
	Departments d;

-- SELF JOIN
SELECT e1.first_name AS Employee_name1,
		e2.first_name AS Employee_name2,
		d.department_name
FROM employees3 e1 JOIN employees3 e2
ON e1.department_id=e2.department_id
JOIN
departments d
ON 
e1.department_id=d.department_id;

