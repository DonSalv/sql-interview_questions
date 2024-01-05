Create table Orders (order_id int, customer_id int, order_date date, price int, CONSTRAINT Orders_pk PRIMARY KEY (order_id));

insert into Orders (order_id, customer_id, order_date, price) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), '1100');
insert into Orders (order_id, customer_id, order_date, price) values ('2', '1', TO_DATE('2019-11-01','YYYY-MM-DD'), '1200');
insert into Orders (order_id, customer_id, order_date, price) values ('3', '1', TO_DATE('2020-05-26','YYYY-MM-DD'), '3000');
insert into Orders (order_id, customer_id, order_date, price) values ('4', '1', TO_DATE('2021-08-31','YYYY-MM-DD'), '3100');
insert into Orders (order_id, customer_id, order_date, price) values ('5', '1', TO_DATE('2022-12-07','YYYY-MM-DD'), '4700');
insert into Orders (order_id, customer_id, order_date, price) values ('6', '2', TO_DATE('2015-01-01','YYYY-MM-DD'), '700');
insert into Orders (order_id, customer_id, order_date, price) values ('7', '2', TO_DATE('2017-11-07','YYYY-MM-DD'), '1000');
insert into Orders (order_id, customer_id, order_date, price) values ('8', '3', TO_DATE('2017-01-01','YYYY-MM-DD'), '900');
insert into Orders (order_id, customer_id, order_date, price) values ('9', '3', TO_DATE('2018-11-07','YYYY-MM-DD'), '900');

SELECT DISTINCT customer_id FROM Orders
MINUS
SELECT DISTINCT customer_id FROM
(SELECT customer_id, year, price,
price-LAG(price) OVER (PARTITION BY customer_id ORDER BY year) AS difference_price,
year-LAG(year) OVER (PARTITION BY customer_id ORDER BY year) AS difference_year FROM
(SELECT customer_id, EXTRACT(YEAR FROM order_date) AS year, SUM(price) AS price 
FROM Orders GROUP BY customer_id, EXTRACT(YEAR FROM order_date)
ORDER BY customer_id, EXTRACT(YEAR FROM order_date)))
WHERE difference_price<=0 OR difference_year>1;

DROP TABLE Orders PURGE;