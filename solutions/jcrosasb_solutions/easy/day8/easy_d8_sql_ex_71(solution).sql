-- Create the employee table
Create table Employee (employee_id int, department_id int, primary_flag varchar(1) CONSTRAINT check_enum_values CHECK (primary_flag IN ('Y','N')));

-- Populate the employee table    
Truncate table Employee;
insert into Employee (employee_id, department_id, primary_flag) values (1, 1, 'N');
insert into Employee (employee_id, department_id, primary_flag) values (2, 1, 'Y');
insert into Employee (employee_id, department_id, primary_flag) values (2, 2, 'N');
insert into Employee (employee_id, department_id, primary_flag) values (3, 3, 'N');
insert into Employee (employee_id, department_id, primary_flag) values (4, 2, 'N');
insert into Employee (employee_id, department_id, primary_flag) values (4, 3, 'Y');
insert into Employee (employee_id, department_id, primary_flag) values (4, 4, 'N');

-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. 
-- Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
SELECT   
    employee_id,
    department_id
FROM (SELECT
          employee_id,
          department_id,
          primary_flag,
          ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) row_number
      FROM employee)
WHERE row_number = 1;

-- Drop tables;
DROP TABLE Employee;
