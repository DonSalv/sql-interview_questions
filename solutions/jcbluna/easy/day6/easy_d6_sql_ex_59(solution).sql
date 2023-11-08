-- Create the tables
CREATE TABLE SchoolA (student_id int, student_name varchar(20));
CREATE TABLE SchoolB (student_id int, student_name varchar(20));
CREATE TABLE SchoolC (student_id int, student_name varchar(20));

-- Populate the schoola table
TRUNCATE TABLE SchoolA;
INSERT INTO SchoolA (student_id, student_name) VALUES ('1', 'Alice');
INSERT INTO SchoolA (student_id, student_name) VALUES ('2', 'Bob');

-- Populate the schoolb table
TRUNCATE TABLE SchoolB;
INSERT INTO SchoolB (student_id, student_name) VALUES ('3', 'Tom');

-- Populate the schoolc table
TRUNCATE TABLE SchoolC;
INSERT INTO SchoolC (student_id, student_name) VALUES ('3', 'Tom');
INSERT INTO SchoolC (student_id, student_name) VALUES ('2', 'Jerry');
INSERT INTO SchoolC (student_id, student_name) VALUES ('10', 'Alice');

-- Solve the exercise
SELECT a.student_name AS member_A, b.student_name AS member_B, c.student_name AS member_C
FROM SchoolA a CROSS JOIN SchoolB b CROSS JOIN SchoolC c
WHERE a.student_name!=b.student_name
AND c.student_name!=b.student_name
AND a.student_name!=c.student_name
AND a.student_id!=b.student_id
AND c.student_id!=b.student_id
AND a.student_id!=c.student_id;

-- Drop unused tables
DROP TABLE SchoolA;
DROP TABLE SchoolB;
DROP TABLE SchoolC;