-- Create the activity table
Create table Activity (machine_id int, process_id int, activity_type varchar(5) CONSTRAINT check_enum_values CHECK (activity_type IN ('start', 'end')), timestamp float);

-- Populate the activity table    
Truncate table Activity;
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 0, 'start', 0.712);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 0, 'end', 1.52);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 1, 'start', 3.14);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 1, 'end', 4.12);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 0, 'start', 0.55);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 0, 'end', 1.55);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 1, 'start', 0.43);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 1, 'end', 1.42);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 0, 'start', 4.1);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 0, 'end', 4.512);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 1, 'start', 2.5);
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 1, 'end', 5);

-- There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp.
-- The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
-- The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
SELECT
    machine_id,
    ROUND(AVG(end_time - start_time),3) processing_time
FROM (SELECT 
          machine_id, 
          process_id,
          MAX(CASE WHEN activity_type = 'start' THEN timestamp END) start_time,
          MAX(CASE WHEN activity_type = 'end' THEN timestamp END) end_time
      FROM Activity
      GROUP BY 
          machine_id,
          process_id)
GROUP BY machine_id
ORDER BY machine_id;

-- Drop tables
DROP TABLE Activity;
