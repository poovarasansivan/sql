
-- It creates an index on the email column of the users table
CREATE INDEX idx_users_email ON users(email);

-- It creates an index on the user_id column of the orders table
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- It creates an index on the order_date column of the orders table
CREATE INDEX idx_order_date ON orders(order_date);

-- It creates an index on the product_id column of the order_items table
CREATE INDEX idx_product_price ON products(price);

-- It creates a unique index on the email column of the users table
CREATE UNIQUE INDEX idx_unique_email ON users(email);

-- It creates an index on the category_id column of the products table
CREATE INDEX idx_category_id ON products(category_id);


-- It creates a trigger that updates the inventory table after an order is placed
-- This trigger will decrease the stock quantity of the product in the inventory table
-- when a new order is inserted into the ordered_items table

DELIMITER $$
CREATE TRIGGER update_inventory_after_order
AFTER INSERT ON ordered_items
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET stock_quantity = stock_quantity - NEW.quantity
  WHERE product_id = NEW.product_id;
END$$
DELIMITER 


-- It creates a view that summarizes the total number of items ordered by each user
-- This view joins the orders, users, and order_items tables to provide a summary of orders placed by each user.
-- The view includes the order ID, user ID, customer name, order date, and total items ordered.
-- The total items are calculated by summing the quantity of items in the order_items table.

CREATE VIEW order_summary AS
SELECT 
    o.order_id,
    o.user_id,
    u.user_name AS customer_name,
    o.ordered_date,
    SUM(oi.quantity) AS total_items
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.user_id, u.user_name, o.ordered_date;


-- It creates a view that provides a summary of sales by month
-- This view aggregates the total sales amount for each user by month.
-- It includes the user ID, user name, month of the order, and total sales amount.
-- The total sales amount is calculated by summing the total amount from the orders table.

CREATE MATERIALIZED VIEW monthly_sales AS
SELECT 
    user_id,
    user_name,
    MONTH(ordered_date) AS MONTH,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY user_id, MONTH(ordered_date);
