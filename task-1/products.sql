-- To CREATE DATABASE products;
CREATE DATABASE products;

-- To create a table in the products database
CREATE TABLE product_item(
product_id INT (50),
product_name VARCHAR (250),
product_category VARCHAR (200),
product_price INT (50),
product_discount INT (50)
)

-- To insert data into the product_item table
INSERT INTO product_item(product_id,product_name,product_category,product_price,product_discount) VALUES 
(1,"Asus Laptop", "Electronics", 50000,2000),
(2,"Samsung Fold 14", "Electronics", 350000,2000),
(3,"Andrioid TV 22Inches", "Electronics",22000,1000),
(4,"Study Table 40x20 Inches","Wood Materials",5000,1000),
(5,"Cartoon Coloring Book", "Books",2000,200)


-- To select all data from the product_item table
SELECT * FROM product_item;