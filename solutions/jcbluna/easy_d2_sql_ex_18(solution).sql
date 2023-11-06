-- Create the salary table
CREATE TABLE Salary (id int, name varchar(100), sex char(1), salary int);

-- Populate the salary table
TRUNCATE TABLE Salary;
INSERT INTO Salary (id, name, sex, salary) VALUES ('1', 'A', 'm', '2500');
INSERT INTO Salary (id, name, sex, salary) VALUES ('2', 'B', 'f', '1500');
INSERT INTO Salary (id, name, sex, salary) VALUES ('3', 'C', 'm', '5500');
INSERT INTO Salary (id, name, sex, salary) VALUES ('4', 'D', 'f', '500');

-- Solve the exercise

UPDATE Salary
SET sex = (CASE WHEN sex='m' THEN 'f'
            WHEN sex='f' THEN 'm'
            END);

-- Drop unused tables
DROP TABLE Salary;