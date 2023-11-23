-- Create the enrollments table
Create table Enrollments (student_id int, course_id int, grade int);

-- Populate the enrollments table    
Truncate table Enrollments;
insert into Enrollments (student_id, course_id, grade) values (2, 2, 95);
insert into Enrollments (student_id, course_id, grade) values (2, 3, 95);
insert into Enrollments (student_id, course_id, grade) values (1, 1, 90);
insert into Enrollments (student_id, course_id, grade) values (1, 2, 99);
insert into Enrollments (student_id, course_id, grade) values (3, 1, 80);
insert into Enrollments (student_id, course_id, grade) values (3, 2, 75);
insert into Enrollments (student_id, course_id, grade) values (3, 3, 82);

-- Write a solution to find the highest grade with its corresponding course for each student.
-- In case of a tie, you should find the course with the smallest course_id.
-- Return the result table ordered by student_id in ascending order
WITH max_grades AS (
    SELECT 
        student_id, 
        MAX(grade) AS grade 
    FROM 
        Enrollments 
    GROUP BY 
        student_id)
SELECT 
    m.student_id, 
    MIN(e.course_id) AS course_id, 
    m.grade 
FROM 
    max_grades m 
LEFT JOIN
    Enrollments e
ON 
    m.student_id = e.student_id AND
    m.grade = e.grade
GROUP BY
    m.student_id, 
    m.grade
ORDER BY
    student_id;

-- Drop tables
DROP TABLE Enrollments;
