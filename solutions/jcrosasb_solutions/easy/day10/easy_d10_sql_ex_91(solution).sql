-- Create the person table
Create table Person (person_id int, name varchar(30), profession varchar(10) CONSTRAINT check_enum_values CHECK (profession IN ('Doctor','Singer','Actor','Player','Engineer','Lawyer')) );
    
-- Populate the person table
Truncate table Person;
insert into Person (person_id, name, profession) values (1, 'Alex', 'Singer');
insert into Person (person_id, name, profession) values (3, 'Alice', 'Actor');
insert into Person (person_id, name, profession) values (2, 'Bob', 'Player');
insert into Person (person_id, name, profession) values (4, 'Messi', 'Doctor');
insert into Person (person_id, name, profession) values (6, 'Tyson', 'Engineer');
insert into Person (person_id, name, profession) values (5, 'Meir', 'Lawyer');

-- Write a solution to report each person's name followed by the first letter of their profession enclosed in parentheses.
-- Return the result table ordered by person_id in descending order
SELECT 
    person_id, 
    name || '(' || SUBSTR(profession,1,1) || ')' name
FROM Person
ORDER BY person_id DESC;

-- Drop tables
DROP TABLE Person;
