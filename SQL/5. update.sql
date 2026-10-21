DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	age INT,
	city VARCHAR(50)
);

INSERT INTO users (username, email, age, city) VALUES
	('Shweta', 'shweta@gmail.com', 21, 'Raxaul'),
	('Shweta Kumari', 'shwetkumaria@gmail.com', 20, 'Patna'),
	('soni', 'soni@gmail.com', 23, 'pune');

SELECT * FROM users;

SELECT user_id, username FROM users;

UPDATE users 
SET age=26
WHERE username='Shweta';

SELECT * FROM users ORDER BY user_id ASC;

UPDATE users 
SET city='Chennai'
WHERE age>=23;

UPDATE users 
SET age=28, city='kolkata'
WHERE username='Shweta';

UPDATE USERS
SET
	AGE = AGE + 1
WHERE
	EMAIL LIKE '%@gmail.com';

SELECT * FROM users ORDER BY user_id ASC;

-- to rename the username column to full_name

ALTER TABLE users
RENAME COLUMN username TO full_name;

-- to change the age columns data type from INT to SMALLINT

ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;

-- to add a NOT NULL CONSTRAINT to city column

ALTER TABLE users
ALTER COLUMN city SET NOT NULL;

-- adding CHECK CONSTRAINT to age column

ALTER TABLE users
ADD CONSTRAINT age CHECK(age>=18);

INSERT INTO users (full_name, email, age, city) VALUES
	('Ram', 'Ram@gmail.com', 22, 'Raxaul');

ALTER TABLE users
RENAME TO customers;

SELECT * FROM customers ORDER BY user_id ASC;
