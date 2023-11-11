-- Create the users table
Create table Users (user_id int, name varchar(40));

-- Populate the users table
Truncate table Users;
insert into Users (user_id, name) values (1, 'aLice');
insert into Users (user_id, name) values (2, 'bOB');

-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id
SELECT 
    user_id,
    INITCAP(LOWER(name)) name
FROM Users;

-- Drop tables
DROP TABLE Users;
