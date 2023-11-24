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
SELECT candidate
FROM(SELECT candidate, COUNT(candidate), DENSE_RANK() OVER(ORDER BY COUNT(candidate) DESC) AS cand_rank
FROM Votes
WHERE candidate IS NOT NULL
GROUP BY candidate)
WHERE cand_rank=1
ORDER BY candidate;

-- Drop unused table
DROP TABLE Votes;