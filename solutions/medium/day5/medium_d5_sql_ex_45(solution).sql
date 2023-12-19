Create table Sales (sale_date date, fruit VARCHAR2(10), sold_num int,
CONSTRAINT fruit_check CHECK (fruit IN ('apples', 'oranges')));

ALTER TABLE Sales ADD PRIMARY KEY (sale_date, fruit) DISABLE;

insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-01','YYYY-MM-DD'), 'apples', '10');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-01','YYYY-MM-DD'), 'oranges', '8');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-02','YYYY-MM-DD'), 'apples', '15');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-02','YYYY-MM-DD'), 'oranges', '15');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-03','YYYY-MM-DD'), 'apples', '20');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-03','YYYY-MM-DD'), 'oranges', '0');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-04','YYYY-MM-DD'), 'apples', '15');
insert into Sales (sale_date, fruit, sold_num) values (TO_DATE('2020-05-04','YYYY-MM-DD'), 'oranges', '16');

SELECT sale_date, SUM(num) AS diff FROM
(SELECT sale_date, sold_num AS num FROM Sales
WHERE fruit='apples'
UNION
SELECT sale_date, -sold_num AS num FROM Sales
WHERE fruit='oranges')
GROUP BY sale_date ORDER BY sale_date;

DROP TABLE Sales PURGE;