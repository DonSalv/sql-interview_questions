Create table Points (id int, x_value int, y_value int, CONSTRAINT Points_pk PRIMARY KEY (id));

insert into Points (id, x_value, y_value) values ('1', '2', '7');
insert into Points (id, x_value, y_value) values ('2', '4', '8');
insert into Points (id, x_value, y_value) values ('3', '2', '10');

SELECT p1, p2, area FROM 
(SELECT p1.id AS p1, p2.id AS p2, 
ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) AS area
FROM Points p1 JOIN Points p2 ON p1.id < p2.id)
WHERE area > 0
ORDER BY area DESC, p1, p2;

DROP TABLE Points PURGE;