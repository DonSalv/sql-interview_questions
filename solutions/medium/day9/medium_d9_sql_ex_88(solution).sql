Create table Students (student_id int, department_id int, mark int, CONSTRAINT Students_pk PRIMARY KEY (student_id));

insert into Students (student_id, department_id, mark) values ('2', '2', '650');
insert into Students (student_id, department_id, mark) values ('8', '2', '650');
insert into Students (student_id, department_id, mark) values ('7', '1', '920');
insert into Students (student_id, department_id, mark) values ('1', '1', '610');
insert into Students (student_id, department_id, mark) values ('3', '1', '530');

SELECT student_id, department_id,
CASE WHEN COUNT(*) OVER (PARTITION BY department_id) = 1 THEN 0
ELSE (ranking - 1) * 100 / (COUNT(*) OVER (PARTITION BY department_id) - 1)
END AS percentage FROM
(SELECT student_id, department_id, 
RANK() OVER (PARTITION BY department_id ORDER BY mark DESC) AS ranking
FROM Students)
ORDER BY department_id, ranking;

DROP TABLE Students PURGE;