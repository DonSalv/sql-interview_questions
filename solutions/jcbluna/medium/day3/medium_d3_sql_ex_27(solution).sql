-- Create the tables
CREATE TABLE Users (user_id int, join_date date, favorite_brand varchar(10));
CREATE TABLE Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int);
CREATE TABLE Items (item_id int, item_brand varchar(10));

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('1', TO_DATE('2018-01-01','%YYYY-%MM-%DD'), 'Lenovo');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('2', TO_DATE('2018-02-09','%YYYY-%MM-%DD'), 'Samsung');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('3', TO_DATE('2018-01-19','%YYYY-%MM-%DD'), 'LG');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('4', TO_DATE('2018-05-21','%YYYY-%MM-%DD'), 'HP');

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), '4', '1', '2');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('2', TO_DATE('2018-08-02','%YYYY-%MM-%DD'), '2', '1', '3');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('3', TO_DATE('2019-08-03','%YYYY-%MM-%DD'), '3', '2', '3');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('4', TO_DATE('2018-08-04','%YYYY-%MM-%DD'), '1', '4', '2');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('5', TO_DATE('2018-08-04','%YYYY-%MM-%DD'), '1', '3', '4');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('6', TO_DATE('2019-08-05','%YYYY-%MM-%DD'), '2', '2', '4');

-- Populate the items table    
TRUNCATE TABLE Items;
INSERT INTO Items (item_id, item_brand) VALUES ('1', 'Samsung');
INSERT INTO Items (item_id, item_brand) VALUES ('2', 'Lenovo');
INSERT INTO Items (item_id, item_brand) VALUES ('3', 'LG');
INSERT INTO Items (item_id, item_brand) VALUES ('4', 'HP');

-- Solve the exercise
SELECT u.user_id AS buyer_id, TO_CHAR(join_date,'YYYY-MM-DD') AS join_date, NVL(boughts,0) AS orders_in_2019
FROM (SELECT buyer_id, COUNT(order_id) AS boughts
FROM Orders o
WHERE EXTRACT(YEAR FROM order_date)=2019
GROUP BY buyer_id) o RIGHT OUTER JOIN Users u
ON(u.user_id=o.buyer_id)
ORDER BY buyer_id, join_date;

-- Drop unused tables
DROP TABLE Users;
DROP TABLE Orders;
DROP TABLE Items;