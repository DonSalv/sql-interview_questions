-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the scores table
Create table Scores (player_name varchar(20), gender varchar(1), day date, score_points int);
    
-- Populate the scores table
Truncate table Scores;
insert into Scores (player_name, gender, day, score_points) values ('Aron', 'F', DATE '2020-01-01', 17);
insert into Scores (player_name, gender, day, score_points) values ('Alice', 'F', DATE '2020-01-07', 23);
insert into Scores (player_name, gender, day, score_points) values ('Bajrang', 'M', DATE '2020-01-07', 7);
insert into Scores (player_name, gender, day, score_points) values ('Khali', 'M', DATE '2019-12-25', 11);
insert into Scores (player_name, gender, day, score_points) values ('Slaman', 'M', DATE '2019-12-30', 13);
insert into Scores (player_name, gender, day, score_points) values ('Joe', 'M', DATE '2019-12-31', 3);
insert into Scores (player_name, gender, day, score_points) values ('Jose', 'M', DATE '2019-12-18', 2);
insert into Scores (player_name, gender, day, score_points) values ('Priya', 'F', DATE '2019-12-31', 23);
insert into Scores (player_name, gender, day, score_points) values ('Priyanka', 'F', DATE '2019-12-30', 17);

-- Write a solution to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
SELECT 
    gender, 
    day, 
    SUM(score_points) OVER 
        (PARTITION BY gender ORDER BY day) AS total 
FROM 
    Scores 
ORDER BY 
    gender, 
    day;

-- Drop tables
DROP TABLE Scores;
