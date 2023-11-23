-- Create the views table
Create table Views (article_id int, author_id int, viewer_id int, view_date date);
    
-- Populate the views table
Truncate table Views;
insert into Views (article_id, author_id, viewer_id, view_date) values (1, 3, 5, DATE '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date) values (3, 4, 5, DATE '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date) values (1, 3, 6, DATE '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date) values (2, 7, 7, DATE '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date) values (2, 7, 6, DATE '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date) values (4, 7, 1, DATE '2019-07-22');
insert into Views (article_id, author_id, viewer_id, view_date) values (3, 4, 4, DATE '2019-07-21');
insert into Views (article_id, author_id, viewer_id, view_date) values (3, 4, 4, DATE '2019-07-21');

-- Write a solution to find all the people who viewed more than one article on the same date.
-- Return the result table sorted by id in ascending order.
SELECT 
    DISTINCT viewer_id AS id
FROM 
    Views 
GROUP BY 
    viewer_id, 
    view_date
HAVING
    COUNT(DISTINCT article_id) > 1
ORDER BY
    viewer_id;

-- Drop tables
DROP TABLE Views;
