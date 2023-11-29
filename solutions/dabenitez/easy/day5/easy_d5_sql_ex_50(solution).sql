Create table Customers (customer_id int, name varchar(30), country varchar(30), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Product (product_id int, description varchar(30), price int, CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Orders (order_id int, customer_id int, product_id int, order_date date, quantity int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk_Product FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Customers (customer_id, name, country) values ('1', 'Winston', 'USA');
insert into Customers (customer_id, name, country) values ('2', 'Jonathan', 'Peru');
insert into Customers (customer_id, name, country) values ('3', 'Moustafa', 'Egypt');

insert into Product (product_id, description, price) values ('10', 'LC Phone', '300');
insert into Product (product_id, description, price) values ('20', 'LC T-Shirt', '10');
insert into Product (product_id, description, price) values ('30', 'LC Book', '45');
insert into Product (product_id, description, price) values ('40', 'LC Keychain', '2');

insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('1', '1', '10', TO_DATE('2020-06-10','YYYY-MM-DD'), '1');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('2', '1', '20', TO_DATE('2020-07-01','YYYY-MM-DD'), '1');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('3', '1', '30', TO_DATE('2020-07-08','YYYY-MM-DD'), '2');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('4', '2', '10', TO_DATE('2020-06-15','YYYY-MM-DD'), '2');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('5', '2', '40', TO_DATE('2020-07-01','YYYY-MM-DD'), '10');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('6', '3', '20', TO_DATE('2020-06-24','YYYY-MM-DD'), '2');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('7', '3', '30', TO_DATE('2020-06-25','YYYY-MM-DD'), '2');
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('9', '3', '30', TO_DATE('2020-05-08','YYYY-MM-DD'), '3');

SELECT customer_id, name FROM
(SELECT c.customer_id,c.name, q1.month, q1.spent FROM
(SELECT o.customer_id, EXTRACT(MONTH FROM o.order_date) AS month, 
SUM(o.quantity*p.price) AS spent FROM Orders o
JOIN Product p ON o.product_id=p.product_id
GROUP BY o.customer_id, EXTRACT(MONTH FROM o.order_date)) Q1
JOIN Customers c ON c.customer_id=q1.customer_id
WHERE month=7 and spent>=100 OR month=6 and spent>=100)
GROUP BY customer_id, name
HAVING COUNT(*) = 2;

DROP TABLE Orders PURGE;
DROP TABLE Product PURGE;
DROP TABLE Customers PURGE;