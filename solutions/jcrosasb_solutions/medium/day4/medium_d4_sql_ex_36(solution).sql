-- Create the logs table
Create table Logs (log_id int);
    
-- Populate the logs table
Truncate table Logs;
insert into Logs (log_id) values (1);
insert into Logs (log_id) values (2);
insert into Logs (log_id) values (3);
insert into Logs (log_id) values (7);
insert into Logs (log_id) values (8);
insert into Logs (log_id) values (10);

-- Write a solution to find the start and end number of continuous ranges in the table LOGS.
-- Return the result table ordered by start_id
SELECT
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM (SELECT 
          log_id, 
          ROW_NUMBER() OVER (ORDER BY log_id) AS num
      FROM 
          logs)
GROUP BY
    log_id - num
ORDER BY
    start_id;  

-- Drop table
DROP TABLE Logs;
