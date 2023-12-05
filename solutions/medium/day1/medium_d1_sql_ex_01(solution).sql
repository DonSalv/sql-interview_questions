Create table Employee (id int, salary int, CONSTRAINT Employee_pk PRIMARY KEY (id));

insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

SELECT MAX(salary) AS SecondHighestSalary FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

DROP TABLE Employee PURGE;