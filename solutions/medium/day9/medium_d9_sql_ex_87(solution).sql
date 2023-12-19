Create table Product (product_id int, price int, CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Sales (sale_id int, product_id int, user_id int, quantity int, CONSTRAINT Sales_pk PRIMARY KEY (sale_id),
CONSTRAINT fk_Sales FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Product (product_id, price) values ('1', '10');
insert into Product (product_id, price) values ('2', '25');
insert into Product (product_id, price) values ('3', '15');

insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '3', '101', '7');
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '1', '102', '9');
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '2', '102', '6');
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '3', '102', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('6', '1', '102', '6');

SELECT user_id, product_id FROM
(SELECT s.user_id, s.product_id, SUM(s.quantity*p.price) AS spent,
RANK() OVER (PARTITION BY s.user_id ORDER BY SUM(s.quantity*p.price) DESC) AS ranking
FROM Sales s JOIN Product p ON s.product_id = p.product_id
GROUP BY s.user_id,s.product_id)
WHERE ranking=1;

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;