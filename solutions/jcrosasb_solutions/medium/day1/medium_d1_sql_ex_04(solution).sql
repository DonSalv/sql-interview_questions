-- Create the logs table
Create table Logs (id int, num int);
    
-- Populate the logs table
Truncate table Logs;
insert into Logs (id, num) values (1, 1);
insert into Logs (id, num) values (2, 1);
insert into Logs (id, num) values (3, 1);
insert into Logs (id, num) values (4, 2);
insert into Logs (id, num) values (5, 1);
insert into Logs (id, num) values (6, 4);
insert into Logs (id, num) values (7, 4);

-- Find all numbers that appear at least three times consecutively
SELECT 
    num
FROM
    (SELECT
         num,
         LAG(num) OVER (ORDER BY id) prev,
         LEAD(num) OVER (ORDER BY id) next
     FROM
        Logs)
WHERE 
    num = prev AND 
    num = next;

-- Drop tables
DROP TABLE Logs;
