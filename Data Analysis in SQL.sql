USE `sales`;

-- Show all customer records
SELECT * FROM customers;

-- Show total number of customers
SELECT count(*) FROM customers;

-- Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM transactions where 
market_code='Mark001';

-- Show transaction count for Chennai market (market code for chennai is Mark001)
SELECT COUNT(*) FROM transactions where 
market_code='Mark001';

-- Total Count of Transactions
SELECT COUNT(*) FROM sales.transactions;

-- Show transactions where currency is USD
SELECT * FROM transactions where currency='USD';

-- Show transactions in 2020 join by date table
SELECT sales.transactions.*, sales.date.*
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;

-- Show total revenue in year 2020
SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;

-- Show total revenue in year 2020 in Chennai
SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 AND sales.transactions.market_code = "Mark001";

-- Show distict products sold in year 2020 in Chennai
SELECT DISTINCT(sales.transactions.product_code)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 AND sales.transactions.market_code = "Mark001";


