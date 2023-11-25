Create table orders (order_number int, customer_number int, CONSTRAINT orders_pk PRIMARY KEY (order_number));

insert into orders (order_number, customer_number) values ('1', '1');
insert into orders (order_number, customer_number) values ('2', '2');
insert into orders (order_number, customer_number) values ('3', '3');
insert into orders (order_number, customer_number) values ('4', '3');

SELECT customer_number FROM
(SELECT customer_number, COUNT(order_number) AS COUNT_ORDER
FROM orders GROUP BY customer_number ORDER BY COUNT_ORDER DESC)
FETCH FIRST 1 ROWS ONLY;

DROP TABLE orders PURGE;