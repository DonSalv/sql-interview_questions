Create table Product (product_id int, price int, CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Sales (sale_id int, product_id int, user_id int, quantity int, CONSTRAINT Sales_pk PRIMARY KEY (sale_id),
CONSTRAINT fk_Sales FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Product (product_id, price) values ('1', '10');
insert into Product (product_id, price) values ('2', '25');
insert into Product (product_id, price) values ('3', '15');

insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '2', '101', '1');
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '3', '102', '3');
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '3', '102', '2');
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '2', '103', '3');

SELECT s.user_id, SUM(s.quantity*p.price) AS spending FROM Sales s
JOIN Product p ON s.product_id=p.product_id
GROUP BY s.user_id
ORDER BY spending DESC, s.user_id;

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;