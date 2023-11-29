-- Create the tables
CREATE TABLE Products (product_id int, price int);
CREATE TABLE Purchases (invoice_id int, product_id int, quantity int);

-- Populate the products table    
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, price) VALUES ('1', '100');
INSERT INTO Products (product_id, price) VALUES ('2', '200');

-- Populate the purchases table    
TRUNCATE TABLE Purchases;
INSERT INTO Purchases (invoice_id, product_id, quantity) VALUES ('1', '1', '2');
INSERT INTO Purchases (invoice_id, product_id, quantity) VALUES ('3', '2', '1');
INSERT INTO Purchases (invoice_id, product_id, quantity) VALUES ('2', '2', '3');
INSERT INTO Purchases (invoice_id, product_id, quantity) VALUES ('2', '1', '4');
INSERT INTO Purchases (invoice_id, product_id, quantity) VALUES ('4', '1', '10');

-- Solve the exercise
SELECT product_id, quantity, price
FROM(SELECT invoice_id, product_id, quantity, price, DENSE_RANK() OVER(ORDER BY total_price DESC, invoice_id) rank_invoice
FROM(SELECT invoice_id, p.product_id, quantity, price*quantity AS price, SUM(price*quantity) OVER(PARTITION BY invoice_id) AS total_price
FROM Purchases p JOIN Products pr
ON(p.product_id=pr.product_id)))
WHERE rank_invoice=1;

-- Drop unused tables
DROP TABLE Products;
DROP TABLE Purchases;