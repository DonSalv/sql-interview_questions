Create table Seller (seller_id int, seller_name varchar(20), CONSTRAINT Seller_pk PRIMARY KEY (seller_id));
Create table Orders (order_id int, sale_date date, order_cost int, customer_id int, seller_id int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
CONSTRAINT fk_Seller FOREIGN KEY (seller_id) REFERENCES Seller(seller_id));

insert into Customer (customer_id, customer_name) values ('101', 'Alice');
insert into Customer (customer_id, customer_name) values ('102', 'Bob');
insert into Customer (customer_id, customer_name) values ('103', 'Charlie');

insert into Seller (seller_id, seller_name) values ('1', 'Daniel');
insert into Seller (seller_id, seller_name) values ('2', 'Elizabeth');
insert into Seller (seller_id, seller_name) values ('3', 'Frank');

insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('1', TO_DATE('2020-03-01','YYYY-MM-DD'), '1500', '101', '1');
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('2', TO_DATE('2020-05-25','YYYY-MM-DD'), '2400', '102', '2');
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('3', TO_DATE('2019-05-25','YYYY-MM-DD'), '800', '101', '3');
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('4', TO_DATE('2020-09-13','YYYY-MM-DD'), '1000', '103', '2');
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('5', TO_DATE('2019-02-11','YYYY-MM-DD'), '700', '101', '2');

(SELECT seller_name FROM Seller)
MINUS
(SELECT s.seller_name FROM Seller s JOIN
(SELECT DISTINCT seller_id FROM Orders
WHERE EXTRACT(YEAR FROM sale_date) = 2020) Q1
ON s.seller_id=q1.seller_id);

DROP TABLE Orders PURGE;
DROP TABLE Seller PURGE;
DROP TABLE Customer PURGE;