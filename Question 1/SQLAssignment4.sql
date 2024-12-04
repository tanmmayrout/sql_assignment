-- Question 15 Column name from product table as price_value from price
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';


-- Question 16 Column value product_name – Ipad to Iphone from product table
UPDATE product
SET product_name = 'Iphone' 
WHERE product_name = 'Ipad';


