-- Create the tables
CREATE TABLE Candidates (candidate_id int, name varchar(30), years_of_exp int, interview_id int);
CREATE TABLE Rounds (interview_id int, round_id int, score int);

-- Populate the candidates table    
TRUNCATE TABLE Candidates;
INSERT INTO Candidates (candidate_id, name, years_of_exp, interview_id) VALUES ('11', 'Atticus', '1', '101');
INSERT INTO Candidates (candidate_id, name, years_of_exp, interview_id) VALUES ('9', 'Ruben', '6', '104');
INSERT INTO Candidates (candidate_id, name, years_of_exp, interview_id) VALUES ('6', 'Aliza', '10', '109');
INSERT INTO Candidates (candidate_id, name, years_of_exp, interview_id) VALUES ('8', 'Alfredo', '0', '107');

-- Populate the rounds table    
TRUNCATE TABLE Rounds;
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('109', '3', '4');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('101', '2', '8');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('109', '4', '1');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('107', '1', '3');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('104', '3', '6');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('109', '1', '4');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('104', '4', '7');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('104', '1', '2');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('109', '2', '1');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('104', '2', '7');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('107', '2', '3');
INSERT INTO Rounds (interview_id, round_id, score) VALUES ('101', '1', '8');

-- Solve the exercise
SELECT candidate_id
FROM Candidates c LEFT OUTER JOIN Rounds r
ON(c.interview_id=r.interview_id)
-- Fix typo in the years of experience
WHERE years_of_exp>=2
GROUP BY candidate_id
HAVING SUM(score)>15;

-- Drop unused tables
DROP TABLE Candidates;
DROP TABLE Rounds;