Create table Products (product_id int, product_name varchar(50), Width int,Length int,Height int, CONSTRAINT Products_pk PRIMARY KEY (product_id));
Create table Warehouse (name varchar(50), product_id int, units int);

ALTER TABLE Warehouse ADD PRIMARY KEY (name, product_id) DISABLE;

insert into Products (product_id, product_name, Width, Length, Height) values ('1', 'LC-TV', '5', '50', '40');
insert into Products (product_id, product_name, Width, Length, Height) values ('2', 'LC-KeyChain', '5', '5', '5');
insert into Products (product_id, product_name, Width, Length, Height) values ('3', 'LC-Phone', '2', '10', '10');
insert into Products (product_id, product_name, Width, Length, Height) values ('4', 'LC-T-Shirt', '4', '10', '20');

insert into Warehouse (name, product_id, units) values ('LCHouse1', '1', '1');
insert into Warehouse (name, product_id, units) values ('LCHouse1', '2', '10');
insert into Warehouse (name, product_id, units) values ('LCHouse1', '3', '5');
insert into Warehouse (name, product_id, units) values ('LCHouse2', '1', '2');
insert into Warehouse (name, product_id, units) values ('LCHouse2', '2', '2');
insert into Warehouse (name, product_id, units) values ('LCHouse3', '4', '1');

SELECT w.name, SUM(w.units*Q1.Volume_product) AS Volume FROM Warehouse w
JOIN (SELECT product_id, Width*Length*Height AS Volume_product FROM Products) Q1
ON w.product_id=q1.product_id
GROUP BY w.name ORDER by w.name;

DROP TABLE Warehouse PURGE;
DROP TABLE Products PURGE;