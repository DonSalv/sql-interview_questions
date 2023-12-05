Create table Department (id int, name varchar(255) not null, CONSTRAINT Department_pk PRIMARY KEY (id));
Create table Employee (id int, name varchar(255), salary int, departmentId int, CONSTRAINT Employee_pk PRIMARY KEY (id),
CONSTRAINT fk_Employee FOREIGN KEY (departmentId) REFERENCES Department(id));

insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');

SELECT department, employee, salary FROM
(SELECT d.name AS department, e.name AS employee, e.salary,
RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS ranking
FROM Employee e  JOIN Department d ON e.departmentId = d.id)
WHERE ranking=1;

DROP TABLE Employee PURGE;
DROP TABLE Department PURGE;