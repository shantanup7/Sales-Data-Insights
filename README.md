# Sales Data Insights

### Description
This project provides an automated solution to unlock critical sales insights that were previously inaccessible to the sales team, enhancing decision-making and reducing manual data handling. The automated dashboard created in Power BI provides real-time insights into sales trends, top customers, and products to support data-driven decision-making.

### Architecture Diagram
![Architecture Diagram](https://github.com/shantanup7/Sales-Data-Insights/blob/main/Images/Architecture%20Diagram.png)

### Dataset Used
The sales data is stored in a MySQL database, structured and analyzed to provide insights into various sales metrics. The dataset involves transactions data, customer details, products, and sales performance metrics across different market segments.

### Tools and Technologies
- **MySQL:** Used for database management and storing sales data.
- **Power BI:** Utilized for creating dynamic and interactive sales dashboards.
- **SQL:** Employed for querying the database to prepare and transform data for analysis.

 ### Data Transformation and Cleanup
- **Filtering Transactions:** Transactions with zero or negative values were removed to ensure data quality.

```
Table.SelectRows(sales_transactions, each ([sales_amount] <> -1 and [sales_amount] <> 0))
```

- **Currency Normalization:** Sales amounts in USD were converted to a standardized currency using the current exchange rate for uniformity in reporting.

```
Table.AddColumn(#"Cleanup Currency", "norm_sales_amount", each if [currency] = "USD#(cr)" then [sales_amount] * 84 else [sales_amount])
```

### Project Execution Flow
**Data Extraction:** Data is pulled from the MySQL database, involving extensive sales records.

![dbDump](https://github.com/shantanup7/Sales-Data-Insights/blob/main/Images/db_dump.jpg)

**Data Analysis using SQL:** 

![MySQL](https://github.com/shantanup7/Sales-Data-Insights/blob/main/Images/Data%20Analysis.jpg)

```
USE sales;

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

SELECT *
FROM sales.transactions
WHERE sales.transactions.sales_amount = -1;

-- Show total revenue in year 2020,
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 
	and transactions.currency="INR\r" 
    or transactions.currency="USD\r";

-- Show total revenue in year 2020, January Month,
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 
	and date.month_name="January"
    and (transactions.currency="INR\r" 
		or transactions.currency="USD\r");
        
-- Show total revenue in year 2020 in Chennai
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 
	and transactions.market_code="Mark001";
```

**Data Transformation:** Includes cleansing and normalization of data to ensure accuracy in the metrics displayed on the dashboard.

![ER](https://github.com/shantanup7/Sales-Data-Insights/blob/main/Images/ER%20Diagram.jpg)

**Dashboard Development:** A comprehensive dashboard is developed in Power BI, showcasing key performance indicators essential for strategic decision-making.

![PowerBI](https://github.com/shantanup7/Sales-Data-Insights/blob/main/Images/Power%20BI.jpg)

### Dashboard Overview
The Power BI dashboard includes:

- **Revenue and Sales Quantity:** Displays total revenue and sales quantities over selected time frames.
  
- **Revenue by Markets:** Visualizes revenue distribution across different markets.
  
- **Sales Trends:** Shows trends over time, helping identify peaks and troughs in sales performance.
  
- **Top Customers and Products:** Highlights top-performing customers and best-selling products, providing actionable insights into sales strategy.
  
### Success Criteria

- **Enhanced Decision Making:** The dashboard supports quick decision-making by providing up-to-date sales insights.
  
- **Reduced Manual Efforts:** By automating data analysis, the sales team can focus more on strategic tasks rather than data gathering.
  
- **Cost Efficiency:** Helps in identifying cost-saving opportunities by analyzing sales trends and customer behavior.

