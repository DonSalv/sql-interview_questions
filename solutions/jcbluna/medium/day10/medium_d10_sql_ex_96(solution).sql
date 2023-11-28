-- Create the votes table
CREATE TABLE Votes(voter varchar(30), candidate varchar(30));

-- Populate the votes table
TRUNCATE TABLE Votes;
INSERT INTO Votes (voter, candidate) VALUES ('Kathy', NULL);
INSERT INTO Votes (voter, candidate) VALUES ('Charles', 'Ryan');
INSERT INTO Votes (voter, candidate) VALUES ('Charles', 'Christine');
INSERT INTO Votes (voter, candidate) VALUES ('Charles', 'Kathy');
INSERT INTO Votes (voter, candidate) VALUES ('Benjamin', 'Christine');
INSERT INTO Votes (voter, candidate) VALUES ('Anthony', 'Ryan');
INSERT INTO Votes (voter, candidate) VALUES ('Edward', 'Ryan');
INSERT INTO Votes (voter, candidate) VALUES ('Terry', NULL);
INSERT INTO Votes (voter, candidate) VALUES ('Evelyn', 'Kathy');
INSERT INTO Votes (voter, candidate) VALUES ('Arthur', 'Christine');

-- Solve the exercise
-- Fix: Count the votes of each voter as one
SELECT candidate
FROM(SELECT candidate, SUM(vote), DENSE_RANK() OVER(ORDER BY SUM(vote) DESC) AS cand_rank
FROM (SELECT voter, 1/COUNT(voter) AS vote
FROM Votes
GROUP BY voter) RIGHT OUTER JOIN Votes
USING(voter)
WHERE candidate IS NOT NULL
GROUP BY candidate)
WHERE cand_rank=1
ORDER BY candidate;

-- Drop unused table
DROP TABLE Votes;