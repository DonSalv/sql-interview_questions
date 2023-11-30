Create table Orders (order_id int, order_date date, customer_id int, invoice int, CONSTRAINT Orders_pk PRIMARY KEY (order_id));

insert into Orders (order_id, order_date, customer_id, invoice) values ('1', TO_DATE('2020-09-15','YYYY-MM-DD'), '1', '30');
insert into Orders (order_id, order_date, customer_id, invoice) values ('2', TO_DATE('2020-09-17','YYYY-MM-DD'), '2', '90');
insert into Orders (order_id, order_date, customer_id, invoice) values ('3', TO_DATE('2020-10-06','YYYY-MM-DD'), '3', '20');
insert into Orders (order_id, order_date, customer_id, invoice) values ('4', TO_DATE('2020-10-20','YYYY-MM-DD'), '3', '21');
insert into Orders (order_id, order_date, customer_id, invoice) values ('5', TO_DATE('2020-11-10','YYYY-MM-DD'), '1', '10');
insert into Orders (order_id, order_date, customer_id, invoice) values ('6', TO_DATE('2020-11-21','YYYY-MM-DD'), '2', '15');
insert into Orders (order_id, order_date, customer_id, invoice) values ('7', TO_DATE('2020-12-01','YYYY-MM-DD'), '4', '55');
insert into Orders (order_id, order_date, customer_id, invoice) values ('8', TO_DATE('2020-12-03','YYYY-MM-DD'), '4', '77');
insert into Orders (order_id, order_date, customer_id, invoice) values ('9', TO_DATE('2021-01-07','YYYY-MM-DD'), '3', '31');
insert into Orders (order_id, order_date, customer_id, invoice) values ('10', TO_DATE('2021-01-15','YYYY-MM-DD'), '2', '20');

SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, 
COUNT(DISTINCT order_id) AS order_count, 
COUNT(DISTINCT customer_id) AS customer_count
FROM Orders WHERE invoice>20
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY TO_CHAR(order_date, 'YYYY-MM');

DROP TABLE Orders PURGE;