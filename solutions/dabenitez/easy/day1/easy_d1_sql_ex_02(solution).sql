Create table Employee (id int, name varchar(255), salary int, managerId int, CONSTRAINT Employee_pk PRIMARY KEY (id));

insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);

SELECT e1.name FROM Employee e1
INNER JOIN Employee e2
ON e1.managerid = e2.id
WHERE e1.salary > e2.salary;

DROP TABLE Employee PURGE;