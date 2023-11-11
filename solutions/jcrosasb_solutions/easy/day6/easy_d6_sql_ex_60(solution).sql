-- Create the tables;
Create table Users (user_id int, user_name varchar(20));
Create table Register (contest_id int, user_id int);

-- Populate the users table;
Truncate table Users;
insert into Users (user_id, user_name) values (6, 'Alice');
insert into Users (user_id, user_name) values (2, 'Bob');
insert into Users (user_id, user_name) values (7, 'Alex');

-- Populate the register table;
Truncate table Register;
insert into Register (contest_id, user_id) values (215, 6);
insert into Register (contest_id, user_id) values (209, 2);
insert into Register (contest_id, user_id) values (208, 2);
insert into Register (contest_id, user_id) values (210, 6);
insert into Register (contest_id, user_id) values (208, 6);
insert into Register (contest_id, user_id) values (209, 7);
insert into Register (contest_id, user_id) values (209, 6);
insert into Register (contest_id, user_id) values (215, 7);
insert into Register (contest_id, user_id) values (208, 7);
insert into Register (contest_id, user_id) values (210, 2);
insert into Register (contest_id, user_id) values (207, 2);
insert into Register (contest_id, user_id) values (210, 7);

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order
SELECT 
    contest_id, 
    ROUND(100*COUNT(user_id)/(SELECT COUNT(*) FROM Users),2) percentage 
FROM Register 
GROUP BY contest_id 
ORDER BY percentage DESC, contest_id;

-- Drop tables
DROP TABLE Users;
DROP TABLE Register;
