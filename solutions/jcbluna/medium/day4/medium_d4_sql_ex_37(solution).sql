-- Create the scores table
CREATE TABLE Scores (player_name varchar(20), gender varchar(1), day date, score_points int);
    
-- Populate the scores table
TRUNCATE TABLE Scores;
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Aron', 'F', TO_DATE('2020-01-01','%YYYY-%MM-%DD'), '17');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Alice', 'F', TO_DATE('2020-01-07','%YYYY-%MM-%DD'), '23');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Bajrang', 'M', TO_DATE('2020-01-07','%YYYY-%MM-%DD'), '7');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Khali', 'M', TO_DATE('2019-12-25','%YYYY-%MM-%DD'), '11');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Slaman', 'M', TO_DATE('2019-12-30','%YYYY-%MM-%DD'), '13');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Joe', 'M', TO_DATE('2019-12-31','%YYYY-%MM-%DD'), '3');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Jose', 'M', TO_DATE('2019-12-18','%YYYY-%MM-%DD'), '2');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Priya', 'F', TO_DATE('2019-12-31','%YYYY-%MM-%DD'), '23');
INSERT INTO Scores (player_name, gender, day, score_points) VALUES ('Priyanka', 'F', TO_DATE('2019-12-30','%YYYY-%MM-%DD'), '17');

-- Solve the exercise
SELECT gender, TO_CHAR(day,'YYYY-MM-DD') AS "day", SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS total
FROM Scores
ORDER BY gender, TO_CHAR(day,'YYYY-MM-DD');

-- Drop unused table
DROP TABLE Scores;