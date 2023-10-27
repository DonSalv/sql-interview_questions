-- Create the person table
Create table Person (id int, email varchar(255));

-- Populate the person table
Truncate table Person;
insert into Person (id, email) values ('1', 'a@b.com');
insert into Person (id, email) values ('2', 'c@d.com');
insert into Person (id, email) values ('3', 'a@b.com');

-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
-- Return the result table in any order.
SELECT email, COUNT(email) AS email_count 
    FROM person 
    GROUP BY email 
    HAVING COUNT(email) > 1; 

-- Drop tables
DROP TABLE Person;