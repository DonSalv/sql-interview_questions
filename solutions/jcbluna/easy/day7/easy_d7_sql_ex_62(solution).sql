-- Create the users table
CREATE TABLE Users (user_id int, name varchar(40));

-- Populate the users table
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, name) VALUES ('1', 'aLice');
INSERT INTO Users (user_id, name) VALUES ('2', 'bOB');

-- Solve the exercise
-- Instead of using Innit cap which capitalize every word
-- we now upper the first character (triming both sides of the string)
-- and lower the rest of characters.
SELECT user_id, UPPER(SUBSTR(TRIM(name),1,1)) || LOWER(SUBSTR(TRIM(name),2)) AS name
FROM Users
ORDER BY user_id;

-- Drop unused table
DROP TABLE Users;