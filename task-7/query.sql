
-- The query uses the ROW_NUMBER() window function to assign a rank to rows within a partition of a result set.
SELECT emp_id,emp_name,department,sale_amount,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY sale_amount DESC) AS row_num FROM sales

-- The query uses the RANK() and DENSE_RANK() window function to assign a rank to rows within a partition of a result set.
SELECT emp_id,emp_name,department,sale_amount, RANK() OVER (PARTITION BY department ORDER BY sale_amount DESC) AS sales_rank,
DENSE_RANK() OVER (PARTITION BY department ORDER BY sale_amount DESC) AS denses_rank FROM sales

-- The query uses the NTILE() window function to distribute rows into a specified number of buckets.
SELECT emp_id,emp_name,department,sale_amount, NTILE(2) OVER (ORDER BY sale_amount DESC) AS bucket FROM sales

-- The query uses the SUM() window function to calculate a running total of sales amount.
SELECT emp_id,emp_name,department,sale_amount, SUM(sale_amount) OVER (ORDER BY sale_amount) AS running_total FROM sales

-- The query uses the AVG() window function to calculate the average sales amount for each department.
SELECT emp_id,emp_name,department,sale_amount, AVG(sale_amount) OVER (PARTITION BY department) AS avg_sales FROM sales

-- The query uses the COUNT() window function to count the number of sales in each department.
SELECT emp_id,emp_name,department,sale_amount, COUNT(sale_amount) OVER (PARTITION BY department) AS sales_count FROM sales

-- The query uses the LAG() and LEAD() window functions to access data from previous and next rows in the result set.
SELECT emp_id, emp_name, sale_amount, LAG(sale_amount) OVER (ORDER BY sale_amount) AS prev_sale, LEAD(sale_amount) OVER (ORDER BY sale_amount) AS next_sale FROM sales;
