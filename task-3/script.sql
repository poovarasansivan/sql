-- Task 3: SQL Queries
-- 1. Count the total number of products available in the product_item table
SELECT COUNT(*) AS total_products_available FROM product_item;

-- 2. Calculate the total value of all products in the product_item table
SELECT SUM(product_price) AS total_products_value FROM product_item

-- 3. Calculate the average price from the product_item table
SELECT AVG(product_price)AS average_product_price FROM product_item

-- 4. Find the minimum price from the product_item table
SELECT MIN(product_price)AS min_product_price FROM product_item

-- 5. Find the maximum price from the product_item table
SELECT MAX(product_price)AS max_product_price FROM product_item

-- 6. Find the total number of products in each category from the product_item table
SELECT product_category, COUNT(*) AS total_products FROM product_item GROUP BY product_category;
