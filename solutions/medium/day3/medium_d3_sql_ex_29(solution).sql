Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date, CONSTRAINT Delivery_pk PRIMARY KEY (delivery_id));

insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', TO_DATE('2019-08-01','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', TO_DATE('2019-08-02','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', TO_DATE('2019-08-11','YYYY-MM-DD'), TO_DATE('2019-08-12','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', TO_DATE('2019-08-24','YYYY-MM-DD'), TO_DATE('2019-08-24','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', TO_DATE('2019-08-21','YYYY-MM-DD'), TO_DATE('2019-08-22','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', TO_DATE('2019-08-11','YYYY-MM-DD'), TO_DATE('2019-08-13','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', TO_DATE('2019-08-09','YYYY-MM-DD'), TO_DATE('2019-08-09','YYYY-MM-DD'));

SELECT ROUND(100*AVG(Q2.status),2) AS immediate_percentage FROM
(SELECT customer_id, MIN(order_date) AS order_date FROM Delivery
GROUP BY customer_id) Q1 JOIN
(SELECT customer_id, order_date, 
CASE WHEN order_date = customer_pref_delivery_date 
THEN 1 ELSE 0 END AS status FROM Delivery) Q2
ON Q1.order_date=q2.order_date;

DROP TABLE Delivery PURGE;