Create table Prices (product_id int, start_date date, end_date date, price int);
Create table UnitsSold (product_id int, purchase_date date, units int);

ALTER TABLE Prices 
    ADD PRIMARY KEY (product_id, start_date, end_date) DISABLE;
    
insert into Prices (product_id, start_date, end_date, price) values ('1', TO_DATE('2019-02-17','YYYY-MM-DD'), TO_DATE('2019-02-28','YYYY-MM-DD'), '5');
insert into Prices (product_id, start_date, end_date, price) values ('1', TO_DATE('2019-03-01','YYYY-MM-DD'), TO_DATE('2019-03-22','YYYY-MM-DD'), '20');
insert into Prices (product_id, start_date, end_date, price) values ('2', TO_DATE('2019-02-01','YYYY-MM-DD'), TO_DATE('2019-02-20','YYYY-MM-DD'), '15');
insert into Prices (product_id, start_date, end_date, price) values ('2', TO_DATE('2019-02-21','YYYY-MM-DD'), TO_DATE('2019-03-31','YYYY-MM-DD'), '30');

insert into UnitsSold (product_id, purchase_date, units) values ('1', TO_DATE('2019-02-25','YYYY-MM-DD'), '100');
insert into UnitsSold (product_id, purchase_date, units) values ('1', TO_DATE('2019-03-01','YYYY-MM-DD'), '15');
insert into UnitsSold (product_id, purchase_date, units) values ('2', TO_DATE('2019-02-10','YYYY-MM-DD'), '200');
insert into UnitsSold (product_id, purchase_date, units) values ('2', TO_DATE('2019-03-22','YYYY-MM-DD'), '30');

SELECT p.product_id, ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM PRICES p JOIN UNITSSOLD u 
ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY  p.product_id;

DROP TABLE UnitsSold PURGE;
DROP TABLE Prices PURGE;