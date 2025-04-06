-- To select all products in the Electronics category
SELECT * FROM product_item WHERE product_category="Electronics"

-- To select all products and sort them by product_category
SELECT * FROM product_item ORDER BY product_category

-- To select all products in the Electronics category and sort them by product_price
SELECT * FROM product_item WHERE product_category="Electronics" AND product_discount <=2000 ORDER BY product_price