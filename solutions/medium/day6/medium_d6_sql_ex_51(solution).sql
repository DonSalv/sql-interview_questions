Create table Customers (customer_id int, name varchar(10), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));
Create table Products (product_id int, product_name varchar(20), price int, CONSTRAINT Products_pk PRIMARY KEY (product_id));
Create table Orders (order_id int, order_date date, customer_id int, product_id int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk_Products FOREIGN KEY (product_id) REFERENCES Products(product_id));

insert into Customers (customer_id, name) values ('1', 'Winston');
insert into Customers (customer_id, name) values ('2', 'Jonathan');
insert into Customers (customer_id, name) values ('3', 'Annabelle');
insert into Customers (customer_id, name) values ('4', 'Marwan');
insert into Customers (customer_id, name) values ('5', 'Khaled');

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
insert into Orders (order_id, order_date, customer_id, product_id) values ('7', TO_DATE('2020-08-01','YYYY-MM-DD'), '3', '1');
insert into Orders (order_id, order_date, customer_id, product_id) values ('8', TO_DATE('2020-08-03','YYYY-MM-DD'), '1', '2');
insert into Orders (order_id, order_date, customer_id, product_id) values ('9', TO_DATE('2020-08-07','YYYY-MM-DD'), '2', '3');
insert into Orders (order_id, order_date, customer_id, product_id) values ('10', TO_DATE('2020-07-15','YYYY-MM-DD'), '1', '2');

SELECT product_name, product_id, order_id, order_date FROM
(SELECT p.product_name, p.product_id, o.order_id, o.order_date,
DENSE_RANK() OVER (PARTITION BY p.product_id ORDER BY o.order_date DESC) AS ranking
FROM Orders o JOIN Products p ON o.product_id = p.product_id)
WHERE ranking= 1
ORDER BY product_name, product_id, order_id;

DROP TABLE Orders PURGE;
DROP TABLE Products PURGE;
DROP TABLE Customers PURGE;s