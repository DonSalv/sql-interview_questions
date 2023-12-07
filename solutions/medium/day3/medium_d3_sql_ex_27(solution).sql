Create table Users (user_id int, join_date date, favorite_brand varchar(10), CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table Items (item_id int, item_brand varchar(10), CONSTRAINT Items_pk PRIMARY KEY (item_id));
Create table Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES Items(item_id),
CONSTRAINT fk_buyer FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES Users(user_id));

insert into Users (user_id, join_date, favorite_brand) values ('1', TO_DATE('2018-01-01','YYYY-MM-DD'), 'Lenovo');
insert into Users (user_id, join_date, favorite_brand) values ('2', TO_DATE('2018-02-09','YYYY-MM-DD'), 'Samsung');
insert into Users (user_id, join_date, favorite_brand) values ('3', TO_DATE('2018-01-19','YYYY-MM-DD'), 'LG');
insert into Users (user_id, join_date, favorite_brand) values ('4', TO_DATE('2018-05-21','YYYY-MM-DD'), 'HP');

insert into Items (item_id, item_brand) values ('1', 'Samsung');
insert into Items (item_id, item_brand) values ('2', 'Lenovo');
insert into Items (item_id, item_brand) values ('3', 'LG');
insert into Items (item_id, item_brand) values ('4', 'HP');

insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('1', TO_DATE('2019-08-01','YYYY-MM-DD'), '4', '1', '2');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('2', TO_DATE('2018-08-02','YYYY-MM-DD'), '2', '1', '3');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('3', TO_DATE('2019-08-03','YYYY-MM-DD'), '3', '2', '3');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('4', TO_DATE('2018-08-04','YYYY-MM-DD'), '1', '4', '2');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('5', TO_DATE('2018-08-04','YYYY-MM-DD'), '1', '3', '4');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('6', TO_DATE('2019-08-05','YYYY-MM-DD'), '2', '2', '4');

SELECT u.user_id AS buyer_id, u.join_date,
COUNT(o.order_id) AS orders_in_2019
FROM Users u LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND EXTRACT(YEAR FROM o.order_date) = 2019
GROUP BY u.user_id, u.join_date
ORDER BY u.user_id;


DROP TABLE Orders PURGE;
DROP TABLE Items PURGE;
DROP TABLE Users PURGE;