-- Create tables
CREATE TABLE Person (
    personId int, 
    firstName varchar(255), 
    lastName varchar(255)
);

CREATE TABLE Address (
    addressId int, 
    personId int, 
    city varchar(255), 
    state varchar(255)
);

-- Populate person table
TRUNCATE TABLE Person;
INSERT INTO Person (personId, lastName, firstName) VALUES ('1', 'Wang', 'Allen');
INSERT INTO Person (personId, lastName, firstName) VALUES ('2', 'Alice', 'Bob');

-- Populate adress table
TRUNCATE TABLE Address;
INSERT INTO Address (addressId, personId, city, state) VALUES ('1', '2', 'New York City', 'New York');
INSERT INTO Address (addressId, personId, city, state) VALUES ('2', '3', 'Leetcode', 'California');

-- Write a solution to report the first name, last name, city, and state of each person in the PERSON table. If the address of a personId is not present in the ADDRESS table, report null instead.
-- Return the result table in any order.
SELECT p.firstName, p.lastName, a.city, a.state 
    FROM person p LEFT JOIN address a 
    ON a.personId = p.personId;