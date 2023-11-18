-- Create the tables
CREATE TABLE Person (id int, name varchar(15), phone_number varchar(11));
CREATE TABLE Country (name varchar(15), country_code varchar(3));
CREATE TABLE Calls (caller_id int, callee_id int, duration int);

-- Populate the person table
TRUNCATE TABLE Person;
INSERT INTO Person (id, name, phone_number) VALUES ('3', 'Jonathan', '051-1234567');
INSERT INTO Person (id, name, phone_number) VALUES ('12', 'Elvis', '051-7654321');
INSERT INTO Person (id, name, phone_number) VALUES ('1', 'Moncef', '212-1234567');
INSERT INTO Person (id, name, phone_number) VALUES ('2', 'Maroua', '212-6523651');
INSERT INTO Person (id, name, phone_number) VALUES ('7', 'Meir', '972-1234567');
INSERT INTO Person (id, name, phone_number) VALUES ('9', 'Rachel', '972-0011100');

-- Populate the country table    
TRUNCATE TABLE Country;
INSERT INTO Country (name, country_code) VALUES ('Peru', '051');
INSERT INTO Country (name, country_code) VALUES ('Israel', '972');
INSERT INTO Country (name, country_code) VALUES ('Morocco', '212');
INSERT INTO Country (name, country_code) VALUES ('Germany', '049');
INSERT INTO Country (name, country_code) VALUES ('Ethiopia', '251');

-- Populate the calls table    
TRUNCATE TABLE Calls;
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('1', '9', '33');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('2', '9', '4');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('1', '2', '59');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('3', '12', '102');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('3', '12', '330');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('12', '3', '5');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('7', '9', '13');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('7', '1', '3');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('9', '7', '1');
INSERT INTO Calls (caller_id, callee_id, duration) VALUES ('1', '7', '7');

-- Solve the exercise
WITH CorrectCalls AS
( -- 2. Associate each call with both countries
SELECT c.id, SUBSTR(phone_number,1,3) AS country_code, duration
FROM (-- 1. Create a table to consider each call for both users
SELECT caller_id AS id, duration
FROM Calls 
UNION ALL 
SELECT callee_id AS id, duration
FROM Calls) c JOIN Person p
ON(c.id=p.id))
SELECT name
FROM
(-- 3. Calculate the average for each country and for all calls
SELECT DISTINCT country_code, AVG(duration) OVER (PARTITION BY country_code) AS country_avg, AVG(duration) OVER () AS global_avg
FROM CorrectCalls) a JOIN Country c
USING(country_code)
-- 4. Take only the countries which meet the requirement
WHERE country_avg>global_avg;

-- Drop unused tables
DROP TABLE Person;
DROP TABLE Country;
DROP TABLE Calls;