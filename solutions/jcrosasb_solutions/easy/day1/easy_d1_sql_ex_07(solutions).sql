-- Create the tables
Create table Employee (empId int, name varchar(255), supervisor int, salary int);
Create table Bonus (empId int, bonus int);

-- Populate the employee table
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values (3, 'Brad', Null, 4000);
insert into Employee (empId, name, supervisor, salary) values (1, 'John', 3, 1000);
insert into Employee (empId, name, supervisor, salary) values (2, 'Dan', 3, 2000);
insert into Employee (empId, name, supervisor, salary) values (4, 'Thomas', 3, 4000);

-- Populate the bouns table
Truncate table Bonus;
insert into Bonus (empId, bonus) values (2, 500);
insert into Bonus (empId, bonus) values (4, 2000);

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
SELECT t.name, t.bonus 
FROM (SELECT e.name, b.bonus 
      FROM employee e FULL OUTER JOIN bonus b 
      ON e.empid = b.empid) t 
WHERE t.bonus < 1000 OR t.bonus IS NULL;

-- Drop tables
DROP TABLE Employee;
DROP TABLE Bonus;
