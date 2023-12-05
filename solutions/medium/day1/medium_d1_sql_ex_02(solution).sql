Create table Employee (id int, salary int, CONSTRAINT Employee_pk PRIMARY KEY (id));

insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

SELECT (SELECT salary FROM 
(SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employee)
WHERE rnk = :n) AS getNthHighestSalary
FROM dual;

DROP TABLE Employee PURGE;