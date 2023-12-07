Create table Product (product_key int, CONSTRAINT Product_pk PRIMARY KEY (product_key));
Create table Customer (customer_id int not null, product_key int,
CONSTRAINT fk_Customer FOREIGN KEY (product_key) REFERENCES Product(product_key));

insert into Product (product_key) values ('5');
insert into Product (product_key) values ('6');

insert into Customer (customer_id, product_key) values ('1', '5');
insert into Customer (customer_id, product_key) values ('2', '6');
insert into Customer (customer_id, product_key) values ('3', '5');
insert into Customer (customer_id, product_key) values ('3', '6');
insert into Customer (customer_id, product_key) values ('1', '6');

SELECT customer_id FROM
(SELECT customer_id, COUNT(DISTINCT product_key) AS num FROM Customer
GROUP BY customer_id)
WHERE num=(SELECT COUNT(*) FROM Product);

DROP TABLE Customer PURGE;
DROP TABLE Product PURGE;