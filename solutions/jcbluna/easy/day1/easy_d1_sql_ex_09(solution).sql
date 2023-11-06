-- Create the orders table
CREATE TABLE orders (order_number int, customer_number int);

-- Populate the orders table    
TRUNCATE TABLE orders;
INSERT INTO orders (order_number, customer_number) VALUES ('1', '1');
INSERT INTO orders (order_number, customer_number) VALUES ('2', '2');
INSERT INTO orders (order_number, customer_number) VALUES ('3', '3');
INSERT INTO orders (order_number, customer_number) VALUES ('4', '3');

-- Solve the exercise
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
FETCH NEXT 1 ROW ONLY;

-- Drop unused tables
DROP TABLE orders;