Create table Items (item_id varchar(30), item_name varchar(30), item_category varchar(30), CONSTRAINT Items_pk PRIMARY KEY (item_id));
Create table Orders (order_id int, customer_id int, order_date date, item_id varchar(30), quantity int,
CONSTRAINT fk_Orders FOREIGN KEY (item_id) REFERENCES Items(item_id));

ALTER TABLE Orders ADD PRIMARY KEY (order_id, item_id) DISABLE;

insert into Items (item_id, item_name, item_category) values ('1', 'LC Alg. Book', 'Book');
insert into Items (item_id, item_name, item_category) values ('2', 'LC DB. Book', 'Book');
insert into Items (item_id, item_name, item_category) values ('3', 'LC SmarthPhone', 'Phone');
insert into Items (item_id, item_name, item_category) values ('4', 'LC Phone 2020', 'Phone');
insert into Items (item_id, item_name, item_category) values ('5', 'LC SmartGlass', 'Glasses');
insert into Items (item_id, item_name, item_category) values ('6', 'LC T-Shirt XL', 'T-shirt');

insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('1', '1', TO_DATE('2020-06-01','YYYY-MM-DD'), '1', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('2', '1', TO_DATE('2020-06-08','YYYY-MM-DD'), '2', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('3', '2', TO_DATE('2020-06-02','YYYY-MM-DD'), '1', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('4', '3', TO_DATE('2020-06-03','YYYY-MM-DD'), '3', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('5', '4', TO_DATE('2020-06-04','YYYY-MM-DD'), '4', '1');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('6', '4', TO_DATE('2020-06-05','YYYY-MM-DD'), '5', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('7', '5', TO_DATE('2020-06-05','YYYY-MM-DD'), '1', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('8', '5', TO_DATE('2020-06-14','YYYY-MM-DD'), '4', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('9', '5', TO_DATE('2020-06-21','YYYY-MM-DD'), '3', '5');

SELECT item_category,
SUM(CASE WHEN Days = 2 THEN quantity ELSE 0 END) AS Monday,
SUM(CASE WHEN Days = 3 THEN quantity ELSE 0 END) AS Tuesday,
SUM(CASE WHEN Days = 4 THEN quantity ELSE 0 END) AS Wednesday,
SUM(CASE WHEN Days = 5 THEN quantity ELSE 0 END) AS Thursday,
SUM(CASE WHEN Days = 6 THEN quantity ELSE 0 END) AS Friday,
SUM(CASE WHEN Days = 7 THEN quantity ELSE 0 END) AS Saturday,
SUM(CASE WHEN Days = 1 THEN quantity ELSE 0 END) AS Sunday
FROM (SELECT i.item_category, TO_CHAR(o.order_date, 'D') AS Days,
SUM(o.quantity) AS quantity FROM Items i
LEFT JOIN Orders o ON o.item_id = i.item_id
GROUP BY i.item_category,TO_CHAR(o.order_date, 'D'))
GROUP BY item_category ORDER BY item_category;

DROP TABLE Orders PURGE;
DROP TABLE Items PURGE;