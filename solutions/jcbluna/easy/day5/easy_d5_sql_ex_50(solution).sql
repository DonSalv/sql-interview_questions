-- Create the tables
CREATE TABLE Customers (customer_id int, name varchar(30), country varchar(30));
CREATE TABLE Product (product_id int, description varchar(30), price int);
CREATE TABLE Orders (order_id int, customer_id int, product_id int, order_date date, quantity int);

-- Populate the customers table
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, name, country) VALUES ('1', 'Winston', 'USA');
INSERT INTO Customers (customer_id, name, country) VALUES ('2', 'Jonathan', 'Peru');
INSERT INTO Customers (customer_id, name, country) VALUES ('3', 'Moustafa', 'Egypt');
    
-- Populate the product table
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, description, price) VALUES ('10', 'LC Phone', '300');
INSERT INTO Product (product_id, description, price) VALUES ('20', 'LC T-Shirt', '10');
INSERT INTO Product (product_id, description, price) VALUES ('30', 'LC Book', '45');
INSERT INTO Product (product_id, description, price) VALUES ('40', 'LC Keychain', '2');

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('1', '1', '10', TO_DATE('2020-06-10','%YYYY-%MM-%DD'), '1');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('2', '1', '20', TO_DATE('2020-07-01','%YYYY-%MM-%DD'), '1');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('3', '1', '30', TO_DATE('2020-07-08','%YYYY-%MM-%DD'), '2');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('4', '2', '10', TO_DATE('2020-06-15','%YYYY-%MM-%DD'), '2');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('5', '2', '40', TO_DATE('2020-07-01','%YYYY-%MM-%DD'), '10');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('6', '3', '20', TO_DATE('2020-06-24','%YYYY-%MM-%DD'), '2');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('7', '3', '30', TO_DATE('2020-06-25','%YYYY-%MM-%DD'), '2');
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES ('9', '3', '30', TO_DATE('2020-05-08','%YYYY-%MM-%DD'), '3');

-- Solve the exercise
SELECT c1.customer_id, c1.name
FROM Customers c1
WHERE 100<=ALL (SELECT NVL(total,0)
            FROM (SELECT 6 AS month FROM dual
            UNION SELECT 7 FROM dual) m LEFT OUTER JOIN (SELECT EXTRACT(MONTH FROM order_date) AS month, SUM(quantity*price) AS total
                                                FROM Customers c2 JOIN Orders o
                                                ON(c2.customer_id=o.customer_id)
                                                JOIN Product p
                                                USING(product_id)
                                                WHERE c2.customer_id=c1.customer_id
                                                AND EXTRACT(MONTH FROM order_date) IN (6,7)
                                                AND EXTRACT(YEAR FROM order_date)=2020
                                                GROUP BY c2.customer_id, EXTRACT(MONTH FROM order_date))
            USING(month));

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Product;
DROP TABLE Orders;