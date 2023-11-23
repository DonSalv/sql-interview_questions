-- Create the tables
CREATE TABLE Subscriptions (account_id int, start_date date, end_date date);
CREATE TABLE Streams (session_id int, account_id int, stream_date date);

-- Populate the subscriptions table
TRUNCATE TABLE Subscriptions;
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('9', TO_DATE('2020-02-18','%YYYY-%MM-%DD'), TO_DATE('2021-10-30','%YYYY-%MM-%DD'));
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('3', TO_DATE('2021-09-21','%YYYY-%MM-%DD'), TO_DATE('2021-11-13','%YYYY-%MM-%DD'));
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('11', TO_DATE('2020-02-28','%YYYY-%MM-%DD'), TO_DATE('2020-08-18','%YYYY-%MM-%DD'));
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('13', TO_DATE('2021-04-20','%YYYY-%MM-%DD'), TO_DATE('2021-09-22','%YYYY-%MM-%DD'));
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('4', TO_DATE('2020-10-26','%YYYY-%MM-%DD'), TO_DATE('2021-05-08','%YYYY-%MM-%DD'));
INSERT INTO Subscriptions (account_id, start_date, end_date) VALUES ('5', TO_DATE('2020-09-11','%YYYY-%MM-%DD'), TO_DATE('2021-01-17','%YYYY-%MM-%DD'));

-- Populate the streams table
TRUNCATE TABLE Streams;
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('14', '9', TO_DATE('2020-05-16','%YYYY-%MM-%DD'));
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('16', '3', TO_DATE('2021-10-27','%YYYY-%MM-%DD'));
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('18', '11', TO_DATE('2020-04-29','%YYYY-%MM-%DD'));
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('17', '13', TO_DATE('2021-08-08','%YYYY-%MM-%DD'));
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('19', '4', TO_DATE('2020-12-31','%YYYY-%MM-%DD'));
INSERT INTO Streams (session_id, account_id, stream_date) VALUES ('13', '5', TO_DATE('2021-01-05','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT COUNT(account_id) AS accounts_count
FROM Subscriptions
WHERE 2021 BETWEEN EXTRACT(YEAR FROM start_date)
AND EXTRACT(YEAR FROM end_date)
AND account_id NOT IN (SELECT account_id FROM Streams WHERE EXTRACT(YEAR FROM stream_date)=2021);

-- Drop unused tables
DROP TABLE Subscriptions;
DROP TABLE Streams;