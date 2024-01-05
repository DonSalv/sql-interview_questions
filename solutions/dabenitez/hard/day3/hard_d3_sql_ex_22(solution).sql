Create table Tasks (task_id int, subtasks_count int, CONSTRAINT Tasks_pk PRIMARY KEY (task_id));
Create table Executed (task_id int, subtask_id int,
CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES Tasks(task_id));

ALTER TABLE Executed ADD PRIMARY KEY (task_id, subtask_id) DISABLE;

insert into Tasks (task_id, subtasks_count) values ('1', '3');
insert into Tasks (task_id, subtasks_count) values ('2', '2');
insert into Tasks (task_id, subtasks_count) values ('3', '4');

insert into Executed (task_id, subtask_id) values ('1', '2');
insert into Executed (task_id, subtask_id) values ('3', '1');
insert into Executed (task_id, subtask_id) values ('3', '2');
insert into Executed (task_id, subtask_id) values ('3', '3');
insert into Executed (task_id, subtask_id) values ('3', '4');

SELECT task_id, LEVEL as subtask_id FROM Tasks
CONNECT BY LEVEL <= subtasks_count
AND PRIOR task_id = task_id
AND PRIOR SYS_GUID() IS NOT NULL
MINUS (SELECT * FROM Executed);

DROP TABLE Executed PURGE;
DROP TABLE Tasks PURGE;