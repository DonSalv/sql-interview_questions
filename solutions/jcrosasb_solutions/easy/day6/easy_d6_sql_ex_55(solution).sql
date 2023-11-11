-- Create the tables
Create table Warehouse (name varchar(50), product_id int, units int);
Create table Products (product_id int, product_name varchar(50), Width int,Length int,Height int);

-- Populate the warehouse table
Truncate table Warehouse;
insert into Warehouse (name, product_id, units) values ('LCHouse1', 1, 1);
insert into Warehouse (name, product_id, units) values ('LCHouse1', 2, 10);
insert into Warehouse (name, product_id, units) values ('LCHouse1', 3, 5);
insert into Warehouse (name, product_id, units) values ('LCHouse2', 1, 2);
insert into Warehouse (name, product_id, units) values ('LCHouse2', 2, 2);
insert into Warehouse (name, product_id, units) values ('LCHouse3', 4, 1);

-- Populate the products table
Truncate table Products;
insert into Products (product_id, product_name, Width, Length, Height) values (1, 'LC-TV', 5, 50, 40);
insert into Products (product_id, product_name, Width, Length, Height) values (2, 'LC-KeyChain', 5, 5, 5);
insert into Products (product_id, product_name, Width, Length, Height) values (3, 'LC-Phone', 2, 10, 10);
insert into Products (product_id, product_name, Width, Length, Height) values (4, 'LC-T-Shirt', 4, 10, 20);

-- Write a solution to report the number of cubic feet of volume the inventory occupies in each warehouse
SELECT 
    w.name warehouse_name, 
    SUM(w.units * p.width * p.length * p.height) volume 
FROM Warehouse w 
INNER JOIN Products p 
ON w.product_id = p.product_id 
GROUP BY w.name;

-- Drop tables
DROP TABLE Warehouse;
DROP TABLE Products;
