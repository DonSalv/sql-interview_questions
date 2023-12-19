Create table OrdersDetails (order_id int, product_id int, quantity int);

ALTER TABLE OrdersDetails ADD PRIMARY KEY (order_id, product_id) DISABLE;

insert into OrdersDetails (order_id, product_id, quantity) values ('1', '1', '12');
insert into OrdersDetails (order_id, product_id, quantity) values ('1', '2', '10');
insert into OrdersDetails (order_id, product_id, quantity) values ('1', '3', '15');
insert into OrdersDetails (order_id, product_id, quantity) values ('2', '1', '8');
insert into OrdersDetails (order_id, product_id, quantity) values ('2', '4', '4');
insert into OrdersDetails (order_id, product_id, quantity) values ('2', '5', '6');
insert into OrdersDetails (order_id, product_id, quantity) values ('3', '3', '5');
insert into OrdersDetails (order_id, product_id, quantity) values ('3', '4', '18');
insert into OrdersDetails (order_id, product_id, quantity) values ('4', '5', '2');
insert into OrdersDetails (order_id, product_id, quantity) values ('4', '6', '8');
insert into OrdersDetails (order_id, product_id, quantity) values ('5', '7', '9');
insert into OrdersDetails (order_id, product_id, quantity) values ('5', '8', '9');
insert into OrdersDetails (order_id, product_id, quantity) values ('3', '9', '20');
insert into OrdersDetails (order_id, product_id, quantity) values ('2', '9', '4');

SELECT order_id FROM
(SELECT order_id, SUM(quantity)/COUNT(product_id) AS average, MAX(quantity) AS maxima
FROM OrdersDetails GROUP BY order_id)
WHERE maxima>
(SELECT MAX(SUM(quantity)/COUNT(product_id)) AS average FROM OrdersDetails GROUP BY order_id);

DROP TABLE OrdersDetails PURGE;