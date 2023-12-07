Create table Products (product_id int, new_price int, change_date date);

ALTER TABLE Products ADD PRIMARY KEY (product_id, change_date) DISABLE;

insert into Products (product_id, new_price, change_date) values ('1', '20', TO_DATE('2019-08-14','YYYY-MM-DD'));
insert into Products (product_id, new_price, change_date) values ('2', '50', TO_DATE('2019-08-14','YYYY-MM-DD'));
insert into Products (product_id, new_price, change_date) values ('1', '30', TO_DATE('2019-08-15','YYYY-MM-DD'));
insert into Products (product_id, new_price, change_date) values ('1', '35', TO_DATE('2019-08-16','YYYY-MM-DD'));
insert into Products (product_id, new_price, change_date) values ('2', '65', TO_DATE('2019-08-17','YYYY-MM-DD'));
insert into Products (product_id, new_price, change_date) values ('3', '20', TO_DATE('2019-08-18','YYYY-MM-DD'));

SELECT product_id,
COALESCE(MAX(CASE WHEN change_date <= TO_DATE('2019-08-16', 'YYYY-MM-DD') 
THEN new_price END), 10) AS price
FROM Products GROUP BY product_id;

DROP TABLE Products PURGE;