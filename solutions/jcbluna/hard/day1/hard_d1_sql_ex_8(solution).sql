-- Create the student table
CREATE TABLE Student (name varchar(50), continent varchar(7));

-- Populate the student table    
TRUNCATE TABLE Student;
INSERT INTO Student (name, continent) VALUES ('Jane', 'America');
INSERT INTO Student (name, continent) VALUES ('Pascal', 'Europe');
INSERT INTO Student (name, continent) VALUES ('Xi', 'Asia');
INSERT INTO Student (name, continent) VALUES ('Jack', 'America');

-- Solve the exercise
WITH StudentRanked AS
(SELECT name, continent, DENSE_RANK() OVER(PARTITION BY continent ORDER BY name) AS rank_name
FROM Student)
SELECT * FROM StudentRanked
PIVOT(
    MAX(name)
    FOR continent
    IN ( 
        'America',
        'Europe',
        'Asia')
)
ORDER BY rank_name;

-- Drop unused table
DROP TABLE Student;