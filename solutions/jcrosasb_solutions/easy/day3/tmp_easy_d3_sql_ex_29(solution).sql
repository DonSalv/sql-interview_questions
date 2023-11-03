-- Create the actions table
Create table Actions (user_id int, post_id int, action_date date, action ENUM('view', 'like', 'reaction', 'comment', 'report', 'share'), extra varchar(10));

-- Populate the actions table
Truncate table Actions;
--insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'view', 'None');

/**
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'like', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'share', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 4, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 4, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-04', 'report', 'racism');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-04', 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-04', 'report', 'racism');
*/

-- Drop tables
DROP TABLE Actions;
