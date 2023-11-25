Create table SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date, CONSTRAINT SalesPerson_pk PRIMARY KEY (sales_id));
Create table Company (com_id int, name varchar(255), city varchar(255), CONSTRAINT Company_pk PRIMARY KEY (com_id));
Create table Orders (order_id int, order_date date, com_id int, sales_id int, amount int, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
    CONSTRAINT fk_Orders1 FOREIGN KEY (sales_id) REFERENCES SalesPerson(sales_id),
    CONSTRAINT fk_Orders2 FOREIGN KEY (com_id) REFERENCES Company(com_id));

insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', TO_DATE('4/1/2006','MM/DD/YYYY'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', TO_DATE('5/1/2010','MM/DD/YYYY'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', TO_DATE('12/25/2008','MM/DD/YYYY'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', TO_DATE('1/1/2005','MM/DD/YYYY'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', TO_DATE('2/3/2007','MM/DD/YYYY'));

insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');

insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', TO_DATE('1/1/2014','DD/MM/YYYY'), '3', '4', '10000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', TO_DATE('2/1/2014','DD/MM/YYYY'), '4', '5', '5000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', TO_DATE('3/1/2014','DD/MM/YYYY'), '1', '1', '50000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', TO_DATE('4/1/2014','DD/MM/YYYY'), '1', '4', '25000');

(SELECT name FROM SalesPerson)
MINUS
(SELECT name FROM
(SELECT c.name AS company_name, q.name FROM Company c
JOIN
(SELECT o.com_id, o.sales_id, s.name FROM Orders o
JOIN SalesPerson s
ON o.sales_id=s.sales_id) q
ON c.com_id=q.com_id)
WHERE COMPANY_NAME='RED');

DROP TABLE Orders PURGE;
DROP TABLE SalesPerson PURGE;
DROP TABLE Company PURGE;