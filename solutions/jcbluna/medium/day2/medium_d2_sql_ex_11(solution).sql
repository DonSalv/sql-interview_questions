-- Create the requestaccepted table
CREATE TABLE RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
    
-- Populate the requestaccepted table
TRUNCATE TABLE RequestAccepted;
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('1', '2', TO_DATE('2016/06/03','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('1', '3', TO_DATE('2016/06/08','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('2', '3', TO_DATE('2016/06/08','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('3', '4', TO_DATE('2016/06/09','%YYYY/%MM/%DD'));

-- Solve the exercise
SELECT id, num
FROM (SELECT id, COUNT(id) AS num
FROM (SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted)
GROUP BY id
ORDER BY num DESC)
-- Write the query without the FETCH NEXT clause
WHERE ROWNUM=1;

-- Drop unused table
DROP TABLE RequestAccepted;