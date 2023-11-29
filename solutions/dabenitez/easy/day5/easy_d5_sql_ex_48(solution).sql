Create table Activities (sell_date date, product varchar(20));

insert into Activities (sell_date, product) values (TO_DATE('2020-05-30','YYYY-MM-DD'), 'Headphone');
insert into Activities (sell_date, product) values (TO_DATE('2020-06-01','YYYY-MM-DD'), 'Pencil');
insert into Activities (sell_date, product) values (TO_DATE('2020-06-02','YYYY-MM-DD'), 'Mask');
insert into Activities (sell_date, product) values (TO_DATE('2020-05-30','YYYY-MM-DD'), 'Basketball');
insert into Activities (sell_date, product) values (TO_DATE('2020-06-01','YYYY-MM-DD'), 'Bible');
insert into Activities (sell_date, product) values (TO_DATE('2020-06-02','YYYY-MM-DD'), 'Mask');
insert into Activities (sell_date, product) values (TO_DATE('2020-05-30','YYYY-MM-DD'), 'T-Shirt');

SELECT sell_date, COUNT(DISTINCT product) AS num_sold,
LISTAGG(DISTINCT product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

DROP TABLE Activities PURGE;