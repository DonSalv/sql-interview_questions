Create table Orders (order_id int, customer_id int, order_type int, CONSTRAINT Orders_pk PRIMARY KEY (order_id));

insert into Orders (order_id, customer_id, order_type) values ('1', '1', '0');
insert into Orders (order_id, customer_id, order_type) values ('2', '1', '0');
insert into Orders (order_id, customer_id, order_type) values ('11', '2', '0');
insert into Orders (order_id, customer_id, order_type) values ('12', '2', '1');
insert into Orders (order_id, customer_id, order_type) values ('21', '3', '1');
insert into Orders (order_id, customer_id, order_type) values ('22', '3', '0');
insert into Orders (order_id, customer_id, order_type) values ('31', '4', '1');
insert into Orders (order_id, customer_id, order_type) values ('32', '4', '1');

SELECT * FROM Orders WHERE customer_id IN
(SELECT customer_id FROM
(SELECT customer_id FROM Orders 
GROUP BY customer_id, order_type)
GROUP BY customer_id
HAVING COUNT(*)=1)
UNION
SELECT * FROM Orders WHERE order_type=0
AND customer_id NOT IN
(SELECT customer_id FROM
(SELECT customer_id FROM Orders 
GROUP BY customer_id, order_type)
GROUP BY customer_id
HAVING COUNT(*)=1);

DROP TABLE Orders PURGE;