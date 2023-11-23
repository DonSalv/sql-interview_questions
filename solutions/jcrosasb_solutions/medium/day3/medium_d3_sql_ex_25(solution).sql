-- Create the tables
Create table Actions (user_id int, post_id int, action_date date, action varchar(15) CONSTRAINT check_enum_values CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), extra varchar(10));
create table Removals (post_id int, remove_date date);

-- Populate the actions table
Truncate table Actions;
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'like', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'share', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 2, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 2, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-03', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-03', 'report', 'racism');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-03', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-03', 'report', 'racism');

-- Populate the removals table
Truncate table Removals;
insert into Removals (post_id, remove_date) values (2, DATE '2019-07-20');
insert into Removals (post_id, remove_date) values (3, DATE '2019-07-18');

-- Write a solution to find the average daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places
SELECT
    AVG(t.num_spams_removed / t.num_spams) * 100 AS average_daily_percent
FROM
    (SELECT
        a.action_date, 
        COUNT(a.action_date) AS num_spams,
        COUNT(r.remove_date) AS num_spams_removed
    FROM 
        Actions a 
    LEFT JOIN
        Removals r
    ON
        r.post_id = a.post_id
    WHERE 
        extra = 'spam'
    GROUP BY
        a.action_date) t;

-- Drop tables
DROP TABLE Actions;
DROP TABLE Removals;
