--1 Check which users have access to the database
SELECT user_id, username, created, password_change_date FROM user_users;

--2 Check what tables are present in database displaying everything in user_tables
SELECT * FROM user_tables;

--3 Describe command
--3A
DESCRIBE orders;

--3B
DESCRIBE productlist;

--3C
DESCRIBE reviews;

--3D
DESCRIBE storefront;

--3E
DESCRIBE userbase;

--3F
DESCRIBE userlibrary;

--4 Display all data currently present in the database

--4A
SELECT * FROM orders;

--4B
SELECT * FROM productlist;

--4C
SELECT * FROM reviews;

--4D
SELECT * FROM storefront;

--4E
SELECT * FROM userbase;

--4F
SELECT * FROM userlibrary;

--5 What constraints are present in database display table_name, constraint_name, constraint_type, status from user constraints table
SELECT table_name, constraint_name, constraint_type, status FROM user_constraints;

--6 What views are present in the database
SELECT view_name, text AS view_text FROM user_views;

--7 Display every username in alphabetical order
SELECT username FROM userbase
ORDER BY username ASC;

--8 Display users with a yahoo email address
SELECT firstname, lastname, username, password, email FROM userbase
WHERE email LIKE '%@yahoo.com';

--9 Diplay users with less than 25 in wallet
SELECT username, birthday, walletfunds FROM userbase
WHERE walletfunds < 25;

--10 Display userid and productcode for user with more than 100 hours played
SELECT userid, productcode FROM userlibrary
WHERE hoursplayed > 100;

--11 Display productcode of games with less than 10 hours played
SELECT productcode FROM userlibrary
WHERE hoursplayed < 10;

--12 Display every unique publisher
SELECT DISTINCT publisher FROM productlist;

--13 Diplay productname, releasedate, publisher, and genre sorted by genre
SELECT productname, releasedate, publisher, genre FROM productlist
ORDER BY genre ASC;

--14 Display productcode publisher for products in strategy genre
SELECT productcode, publisher FROM productlist
WHERE genre = 'Strategy';

--15 Display productcode description and price for products costing more than 25 soreted by descending price
SELECT o.productcode, o.price, s.description FROM storefront s, orders o
WHERE s.productcode = o.productcode
AND o.price > 25
ORDER BY o.price DESC;

--16 Display inventoryid and price of all products in storefront, sorted by ascending price
SELECT inventoryid, price FROM storefront
ORDER BY price ASC;

--17 Display productcode and review for products with a 1 rating
SELECT productcode, review FROM reviews
WHERE rating = 1;

--18 Display productcode and review for products with rating of 4 or higher
SELECT productcode, review FROM reviews
WHERE rating >= 4;

--19 Display every unique userid from users who placed an order
SELECT DISTINCT userid FROM orders;

--20 Display all order data sorted by earliest purchase date
SELECT * FROM orders
ORDER BY purchasedate ASC;


