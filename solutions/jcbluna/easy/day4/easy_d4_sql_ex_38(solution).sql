-- Creates the tables
CREATE TABLE Students (student_id int, student_name varchar(20));
CREATE TABLE Subjects (subject_name varchar(20));
CREATE TABLE Examinations (student_id int, subject_name varchar(20));
    
-- Populate the students table
TRUNCATE TABLE Students;
INSERT INTO Students (student_id, student_name) VALUES ('1', 'Alice');
INSERT INTO Students (student_id, student_name) VALUES ('2', 'Bob');
INSERT INTO Students (student_id, student_name) VALUES ('13', 'John');
INSERT INTO Students (student_id, student_name) VALUES ('6', 'Alex');
    
-- Populate the subjects talbe
TRUNCATE TABLE Subjects;
INSERT INTO Subjects (subject_name) VALUES ('Math');
INSERT INTO Subjects (subject_name) VALUES ('Physics');
INSERT INTO Subjects (subject_name) VALUES ('Programming');
    
-- Populate the examinations table
TRUNCATE TABLE Examinations;
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');

-- Solve the exercise

SELECT ss.student_id, ss.student_name, ss.subject_name, COUNT(e.subject_name)
FROM (
        SELECT student_id, student_name, subject_name
        FROM Students CROSS JOIN Subjects) ss LEFT OUTER JOIN Examinations e
ON(ss.student_id=e.student_id AND ss.subject_name=e.subject_name)
GROUP BY ss.student_id, ss.student_name, ss.subject_name
ORDER BY ss.student_id;

-- Drop unused tables

DROP TABLE Students;
DROP TABLE Subjects;
DROP TABLE Examinations;