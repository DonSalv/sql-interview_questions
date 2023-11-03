-- Table creation
CREATE TABLE IF NOT EXISTS Person (personId int, firstName varchar(255), lastName varchar(255));
CREATE TABLE IF NOT EXISTS Address (addressId int, personId int, city varchar(255), state varchar(255));

-- Populate person table
TRUNCATE TABLE Person;
INSERT INTO Person (personId, lastName, firstName) VALUES ('1', 'Wang', 'Allen');
INSERT INTO Person (personId, lastName, firstName) VALUES ('2', 'Alice', 'Bob');

-- Populate adress table
TRUNCATE TABLE Address;
INSERT INTO Address (addressId, personId, city, state) VALUES ('1', '2', 'New York City', 'New York');
INSERT INTO Address (addressId, personId, city, state) VALUES ('2', '3', 'Leetcode', 'California');

-- Solution to the exercise
SELECT firstName, lastName, city, state
FROM person p LEFT OUTER JOIN address a
ON (p.personId=a.personId)
ORDER BY firstName, lastName;

-- Drop unused tables
DROP TABLE Person;
DROP TABLE Address;

