Create table Store (bill_id int, customer_id int, amount int, CONSTRAINT Store_pk PRIMARY KEY (bill_id));

insert into Store (bill_id, customer_id, amount) values ('6', '1', '549');
insert into Store (bill_id, customer_id, amount) values ('8', '1', '834');
insert into Store (bill_id, customer_id, amount) values ('4', '2', '394');
insert into Store (bill_id, customer_id, amount) values ('11', '3', '657');
insert into Store (bill_id, customer_id, amount) values ('13', '3', '257');


SELECT COUNT(DISTINCT customer_id) AS rich_count FROM
(SELECT customer_id FROM Store WHERE amount>500);

DROP TABLE Store PURGE;