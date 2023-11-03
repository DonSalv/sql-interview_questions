-- Create the person table
CREATE TABLE Person (id int, email varchar(255));

-- Populate the person table
TRUNCATE TABLE Person;
INSERT INTO Person (id, email) VALUES ('1', 'a@b.com');
INSERT INTO Person (id, email) VALUES ('2', 'c@d.com');
INSERT INTO Person (id, email) VALUES ('3', 'a@b.com');

-- Solve the exercise
SELECT email 
FROM Person
GROUP BY email
HAVING COUNT(email)>1;

-- Drop unused tables
DROP TABLE Person;
