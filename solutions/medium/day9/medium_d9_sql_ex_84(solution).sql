Create table Tasks (task_id int, assignee_id int, submit_date date, CONSTRAINT Tasks_pk PRIMARY KEY (task_id));

insert into Tasks (task_id, assignee_id, submit_date) values ('1', '1', TO_DATE('2022-06-13','YYYY-MM-DD'));
insert into Tasks (task_id, assignee_id, submit_date) values ('2', '6', TO_DATE('2022-06-14','YYYY-MM-DD'));
insert into Tasks (task_id, assignee_id, submit_date) values ('3', '6', TO_DATE('2022-06-15','YYYY-MM-DD'));
insert into Tasks (task_id, assignee_id, submit_date) values ('4', '3', TO_DATE('2022-06-18','YYYY-MM-DD'));
insert into Tasks (task_id, assignee_id, submit_date) values ('5', '5', TO_DATE('2022-06-19','YYYY-MM-DD'));
insert into Tasks (task_id, assignee_id, submit_date) values ('6', '7', TO_DATE('2022-06-19','YYYY-MM-DD'));

SELECT
COUNT(CASE WHEN TO_CHAR(submit_date, 'Dy') IN ('Sat', 'Sun') THEN 1 END) AS weekend_cnt,
COUNT(CASE WHEN TO_CHAR(submit_date, 'Dy') IN ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN 1 END) AS working_cnt
FROM Tasks;

DROP TABLE Tasks PURGE;