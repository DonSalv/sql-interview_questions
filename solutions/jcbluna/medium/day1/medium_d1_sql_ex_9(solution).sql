-- Create the tables
CREATE TABLE Student (student_id int,student_name varchar(45), gender varchar(6), dept_id int);
CREATE TABLE Department (dept_id int, dept_name varchar(255));
    
-- Populate the student table
TRUNCATE TABLE Student;
INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES ('1', 'Jack', 'M', '1');
INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES ('2', 'Jane', 'F', '1');
INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES ('3', 'Mark', 'M', '2');
    
-- Populate the department table
TRUNCATE TABLE Department;
INSERT INTO Department (dept_id, dept_name) VALUES ('1', 'Engineering');
INSERT INTO Department (dept_id, dept_name) VALUES ('2', 'Science');
INSERT INTO Department (dept_id, dept_name) VALUES ('3', 'Law');

-- Solve the exercise
SELECT dept_name, COUNT(student_id) AS student_number
FROM Department LEFT OUTER JOIN Student
USING(dept_id)
GROUP BY dept_name
ORDER BY student_number DESC, dept_name ASC;

-- Drop unused tables
DROP TABLE Student;
DROP TABLE Department;