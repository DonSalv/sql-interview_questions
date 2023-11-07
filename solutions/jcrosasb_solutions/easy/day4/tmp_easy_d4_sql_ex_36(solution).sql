-- Create the submissions table
Create table Submissions (sub_id int, parent_id int);
    
-- Populate the submissions table
Truncate table Submissions;
insert into Submissions (sub_id, parent_id) values (1, Null);
insert into Submissions (sub_id, parent_id) values (2, Null);
insert into Submissions (sub_id, parent_id) values (1, Null);
insert into Submissions (sub_id, parent_id) values (12, Null);
insert into Submissions (sub_id, parent_id) values (3, 1);
insert into Submissions (sub_id, parent_id) values (5, 2);
insert into Submissions (sub_id, parent_id) values (3, 1);
insert into Submissions (sub_id, parent_id) values (4, 1);
insert into Submissions (sub_id, parent_id) values (9, 1);
insert into Submissions (sub_id, parent_id) values (10, 2);
insert into Submissions (sub_id, parent_id) values (6, 7);

-- Write a solution to find the number of comments per post. The result table should contain post_id and its corresponding number_of_comments.
-- The SUBMISSIONS table may contain duplicate comments. You should count the number of unique comments per post.
-- The SUBMISSIONS table may contain duplicate posts. You should treat them as one post.
-- The result table should be ordered by post_id in ascending order.
