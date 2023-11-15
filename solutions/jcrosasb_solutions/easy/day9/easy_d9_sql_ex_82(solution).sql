-- Create the tabkes
Create table NewYork (student_id int, score int);
Create table California (student_id int, score int);


-- EXAMPLE 1    
-- Populate the newyork table
Truncate table NewYork;
insert into NewYork (student_id, score) values (1, 90);
insert into NewYork (student_id, score) values (2, 87);
    
-- Populate the california table
Truncate table California;
insert into California (student_id, score) values (2, 89);
insert into California (student_id, score) values (3, 88);

/*
-- Example 2
-- Populate the newyork table
Truncate table NewYork;
insert into NewYork (student_id, score) values (1, 89);
insert into NewYork (student_id, score) values (2, 88);
    
-- Populate the california table
Truncate table California;
insert into California (student_id, score) values (2, 90);
insert into California (student_id, score) values (3, 87);
*/

/*
-- Example 3
-- Populate the newyork table
Truncate table NewYork;
insert into NewYork (student_id, score) values (1, 89);
insert into NewYork (student_id, score) values (2, 90);
    
-- Populate the california table
Truncate table California;
insert into California (student_id, score) values (2, 87);
insert into California (student_id, score) values (3, 99);
*/

-- There is a competition between New York University and California University. The competition is held between the same number of students from both universities. 
-- The university that has more excellent students wins the competition. If the two universities have the same number of excellent students, the competition ends in a draw.
-- An excellent student is a student that scored 90% or more in the exam.
-- Return:
--      * "New York University" if New York University wins the competition.
--      * "California University" if California University wins the competition.
--      * "No Winner" if the competition ends in a draw
SELECT 
    CASE 
        WHEN (SELECT count(student_id) FROM NewYork WHERE score >=90) > (SELECT count(student_id) FROM California WHERE score >=90) 
            THEN 'New York University' 
        WHEN (SELECT count(student_id) FROM NewYork WHERE score >=90) < (SELECT count(student_id) FROM California WHERE score >=90) 
            THEN 'California University' 
        ELSE 'No Winner'
    END Winner
FROM DUAL;

-- Drop tables
DROP TABLE NewYork;
DROP TABLE California;
