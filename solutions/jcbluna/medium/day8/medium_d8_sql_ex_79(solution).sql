-- Create the data table
CREATE TABLE Data (first_col int, second_col int);

-- Populate the data table    
TRUNCATE TABLE Data;
INSERT INTO Data (first_col, second_col) VALUES ('4', '2');
INSERT INTO Data (first_col, second_col) VALUES ('2', '3');
INSERT INTO Data (first_col, second_col) VALUES ('3', '1');
INSERT INTO Data (first_col, second_col) VALUES ('1', '4');

-- Solve the exercise
SELECT first_col, second_col
FROM (SELECT first_col, ROW_NUMBER() OVER (ORDER BY first_col) AS rown
From Data
ORDER BY first_col)
JOIN (SELECT second_col, ROW_NUMBER() OVER (ORDER BY second_col DESC) AS rown
From Data
ORDER BY second_col DESC)
USING(rown);

-- Drop unused table
DROP TABLE Data;