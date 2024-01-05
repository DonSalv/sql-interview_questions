Create table Employees (employee_id int, needed_hours int, CONSTRAINT Employees_pk PRIMARY KEY (employee_id));
Create table Logs (employee_id int, in_time date, out_time date,
CONSTRAINT fk_Logs FOREIGN KEY (employee_id) REFERENCES Employees(employee_id));

ALTER TABLE Logs ADD PRIMARY KEY (employee_id, in_time, out_time) DISABLE;

insert into Employees (employee_id, needed_hours) values ('1', '20');
insert into Employees (employee_id, needed_hours) values ('2', '12');
insert into Employees (employee_id, needed_hours) values ('3', '2');

insert into Logs (employee_id, in_time, out_time) values ('1', TO_DATE('2022-10-01 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-01 17:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('1', TO_DATE('2022-10-06 09:05:04','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-06 17:09:03','YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('1', TO_DATE('2022-10-12 23:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-13 03:00:01','YYYY-MM-DD HH24:MI:SS'));
insert into Logs (employee_id, in_time, out_time) values ('2', TO_DATE('2022-10-29 12:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-29 23:58:58','YYYY-MM-DD HH24:MI:SS'));

SELECT employee_id FROM
(SELECT e.employee_id, e.needed_hours, COALESCE(q1.minutes,0) AS minutes FROM Employees e LEFT JOIN
(SELECT employee_id, SUM(CEIL(1440*(out_time-in_time))) AS minutes FROM Logs
GROUP BY employee_id) Q1
ON e.employee_id=q1.employee_id)
WHERE minutes<60*needed_hours;

DROP TABLE Logs PURGE;
DROP TABLE Employees PURGE;