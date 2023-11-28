-- Create the tables
CREATE TABLE Orders (order_id int, customer_id int, order_date date, item_id varchar(30), quantity int);
CREATE TABLE Items (item_id varchar(30), item_name varchar(30), item_category varchar(30));

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('1', '1', TO_DATE('2020-06-01','%YYYY-%MM-%DD'), '1', '10');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('2', '1', TO_DATE('2020-06-08','%YYYY-%MM-%DD'), '2', '10');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('3', '2', TO_DATE('2020-06-02','%YYYY-%MM-%DD'), '1', '5');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('4', '3', TO_DATE('2020-06-03','%YYYY-%MM-%DD'), '3', '5');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('5', '4', TO_DATE('2020-06-04','%YYYY-%MM-%DD'), '4', '1');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('6', '4', TO_DATE('2020-06-05','%YYYY-%MM-%DD'), '5', '5');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('7', '5', TO_DATE('2020-06-05','%YYYY-%MM-%DD'), '1', '10');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('8', '5', TO_DATE('2020-06-14','%YYYY-%MM-%DD'), '4', '5');
INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES ('9', '5', TO_DATE('2020-06-21','%YYYY-%MM-%DD'), '3', '5');

-- Populate the items table    
TRUNCATE TABLE Items;
INSERT INTO Items (item_id, item_name, item_category) VALUES ('1', 'LC Alg. Book', 'Book');
INSERT INTO Items (item_id, item_name, item_category) VALUES ('2', 'LC DB. Book', 'Book');
INSERT INTO Items (item_id, item_name, item_category) VALUES ('3', 'LC SmarthPhone', 'Phone');
INSERT INTO Items (item_id, item_name, item_category) VALUES ('4', 'LC Phone 2020', 'Phone');
INSERT INTO Items (item_id, item_name, item_category) VALUES ('5', 'LC SmartGlass', 'Glasses');
INSERT INTO Items (item_id, item_name, item_category) VALUES ('6', 'LC T-Shirt XL', 'T-shirt');

-- Solve the exercise
WITH WeekItems AS
(SELECT *
FROM (SELECT 'Monday' AS week_day, 2 AS week_day_num FROM dual UNION ALL
SELECT 'Tuesday' AS week_day, 3 AS week_day_num FROM dual UNION ALL
SELECT 'Wednesday' AS week_day, 4 AS week_day_num FROM dual UNION ALL
SELECT 'Thursday' AS week_day, 5 AS week_day_num FROM dual UNION ALL
SELECT 'Friday' AS week_day, 6 AS week_day_num FROM dual UNION ALL
SELECT 'Saturday' AS week_day, 7 AS week_day_num FROM dual UNION ALL
SELECT 'Sunday' AS week_day, 1 AS week_day_num FROM dual) CROSS JOIN
(SELECT item_category, item_id FROM Items))
SELECT * FROM
(SELECT week_day, item_category, SUM(NVL(quantity,0)) AS total_quantity
FROM WeekItems wi LEFT OUTER JOIN
(SELECT order_id, customer_id, TO_CHAR(order_date, 'D') AS week_day_num, item_id, quantity
FROM Orders) o
ON(o.week_day_num=wi.week_day_num
AND wi.item_id=o.item_id)
GROUP BY week_day, item_category)
PIVOT(SUM(NVL(total_quantity,0)) 
    FOR week_day
    IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
ORDER BY item_category;

-- Drop unused tables
DROP TABLE Orders;
DROP TABLE Items;