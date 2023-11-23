-- Create the tables
CREATE TABLE Salesperson (salesperson_id int, name varchar(30));
CREATE TABLE Customer (customer_id int, salesperson_id int);
CREATE TABLE Sales (sale_id int, customer_id int, price int);

-- Populate the salesperson table    
TRUNCATE TABLE Salesperson;
INSERT INTO Salesperson (salesperson_id, name) VALUES ('1', 'Alice');
INSERT INTO Salesperson (salesperson_id, name) VALUES ('2', 'Bob');
INSERT INTO Salesperson (salesperson_id, name) VALUES ('3', 'Jerry');

-- Populate the customer table    
TRUNCATE TABLE Customer;
INSERT INTO Customer (customer_id, salesperson_id) VALUES ('1', '1');
INSERT INTO Customer (customer_id, salesperson_id) VALUES ('2', '1');
INSERT INTO Customer (customer_id, salesperson_id) VALUES ('3', '2');

-- Populate the sales table    
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, customer_id, price) VALUES ('1', '2', '892');
INSERT INTO Sales (sale_id, customer_id, price) VALUES ('2', '1', '354');
INSERT INTO Sales (sale_id, customer_id, price) VALUES ('3', '3', '988');
INSERT INTO Sales (sale_id, customer_id, price) VALUES ('4', '3', '856');

-- Solve the exercise
SELECT sp.salesperson_id, name, SUM(NVL(price,0)) AS total
FROM Salesperson sp LEFT OUTER JOIN Customer c
ON(sp.salesperson_id=c.salesperson_id)
LEFT OUTER JOIN Sales s
ON(c.customer_id=s.customer_id)
GROUP BY sp.salesperson_id, name;

-- Drop unused tables
DROP TABLE Salesperson;
DROP TABLE Customer;
DROP TABLE Sales;