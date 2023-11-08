-- Create the tables
CREATE TABLE Employees (id int, name varchar(20));
CREATE TABLE EmployeeUNI (id int, unique_id int);

-- Populate the employees table
TRUNCATE TABLE Employees;
INSERT INTO Employees (id, name) VALUES ('1', 'Alice');
INSERT INTO Employees (id, name) VALUES ('7', 'Bob');
INSERT INTO Employees (id, name) VALUES ('11', 'Meir');
INSERT INTO Employees (id, name) VALUES ('90', 'Winston');
INSERT INTO Employees (id, name) VALUES ('3', 'Jonathan');
    
-- Populate the employeeuni
TRUNCATE TABLE EmployeeUNI;
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('3', '1');
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('11', '2');
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('90', '3');

-- Solve the exercise
SELECT unique_id, name
FROM Employees LEFT OUTER JOIN EmployeeUNI
USING(id)
ORDER BY name;

-- Drop unused tables
DROP TABLE Employees;
DROP TABLE EmployeeUNI;