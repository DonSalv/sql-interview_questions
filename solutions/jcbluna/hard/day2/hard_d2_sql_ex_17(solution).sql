-- Create the tables
CREATE TABLE Student (student_id int, student_name varchar(30));
CREATE TABLE Exam (exam_id int, student_id int, score int);

-- Populate the student table    
TRUNCATE TABLE Student;
INSERT INTO Student (student_id, student_name) VALUES ('1', 'Daniel');
INSERT INTO Student (student_id, student_name) VALUES ('2', 'Jade');
INSERT INTO Student (student_id, student_name) VALUES ('3', 'Stella');
INSERT INTO Student (student_id, student_name) VALUES ('4', 'Jonathan');
INSERT INTO Student (student_id, student_name) VALUES ('5', 'Will');
    
-- Populate the exam table
TRUNCATE TABLE Exam;
INSERT INTO Exam (exam_id, student_id, score) VALUES ('10', '1', '70');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('10', '2', '80');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('10', '3', '90');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('20', '1', '80');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('30', '1', '70');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('30', '3', '80');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('30', '4', '90');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('40', '1', '60');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('40', '2', '70');
INSERT INTO Exam (exam_id, student_id, score) VALUES ('40', '4', '80');

-- Solve the exercise
SELECT student_id, student_name
FROM Student
WHERE student_id IN (
SELECT student_id FROM Exam
MINUS
SELECT student_id
FROM(SELECT student_id, exam_id, DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) rank_norm,
DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score) rank_inv
FROM Exam)
WHERE rank_norm=1 OR
rank_inv=1);

-- Drop unused tables
DROP TABLE Student;
DROP TABLE Exam;