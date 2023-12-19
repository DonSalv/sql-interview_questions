Create table Customers (customer_id int, name varchar(10), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Products (product_id int, product_name varchar(20), price int, CONSTRAINT Products_pk PRIMARY KEY (product_id));
Create table Orders (order_id int, order_date date, customer_id int, product_id int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk_Products FOREIGN KEY (product_id) REFERENCES Products(product_id));

insert into Customers (customer_id, name) values ('1', 'Alice');
insert into Customers (customer_id, name) values ('2', 'Bob');
insert into Customers (customer_id, name) values ('3', 'Tom');
insert into Customers (customer_id, name) values ('4', 'Jerry');
insert into Customers (customer_id, name) values ('5', 'John');

insert into Products (product_id, product_name, price) values ('1', 'keyboard', '120');
insert into Products (product_id, product_name, price) values ('2', 'mouse', '80');
insert into Products (product_id, product_name, price) values ('3', 'screen', '600');
insert into Products (product_id, product_name, price) values ('4', 'hard disk', '450');

insert into Orders (order_id, order_date, customer_id, product_id) values ('1', TO_DATE('2020-07-31','YYYY-MM-DD'), '1', '1');
insert into Orders (order_id, order_date, customer_id, product_id) values ('2', TO_DATE('2020-07-30','YYYY-MM-DD'), '2', '2');
insert into Orders (order_id, order_date, customer_id, product_id) values ('3', TO_DATE('2020-08-29','YYYY-MM-DD'), '3', '3');
insert into Orders (order_id, order_date, customer_id, product_id) values ('4', TO_DATE('2020-07-29','YYYY-MM-DD'), '4', '1');
insert into Orders (order_id, order_date, customer_id, product_id) values ('5', TO_DATE('2020-06-10','YYYY-MM-DD'), '1', '2');
insert into Orders (order_id, order_date, customer_id, product_id) values ('6', TO_DATE('2020-08-01','YYYY-MM-DD'), '2', '1');
insert into Orders (order_id, order_date, customer_id, product_id) values ('7', TO_DATE('2020-08-01','YYYY-MM-DD'), '3', '3');
insert into Orders (order_id, order_date, customer_id, product_id) values ('8', TO_DATE('2020-08-03','YYYY-MM-DD'), '1', '2');
insert into Orders (order_id, order_date, customer_id, product_id) values ('9', TO_DATE('2020-08-07','YYYY-MM-DD'), '2', '3');
insert into Orders (order_id, order_date, customer_id, product_id) values ('10', TO_DATE('2020-07-15','YYYY-MM-DD'), '1', '2');

SELECT q1.customer_id, q1.product_id, p.product_name FROM
(SELECT customer_id, product_id, COUNT(*) AS num,
DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS ranking FROM Orders
GROUP BY customer_id, product_id) Q1
JOIN Products p ON p.product_id=q1.product_id
WHERE q1.ranking=1
ORDER BY q1.customer_id, q1.product_id;

DROP TABLE Orders PURGE;
DROP TABLE Products PURGE;
DROP TABLE Customers PURGE;