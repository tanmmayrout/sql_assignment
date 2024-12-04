-- Create Database Question 3 
CREATE DATABASE Question3;

-- Use the Question2 database
USE Question3;

CREATE TABLE -- Create the table 
    dept_tbl (
    id_deptname VARCHAR(20),   
    emp_name VARCHAR(100),         
    salary DECIMAL(10, 2)         
);

INSERT INTO dept_tbl (id_deptname, emp_name, salary) -- Insert the data 
VALUES 
('1111-MATH', 'RAHUL', 10000),
('1111-MATH', 'RAKESH', 20000),
('2222-SCIENCE', 'AKASH', 10000),
('222-SCIENCE', 'ANDREW', 10000),
('22-CHEM', 'ANKIT', 25000),
('3333-CHEM', 'SONIKA', 12000),
('4444-BIO', 'HITESH', 2300),
('44-BIO', 'AKSHAY', 10000);

SELECT * FROM dept_tbl; -- Display the table 


-- the total salary of each department
SELECT 
    RIGHT(id_deptname, CHARINDEX('-', REVERSE(id_deptname)) - 1) AS dept_name,   --Reverses the string id_deptname and CHARINDEX finds the position of the first occurrence of '-' in the reversed string.
    SUM(salary) AS total_salary -- ADDs up salary values for each group 
FROM dept_tbl
GROUP BY RIGHT(id_deptname, CHARINDEX('-', REVERSE(id_deptname)) - 1); -- Groups the results by the extracted dept_name so that the total salary for each department is calculated

--dept_name is temporary 