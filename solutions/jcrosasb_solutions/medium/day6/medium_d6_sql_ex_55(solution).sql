-- Crate the calls table
Create table Calls (from_id int, to_id int, duration int);

-- Populate the calls table    
Truncate table Calls;
insert into Calls (from_id, to_id, duration) values (1, 2, 59);
insert into Calls (from_id, to_id, duration) values (2, 1, 11);
insert into Calls (from_id, to_id, duration) values (1, 3, 20);
insert into Calls (from_id, to_id, duration) values (3, 4, 100);
insert into Calls (from_id, to_id, duration) values (3, 4, 200);
insert into Calls (from_id, to_id, duration) values (3, 4, 200);
insert into Calls (from_id, to_id, duration) values (4, 3, 499);

-- Write a solution to report the number of calls and the total call
-- duration between each pair of distinct persons (person1, person2) where person1 < person2
SELECT
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM
    Calls
GROUP BY
    LEAST(from_id, to_id),
    GREATEST(from_id, to_id);

-- Drop tables
DROP TABLE Calls;
