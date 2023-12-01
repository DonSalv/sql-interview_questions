Create table Activity (machine_id int, process_id int, activity_type VARCHAR2(15), timestamp float, CONSTRAINT activity_type_check CHECK (activity_type IN ('start', 'end')));

ALTER TABLE Activity ADD PRIMARY KEY (machine_id, process_id, activity_type) DISABLE;

insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'start', '0.712');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'end', '1.52');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'start', '3.14');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'end', '4.12');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'start', '0.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'end', '1.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'start', '0.43');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'end', '1.42');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'start', '4.1');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'end', '4.512');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'start', '2.5');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'end', '5');

SELECT machine_id, ROUND(AVG(end_time - start_time), 3) AS processing_time FROM 
(SELECT machine_id, process_id,
MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time,
MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time
FROM Activity GROUP BY machine_id, process_id)
GROUP BY machine_id
ORDER BY machine_id;

DROP TABLE Activity PURGE;