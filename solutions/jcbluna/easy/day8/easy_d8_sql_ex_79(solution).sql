-- Create the tables
CREATE TABLE Employees (employee_id int, name varchar(30));
CREATE TABLE Salaries (employee_id int, salary int);
    
-- Populate the employees table
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, name) VALUES ('2', 'Crew');
INSERT INTO Employees (employee_id, name) VALUES ('4', 'Haven');
INSERT INTO Employees (employee_id, name) VALUES ('5', 'Kristian');

-- Populate the salaries table
TRUNCATE TABLE Salaries;
INSERT INTO Salaries (employee_id, salary) VALUES ('5', '76071');
INSERT INTO Salaries (employee_id, salary) VALUES ('1', '22517');
INSERT INTO Salaries (employee_id, salary) VALUES ('4', '63539');

-- Solve the exercise
SELECT DISTINCT employee_id
FROM Employees FULL OUTER JOIN Salaries
USING(employee_id)
WHERE name IS NULL
OR salary IS NULL
ORDER BY employee_id ASC;

-- Drop unused tables
DROP TABLE Employees;
DROP TABLE Salaries;