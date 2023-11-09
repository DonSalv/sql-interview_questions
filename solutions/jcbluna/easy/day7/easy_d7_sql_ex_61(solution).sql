-- Create the activity table
CREATE TABLE Activity (machine_id int, process_id int, activity_type varchar(5) CHECK(activity_type IN ('start', 'end')), timestamp float);

-- Populate the activity table    
TRUNCATE TABLE Activity;
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('0', '0', 'start', '0.712');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('0', '0', 'end', '1.52');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('0', '1', 'start', '3.14');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('0', '1', 'end', '4.12');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('1', '0', 'start', '0.55');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('1', '0', 'end', '1.55');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('1', '1', 'start', '0.43');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('1', '1', 'end', '1.42');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('2', '0', 'start', '4.1');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('2', '0', 'end', '4.512');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('2', '1', 'start', '2.5');
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES ('2', '1', 'end', '5');

-- Solve the exercise
SELECT machine_id, ROUND(AVG(processing_time),3) AS processing_time
FROM (SELECT machine_id, process_id, SUM((CASE activity_type WHEN 'start' THEN -1
                                    ELSE 1 END)* timestamp) AS processing_time
FROM Activity
GROUP BY machine_id, process_id)
GROUP BY machine_id
ORDER BY machine_id;

-- Drop unused table
DROP TABLE Activity;