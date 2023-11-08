-- Create the tables
CREATE TABLE Departments (id int, name varchar(30));
CREATE TABLE Students (id int, name varchar(30), department_id int);
    
-- Populate the departments table
TRUNCATE TABLE Departments;
INSERT INTO Departments (id, name) VALUES ('1', 'Electrical Engineering');
INSERT INTO Departments (id, name) VALUES ('7', 'Computer Engineering');
INSERT INTO Departments (id, name) VALUES ('13', 'Bussiness Administration');
    
-- Populate the students table
TRUNCATE TABLE Students;
INSERT INTO Students (id, name, department_id) VALUES ('23', 'Alice', '1');
INSERT INTO Students (id, name, department_id) VALUES ('1', 'Bob', '7');
INSERT INTO Students (id, name, department_id) VALUES ('5', 'Jennifer', '13');
INSERT INTO Students (id, name, department_id) VALUES ('2', 'John', '14');
INSERT INTO Students (id, name, department_id) VALUES ('4', 'Jasmine', '77');
INSERT INTO Students (id, name, department_id) VALUES ('3', 'Steve', '74');
INSERT INTO Students (id, name, department_id) VALUES ('6', 'Luis', '1');
INSERT INTO Students (id, name, department_id) VALUES ('8', 'Jonathan', '7');
INSERT INTO Students (id, name, department_id) VALUES ('7', 'Daiana', '33');
INSERT INTO Students (id, name, department_id) VALUES ('11', 'Madelynn', '1');

-- Solve the exercise
SELECT id, name
FROM Students
MINUS
SELECT s.id, s.name
FROM Students s JOIN Departments d
ON(s.department_id=d.id);


-- Drop unused tables
DROP TABLE Departments;
DROP TABLE Students;