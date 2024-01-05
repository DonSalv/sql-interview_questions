Create table Department (id int, name varchar(255), CONSTRAINT Department_pk PRIMARY KEY (id));
Create table Employee (id int, name varchar(255), salary int, departmentId int, CONSTRAINT Employee_pk PRIMARY KEY (id),
CONSTRAINT fk_Employee FOREIGN KEY (departmentId) REFERENCES Department(id));

insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1');
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1');

SELECT department, employee, salary FROM
(SELECT e.id, e.name AS employee, e.salary, d.name As department,
DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS ranking
FROM Employee e JOIN Department d ON e.departmentId=d.id)
WHERE ranking<=3;

DROP TABLE Employee PURGE;
DROP TABLE Department PURGE;