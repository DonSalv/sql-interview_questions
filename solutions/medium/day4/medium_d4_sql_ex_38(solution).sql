Create table Customer (customer_id int, name varchar(20), visited_on date, amount int);

ALTER TABLE Customer ADD PRIMARY KEY (customer_id, visited_on) DISABLE;

insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', TO_DATE('2019-01-01','YYYY-MM-DD'), '100');
insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', TO_DATE('2019-01-02','YYYY-MM-DD'), '110');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', TO_DATE('2019-01-03','YYYY-MM-DD'), '120');
insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', TO_DATE('2019-01-04','YYYY-MM-DD'), '130');
insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', TO_DATE('2019-01-05','YYYY-MM-DD'), '110');
insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', TO_DATE('2019-01-06','YYYY-MM-DD'), '140');
insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', TO_DATE('2019-01-07','YYYY-MM-DD'), '150');
insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', TO_DATE('2019-01-08','YYYY-MM-DD'), '80');
insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', TO_DATE('2019-01-09','YYYY-MM-DD'), '110');
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', TO_DATE('2019-01-10','YYYY-MM-DD'), '130');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', TO_DATE('2019-01-10','YYYY-MM-DD'), '150');

SELECT visited_on, amount, average_amount FROM
(SELECT visited_on, 
SUM(sum_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
ROUND(AVG(sum_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount,
ROW_NUMBER() OVER (ORDER BY visited_on) AS num FROM 
(SELECT visited_on, SUM(amount) AS sum_amount FROM Customer
GROUP BY visited_on ORDER BY visited_on))
WHERE num>6;

DROP TABLE Customer PURGE;