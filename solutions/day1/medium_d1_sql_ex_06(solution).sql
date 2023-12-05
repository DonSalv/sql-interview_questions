Create table Employee (id int, name varchar(255), department varchar(255), managerId int, CONSTRAINT Employee_pk PRIMARY KEY (id));

insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', NULL);
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

SELECT name FROM
(SELECT e2.name, COUNT(*) AS employees FROM Employee e1
JOIN Employee e2 ON e1.managerId=e2.id
GROUP BY e2.name)
WHERE employees>=5;

DROP TABLE Employee PURGE;