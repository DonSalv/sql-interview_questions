Create Table Point2D (x int not null, y int not null);

ALTER TABLE Point2D ADD PRIMARY KEY (x, y) DISABLE;

insert into Point2D (x, y) values ('-1', '-1');
insert into Point2D (x, y) values ('0', '0');
insert into Point2D (x, y) values ('-1', '-2');

SELECT MIN(distance) AS shortest FROM
(SELECT ROUND(SQRT(POWER(p2.x - p1.x, 2) + POWER(p2.y - p1.y, 2)),2) AS distance
FROM Point2D p1 CROSS JOIN Point2D p2)
WHERE distance>0;

DROP TABLE Point2D PURGE;