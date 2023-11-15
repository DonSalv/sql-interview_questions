-- Create the teacher table
Create table Teacher (teacher_id int, subject_id int, dept_id int);
    
-- Populate the teacher table
Truncate table Teacher;
insert into Teacher (teacher_id, subject_id, dept_id) values (1, 2, 3);
insert into Teacher (teacher_id, subject_id, dept_id) values (1, 2, 4);
insert into Teacher (teacher_id, subject_id, dept_id) values (1, 3, 3);
insert into Teacher (teacher_id, subject_id, dept_id) values (2, 1, 1);
insert into Teacher (teacher_id, subject_id, dept_id) values (2, 2, 1);
insert into Teacher (teacher_id, subject_id, dept_id) values (2, 3, 1);
insert into Teacher (teacher_id, subject_id, dept_id) values (2, 4, 1);

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university
SELECT 
    teacher_id, 
    COUNT(Distinct subject_id) cnt 
FROM Teacher 
GROUP BY teacher_id;

-- Drop tables
DROP TABLE Teacher
