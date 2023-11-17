-- Create the tabkes
CREATE TABLE NewYork (student_id int, score int);
CREATE TABLE California (student_id int, score int);

-- Example 1    
-- Populate the newyork table
TRUNCATE TABLE NewYork;
INSERT INTO NewYork (student_id, score) VALUES ('1', '90');
INSERT INTO NewYork (student_id, score) VALUES ('2', '87');
    
-- Populate the california table
TRUNCATE TABLE California;
INSERT INTO California (student_id, score) VALUES ('2', '89');
INSERT INTO California (student_id, score) VALUES ('3', '88');

-- Example 2    
-- Populate the newyork table
TRUNCATE TABLE NewYork;
INSERT INTO NewYork (student_id, score) VALUES ('1', '89');
INSERT INTO NewYork (student_id, score) VALUES ('2', '88');
    
-- Populate the california table
TRUNCATE TABLE California;
INSERT INTO California (student_id, score) VALUES ('2', '90');
INSERT INTO California (student_id, score) VALUES ('3', '87');

-- Example 3    
-- Populate the newyork table
TRUNCATE TABLE NewYork;
INSERT INTO NewYork (student_id, score) VALUES ('1', '89');
INSERT INTO NewYork (student_id, score) VALUES ('2', '90');
    
-- Populate the california table
TRUNCATE TABLE California;
INSERT INTO California (student_id, score) VALUES ('2', '87');
INSERT INTO California (student_id, score) VALUES ('3', '99');


-- Solve the exercise
-- Name the column of both subtables with the counts and reference them in the
-- CASE Expression
SELECT (CASE WHEN n.count>c.count THEN 'New York University'
        WHEN c.count>n.count THEN 'California University'
        ELSE 'No Winner' END) AS winner
FROM (SELECT COUNT(student_id) AS count FROM NewYork WHERE score>=90) n,
(SELECT COUNT(student_id) AS count FROM California WHERE score>=90) c;

-- Drop unused tables
DROP TABLE NewYork;
DROP TABLE California;