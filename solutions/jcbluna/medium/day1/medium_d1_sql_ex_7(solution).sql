-- Create the tables
CREATE TABLE Candidate (id int, name varchar(255));
CREATE TABLE Vote (id int, candidateId int);

-- Populate the candidate table    
TRUNCATE TABLE Candidate;
INSERT INTO Candidate (id, name) VALUES ('1', 'A');
INSERT INTO Candidate (id, name) VALUES ('2', 'B');
INSERT INTO Candidate (id, name) VALUES ('3', 'C');
INSERT INTO Candidate (id, name) VALUES ('4', 'D');
INSERT INTO Candidate (id, name) VALUES ('5', 'E');

-- Populate the vote table    
TRUNCATE TABLE Vote;
INSERT INTO Vote (id, candidateId) VALUES ('1', '2');
INSERT INTO Vote (id, candidateId) VALUES ('2', '4');
INSERT INTO Vote (id, candidateId) VALUES ('3', '3');
INSERT INTO Vote (id, candidateId) VALUES ('4', '2');
INSERT INTO Vote (id, candidateId) VALUES ('5', '5');

-- Solve the exercise
SELECT name
FROM (SELECT name, COUNT(v.id) AS votes
    FROM Candidate c JOIN Vote v
    ON(c.id=v.candidateId)
    GROUP BY name
    ORDER BY votes DESC)
-- Write the query without the FETCH NEXT clause
WHERE ROWNUM=1;

-- Drop unused table
DROP TABLE Candidate;
DROP TABLE Vote;