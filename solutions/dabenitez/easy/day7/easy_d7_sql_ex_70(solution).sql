Create table Products (product_id int, store VARCHAR2(10), price int,
CONSTRAINT store_check CHECK (store IN ('store1', 'store2', 'store3')));

ALTER TABLE Products ADD PRIMARY KEY (product_id, store) DISABLE;

insert into Products (product_id, store, price) values ('0', 'store1', '95');
insert into Products (product_id, store, price) values ('0', 'store3', '105');
insert into Products (product_id, store, price) values ('0', 'store2', '100');
insert into Products (product_id, store, price) values ('1', 'store1', '70');
insert into Products (product_id, store, price) values ('1', 'store3', '80');


SELECT product_id,
MAX(CASE WHEN store = 'store1' THEN price END) AS store1,
MAX(CASE WHEN store = 'store2' THEN price END) AS store2,
MAX(CASE WHEN store = 'store3' THEN price END) AS store3
FROM Products
GROUP BY product_id
ORDER BY product_id;

DROP TABLE Products PURGE;