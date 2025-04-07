
-- This SQL query retrieves customer and order details by joining the customers and orders tables.
SELECT cu.cust_id,cu.name,cu.phone_no,o.order_id,o.product_id,o.product_name,o.product_category,o.product_price FROM customers cu 
INNER JOIN orders o ON o.cust_id=cu.cust_id ORDER BY cu.name


-- This SQL query retrieves customer and order details by performing a left join on the customers and orders tables.
SELECT * FROM customers cu LEFT JOIN orders o ON cu.cust_id=o.cust_id ORDER BY cu.id 


-- This SQL query retrieves customer and order details by performing a right join on the customers and orders tables.
SELECT * FROM customers cu RIGHT JOIN orders o ON cu.cust_id=o.cust_id ORDER BY cu.id 


-- This SQL query retrieves customer and order details by performing a cross join on the customers and orders tables.
SELECT * FROM customers cu CROSS JOIN orders ORDER BY cu.id 


-- This SQL query retrieves customer and order details by performing a self join on the orders table.
SELECT o1.order_id AS Order1_ID, o2.order_id AS Order2_ID, o1.cust_id, o1.product_name AS Product1, o2.product_name AS Product2 FROM 
orders o1 JOIN orders o2 ON o1.cust_id = o2.cust_id AND o1.order_id < o2.order_id;
