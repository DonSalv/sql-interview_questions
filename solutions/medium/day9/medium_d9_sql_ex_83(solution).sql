Create table Orders (order_id int, product_id int, quantity int, purchase_date date, CONSTRAINT Orders_pk PRIMARY KEY (order_id));

insert into Orders (order_id, product_id, quantity, purchase_date) values ('1', '1', '7', TO_DATE('2020-03-16','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('2', '1', '4', TO_DATE('2020-12-02','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('3', '1', '7', TO_DATE('2020-05-10','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('4', '1', '6', TO_DATE('2021-12-23','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('5', '1', '5', TO_DATE('2021-05-21','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('6', '1', '6', TO_DATE('2021-10-11','YYYY-MM-DD'));
insert into Orders (order_id, product_id, quantity, purchase_date) values ('7', '2', '6', TO_DATE('2022-10-11','YYYY-MM-DD'));

SELECT DISTINCT product_id FROM
(SELECT product_id, EXTRACT(YEAR FROM purchase_date) AS year, COUNT(*) AS Purchases,
LAG(EXTRACT(YEAR FROM purchase_date)) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM purchase_date)) AS previous_year
FROM Orders GROUP BY product_id, EXTRACT(YEAR FROM purchase_date)
HAVING COUNT(*)>=3)
WHERE year-previous_year=1;

DROP TABLE Orders PURGE;