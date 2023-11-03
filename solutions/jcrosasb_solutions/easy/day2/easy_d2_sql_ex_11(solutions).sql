-- Create the courses table
Create table Courses (student varchar(255), class varchar(255));

-- Populate the courses table
Truncate table Courses;
insert into Courses (student, class) values ('A', 'Math');
insert into Courses (student, class) values ('B', 'English');
insert into Courses (student, class) values ('C', 'Math');
insert into Courses (student, class) values ('D', 'Biology');
insert into Courses (student, class) values ('E', 'Math');
insert into Courses (student, class) values ('F', 'Computer');
insert into Courses (student, class) values ('G', 'Math');
insert into Courses (student, class) values ('H', 'Math');
insert into Courses (student, class) values ('I', 'Math');

-- Write a solution to find all the classes that have at least five students.
SELECT class 
FROM (SELECT class, COUNT(class) student_number 
      FROM Courses 
      GROUP BY class) t 
WHERE t.student_number >= 5;

-- Drop tables
DROP TABLE Courses;
