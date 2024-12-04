-- Create Database Question 2 
CREATE DATABASE Question2;

-- Use the Question2 database
USE Question2;

CREATE TABLE product_details ( -- TABLE product details 
    sell_date DATE,
    product VARCHAR(100) 
);

INSERT INTO product_details (sell_date, product) -- Data for the table 
VALUES
    ('2020-05-30', 'Headphones'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Book'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');


SELECT * FROM product_details;-- Display the table 

--The count of different products sold for each date
SELECT sell_date, COUNT(DISTINCT product) AS num_different_products
FROM product_details
GROUP BY sell_date;


-- The names of the differnt products sold for each date 
SELECT sell_date,
       STRING_AGG (product, ', ') AS product_list -- output string will list all products sold on the same date, separated by commas
FROM product_details
GROUP BY sell_date -- ensures that all products sold on the same date are combined together.
ORDER BY sell_date; -- Ensures that the output is listed chronologically by the date of sale.
