-- Create the scores table
CREATE TABLE Scores (id int, score NUMBER(3,2));
    
-- Populate the scores table
TRUNCATE TABLE Scores;
INSERT INTO Scores (id, score) VALUES ('1', '3.5');
INSERT INTO Scores (id, score) VALUES ('2', '3.65');
INSERT INTO Scores (id, score) VALUES ('3', '4.0');
INSERT INTO Scores (id, score) VALUES ('4', '3.85');
INSERT INTO Scores (id, score) VALUES ('5', '4.0');
INSERT INTO Scores (id, score) VALUES ('6', '3.65');

-- Solve the exercise
SELECT TO_CHAR(score,'0.00') AS score, DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores;

-- Drop unused table
DROP TABLE Scores;