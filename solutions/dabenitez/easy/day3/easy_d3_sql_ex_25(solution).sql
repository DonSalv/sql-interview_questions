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


SELECT DISTINCT s.buyer_id FROM SALES s
JOIN PRODUCT p ON s.product_id = p.product_id
WHERE p.product_name = 'S8' AND s.buyer_id NOT IN 
(SELECT DISTINCT s2.buyer_id FROM SALES s2
JOIN PRODUCT p2 ON s2.product_id = p2.product_id
WHERE p2.product_name = 'iPhone');

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;
