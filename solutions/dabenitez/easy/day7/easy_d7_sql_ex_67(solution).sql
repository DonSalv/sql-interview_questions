Create table Employees(employee_id int, name varchar(20), reports_to int, age int, CONSTRAINT Employee_pk PRIMARY KEY (employee_id));

insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43');
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37');

SELECT q1.id AS employee_id, 
e.name, q1.reports_count, q1.average_age FROM
(SELECT reports_to AS id,
COUNT(*) AS reports_count,
ROUND(AVG(age)) AS average_age
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to) Q1
JOIN Employees e
ON e.employee_id=q1.id;

DROP TABLE Employees PURGE;