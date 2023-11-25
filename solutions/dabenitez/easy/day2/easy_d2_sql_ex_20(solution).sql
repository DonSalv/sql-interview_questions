Create table Product (product_id int, product_name varchar(10), CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Sales (sale_id int, product_id int, year int, quantity int, price int, 
CONSTRAINT fk_Sales FOREIGN KEY (product_id) REFERENCES Product(product_id));

ALTER TABLE Sales 
    ADD PRIMARY KEY (sale_id, year) DISABLE;

insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');

insert into Product (product_id, product_name) values ('100', 'Nokia');
insert into Product (product_id, product_name) values ('200', 'Apple');
insert into Product (product_id, product_name) values ('300', 'Samsung');

SELECT p.product_name, s.year, s.price FROM Sales s
JOIN Product p
ON s.product_id=p.product_id;

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;