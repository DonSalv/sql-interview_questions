-- Create the tables
Create table Student (student_id int,student_name varchar(15), gender varchar(6), dept_id int);
Create table Department (dept_id int, dept_name varchar(15));
    
-- Populate the student table
Truncate table Student;
insert into Student (student_id, student_name, gender, dept_id) values (1, 'Jack', 'M', 1);
insert into Student (student_id, student_name, gender, dept_id) values (2, 'Jane', 'F', 1);
insert into Student (student_id, student_name, gender, dept_id) values (3, 'Mark', 'M', 2);

-- Populate the department table
Truncate table Department;
insert into Department (dept_id, dept_name) values (1, 'Engineering');
insert into Department (dept_id, dept_name) values (2, 'Science');
insert into Department (dept_id, dept_name) values (3, 'Law');

-- Write a solution to report the respective department name and number of students majoring in each department for all departments in the DEPARTMENT table (even ones with no current students).
-- Return the result table ordered by student_number in descending order. In case of a tie, order them by dept_name alphabetically
SELECT 
    d.dept_name, 
    COUNT(s.dept_id) AS student_number 
FROM 
    Department d 
FULL OUTER JOIN 
    Student s 
ON 
    d.dept_id = s.dept_id 
GROUP BY 
    d.dept_name 
ORDER BY 
    COUNT(s.dept_id) DESC,
    d.dept_name;

-- Drop tables
DROP TABLE Student;
DROP TABLE Department;
