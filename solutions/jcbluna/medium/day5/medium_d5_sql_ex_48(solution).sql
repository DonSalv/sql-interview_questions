-- Createe the salaries table
CREATE TABLE Salaries (company_id int, employee_id int, employee_name varchar(13), salary int);

-- Populate the salaries table    
TRUNCATE TABLE Salaries;
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('1', '1', 'Tony', '2000');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('1', '2', 'Pronub', '21300');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('1', '3', 'Tyrrox', '10800');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('2', '1', 'Pam', '300');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('2', '7', 'Bassem', '450');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('2', '9', 'Hermione', '700');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('3', '7', 'Bocaben', '100');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('3', '2', 'Ognjen', '2200');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('3', '13', 'Nyancat', '3300');
INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES ('3', '15', 'Morninngcat', '7777');

-- Solve the exercise
SELECT company_id, employee_id, employee_name, ROUND(salary*(CASE WHEN max_salary<1000 THEN 1
WHEN max_salary<10000 AND max_salary>1000 THEN 1-0.24
WHEN max_salary>10000 THEN 1-0.49 END)) AS salary
FROM(SELECT company_id, employee_id, employee_name, salary, 
(SELECT MAX(salary) FROM Salaries WHERE company_id=s.company_id) AS max_salary
FROM Salaries s);

-- Drop unused table
DROP TABLE Salaries;