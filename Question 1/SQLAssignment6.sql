-- Question 18 Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
BEGIN TRANSACTION;

DELETE FROM users WHERE userid = 1;
DELETE FROM users WHERE userid = 2;

ROLLBACK;

SELECT * FROM users;

-- Question 19  Insert one more record as same (3,'Laptop',330) as product table 
INSERT INTO product (product_id, product_name, price)
VALUES (3, 'Laptop', 330);


-- Question 20 Write a query to find the duplicates in product table

SELECT product_name, price, COUNT(*) AS duplicate_count
FROM product
GROUP BY product_name, price
HAVING COUNT(*) > 1;
