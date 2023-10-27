-- Create the weahter table
Create table Weather (id int, recordDate date, temperature int);

-- Populate the weather table
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values (1, DATE '2015-01-01', 10);
insert into Weather (id, recordDate, temperature) values (2, DATE '2015-01-02', 25);
insert into Weather (id, recordDate, temperature) values (3, DATE '2015-01-03', 20);
insert into Weather (id, recordDate, temperature) values (4, DATE '2015-01-04', 30);

-- Write a solution to find all dates Id with higher temperatures compared to its previous dates (yesterday).
SELECT id 
    FROM (SELECT id, temperature - LAG(temperature) OVER (ORDER BY recordDate) dT 
          FROM weather
         ) 
    WHERE dT > 1;

-- Drop tables
DROP TABLE Weather;

