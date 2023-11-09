-- Create the users table
CREATE TABLE Users (user_id int, name varchar(40));

-- Populate the users table
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, name) VALUES ('1', 'aLice');
INSERT INTO Users (user_id, name) VALUES ('2', 'bOB');

-- Solve the exercise
SELECT user_id, INITCAP(name) AS name
FROM Users
ORDER BY user_id;

-- Drop unused table´
DROP TABLE Users;