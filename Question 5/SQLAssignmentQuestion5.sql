-- Create Database for Question 5
CREATE DATABASE Question5;

USE Question5;

--Create table 
CREATE TABLE sales_data (
    product_id INT,           
    sale_date DATE,           
    quantity_sold INT         
);

--Data
INSERT INTO sales_data (product_id, sale_date, quantity_sold) 
VALUES
    (1, '2022-01-01', 20),
    (2, '2022-01-01', 15),
    (1, '2022-01-02', 10),
    (2, '2022-01-02', 25),
    (1, '2022-01-03', 30),
    (2, '2022-01-03', 18),
    (1, '2022-01-04', 12),
    (2, '2022-01-04', 22);

SELECT * FROM sales_data

SELECT product_id, sale_date, quantity_sold
FROM ( --for each sale, assigning ranks based on sale_date in descending order. This result is treated as a derived table = RankedSales
    SELECT product_id, sale_date, quantity_sold,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY sale_date DESC) AS rank -- most recent sale has rank = 1 Order in DESC 
    FROM sales_data
) AS RankedSales -- derived table RankedSales
WHERE rank = 1; -- filter the results using WHERE rank = 1 to get the latest sale for each product_id 