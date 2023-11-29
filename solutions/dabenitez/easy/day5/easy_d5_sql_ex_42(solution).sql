Create table Products (product_id int, product_name varchar(40), product_category varchar(40), CONSTRAINT Products_pk PRIMARY KEY (product_id));
Create table Orders (product_id int, order_date date, unit int,
CONSTRAINT fk_Orders FOREIGN KEY (product_id) REFERENCES Products(product_id));

insert into Products (product_id, product_name, product_category) values ('1', 'Leetcode Solutions', 'Book');
insert into Products (product_id, product_name, product_category) values ('2', 'Jewels of Stringology', 'Book');
insert into Products (product_id, product_name, product_category) values ('3', 'HP', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('4', 'Lenovo', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('5', 'Leetcode Kit', 'T-shirt');

insert into Orders (product_id, order_date, unit) values ('1', TO_DATE('2020-02-05','YYYY-MM-DD'), '60');
insert into Orders (product_id, order_date, unit) values ('1', TO_DATE('2020-02-10','YYYY-MM-DD'), '70');
insert into Orders (product_id, order_date, unit) values ('2', TO_DATE('2020-01-18','YYYY-MM-DD'), '30');
insert into Orders (product_id, order_date, unit) values ('2', TO_DATE('2020-02-11','YYYY-MM-DD'), '80');
insert into Orders (product_id, order_date, unit) values ('3', TO_DATE('2020-02-17','YYYY-MM-DD'), '2');
insert into Orders (product_id, order_date, unit) values ('3', TO_DATE('2020-02-24','YYYY-MM-DD'), '3');
insert into Orders (product_id, order_date, unit) values ('4', TO_DATE('2020-03-01','YYYY-MM-DD'), '20');
insert into Orders (product_id, order_date, unit) values ('4', TO_DATE('2020-03-04','YYYY-MM-DD'), '30');
insert into Orders (product_id, order_date, unit) values ('4', TO_DATE('2020-03-04','YYYY-MM-DD'), '60');
insert into Orders (product_id, order_date, unit) values ('5', TO_DATE('2020-02-25','YYYY-MM-DD'), '50');
insert into Orders (product_id, order_date, unit) values ('5', TO_DATE('2020-02-27','YYYY-MM-DD'), '50');
insert into Orders (product_id, order_date, unit) values ('5', TO_DATE('2020-03-01','YYYY-MM-DD'), '50');

SELECT p.product_name, q1.units FROM Products p
JOIN
(SELECT product_id, SUM(unit) AS units FROM Orders
WHERE EXTRACT(MONTH FROM order_date) = 02 AND EXTRACT(YEAR FROM order_date) = 2020
GROUP BY product_id) q1
ON p.product_id=q1.product_id
WHERE q1.units>=100;

DROP TABLE Orders PURGE;
DROP TABLE Products PURGE;