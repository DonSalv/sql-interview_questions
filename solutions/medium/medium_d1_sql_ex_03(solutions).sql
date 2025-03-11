-- medium day 1 exercise 03

-- Create the scores table
Create table Scores (id number primary key,
                     score number(3,2));
    
-- Populate the scores table
Truncate table Scores;
INSERT INTO Scores (id, score) VALUES (1, 3.5);
INSERT INTO Scores (id, score) VALUES (2, 3.65);
INSERT INTO Scores (id, score) VALUES (3, 4.0);
INSERT INTO Scores (id, score) VALUES (4, 3.85);
INSERT INTO Scores (id, score) VALUES (5, 4.0);
INSERT INTO Scores (id, score) VALUES (6, 3.65);

-- Solution
select score, dense_rank() over (order by score desc) as rank
from Scores;

-- explanation: 
-- dense_rank function maintains the rank and does not give any gap for the values.


-- drop table
drop table Scores;