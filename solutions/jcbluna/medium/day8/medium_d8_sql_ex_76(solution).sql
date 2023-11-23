-- Create the orders table
CREATE TABLE Orders (order_id int, customer_id int, order_type int);

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('1', '1', '0');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('2', '1', '0');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('11', '2', '0');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('12', '2', '1');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('21', '3', '1');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('22', '3', '0');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('31', '4', '1');
INSERT INTO Orders (order_id, customer_id, order_type) VALUES ('32', '4', '1');

-- Solve the exercise
SELECT order_id, customer_id, order_type
FROM Orders
WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE order_type=0)
OR order_type!=1;

-- Drop unused table
DROP TABLE Orders;