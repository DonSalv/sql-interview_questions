Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date, CONSTRAINT Delivery_pk PRIMARY KEY (delivery_id));

insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', TO_DATE('2019-08-01','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '5', TO_DATE('2019-08-02','YYYY-MM-DD'), TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', TO_DATE('2019-08-11','YYYY-MM-DD'), TO_DATE('2019-08-11','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', TO_DATE('2019-08-24','YYYY-MM-DD'), TO_DATE('2019-08-26','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '4', TO_DATE('2019-08-21','YYYY-MM-DD'), TO_DATE('2019-08-22','YYYY-MM-DD'));
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', TO_DATE('2019-08-11','YYYY-MM-DD'), TO_DATE('2019-08-13','YYYY-MM-DD'));

SELECT ROUND(100*(SELECT COUNT(*) FROM Delivery
WHERE order_date = customer_pref_delivery_date)
/ (SELECT COUNT(*) FROM Delivery),2)
AS immediate_percentage FROM DUAL;

DROP TABLE Delivery PURGE;