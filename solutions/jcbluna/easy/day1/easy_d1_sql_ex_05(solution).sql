-- Crete the Person table
CREATE TABLE Person (Id int, Email varchar(255));

-- Populate the Person table
TRUNCATE TABLE Person;
INSERT INTO Person (id, email) VALUES ('1', 'john@example.com');
INSERT INTO Person (id, email) VALUES ('2', 'bob@example.com');
INSERT INTO Person (id, email) VALUES ('3', 'john@example.com');

-- Solve the exercise
DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id)
                FROM Person
                GROUP BY email);

-- Print the table after delete duplicates                
SELECT * FROM Person;

-- Drop unused tables
DROP TABLE Person;
