-- Create teh employees table
CREATE TABLE Employees (employee_id int, name varchar(30), salary int);

-- Populate the employees table    
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, name, salary) VALUES ('2', 'Meir', '3000');
INSERT INTO Employees (employee_id, name, salary) VALUES ('3', 'Michael', '3800');
INSERT INTO Employees (employee_id, name, salary) VALUES ('7', 'Addilyn', '7400');
INSERT INTO Employees (employee_id, name, salary) VALUES ('8', 'Juan', '6100');
INSERT INTO Employees (employee_id, name, salary) VALUES ('9', 'Kannon', '7700');

-- Solve the exercise
SELECT employee_id,(CASE WHEN MOD(employee_id,2)=1
                     AND UPPER(SUBSTR(name,1,1))!='M' THEN 1
                     ELSE 0 END)*salary AS bonus
FROM Employees
ORDER BY employee_id;

-- Drop the unused 
DROP TABLE Employees;