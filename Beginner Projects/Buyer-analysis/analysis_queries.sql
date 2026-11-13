/* Analysis queries */;
--Display firstname, lastname, and email of all buyers
SELECT 
	first_name,
	last_name,
	email
FROM buyers;

--Buyers from Nigeria
SELECT *
FROM buyers
WHERE country = 'Nigeria';

--Buyers with purchase amount greater than 700.00
SELECT *
FROM buyers
WHERE purchase_amount > 700.00;

--Buyers from Nigeria AND older than 30
SELECT *
FROM buyers
WHERE country = 'Nigeria' AND age > 30;

--Buyers from UK OR USA
SELECT *
FROM buyers
WHERE country = 'UK' OR country = 'USA';

--Buyers, from the highest purchase amount to the lowest
SELECT *
FROM buyers
ORDER BY purchase_amount DESC;

--Top 3 buyers by purchase amount
SELECT TOP (3) *
FROM buyers
ORDER BY purchase_amount DESC;

/* Aggregate Functions */
--Total amount of buyers
SELECT 
	COUNT(buyer_id) AS total_buyers
FROM buyers;

--Total amount spent by all buyers
SELECT 
	SUM(purchase_amount) AS total_amount
FROM buyers;

--Average purchase amount of Nigerian buyers
SELECT 
	AVG(purchase_amount) AS average_purchase
FROM buyers
WHERE country = 'Nigeria';

--Highest purchase amount
SELECT
	MAX(purchase_amount) AS max_purchase
FROM buyers;

--Minimum purchase amount
SELECT 
	MIN(purchase_amount) AS min_purchase
FROM buyers;

/* Answering business questions using GROUP BY */
--Count number of buyers in each country
SELECT 
	country,
	COUNT(buyer_id) AS buyers_by_country
FROM buyers
GROUP BY country;

--Total purchase amount for each country
SELECT 
	country,
	SUM(purchase_amount) AS totalamount_by_country
FROM buyers
GROUP BY country;

--Average purchase amount for each country
SELECT 
	country,
	AVG(purchase_amount) AS avg_by_country
FROM buyers
GROUP BY country;

--Highest purchase amount for each country
SELECT 
	country,
	MAX(purchase_amount) AS max_by_country
FROM buyers
GROUP BY country;

/* HAVING */
--Countries with purchase amount greater 1500.00
SELECT 
	country,
	SUM(purchase_amount) AS total_purchase
FROM buyers
GROUP BY country
HAVING SUM(purchase_amount) > 1500.00;

--Countries with average purchase amount greater than 800.00
SELECT 
	country,
	AVG(purchase_amount) AS avg_purchase
FROM buyers
GROUP BY country
HAVING AVG(purchase_amount) > 800.00;

--Countries with minimum purchase above 600.00
SELECT 
	country,
	MIN(purchase_amount) AS min_purchase
FROM buyers
GROUP BY country
HAVING MIN(purchase_amount) > 600.00;

/* DISTINCT- Retrieving unique values*/
--Display all unique countries represented 
SELECT
DISTINCT country
FROM buyers;

--How many different countries do the buyers come from?
SELECT
	COUNT(DISTINCT country) AS unique_countries
FROM buyers;

/* FINAL ANALYSIS- CUSTOMER PURCHASING BEHAVIOUR 
1. Understanding the buyers */
-- How many buyers are represented in the database
SELECT 
	COUNT(buyer_id) AS total_buyers
FROM buyers; --8 buyers in total

-- How many countries do the buyers come from?
SELECT DISTINCT country
FROM buyers;

-- Country with the youngest age buyer
SELECT TOP (1)
	first_name,
	last_name,
	country,
	age
FROM buyers
ORDER BY age ASC;

-- Country with oldest age buyer
SELECT TOP (1)
	first_name,
	last_name,
	country,
	age
FROM buyers
ORDER BY age DESC;


/* 2. Understanding purchasing behaviour */
-- Display the 5 buyers (in descending order) who spent the most money, showing their first name, last name, country and purchase amount
SELECT TOP (5)
	first_name,
	last_name,
	country,
	purchase_amount
FROM buyers
ORDER BY purchase_amount DESC;

-- Calculate the total amount spent by all buyers
SELECT
	SUM(purchase_amount) AS total_amount
FROM buyers;

-- Calculate the average purchase amount across all buyers 
SELECT 
	AVG(purchase_amount) AS average
FROM buyers;

--Country with the highest purchase amount
SELECT TOP (1)
	country,
	SUM(purchase_amount) AS highest_purchase_amount
FROM buyers
GROUP BY country
ORDER BY highest_purchase_amount DESC;

--Country with the lowest purchase amount
SELECT TOP (1)
	country,
	SUM(purchase_amount) AS lowest_purchase_amount
FROM buyers
GROUP BY country
ORDER BY lowest_purchase_amount ASC;

/* KEY FINDINGS

1. The database contains 8 buyers from 4 countries
2. Nigeria has the lowest purchase amount (1200.00)
3. USA has the highest purchase amount (3500.00)
4. Canada has the youngest buyer, Fatima Zakky (age 20)
5. Nigeria has the oldest buyer, Aisha Wale (age 56) 
6. Countries with average greater than 800.00 are Canada, UK, and the USA
7. Countries with minimum purchase above 600.00 are Canada and UK
8. Total amount generated from all the buyers is 8300.00 with an average of 1037.50

*/