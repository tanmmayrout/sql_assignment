--  Question 16 table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

-- Question 17  a new column  as Status in the table crate above gold_membership_users  the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
USE ecommerce;

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'gold_membership_users';

EXEC sp_columns 'gold_membership_users';

ALTER TABLE gold_membership_users -- Status column to the gold_membership_users table: 
ADD Status VARCHAR(3);

UPDATE gold_membership_users
SET Status = 'Yes';

UPDATE users
SET Status = 'No'
WHERE userid NOT IN (SELECT userid FROM gold_membership_users);



