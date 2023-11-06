-- Create the cinema table
CREATE TABLE cinema (id int, movie varchar(255), description varchar(255), rating NUMBER(2,1));
    
-- Populate the cinema table
TRUNCATE TABLE cinema;
INSERT INTO cinema (id, movie, description, rating) VALUES ('1', 'War', 'great 3D', '8.9');
INSERT INTO cinema (id, movie, description, rating) VALUES ('2', 'Science', 'fiction', '8.5');
INSERT INTO cinema (id, movie, description, rating) VALUES ('3', 'irish', 'boring', '6.2');
INSERT INTO cinema (id, movie, description, rating) VALUES ('4', 'Ice song', 'Fantacy', '8.6');
INSERT INTO cinema (id, movie, description, rating) VALUES ('5', 'House card', 'Interesting', '9.1');

-- Solve the exercise

SELECT *
FROM cinema
WHERE MOD(id,2)=1
AND description!='boring'
ORDER BY rating DESC;

-- Drop unused table
DROP TABLE cinema;