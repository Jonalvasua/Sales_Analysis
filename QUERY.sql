-- WE DO A QUICK ANALYSIS OF THE DIFFERENT TABLES TO SEE THE INFO
SELECT * FROM markets; -- transactionstransactionsthe last 2 rows are data that we won't use because we want the information from india
SELECT * FROM transactions; -- we have negative sales_amount and diff. type of currency

-- FIRST WE ARE GOING TO LOOK AT HOW MANY RECORDS WE HAVE
SELECT COUNT(*) FROM sales.transactions;

-- now we want to look at the transactions of an specific coustomer
SELECT * FROM sales.transactions LIMIT 5;
SELECT * FROM sales.transactions WHERE market_code = 'Mark001';
SELECT COUNT(*) FROM sales.transactions WHERE market_code = 'Mark001'; -- WE SEE HOW MANY TRANSACTION THIS COUSTOMER HAVE

-- WE NOTICE SOME ISSUES IN TRANSACTIONS TABLE
SELECT * FROM sales.transactions WHERE currency = "USD"; -- WE NEED THE CURRENCY IN INR
SELECT * FROM sales.transactions WHERE sales_amount < 1; -- there can't be sales in 0 or -1

-- WE WANT TO LOOK AT ALL THE TRANSACTIONS DONE IN A CERTAIN DATE
SELECT * FROM sales.transactions WHERE YEAR(order_date) = 2020;

-- WE WANT THE TOTAL REVENUE FOR THE 2020 AND 2019 YEAR
SELECT SUM(sales_amount) FROM sales.transactions WHERE YEAR(order_date) = 2020;
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020;

SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions;

SELECT SUM(sales_amount) FROM sales.transactions WHERE YEAR(order_date) = 2019; -- WE CAN NOTICE THAT THE REVENUES ARE DECLINING BECAUSE 2019 REVENUE WAS GRATTER THAN 2020 

-- WE WANT TO KNOW HOW MUCH SALES HAS BEEN IN CHENNAI, FOR THIS WE CAN USE THE TABLE MARKETS
SELECT * FROM sales.markets; -- Chennai is Mark001
SELECT SUM(sales_amount) FROM sales.transactions WHERE YEAR(order_date) = 2020 AND market_code = 'Mark001';


-- NOW WE GENERATE THE TABLES TO EXPORT
SELECT * FROM sales.transactions WHERE sales_amount > 0;
SELECT * FROM sales.customers;
SELECT * FROM sales.markets WHERE zone != '';
SELECT * FROM sales.products;
SELECT * FROM sales.date;

