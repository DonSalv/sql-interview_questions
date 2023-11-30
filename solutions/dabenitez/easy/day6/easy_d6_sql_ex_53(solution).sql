Create table Sales (sale_id int, product_name varchar(30), sale_date date, CONSTRAINT Sales_pk PRIMARY KEY (sale_id));

insert into Sales (sale_id, product_name, sale_date) values ('1', 'LCPHONE', TO_DATE('2000-01-16','YYYY-MM-DD'));
insert into Sales (sale_id, product_name, sale_date) values ('2', 'LCPhone', TO_DATE('2000-01-17','YYYY-MM-DD'));
insert into Sales (sale_id, product_name, sale_date) values ('3', 'LcPhOnE', TO_DATE('2000-02-18','YYYY-MM-DD'));
insert into Sales (sale_id, product_name, sale_date) values ('4', 'LCKeyCHAiN', TO_DATE('2000-02-19','YYYY-MM-DD'));
insert into Sales (sale_id, product_name, sale_date) values ('5', 'LCKeyChain', TO_DATE('2000-02-28','YYYY-MM-DD'));
insert into Sales (sale_id, product_name, sale_date) values ('6', 'Matryoshka', TO_DATE('2000-03-31','YYYY-MM-DD'));

SELECT LOWER(TRIM(product_name)) AS product_name,
TO_CHAR(sale_date, 'YYYY-MM') AS sale_date,
COUNT(*) AS total FROM Sales
GROUP BY LOWER(TRIM(product_name)), TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY LOWER(TRIM(product_name));

DROP TABLE Sales PURGE;