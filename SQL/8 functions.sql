DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100),
	category VARCHAR(50),
	price NUMERIC(10, 2),
	quantity INT,
	added_date DATE,
	discount_rate NUMERIC(5,2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', '12000.00', 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

SELECT * FROM products;
--AGGREGATE FUNCTION

-- total quantity available of all products
SELECT SUM(quantity) AS total_quantity
FROM products;
-- 
SELECT SUM(quantity) AS quantity_of_ele
FROM products
WHERE category='Electronics' AND price > 20000;
-- total no. of products
SELECT COUNT(*) AS total_products
FROM products;
-- count with condition
SELECT COUNT(*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';
-- AVG. priceof he products
SELECT AVG(price) AS average_price
FROM products;
-- avg. price with condition
SELECT AVG(price) AS average_price
FROM products
WHERE category='Accessories' OR added_date > '2024-02-01';
-- amx amd min price
SELECT MAX(price) AS MAX_PRICE,
		MIN(price) AS MIN_PRICE
FROM products;

-- STING FUNCTION IN SQL

-- Get all the category in UPPERcase
SELECT UPPER(category) AS Category_Capital
FROM products;
-- Get all the category in Lowercase
SELECT LOWER(category) AS Category_Small
FROM products;
-- join product_name and category text with hypen.
SELECT CONCAT(product_name,'-',category) AS product_details
FROM products;
-- Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name, 1,5) AS short_name
FROM products;
-- count length
SELECT product_name, LENGTH(product_name) AS count_of_char
FROM products;
-- remove leading and traling spaces from string
SELECT LENGTH (TRIM('  Monitor  ')) AS Trimmed_text;
SELECT LENGTH ('  Monitor  ') AS Trimmed_text;
-- Replace word "phone" with "device" in product name
SELECT REPLACE(product_name, 'phone','device') AS updated_name
FROM products;
-- Get the first 3 characters from category
SELECT LEFT(category, 3) AS Category_right_char
FROM products;
-- Get the first 3 characters from category
SELECT RIGHT(category, 3) AS Category_left_char
FROM products;

-- DATE & TIME FUNCTION IN SQL

-- NOW() - get current date and time
SELECT NOW() AS current_date_time;
-- CURRENT_DATE() - Get current date
SELECT CURRENT_DATE AS today_date;

SELECT added_date, Current_Date, (CURRENT_DATE- added_date) AS Days_difference
FROM products;
-- EXTRACT() - Extract parts of a Date
-- Extract the year, month, and day from the added_date column.
SELECT product_name,
	EXTRACT(YEAR FROM added_date) AS year_added,
	EXTRACT(MONTH FROM added_date) AS month_added,
	EXTRACT(DAY FROM added_date) AS day_added
FROM products;
-- AGE() - clculate age between dates
-- calculate the time difference between added_date and today's date.
SELECT product_name,
		AGE(CURRENT_DATE, added_date) AS Age_since_added
FROM products;		
-- TO_CHAR()- Format dates as strings
-- Format added-date in a custom Format (dd-mm-yyyy).
SELECT product_name,
		TO_CHAR(added_date, 'DD-MM-YYYY') AS Format_Date
FROM products;	
-- DATE_PART() - get specific date part
-- Extract the day of the week from added_date.
SELECT product_name, added_date,
	DATE_PART('year', added_date) AS day_of_week
	FROM products;

SELECT * FROM products;
-- DATE_TRUC() - Truncate Date to precision
-- Truncate added_date to the start of the month.
SELECT product_name, added_date,
	DATE_TRUNC('month', added_date) AS Month_start
FROM products;
-- INTERVAL - Add or subtract time intervals
-- Add 6 months to he added_date.
SELECT product_name, added_date,
	added_date + INTERVAL '6 Months' AS new_date
FROM products;
-- CURRENT_TIME() - Get current Time
-- Retrive only the current time.
SELECT CURRENT_TIME AS Current_time;
-- TO_DATE() - Convert string to date
-- convert a string to a date format.
SELECT TO_DATE('21-09-2026', 'DD-MM-YYYY') AS converted_date;

-- CONDITIONAL FUNCTION
/* 1. CASE Function - Catergorizing based on conditions 
we will categorize products into price range:

Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/

SELECT product_name, price, 
	CASE
		WHEN price>=50000 THEN 'Expensive'
		WHEN price>=10000 AND price<=49999 THEN 'Moderate'
		ELSE 'Affordable'
	END AS price_category
FROM products;

-- Assignment on CASE Function/*
/* 2. CASE with AND & OR Operator - stock status
we wil classify products based on quantity available:

In stock if quantity is 10 or more.
Limited stock if quantity is between 5 an 9.
Out of stock Soon if quantity is less than 5.
*/

SELECT product_name, quantity, 
	CASE
	WHEN quantity >=10 THEN 'Instock'
	WHEN quantity BETWEEN 6 AND 9 THEN 'Limited stock'
	ELSE 'Out of stock'
END AS stock_status
FROM products;

/* 3. CASE with LIKE Operator - category Classification
check if the category name contains "Electronics" or "Furniture" using LIKE.
*/

SELECT product_name, category, 
	CASE
	WHEN category LIKE 'Electronics%' THEN 'Electronics Item'
	WHEN category LIKE 'Furniture%' THEN 'Furniture Item'
	ELSE 'Accessory Item'
END AS category_status
FROM products;

-- COALESCE FUNCTION IN SQL
-- (Handling NULL Values)
SELECT* FROM products;

ALTER TABLE products
DROP column discount_price;

ALTER TABLE products
ADD COLUMN discount_price NUMERIC(10,2);

UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop', 'Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN('Laptop', 'Desk');

SELECT product_name, price, discount_price
FROM products;

SELECT product_name,
	COALESCE(discount_price, price) AS Final_price
FROM products;

FROM products;

-- WINDOW FUNCTION IN SQL
-- Assign a unique row number to each product within the same category.
SELECT product_name, category, price,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;

SELECT product_name, category, price,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS Ranking
FROM products;

SELECT product_name, category, price,
	SUM(price) OVER(PARTITION BY category ORDER BY price ASC) AS running_total
FROM products;

-- Deleting duplicate row (it my own)
-- Remove duplicate products and keep the first record
DELETE FROM products
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products
    GROUP BY product_name, category, price, quantity, added_date, discount_rate
);

SELECT* FROM products;


