Create Table Point (x int, CONSTRAINT Point_pk PRIMARY KEY (x));

insert into Point (x) values ('-1');
insert into Point (x) values ('0');
insert into Point (x) values ('2');

SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM POINT p1
CROSS JOIN POINT p2
WHERE p1.x <> p2.x;

DROP TABLE Point PURGE;