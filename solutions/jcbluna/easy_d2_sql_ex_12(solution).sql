-- Create the tables
CREATE TABLE FriendRequest (sender_id int, send_to_id int, request_date date);
CREATE TABLE RequestAccepted (requester_id int, accepter_id int, accept_date date);

-- Populate the friendrequest table    
TRUNCATE TABLE FriendRequest;
INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES ('1', '2', TO_DATE('2016/06/01','%YYYY/%MM/%DD'));
INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES ('1', '3', TO_DATE('2016/06/01','%YYYY/%MM/%DD'));
INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES ('1', '4', TO_DATE('2016/06/01','%YYYY/%MM/%DD'));
INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES ('2', '3', TO_DATE('2016/06/02','%YYYY/%MM/%DD'));
INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES ('3', '4', TO_DATE('2016/06/09','%YYYY/%MM/%DD'));

-- Populate the requestaccepted
TRUNCATE TABLE RequestAccepted;
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('1', '2', TO_DATE('2016/06/03','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('1', '3', TO_DATE('2016/06/08','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('2', '3', TO_DATE('2016/06/08','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('3', '4', TO_DATE('2016/06/09','%YYYY/%MM/%DD'));
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES ('3', '4', TO_DATE('2016/06/10','%YYYY/%MM/%DD'));

-- Solve the exercise
SELECT COUNT(requester_id)/COUNT(sender_id) AS accept_rate
FROM (
        SELECT DISTINCT sender_id, send_to_id,requester_id, accepter_id
        FROM friendrequest f LEFT OUTER JOIN requestaccepted r
        ON (f.sender_id=r.requester_id AND f.send_to_id=r.accepter_id));

-- Grouping by month
SELECT month,COUNT(requester_id)/COUNT(sender_id) AS accept_rate
FROM (
        SELECT DISTINCT sender_id, send_to_id,requester_id, accepter_id, EXTRACT(month FROM request_date) AS month
        FROM friendrequest f LEFT OUTER JOIN requestaccepted r
        ON (f.sender_id=r.requester_id AND f.send_to_id=r.accepter_id))
GROUP BY month;

-- Grouping by day
SELECT request_date,COUNT(requester_id)/COUNT(sender_id) AS accept_rate
FROM (
        SELECT DISTINCT sender_id, send_to_id,requester_id, accepter_id, request_date
        FROM friendrequest f LEFT OUTER JOIN requestaccepted r
        ON (f.sender_id=r.requester_id AND f.send_to_id=r.accepter_id))
GROUP BY request_date;


-- Drop unused tables
DROP TABLE FriendRequest;
DROP TABLE RequestAccepted;