Create table Employee (id int, month int, salary int);

ALTER TABLE Employee ADD PRIMARY KEY (id, month) DISABLE;

insert into Employee (id, month, salary) values ('1', '1', '20');
insert into Employee (id, month, salary) values ('2', '1', '20');
insert into Employee (id, month, salary) values ('1', '2', '30');
insert into Employee (id, month, salary) values ('2', '2', '30');
insert into Employee (id, month, salary) values ('3', '2', '40');
insert into Employee (id, month, salary) values ('1', '3', '40');
insert into Employee (id, month, salary) values ('3', '3', '60');
insert into Employee (id, month, salary) values ('1', '4', '60');
insert into Employee (id, month, salary) values ('3', '4', '70');
insert into Employee (id, month, salary) values ('1', '7', '90');
insert into Employee (id, month, salary) values ('1', '8', '90');

SELECT Q1.id, Q1.month, 
Q1.salary+ COALESCE(Q2.salary,0)+ COALESCE(Q3.salary,0) AS Salary FROM 
(SELECT id, month, salary FROM
(SELECT id, month, salary, RANK() OVER 
(PARTITION BY id ORDER BY month DESC) as ranking
FROM Employee) WHERE ranking>1) Q1
LEFT JOIN 
(SELECT id, month, salary FROM
(SELECT id, month, salary, RANK() OVER 
(PARTITION BY id ORDER BY month DESC) as ranking
FROM Employee) WHERE ranking>1)Q2
ON Q1.id=Q2.id AND Q1.month=Q2.month+1
LEFT JOIN 
(SELECT id, month, salary FROM
(SELECT id, month, salary, RANK() OVER 
(PARTITION BY id ORDER BY month DESC) as ranking
FROM Employee) WHERE ranking>1)Q3
ON Q1.id=Q3.id AND Q1.month=Q3.month+2
ORDER BY id, month DESC;

DROP TABLE Employee PURGE;