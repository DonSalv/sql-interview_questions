Create table Customers (customer_id int, name varchar(10), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Orders (order_id int, order_date date, customer_id int, cost int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Orders FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

insert into Customers (customer_id, name) values ('1', 'Winston');
insert into Customers (customer_id, name) values ('2', 'Jonathan');
insert into Customers (customer_id, name) values ('3', 'Annabelle');
insert into Customers (customer_id, name) values ('4', 'Marwan');
insert into Customers (customer_id, name) values ('5', 'Khaled');

insert into Orders (order_id, order_date, customer_id, cost) values ('1', TO_DATE('2020-07-31','YYYY-MM-DD'), '1', '30');
insert into Orders (order_id, order_date, customer_id, cost) values ('2', TO_DATE('2020-07-30','YYYY-MM-DD'), '2', '40');
insert into Orders (order_id, order_date, customer_id, cost) values ('3', TO_DATE('2020-07-31','YYYY-MM-DD'), '3', '70');
insert into Orders (order_id, order_date, customer_id, cost) values ('4', TO_DATE('2020-07-29','YYYY-MM-DD'), '4', '100');
insert into Orders (order_id, order_date, customer_id, cost) values ('5', TO_DATE('2020-06-10','YYYY-MM-DD'), '1', '1010');
insert into Orders (order_id, order_date, customer_id, cost) values ('6', TO_DATE('2020-08-01','YYYY-MM-DD'), '2', '102');
insert into Orders (order_id, order_date, customer_id, cost) values ('7', TO_DATE('2020-08-01','YYYY-MM-DD'), '3', '111');
insert into Orders (order_id, order_date, customer_id, cost) values ('8', TO_DATE('2020-08-03','YYYY-MM-DD'), '1', '99');
insert into Orders (order_id, order_date, customer_id, cost) values ('9', TO_DATE('2020-08-07','YYYY-MM-DD'), '2', '32');
insert into Orders (order_id, order_date, customer_id, cost) values ('10', TO_DATE('2020-07-15','YYYY-MM-DD'), '1', '2');

SELECT name, customer_id, order_id, order_date FROM
(SELECT c.name, c.customer_id, o.order_id, o.order_date,
RANK() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS ranking
FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id)
WHERE ranking<= 3
ORDER BY name, order_date DESC;

DROP TABLE Orders PURGE;
DROP TABLE Customers PURGE;