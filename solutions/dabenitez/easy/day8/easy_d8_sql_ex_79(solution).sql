Create table Employees (employee_id int, name varchar(30), CONSTRAINT Employees_pk PRIMARY KEY (employee_id));
Create table Salaries (employee_id int, salary int, CONSTRAINT Salaries_pk PRIMARY KEY (employee_id));

insert into Employees (employee_id, name) values ('2', 'Crew');
insert into Employees (employee_id, name) values ('4', 'Haven');
insert into Employees (employee_id, name) values ('5', 'Kristian');

insert into Salaries (employee_id, salary) values ('5', '76071');
insert into Salaries (employee_id, salary) values ('1', '22517');
insert into Salaries (employee_id, salary) values ('4', '63539');

(SELECT employee_id FROM Employees
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries))
UNION
(SELECT employee_id FROM Salaries
WHERE employee_id NOT IN (SELECT employee_id FROM Employees))
ORDER BY employee_id;

DROP TABLE Salaries PURGE;
DROP TABLE Employees PURGE;