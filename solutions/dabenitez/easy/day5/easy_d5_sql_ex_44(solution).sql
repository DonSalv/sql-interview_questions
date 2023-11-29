Create table Employees (id int, name varchar(20), CONSTRAINT Employees_pk PRIMARY KEY (id));
Create table EmployeeUNI (id int, unique_id int);

ALTER TABLE EmployeeUNI 
    ADD PRIMARY KEY (id, unique_id) DISABLE;

insert into Employees (id, name) values ('1', 'Alice');
insert into Employees (id, name) values ('7', 'Bob');
insert into Employees (id, name) values ('11', 'Meir');
insert into Employees (id, name) values ('90', 'Winston');
insert into Employees (id, name) values ('3', 'Jonathan');

insert into EmployeeUNI (id, unique_id) values ('3', '1');
insert into EmployeeUNI (id, unique_id) values ('11', '2');
insert into EmployeeUNI (id, unique_id) values ('90', '3');

SELECT e2.unique_id, e1.name FROM Employees e1
LEFT JOIN EmployeeUNI e2
ON e2.id = e1.id;

DROP TABLE EmployeeUNI PURGE;
DROP TABLE Employees PURGE;
