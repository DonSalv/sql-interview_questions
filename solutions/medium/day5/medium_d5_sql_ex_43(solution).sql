Create table Customers (customer_id int, customer_name varchar(30), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Orders (order_id int, customer_id int, product_name varchar(30), CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Orders FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

insert into Customers (customer_id, customer_name) values ('1', 'Daniel');
insert into Customers (customer_id, customer_name) values ('2', 'Diana');
insert into Customers (customer_id, customer_name) values ('3', 'Elizabeth');
insert into Customers (customer_id, customer_name) values ('4', 'Jhon');

insert into Orders (order_id, customer_id, product_name) values ('10', '1', 'A');
insert into Orders (order_id, customer_id, product_name) values ('20', '1', 'B');
insert into Orders (order_id, customer_id, product_name) values ('30', '1', 'D');
insert into Orders (order_id, customer_id, product_name) values ('40', '1', 'C');
insert into Orders (order_id, customer_id, product_name) values ('50', '2', 'A');
insert into Orders (order_id, customer_id, product_name) values ('60', '3', 'A');
insert into Orders (order_id, customer_id, product_name) values ('70', '3', 'B');
insert into Orders (order_id, customer_id, product_name) values ('80', '3', 'D');
insert into Orders (order_id, customer_id, product_name) values ('90', '4', 'C');

SELECT c.customer_id, c.customer_name FROM Customers c
JOIN Orders o1 ON c.customer_id = o1.customer_id AND o1.product_name = 'A'
JOIN Orders o2 ON c.customer_id = o2.customer_id AND o2.product_name = 'B'
LEFT JOIN Orders o3 ON c.customer_id = o3.customer_id AND o3.product_name = 'C'
WHERE o3.order_id IS NULL;

DROP TABLE Orders PURGE;
DROP TABLE Customers PURGE;