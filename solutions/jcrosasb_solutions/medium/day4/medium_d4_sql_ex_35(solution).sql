-- Create the employees table
Create table Employees (employee_id int, employee_name varchar(30), manager_id int);

-- Populate the employees table
Truncate table Employees;
insert into Employees (employee_id, employee_name, manager_id) values (1, 'Boss', 1);
insert into Employees (employee_id, employee_name, manager_id) values (3, 'Alice', 3);
insert into Employees (employee_id, employee_name, manager_id) values (2, 'Bob', 1);
insert into Employees (employee_id, employee_name, manager_id) values (4, 'Daniel', 2);
insert into Employees (employee_id, employee_name, manager_id) values (7, 'Luis', 4);
insert into Employees (employee_id, employee_name, manager_id) values (8, 'John', 3);
insert into Employees (employee_id, employee_name, manager_id) values (9, 'Angela', 8);
insert into Employees (employee_id, employee_name, manager_id) values (77, 'Robert', 1);

-- Write a solution to find employee_id of all employees that directly or indirectly report their work to the head of the company.
-- The indirect relation between managers will not exceed three managers as the company is small
SELECT 
    employee_id
FROM
    Employees
WHERE manager_id IN (SELECT 
                         employee_id
                     FROM
                         Employees
                     WHERE manager_id IN (SELECT 
                                              employee_id
                                          FROM
                                              Employees
                                          WHERE
                                              manager_id = 1)) AND
      employee_id != 1;

-- Drop tables
DROP TABLE Employees;
