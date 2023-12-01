Create table Products (product_id int, store1 int, store2 int, store3 int, CONSTRAINT Products_pk PRIMARY KEY (product_id));

insert into Products (product_id, store1, store2, store3) values ('0', '95', '100', '105');
insert into Products (product_id, store1, store2, store3) values ('1', '70', NULL, '80');

SELECT product_id, store, price FROM Products
UNPIVOT (price FOR store IN (store1, store2, store3));

DROP TABLE Products PURGE;