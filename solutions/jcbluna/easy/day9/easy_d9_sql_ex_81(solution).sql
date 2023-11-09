-- Create the problems table
CREATE TABLE Problems (problem_id int, likes int, dislikes int);
    
-- Populate the problems table
TRUNCATE TABLE Problems;
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('6', '1290', '425');
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('11', '2677', '8659');
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('1', '4446', '2760');
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('7', '8569', '6086');
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('13', '2050', '4164');
INSERT INTO Problems (problem_id, likes, dislikes) VALUES ('10', '9002', '7446');

-- Solve the exercise
SELECT problem_id
FROM Problems
WHERE (likes/(likes+dislikes))*100<60
ORDER BY problem_id ASC;

-- Drop unused table
DROP TABLE Problems;