-- Create Database for Question 4 
CREATE DATABASE Question4;

USE Question4;

CREATE TABLE -- Create table 
    email_signup (
    id INT PRIMARY KEY,
    email_id VARCHAR(255),
    signup_date DATE
);

-- Add data 
INSERT INTO email_signup (id, email_id, signup_date) VALUES
(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', NULL);

SELECT * FROM email_signup; --Display  contents 

SELECT 
    MIN(signup_date) AS first_signup, --Finds the earliest signup date for matching Gmail accounts.
    MAX(signup_date) AS latest_signup, --Finds the most recent signup date for matching Gmail accounts.
    DATEDIFF(DAY, MIN(signup_date), MAX(signup_date)) AS date_difference -- Calculates the difference in days between the earliest and latest signup dates.
FROM 
    email_signup
WHERE 
    LOWER(email_id) --Converts all variations of Gmail, GMAIL, or gmail to lowercase
	LIKE '%@gmail.com'; --Ensures only emails ending in @gmail.com are matched .