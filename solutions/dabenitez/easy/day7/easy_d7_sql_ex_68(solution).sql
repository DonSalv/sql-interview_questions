Create table Employees(emp_id int, event_day date, in_time int, out_time int);

ALTER TABLE Employees ADD PRIMARY KEY (emp_id, event_day, in_time) DISABLE;
    
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', TO_DATE('2020-11-28','YYYY-MM-DD'), '4', '32');
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', TO_DATE('2020-11-28','YYYY-MM-DD'), '55', '200');
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', TO_DATE('2020-12-3','YYYY-MM-DD'), '1', '42');
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', TO_DATE('2020-11-28','YYYY-MM-DD'), '3', '33');
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', TO_DATE('2020-12-9','YYYY-MM-DD'), '47', '74');

SELECT event_day AS day, emp_id, SUM(out_time-in_time) AS total_time FROM Employees
GROUP BY event_day, emp_id;

DROP TABLE Employees PURGE;