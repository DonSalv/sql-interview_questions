Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date, CONSTRAINT Delivery_pk PRIMARY KEY (delivery_id));

insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', TO_DATE('2019-08-01','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', TO_DATE('2019-08-01','YYYY-MM-DD'), TO_DATE('2019-08-01','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', TO_DATE('2019-08-01','YYYY-MM-DD'), TO_DATE('2019-08-01','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', TO_DATE('2019-08-02','YYYY-MM-DD'), TO_DATE('2019-08-13','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', TO_DATE('2019-08-02','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', TO_DATE('2019-08-02','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', TO_DATE('2019-08-03','YYYY-MM-DD'), TO_DATE('2019-08-03','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('8', '1', TO_DATE('2019-08-03','YYYY-MM-DD'), TO_DATE('2019-08-03','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('9', '5', TO_DATE('2019-08-04','YYYY-MM-DD'), TO_DATE('2019-08-18','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('10', '2', TO_DATE('2019-08-04','YYYY-MM-DD'), TO_DATE('2019-08-18','YYYY-MM-DD'));

SELECT order_date,
ROUND(100*(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*)), 2) AS immediate_percentage
FROM Delivery GROUP BY order_date ORDER BY order_date;

DROP TABLE Delivery PURGE;