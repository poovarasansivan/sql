-- Task: 6
-- Description: Get the current date and time

SELECT CURRENT_DATE;
SELECT NOW();
SELECT SYSDATE()	


-- It will return the year of the ordered_date column from the orders table.
SELECT YEAR(ordered_date) AS ordered_year FROM orders GROUP BY ordered_year

-- It will return the month of the ordered_date column from the orders table.
SELECT MONTH(ordered_date) AS ordered_month FROM orders GROUP BY ordered_month

-- It will return the day,dayname, month and year of the ordered_date column from the orders table.
SELECT DAY (ordered_date) AS ordered_day, DAYNAME(ordered_date) AS day_name,MONTHNAME (ordered_date) AS ordered_month,YEAR(ordered_date) AS ordered_date FROM orders 

SELECT cust_id, DATEDIFF(MAX(ordered_date),MIN(ordered_date)) AS date_diff FROM ( SELECT cust_id,ordered_date,ROW_NUMBER() OVER (PARTITION BY cust_id ORDER BY ordered_date) AS rn FROM orders) AS ranked_orders
WHERE rn <= 2 GROUP BY cust_id HAVING COUNT(*) = 2;

-- It will return the 1 day interval order placed by each customer.
SELECT * FROM orders WHERE ordered_date >= CURDATE()-INTERVAL 1 DAY;

-- It will return the order details with formated date and month for each customer.
SELECT cu.cust_id,cu.name,o.product_name,o.product_category,o.product_price, DATE_FORMAT(o.ordered_date, '%d-%m-%Y') AS formatted_date,
DATE_FORMAT(o.ordered_date,'%m') AS ordered_month
FROM customers cu INNER JOIN orders o ON o.cust_id=cu.cust_id