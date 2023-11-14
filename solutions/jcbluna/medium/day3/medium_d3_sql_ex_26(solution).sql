-- Create the views table
CREATE TABLE Views (article_id int, author_id int, viewer_id int, view_date date);
    
-- Populate the views table
TRUNCATE TABLE Views;
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('1', '3', '5', TO_DATE('2019-08-01','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('3', '4', '5', TO_DATE('2019-08-01','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('1', '3', '6', TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('2', '7', '7', TO_DATE('2019-08-01','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('2', '7', '6', TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('4', '7', '1', TO_DATE('2019-07-22','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('3', '4', '4', TO_DATE('2019-07-21','%YYYY-%MM-%DD'));
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('3', '4', '4', TO_DATE('2019-07-21','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT DISTINCT viewer_id AS id
FROM (SELECT viewer_id, view_date, COUNT(DISTINCT article_id) AS articles_read
        FROM Views
        GROUP BY viewer_id, view_date)
WHERE articles_read>1
ORDER BY id;

-- Drop unused table
DROP TABLE Views;