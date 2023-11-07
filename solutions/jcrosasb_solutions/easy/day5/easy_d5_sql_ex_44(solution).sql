-- Create the tables
Create table Employees (id int, name varchar(20));
Create table EmployeeUNI (id int, unique_id int);

-- Populate the employees table
Truncate table Employees;
insert into Employees (id, name) values (1, 'Alice');
insert into Employees (id, name) values (7, 'Bob');
insert into Employees (id, name) values (11, 'Meir');
insert into Employees (id, name) values (90, 'Winston');
insert into Employees (id, name) values (3, 'Jonathan');
    
-- Populate the employeeuni
Truncate table EmployeeUNI;
insert into EmployeeUNI (id, unique_id) values (3, 1);
insert into EmployeeUNI (id, unique_id) values (11, 2);
insert into EmployeeUNI (id, unique_id) values (90, 3);

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null
SELECT 
    e_uni.unique_id, 
    e.name from 
Employees e 
FULL OUTER JOIN EmployeeUNI e_uni 
ON e.id = e_uni.id;

-- Drop tables
DROP TABLE Employees;
DROP TABLE EmployeeUNI;
