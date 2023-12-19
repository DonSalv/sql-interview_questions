Create table Employees (employee_id int, name varchar(30), salary int, CONSTRAINT Employees_pk PRIMARY KEY (employee_id));

insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000');
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3000');
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400');
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100');
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7400');

SELECT e.employee_id, e.name, Q1.salary, Q1.team_id
FROM Employees e JOIN
(SELECT salary, RANK() OVER (ORDER BY salary) AS team_id
FROM Employees GROUP BY salary
HAVING COUNT(*)>1) Q1
ON e.salary=Q1.salary
ORDER BY Q1.team_id, e.employee_id;

DROP TABLE Employees PURGE;