-- Create the tables
Create table Accounts (id int, name varchar(10));
Create table Logins (id int, login_date date);

-- Populate the accounts table    
Truncate table Accounts;
insert into Accounts (id, name) values (1, 'Winston');
insert into Accounts (id, name) values (7, 'Jonathan');

-- Populate the logins table

Truncate table Logins;
insert into Logins (id, login_date) values (7, DATE '2020-05-30');
insert into Logins (id, login_date) values (1, DATE '2020-05-30');
insert into Logins (id, login_date) values (7, DATE '2020-05-31');
insert into Logins (id, login_date) values (7, DATE '2020-06-01');
insert into Logins (id, login_date) values (7, DATE '2020-06-02');
insert into Logins (id, login_date) values (7, DATE '2020-06-02');
insert into Logins (id, login_date) values (7, DATE '2020-06-03');
insert into Logins (id, login_date) values (1, DATE '2020-06-07');
insert into Logins (id, login_date) values (7, DATE '2020-06-10');

-- Active users are those who logged in to their accounts for five or more consecutive days.
-- Write a solution to find the id and the name of active users.
-- Return the result table ordered by id.
-- Follow up Could you write a general solution if the active users are those who logged in to their accounts for n or more consecutive days?
WITH day_offset AS (
    SELECT
        id, 
        login_date,
        (login_date - ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date)) + 1 AS offset 
    FROM (SELECT DISTINCT * FROM Logins))     
SELECT
    id,
    name
FROM
    (SELECT 
       DISTINCT id
    FROM
        day_offset
    GROUP BY
        id,
        offset
    HAVING
        COUNT(login_date) >= 5)  -- Here you can adjust the number of consecutive days
JOIN
    Accounts
USING
    (id);

-- Drop tables
DROP TABLE Accounts;
DROP TABLE Logins;
