-- Create the tables
Create table Users (user_id int, join_date date, favorite_brand varchar(10));
Create table Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int);
Create table Items (item_id int, item_brand varchar(10));

-- Populate the users table    
Truncate table Users;
insert into Users (user_id, join_date, favorite_brand) values (1, DATE '2018-01-01', 'Lenovo');
insert into Users (user_id, join_date, favorite_brand) values (2, DATE '2018-02-09', 'Samsung');
insert into Users (user_id, join_date, favorite_brand) values (3, DATE '2018-01-19', 'LG');
insert into Users (user_id, join_date, favorite_brand) values (4, DATE '2018-05-21', 'HP');

-- Populate the orders table    
Truncate table Orders;
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (1, '2019-08-01', 4, 1, 2);
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (2, '2018-08-02', 2, 1, 3);
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (3, '2019-08-03', 3, 2, 3);
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (4, '2018-08-04', 1, 4, 2);
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (5, '2018-08-04', 1, 3, 4);
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values (6, '2019-08-05', 2, 2, 4);

-- Populate the items table    
Truncate table Items;
insert into Items (item_id, item_brand) values (1, 'Samsung');
insert into Items (item_id, item_brand) values (2, 'Lenovo');
insert into Items (item_id, item_brand) values (3, 'LG');
insert into Items (item_id, item_brand) values (4, 'HP');

-- Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019
SELECT
    u.user_id AS buyer_id,
    u.join_date,
    NVL(t.orders_in_2019, 0) AS orders_in_2019
FROM (SELECT 
          o.buyer_id,
          u.join_date,
          COUNT(o.buyer_id) AS orders_in_2019
      FROM
          Orders o
      LEFT JOIN
          USERS u
      ON 
          o.buyer_id = u.user_id
      WHERE
          TO_CHAR(EXTRACT(YEAR FROM o.order_date)) = '2019'
      GROUP BY
          o.buyer_id,
          u.join_date) t
FULL OUTER JOIN
    Users u
ON 
    u.user_id = t.buyer_id;

-- Drop tables
DROP TABLE Users;
DROP TABLE Orders;
DROP TABLE Items;
