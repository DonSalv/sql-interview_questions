Create table Products (product_id int, low_fats VARCHAR2(5), recyclable VARCHAR2(5), CONSTRAINT Products_pk PRIMARY KEY (product_id), 
CONSTRAINT low_fats_check CHECK (low_fats IN ('Y', 'N')), CONSTRAINT recyclable_check CHECK (recyclable IN ('Y', 'N')));

insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');

SELECT product_id FROM Products
WHERE low_fats='Y' AND recyclable='Y';

DROP TABLE Products PURGE;