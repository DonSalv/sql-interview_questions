-- Create the tables
CREATE TABLE Warehouse (name varchar(50), product_id int, units int);
CREATE TABLE Products (product_id int, product_name varchar(50), Width int,Length int,Height int);

-- Populate the warehouse table
TRUNCATE TABLE Warehouse;
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse1', '1', '1');
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse1', '2', '10');
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse1', '3', '5');
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse2', '1', '2');
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse2', '2', '2');
INSERT INTO Warehouse (name, product_id, units) VALUES ('LCHouse3', '4', '1');

-- Populate the products table
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES ('1', 'LC-TV', '5', '50', '40');
INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES ('2', 'LC-KeyChain', '5', '5', '5');
INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES ('3', 'LC-Phone', '2', '10', '10');
INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES ('4', 'LC-T-Shirt', '4', '10', '20');

-- Solve the exercise
SELECT name AS warehouse_name, SUM(units*Width*Length*Height) AS volume
FROM Warehouse JOIN Products
USING(product_id)
GROUP BY name
ORDER BY name;

-- Drop unused tables
DROP TABLE Warehouse;
DROP TABLE Products;