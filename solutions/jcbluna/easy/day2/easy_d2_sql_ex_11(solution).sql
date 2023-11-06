-- Create the courses table
CREATE TABLE Courses (student varchar(255), class varchar(255));

-- Populate the courses table
TRUNCATE TABLE Courses;
INSERT INTO Courses (student, class) VALUES ('A', 'Math');
INSERT INTO Courses (student, class) VALUES ('B', 'English');
INSERT INTO Courses (student, class) VALUES ('C', 'Math');
INSERT INTO Courses (student, class) VALUES ('D', 'Biology');
INSERT INTO Courses (student, class) VALUES ('E', 'Math');
INSERT INTO Courses (student, class) VALUES ('F', 'Computer');
INSERT INTO Courses (student, class) VALUES ('G', 'Math');
INSERT INTO Courses (student, class) VALUES ('H', 'Math');
INSERT INTO Courses (student, class) VALUES ('I', 'Math');

-- Solve the exercise

SELECT class FROM Courses
GROUP BY class
HAVING COUNT(class)>5;

-- Drop unused tables

DROP TABLE Courses;