-- Create the students table
CREATE TABLE Students (student_id int, department_id int, mark int);

-- Populate the students table    
TRUNCATE TABLE Students;
INSERT INTO Students (student_id, department_id, mark) VALUES ('2', '2', '650');
INSERT INTO Students (student_id, department_id, mark) VALUES ('8', '2', '650');
INSERT INTO Students (student_id, department_id, mark) VALUES ('7', '1', '920');
INSERT INTO Students (student_id, department_id, mark) VALUES ('1', '1', '610');
INSERT INTO Students (student_id, department_id, mark) VALUES ('3', '1', '530');

-- Solve the exercise
SELECT student_id, department_id, 
(CASE WHEN students_dept!=1 THEN ROUND((student_rank-1)*100/(students_dept-1),2) ELSE 0 END) AS percentage
FROM(SELECT student_id, department_id, mark, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY mark DESC) AS student_rank,
COUNT(student_id) OVER (PARTITION BY department_id) AS students_dept
FROM Students);

-- Drop unused table
DROP TABLE Students;