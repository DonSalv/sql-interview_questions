Create table Employees (employee_id int, employee_name varchar(30), manager_id int, CONSTRAINT Employees_pk PRIMARY KEY (employee_id));

insert into Employees (employee_id, employee_name, manager_id) values ('1', 'Boss', '1');
insert into Employees (employee_id, employee_name, manager_id) values ('3', 'Alice', '3');
insert into Employees (employee_id, employee_name, manager_id) values ('2', 'Bob', '1');
insert into Employees (employee_id, employee_name, manager_id) values ('4', 'Daniel', '2');
insert into Employees (employee_id, employee_name, manager_id) values ('7', 'Luis', '4');
insert into Employees (employee_id, employee_name, manager_id) values ('8', 'John', '3');
insert into Employees (employee_id, employee_name, manager_id) values ('9', 'Angela', '8');
insert into Employees (employee_id, employee_name, manager_id) values ('77', 'Robert', '1');

SELECT employee_id FROM
(SELECT q1.employee_id, q1.manager_id, q1.manager_2, e3.manager_id AS manager_3 FROM
(SELECT e1.employee_id, e1.manager_id, e2.manager_id AS manager_2 FROM Employees e1
JOIN Employees e2 ON e1.manager_id=e2.employee_id) Q1
JOIN Employees e3 ON Q1.manager_2=e3.employee_id)
WHERE manager_3=1 AND employee_id<>1;

DROP TABLE Employees PURGE;