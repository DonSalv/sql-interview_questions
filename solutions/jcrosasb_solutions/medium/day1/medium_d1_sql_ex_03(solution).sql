-- Create the scores table
Create table Scores (id int, score NUMBER(3,2));
    
-- Populate the scores table
Truncate table Scores;
insert into Scores (id, score) values (1, 3.5);
insert into Scores (id, score) values (2, 3.65);
insert into Scores (id, score) values (3, 4.0);
insert into Scores (id, score) values (4, 3.85);
insert into Scores (id, score) values (5, 4.0);
insert into Scores (id, score) values (6, 3.65);

-- Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
--      * The scores should be ranked from the highest to the lowest.
--      * If there is a tie between two scores, both should have the same ranking.
--      * After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
-- Return the result table ordered by score in descending order
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM
    Scores
ORDER BY
    score DESC;

-- Drop tables
DROP TABLE Scores;
