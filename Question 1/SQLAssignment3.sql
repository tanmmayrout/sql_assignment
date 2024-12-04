-- Question 4 Show all the tables 

SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = 'ecommerce';

-- Question 5 Count all the records of all four tables using single query
SELECT 'gold_member_users' AS table_name, COUNT(*) AS record_count FROM gold_member_users
UNION ALL -- results from all the queries while keeping duplicate results
SELECT 'users', COUNT(*) FROM users
UNION ALL
SELECT 'sales', COUNT(*) FROM sales
UNION ALL
SELECT 'product', COUNT(*) FROM product;

-- Question 6 What is the total amount each customer spent on ecommerce company
SELECT 
    s.userid,
    u.username,
    SUM(p.price) AS total_spent
FROM 
    sales s
JOIN 
    product p ON s.product_id = p.product_id
JOIN 
    users u ON s.userid = u.userid
GROUP BY 
    s.userid, u.username; -- results by customer ID and name to calculate the total for each customer


-- Question 7 the distinct dates of each customer visited the website:
	SELECT DISTINCT  -- Only unique combinations of created_date and username are returned.
    s.created_date AS date,
    u.username AS customer_name
FROM 
    sales s
JOIN 
    users u ON s.userid = u.userid
ORDER BY 
    s.created_date, u.username; --  result first by the date and then by the customer name

-- Question 8 the first product purchased by each customer using 3 tables(users, sales, product)
WITH FirstPurchase AS ( -- selects the username, product name, and the row number of each customer's purchases
    SELECT 
        u.username,
        p.product_name,
        s.created_date,
        ROW_NUMBER() OVER (PARTITION BY s.userid ORDER BY s.created_date) AS rn -- function assigns a unique row number to each customer's purchases,
    FROM 
        sales s
    JOIN 
        users u ON s.userid = u.userid
    JOIN 
        product p ON s.product_id = p.product_id
)
SELECT 
    username AS customer_name,
    product_name AS first_product
FROM 
    FirstPurchase
WHERE 
    rn = 1; -- to get only the first purchase for each customer


-- Question 9 Counts the number of times each product was purchased by each customer
WITH ProductCounts AS (
    SELECT 
        s.userid,
        p.product_name,
        COUNT(*) AS item_count, -- Counts the number of times each product was purchased by each customer
        ROW_NUMBER() OVER (PARTITION BY s.userid ORDER BY COUNT(*) DESC) AS rn
		-- The most purchased item for each customer is found by ranking products based on the number of purchases using ROW_NUMBER()
    FROM 
        sales s
    JOIN 
        product p ON s.product_id = p.product_id
    GROUP BY 
        s.userid, p.product_name
)
SELECT 
    u.username AS customer_name,
    pc.product_name AS most_purchased_item,
    pc.item_count
FROM 
    ProductCounts pc
JOIN 
    users u ON pc.userid = u.userid
WHERE 
    pc.rn = 1; -- ensures only the most purchased item for each customer is returned.


-- Question 10 the customer who is not the gold_member_user

SELECT 
    u.username AS customer_name
FROM 
    users u
LEFT JOIN 
    gold_member_users gmu ON u.userid = gmu.userid
WHERE 
    gmu.userid IS NULL;

-- Question 11 the amount spent by each customer when he was the gold_member user 

SELECT 
    u.username AS customer_name,
    SUM(p.price) AS total_spent_as_gold_member -- the result by customer name so that we can sum the amounts per customer.
FROM 
    sales s
JOIN 
    users u ON s.userid = u.userid
JOIN 
    gold_member_users gmu ON s.userid = gmu.userid -- ensure that only sales made when the customer was a gold member are considered. 
JOIN 
    product p ON s.product_id = p.product_id
GROUP BY 
    u.username;

-- Question 12 prices of the products purchased by the customer during the time they were a gold member
SELECT 
    u.username AS customer_name,
    SUM(p.price) AS total_spent_as_gold_member
FROM 
    sales s
JOIN 
    users u ON s.userid = u.userid
JOIN 
    gold_member_users gmu ON s.userid = gmu.userid
JOIN 
    product p ON s.product_id = p.product_id
WHERE 
    s.created_date >= gmu.signup_date
GROUP BY 
    u.username;

-- Question 13 the Customers names whose name starts with M

SELECT 
    username AS customer_name
FROM 
    users
WHERE 
    username LIKE 'M%';


-- Question 14 the Distinct customer Id of each customer

SELECT DISTINCT 
    userid AS customer_id
FROM 
    users;

