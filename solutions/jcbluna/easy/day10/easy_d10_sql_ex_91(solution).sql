-- Create the person table
CREATE TABLE Person (person_id int, name varchar(30), profession varchar(8) CHECK(profession IN ('Doctor','Singer','Actor','Player','Engineer','Lawyer')));
    
-- Populate the person table
TRUNCATE TABLE Person;
INSERT INTO Person (person_id, name, profession) VALUES ('1', 'Alex', 'Singer');
INSERT INTO Person (person_id, name, profession) VALUES ('3', 'Alice', 'Actor');
INSERT INTO Person (person_id, name, profession) VALUES ('2', 'Bob', 'Player');
INSERT INTO Person (person_id, name, profession) VALUES ('4', 'Messi', 'Doctor');
INSERT INTO Person (person_id, name, profession) VALUES ('6', 'Tyson', 'Engineer');
INSERT INTO Person (person_id, name, profession) VALUES ('5', 'Meir', 'Lawyer');

-- Solve the exercise
SELECT person_id, name || '(' || UPPER(SUBSTR(profession,1,1)) || ')'
FROM Person
ORDER BY person_id DESC;

-- Drop unused table
DROP TABLE Person;