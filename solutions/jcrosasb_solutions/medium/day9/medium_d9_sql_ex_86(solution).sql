-- Create the weather table
Create table Weather (city_id int, day date, degree int);

-- Populate the wather table    
Truncate table Weather;
insert into Weather (city_id, day, degree) values ('1', DATE '2022-01-07', '-12');
insert into Weather (city_id, day, degree) values ('1', DATE '2022-03-07', '5');
insert into Weather (city_id, day, degree) values ('1', DATE '2022-07-07', '24');
insert into Weather (city_id, day, degree) values ('2', DATE '2022-08-07', '37');
insert into Weather (city_id, day, degree) values ('2', DATE '2022-08-17', '37');
insert into Weather (city_id, day, degree) values ('3', DATE '2022-02-07', '-7');
insert into Weather (city_id, day, degree) values ('3', DATE '2022-12-07', '-6');

-- Write a solution to report the day that has the maximum recorded degree in each city. 
-- If the maximum degree was recorded for the same city multiple times, return the earliest day among them.
-- Return the result table ordered by city_id in ascending order
SELECT
    city_id,
    MIN(day) AS day,
    degree
FROM
    (SELECT
        t.city_id,
        w.day,
        t.degree
    FROM
        (SELECT
            city_id,
            MAX(degree) AS degree
        FROM
            Weather
        GROUP BY
            city_id) t
    INNER JOIN
        Weather w
    ON
        t.city_id = w.city_id AND
        t.degree = w.degree)
GROUP BY
    city_id,
    degree
ORDER BY
    city_id;

-- Drop tables
DROP TABLE Weather;
