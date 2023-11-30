-- Create the tables
Create table Schools (school_id int, capacity int);
Create table Exam (score int, student_count int);

-- Populate the schools table    
Truncate table Schools;
insert into Schools (school_id, capacity) values (11, 151);
insert into Schools (school_id, capacity) values (5, 48);
insert into Schools (school_id, capacity) values (9, 9);
insert into Schools (school_id, capacity) values (10, 99);

-- Populate the exam table    
Truncate table Exam;
insert into Exam (score, student_count) values (975, 10);
insert into Exam (score, student_count) values (966, 60);
insert into Exam (score, student_count) values (844, 76);
insert into Exam (score, student_count) values (749, 76);
insert into Exam (score, student_count) values (744, 100);

-- Every year, each school announces a minimum score requirement that a student needs to apply to it. 
-- The school chooses the minimum score requirement based on the exam results of all the students:
--      * They want to ensure that even if every student meeting the requirement applies, the school can accept everyone.
--      * They also want to maximize the possible number of students that can apply.
--      * They must use a score that is in the EXAM table.
-- Write a solution to report the minimum score requirement for each school. If there are multiple score values satisfying 
-- the above conditions, choose the smallest one. If the input data is not enough to determine the score, report -1
SELECT
    school_id, 
    NVL(MIN(score), -1) AS score
FROM 
    Schools 
LEFT JOIN 
    Exam
ON
    capacity >= student_count
GROUP BY 
    school_id;

-- Drop tables
DROP TABLE Schools;
DROP TABLE Exam;
