Create table Products (product_id int, store varchar(10), price int);

ALTER TABLE Products ADD PRIMARY KEY (product_id, store) DISABLE;

insert into Products (product_id, store, price) values ('1', 'Shop', '110');
insert into Products (product_id, store, price) values ('1', 'LC_Store', '100');
insert into Products (product_id, store, price) values ('2', 'Nozama', '200');
insert into Products (product_id, store, price) values ('2', 'Souq', '190');
insert into Products (product_id, store, price) values ('3', 'Shop', '1000');
insert into Products (product_id, store, price) values ('3', 'Souq', '1900');

SELECT * FROM Products
PIVOT(MAX(price) FOR store IN ('LC_Store','Nozama','Shop', 'Souq'));

DROP TABLE Products PURGE;
