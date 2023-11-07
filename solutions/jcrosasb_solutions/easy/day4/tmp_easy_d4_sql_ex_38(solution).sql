-- Creates the tables
Create table Students (student_id int, student_name varchar(20));
Create table Subjects (subject_name varchar(20));
Create table Examinations (student_id int, subject_name varchar(20));
    
-- Populate the students table
Truncate table Students;
insert into Students (student_id, student_name) values (1, 'Alice');
insert into Students (student_id, student_name) values (2, 'Bob');
insert into Students (student_id, student_name) values (13, 'John');
insert into Students (student_id, student_name) values (6, 'Alex');
    
-- Populate the subjects talbe
Truncate table Subjects;
insert into Subjects (subject_name) values ('Math');
insert into Subjects (subject_name) values ('Physics');
insert into Subjects (subject_name) values ('Programming');
    
-- Populate the examinations table
Truncate table Examinations;
insert into Examinations (student_id, subject_name) values (1, 'Math');
insert into Examinations (student_id, subject_name) values (1, 'Physics');
insert into Examinations (student_id, subject_name) values (1, 'Programming');
insert into Examinations (student_id, subject_name) values (2, 'Programming');
insert into Examinations (student_id, subject_name) values (1, 'Physics');
insert into Examinations (student_id, subject_name) values (1, 'Math');
insert into Examinations (student_id, subject_name) values (13, 'Math');
insert into Examinations (student_id, subject_name) values (13, 'Programming');
insert into Examinations (student_id, subject_name) values (13, 'Physics');
insert into Examinations (student_id, subject_name) values (2, 'Math');
insert into Examinations (student_id, subject_name) values (1, 'Math');

-- Write a solution to find the number of times each student attended each exam.
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name)
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- Drop tables
DROP TABLE Students;
DROP TABLE Subjects;
DROP TABLE Examinations;
