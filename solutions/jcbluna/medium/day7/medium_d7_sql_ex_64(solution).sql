-- Create the orderdetails table
CREATE TABLE OrdersDetails (order_id int, product_id int, quantity int);

-- Populate the orders details table    
TRUNCATE TABLE OrdersDetails;
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('1', '1', '12');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('1', '2', '10');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('1', '3', '15');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('2', '1', '8');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('2', '4', '4');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('2', '5', '6');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('3', '3', '5');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('3', '4', '18');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('4', '5', '2');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('4', '6', '8');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('5', '7', '9');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('5', '8', '9');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('3', '9', '20');
INSERT INTO OrdersDetails (order_id, product_id, quantity) VALUES ('2', '9', '4');

-- Solve the exercise
SELECT order_id
FROM(SELECT order_id, (CASE WHEN MAX(quantity) > MAX(SUM(quantity)/COUNT(DISTINCT product_id)) OVER () THEN 1 ELSE NULL END) AS imbalanced
FROM OrdersDetails
GROUP BY order_id)
WHERE imbalanced IS NOT NULL;

-- Drop unused table
DROP TABLE OrdersDetails;