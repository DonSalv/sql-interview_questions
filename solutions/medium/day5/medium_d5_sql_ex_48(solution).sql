Create table Salaries (company_id int, employee_id int, employee_name varchar(13), salary int);

ALTER TABLE Salaries ADD PRIMARY KEY (company_id, employee_id) DISABLE;

insert into Salaries (company_id, employee_id, employee_name, salary) values ('1', '1', 'Tony', '2000');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('1', '2', 'Pronub', '21300');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('1', '3', 'Tyrrox', '10800');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('2', '1', 'Pam', '300');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('2', '7', 'Bassem', '450');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('2', '9', 'Hermione', '700');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('3', '7', 'Bocaben', '100');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('3', '2', 'Ognjen', '2200');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('3', '13', 'Nyancat', '3300');
insert into Salaries (company_id, employee_id, employee_name, salary) values ('3', '15', 'Morninngcat', '7777');

SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary*(1-Q1.taxes),0) AS Salary FROM Salaries s
JOIN (SELECT company_id, (CASE WHEN MAX(salary) < 1000 THEN 0
WHEN MAX(salary) >=1000 AND MAX(salary)<= 10000 THEN 0.24
WHEN MAX(salary) > 10000 THEN 0.49
END) AS Taxes
FROM Salaries GROUP BY company_id) Q1
ON s.company_id=q1.company_id;

DROP TABLE Salaries PURGE;