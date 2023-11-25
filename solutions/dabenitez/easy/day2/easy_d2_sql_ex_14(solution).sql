Create table Triangle (x int, y int, z int);

insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');

SELECT x, y, z,
  CASE 
    WHEN x + y > z AND y + z > x AND z + x > y THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM TRIANGLE;

DROP TABLE Triangle PURGE;