-- Question 1 Creating a database 
CREATE DATABASE ecommerce;

USE ecommerce; -- Use ecommerce to create the tables in it 

-- Question 2  Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce)
CREATE TABLE gold_member_users (
    userid INT,
    username VARCHAR(50),
    signup_date DATE
);

CREATE TABLE users (
    userid INT,
    username VARCHAR(50),
    signup_date DATE
);

CREATE TABLE sales (
    userid INT,
    username VARCHAR(50),
    created_date DATE,
    product_id INT
);

CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(50),
    price INT
);
