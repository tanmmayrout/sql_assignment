-- Question 3 Insert the values provided above with respective datatypes

INSERT INTO gold_member_users (userid, username, signup_date) VALUES
(1, 'John', '2017-09-22'),
(2, 'Mary', '2017-04-21');

INSERT INTO users (userid, username, signup_date) VALUES
(1, 'John', '2014-09-02'),
(3, 'Michel', '2015-01-15'),
(2, 'Mary', '2014-04-11');

INSERT INTO sales (userid, username, created_date, product_id) VALUES
(1, 'John', '2017-04-19', 2),
(2, 'Mary', '2019-12-18', 1),
(3, 'Michel', '2020-07-20', 3),
(1, 'John', '2019-10-23', 2),
(1, 'John', '2018-03-19', 3),
(2, 'Mary', '2016-12-20', 2),
(1, 'John', '2016-11-09', 1),
(1, 'John', '2016-05-20', 3),
(3, 'Michel', '2017-09-24', 1),
(1, 'John', '2017-03-11', 2),
(1, 'John', '2016-03-11', 1),
(2, 'Mary', '2016-11-10', 1),
(2, 'Mary', '2017-12-07', 2);

INSERT INTO product (product_id, product_name, price) VALUES
(1, 'Mobile', 980),
(2, 'Ipad', 870),
(3, 'Laptop', 330);

