-- Create the tables
CREATE TABLE Product(product_id int, name varchar(15));
CREATE TABLE Invoice(invoice_id int,product_id int,rest int, paid int, canceled int, refunded int);

-- Populate the product table    
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, name) VALUES ('0', 'ham');
INSERT INTO Product (product_id, name) VALUES ('1', 'bacon');

-- Populate the invoice table
TRUNCATE TABLE Invoice;
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('23', '0', '2', '0', '5', '0');
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('12', '0', '0', '4', '0', '3');
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('1', '1', '1', '1', '0', '1');
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('2', '1', '1', '0', '1', '1');
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('3', '1', '0', '1', '1', '1');
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES ('4', '1', '1', '1', '1', '0');

-- Solve the exercise
SELECT name, SUM(rest) AS rest, SUM(paid) AS paid,
SUM(canceled) AS canceled, SUM(refunded) AS refunded
FROM Invoice JOIN Product
USING(product_id)
GROUP BY name
ORDER BY name;

-- Drop unused tables
DROP TABLE Product;
DROP TABLE Invoice;