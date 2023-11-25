Create table Product (product_id int, product_name varchar(10), unit_price int, CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Sales (seller_id int, product_id int, buyer_id int not null, sale_date date not null, quantity int, price int, 
CONSTRAINT fk_Sales FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Product (product_id, product_name, unit_price) values ('1', 'S8', '1000');
insert into Product (product_id, product_name, unit_price) values ('2', 'G4', '800');
insert into Product (product_id, product_name, unit_price) values ('3', 'iPhone', '1400');

insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '1', '1', TO_DATE('2019-01-21','YYYY-MM-DD'), '2', '2000');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '2', '2', TO_DATE('2019-02-17','YYYY-MM-DD'), '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('2', '2', '3', TO_DATE('2019-06-02','YYYY-MM-DD'), '1', '800');
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('3', '3', '4', TO_DATE('2019-05-13','YYYY-MM-DD'), '2', '2800');

(SELECT DISTINCT p.product_id, p.product_name FROM PRODUCT p
LEFT JOIN SALES s ON p.product_id = s.product_id
WHERE (s.sale_date >= TO_DATE('2019-01-01', 'YYYY-MM-DD') 
AND s.sale_date <= TO_DATE('2019-03-31', 'YYYY-MM-DD')))
MINUS
(SELECT DISTINCT p.product_id, p.product_name FROM PRODUCT p
LEFT JOIN SALES s ON p.product_id = s.product_id
WHERE (s.sale_date <= TO_DATE('2019-01-01', 'YYYY-MM-DD') 
OR s.sale_date >= TO_DATE('2019-03-31', 'YYYY-MM-DD')));

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;