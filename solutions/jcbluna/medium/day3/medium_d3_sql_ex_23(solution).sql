-- Create the enrollments table
CREATE TABLE Enrollments (student_id int, course_id int, grade int);

-- Populate the enrollments table    
TRUNCATE TABLE Enrollments;
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('2', '2', '95');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('2', '3', '95');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('1', '1', '90');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('1', '2', '99');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('3', '1', '80');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('3', '2', '75');
INSERT INTO Enrollments (student_id, course_id, grade) VALUES ('3', '3', '82');

-- Solve the exercise
SELECT student_id, MIN(course_id) as course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN (SELECT student_id, MAX(grade)
                            FROM Enrollments
                            GROUP BY student_id)  
GROUP BY student_id, grade
ORDER BY student_id;

-- Drop unused table
DROP TABLE Enrollments;