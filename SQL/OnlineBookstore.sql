-- create database
CREATE DATABASE OnlineBookstore;

-- switch to the database
‪E:\OnlineBookstore;

-- create tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(100),
	City VARCHAR(50),
	Country VARCHAR(150)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

SELECT * FROM Books;
SELECT * FROM Customers; 
SELECT * FROM Orders;
-- import data in to Books table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'E:\OnlineBookstore\Books.csv'
CSV HEADER;

--  Import data into customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'E:\OnlineBookstore\Customers.csv'
CSV HEADER;

-- Import Data into Orders Tbale
COPY Orders(Order_ID, Customer_id, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'E:\OnlineBookstore\Orders.csv'
CSV HEADER;

-- 1) Retrive all books in the "Fiction" genre:
SELECT * FROM Books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM Books
WHERE Published_Year > 1950;
-- 3) List all customer from the Canada;
SELECT * FROM Customers
WHERE Country = 'Canada';
-- 4) show orders placed in November 2023;
SELECT * FROM Orders
WHERE Order_date BETWEEN '2023-11-01' AND '2023-11-30';
-- 5) Retrive the total stock of books available;
SELECT SUM(stock) AS total_stock
FROM Books;
-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- 7) Show all customer who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE quantity >1;

-- 8) Retrive all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE total_amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books ORDER BY stock LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS revenue FROM Orders;

-- ADVANCE QUESTIONS

-- 1) Retrive the total number of books sold for each genre:
SELECT b.Genre, SUM(o.quantity) AS Total_books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_price
FROM Books
WHERE Genre = 'Fantasy';

-- 3) List customer who have placed at least 2 orders:
SELECT customer_id, COUNT(order_id) AS Order_count
FROM Orders
GROUP BY customer_id 
HAVING COUNT(Order_id) >=2;
-- same as 3 questio but output shows with customer name
SELECT o.customer_id, c.name, COUNT(o.order_id) AS Order_count
FROM Orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name 
HAVING COUNT(Order_id) >=2;

-- 4) Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM Orders o
JOIN Books b ON o.book_id=b.book_id
GROUP BY o.Book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1; 

-- 5) show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY price DESC lIMIT 3;

-- 6) Retrive the total quantity of book sold by each author:
SELECT b.author, SUM(o.quantity) AS Total_book_sold
FROM Orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;
-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.City, total_amount
FROM Orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;

-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name 
ORDER BY total_spent DESC LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity, 
	b.stock-COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN Orders  o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;
