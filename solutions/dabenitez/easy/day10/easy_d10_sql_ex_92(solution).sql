Create table Salary (emp_id int,firstname varchar(100),lastname varchar(100),salary int, department_id varchar(100));

ALTER TABLE Salary ADD PRIMARY KEY (emp_id, salary) DISABLE;

insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('1', 'Todd', 'Wilson', '110000', 'D1006');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('1', 'Todd', 'Wilson', '106119', 'D1006');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('2', 'Justin', 'Simon', '128922', 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('2', 'Justin', 'Simon', '130000', 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('3', 'Kelly', 'Rosario', '42689', 'D1002');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('4', 'Patricia', 'Powell', '162825', 'D1004');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('4', 'Patricia', 'Powell', '170000', 'D1004');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('5', 'Sherry', 'Golden', '44101', 'D1002');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('6', 'Natasha', 'Swanson', '79632', 'D1005');
insert into Salary (emp_id, firstname, lastname, salary, department_id) values ('6', 'Natasha', 'Swanson', '90000', 'D1005');

SELECT emp_id, MAX(salary) AS max_salary
FROM Salary GROUP BY emp_id;

SELECT DISTINCT s.emp_id, s.firstname, s.lastname, Q1.max_salary AS salary, s.department_id
FROM (SELECT emp_id, MAX(salary) AS max_salary FROM Salary GROUP BY emp_id) Q1
JOIN Salary s ON s.emp_id = Q1.emp_id
ORDER BY s.emp_id;

DROP TABLE Salary PURGE;