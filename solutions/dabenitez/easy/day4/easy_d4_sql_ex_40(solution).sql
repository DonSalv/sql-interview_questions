Create table Employee (employee_id int, team_id int, CONSTRAINT Employee_pk PRIMARY KEY (employee_id));

insert into Employee (employee_id, team_id) values ('1', '8');
insert into Employee (employee_id, team_id) values ('2', '8');
insert into Employee (employee_id, team_id) values ('3', '8');
insert into Employee (employee_id, team_id) values ('4', '7');
insert into Employee (employee_id, team_id) values ('5', '9');
insert into Employee (employee_id, team_id) values ('6', '9');

SELECT e.employee_id, t.team_size
FROM Employee e LEFT JOIN
(SELECT team_id, COUNT(team_id) AS team_size FROM Employee
GROUP BY team_id) t
ON e.team_id=t.team_id
ORDER BY e.employee_id;

DROP TABLE Employee PURGE;