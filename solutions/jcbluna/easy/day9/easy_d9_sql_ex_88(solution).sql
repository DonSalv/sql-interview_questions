-- Create the teacher table
CREATE TABLE Teacher (teacher_id int, subject_id int, dept_id int);
    
-- Populate the teacher table
TRUNCATE TABLE Teacher;
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('1', '2', '3');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('1', '2', '4');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('1', '3', '3');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('2', '1', '1');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('2', '2', '1');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('2', '3', '1');
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES ('2', '4', '1');

-- Solve the exercise
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- Drop unused table
DROP TABLE Teacher;