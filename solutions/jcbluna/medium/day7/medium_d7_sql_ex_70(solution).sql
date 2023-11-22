-- Create the tables
CREATE TABLE Schools (school_id int, capacity int);
CREATE TABLE Exam (score int, student_count int);

-- Populate the schools table    
TRUNCATE TABLE Schools;
INSERT INTO Schools (school_id, capacity) VALUES ('11', '151');
INSERT INTO Schools (school_id, capacity) VALUES ('5', '48');
INSERT INTO Schools (school_id, capacity) VALUES ('9', '9');
INSERT INTO Schools (school_id, capacity) VALUES ('10', '99');

-- Populate the exam table    
TRUNCATE TABLE Exam;
INSERT INTO Exam (score, student_count) VALUES ('975', '10');
INSERT INTO Exam (score, student_count) VALUES ('966', '60');
INSERT INTO Exam (score, student_count) VALUES ('844', '76');
INSERT INTO Exam (score, student_count) VALUES ('749', '76');
INSERT INTO Exam (score, student_count) VALUES ('744', '100');

-- Solve the exercise
SELECT school_id, MIN(NVL(score,-1)) KEEP (DENSE_RANK FIRST ORDER BY score) AS score
FROM Schools s LEFT OUTER JOIN Exam e
ON(s.capacity>=e.student_count)
GROUP BY school_id;

-- Drop unused tables
DROP TABLE Schools;
DROP TABLE Exam;