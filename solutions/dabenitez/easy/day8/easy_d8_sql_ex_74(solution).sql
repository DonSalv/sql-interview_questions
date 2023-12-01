Create table Customers (customer_id int, year int, revenue int);

ALTER TABLE Customers ADD PRIMARY KEY (customer_id, year) DISABLE;

insert into Customers (customer_id, year, revenue) values ('1', '2018', '50');
insert into Customers (customer_id, year, revenue) values ('1', '2021', '30');
insert into Customers (customer_id, year, revenue) values ('1', '2020', '70');
insert into Customers (customer_id, year, revenue) values ('2', '2021', '-50');
insert into Customers (customer_id, year, revenue) values ('3', '2018', '10');
insert into Customers (customer_id, year, revenue) values ('3', '2016', '50');
insert into Customers (customer_id, year, revenue) values ('4', '2021', '20');

SELECT customer_id FROM Customers
WHERE year='2021' AND revenue>0;

DROP TABLE Customers PURGE;