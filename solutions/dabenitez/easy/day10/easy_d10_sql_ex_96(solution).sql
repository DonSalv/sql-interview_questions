Create table Salaries(emp_name varchar(30), department varchar(30),salary int);

ALTER TABLE Salaries ADD PRIMARY KEY (emp_name, department) DISABLE;

insert into Salaries (emp_name, department, salary) values ('Kathy', 'Engineering', '50000');
insert into Salaries (emp_name, department, salary) values ('Roy', 'Marketing', '30000');
insert into Salaries (emp_name, department, salary) values ('Charles', 'Engineering', '45000');
insert into Salaries (emp_name, department, salary) values ('Jack', 'Engineering', '85000');
insert into Salaries (emp_name, department, salary) values ('Benjamin', 'Marketing', '34000');
insert into Salaries (emp_name, department, salary) values ('Anthony', 'Marketing', '42000');
insert into Salaries (emp_name, department, salary) values ('Edward', 'Engineering', '102000');
insert into Salaries (emp_name, department, salary) values ('Terry', 'Engineering', '44000');
insert into Salaries (emp_name, department, salary) values ('Evelyn', 'Marketing', '53000');
insert into Salaries (emp_name, department, salary) values ('Arthur', 'Engineering', '32000');

SELECT MAX(Max_salary)-MIN(Max_salary) AS salary_difference FROM
(SELECT department, MAX(salary) AS Max_salary FROM Salaries
GROUP BY department);

DROP TABLE Salaries PURGE;