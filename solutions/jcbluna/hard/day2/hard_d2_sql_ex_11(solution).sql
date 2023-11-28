-- Create the tables
CREATE TABLE Users (user_id int, join_date date, favorite_brand varchar(10));
CREATE TABLE Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int);
CREATE TABLE Items (item_id int, item_brand varchar(10));

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('1', TO_DATE('2019-01-01','%YYYY-%MM-%DD'), 'Lenovo');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('2', TO_DATE('2019-02-09','%YYYY-%MM-%DD'), 'Samsung');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('3', TO_DATE('2019-01-19','%YYYY-%MM-%DD'), 'LG');
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES ('4', TO_DATE('2019-05-21','%YYYY-%MM-%DD'), 'HP');

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), '4', '1', '2');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('2', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), '2', '1', '3');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('3', TO_DATE('2019-08-03','%YYYY-%MM-%DD'), '3', '2', '3');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('4', TO_DATE('2019-08-04','%YYYY-%MM-%DD'), '1', '4', '2');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('5', TO_DATE('2019-08-04','%YYYY-%MM-%DD'), '1', '3', '4');
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES ('6', TO_DATE('2019-08-05','%YYYY-%MM-%DD'), '2', '2', '4');

-- Populate the items table    
TRUNCATE TABLE Items;
INSERT INTO Items (item_id, item_brand) VALUES ('1', 'Samsung');
INSERT INTO Items (item_id, item_brand) VALUES ('2', 'Lenovo');
INSERT INTO Items (item_id, item_brand) VALUES ('3', 'LG');
INSERT INTO Items (item_id, item_brand) VALUES ('4', 'HP');

-- Solve the exercise
SELECT u.user_id AS seller_id, (CASE WHEN o.user_id IS NULL THEN 'no' ELSE 'yes' END) AS "2nd_item_fav_brand"
FROM Users u LEFT OUTER JOIN
(SELECT u.user_id
FROM Users u JOIN Orders o
ON(u.user_id=o.seller_id)
JOIN Items i
ON(o.item_id=i.item_id
AND u.favorite_brand=i.item_brand)) o
ON(u.user_id=o.user_id)
ORDER BY seller_id;

-- Drop unused tables
DROP TABLE Users;
DROP TABLE Orders;
DROP TABLE Items;