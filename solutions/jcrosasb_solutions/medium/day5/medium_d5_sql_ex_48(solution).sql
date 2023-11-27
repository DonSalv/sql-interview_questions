-- Createe the salaries table
Create table Salaries (company_id int, employee_id int, employee_name varchar(13), salary int);

-- Populate the salaries table    
Truncate table Salaries;
insert into Salaries (company_id, employee_id, employee_name, salary) values (1, 1, 'Tony', 2000);
insert into Salaries (company_id, employee_id, employee_name, salary) values (1, 2, 'Pronub', 21300);
insert into Salaries (company_id, employee_id, employee_name, salary) values (1, 3, 'Tyrrox', 10800);
insert into Salaries (company_id, employee_id, employee_name, salary) values (2, 1, 'Pam', 300);
insert into Salaries (company_id, employee_id, employee_name, salary) values (2, 7, 'Bassem', 450);
insert into Salaries (company_id, employee_id, employee_name, salary) values (2, 9, 'Hermione', 700);
insert into Salaries (company_id, employee_id, employee_name, salary) values (3, 7, 'Bocaben', 100);
insert into Salaries (company_id, employee_id, employee_name, salary) values (3, 2, 'Ognjen', 2200);
insert into Salaries (company_id, employee_id, employee_name, salary) values (3, 13, 'Nyancat', 3300);
insert into Salaries (company_id, employee_id, employee_name, salary) values (3, 15, 'Morninngcat', 7777);

-- Find the salaries of the employees after applying taxes. Round the salary to the nearest integer.
-- The tax rate is calculated for each company based on the following criteria:
--      * 0%  If the max salary of any employee in the company is less than $1000.
--      * 24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
--      * 49% If the max salary of any employee in the company is greater than $10000.
SELECT
    company_id,
    employee_id,
    employee_name,
    CASE
         WHEN comp_max_salary < 1000 THEN ROUND(salary)
         WHEN comp_max_salary >= 1000 AND comp_max_salary <= 10000 THEN ROUND((1 - 0.24) * salary)
         WHEN comp_max_salary > 10000 THEN ROUND((1 - 0.49) * salary)
     END salary
FROM 
    Salaries 
JOIN
    (SELECT 
        company_id, 
        MAX(salary) AS comp_max_salary 
     FROM 
        Salaries 
    GROUP BY 
        company_id) 
USING
    (company_id);
    
-- Drop tables
DROP TABLE Salaries;
