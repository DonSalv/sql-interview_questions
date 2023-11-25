Create table Employee (empId int, name varchar(255), supervisor int, salary int, CONSTRAINT Employee_pk PRIMARY KEY (empId));
Create table Bonus (empId int, bonus int,
    CONSTRAINT fk_Bonus
    FOREIGN KEY (empId)
    REFERENCES Employee(empId));

insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', NULL, '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');

insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');

SELECT e.name, b.bonus FROM Employee e
LEFT JOIN Bonus b
ON e.empId=b.empId
WHERE b.bonus < 1000 or b.bonus is null;

DROP TABLE Bonus PURGE;
DROP TABLE Employee PURGE;