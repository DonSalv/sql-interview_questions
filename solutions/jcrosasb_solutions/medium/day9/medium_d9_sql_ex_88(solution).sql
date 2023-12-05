-- Create the students table
Create table Students (student_id int, department_id int, mark int);

-- Populate the students table    
Truncate table Students;
insert into Students (student_id, department_id, mark) values ('2', '2', '650');
insert into Students (student_id, department_id, mark) values ('8', '2', '650');
insert into Students (student_id, department_id, mark) values ('7', '1', '920');
insert into Students (student_id, department_id, mark) values ('1', '1', '610');
insert into Students (student_id, department_id, mark) values ('3', '1', '530');

-- Write a solution to report the rank of each student in their department as a percentage, 
-- where the rank as a percentage is computed using the following formula: 
--        (student_rank_in_the_department - 1) * 100 / (the_number_of_students_in_the_department - 1). 
-- The percentage should be rounded to 2 decimal places. student_rank_in_the_department is determined by descending mark, 
-- such that the student with the highest mark is rank 1. If two students get the same mark, they also get the same rank
WITH dept_rankings AS (
    SELECT
        student_id,
        department_id,
        mark,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY mark DESC) AS rank
    FROM
        Students
)
SELECT
    d.student_id,
    d.department_id,
    TO_CHAR((d.rank - 1) * 100 /(t.std_by_dept - 1), '999.9') AS percentage
FROM
    dept_rankings d
INNER JOIN
    (SELECT
         department_id,
         COUNT(student_id) As std_by_dept
     FROM
         dept_rankings
     GROUP BY
         department_id) t
ON
    d.department_id = t.department_id;

-- NOTE: not sure if I should use DENSE_RANK() or RANK(). The difference would be, in the case of a tie in marks for exmaple in rank 2,
-- the next rank would be 4 instead of 3 when using RANK(). In case it fails the tests, please try with RANK() instead of DENSE_RANK()


-- Drop tables
DROP TABLE Students;
