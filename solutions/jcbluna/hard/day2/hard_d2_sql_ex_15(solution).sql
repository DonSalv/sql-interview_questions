-- Create the useractivity table
CREATE TABLE UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date);

-- Populate the useractivity table    
TRUNCATE TABLE UserActivity;
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES ('Alice', 'Travel', TO_DATE('2020-02-12','%YYYY-%MM-%DD'), TO_DATE('2020-02-20','%YYYY-%MM-%DD'));
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES ('Alice', 'Dancing', TO_DATE('2020-02-21','%YYYY-%MM-%DD'), TO_DATE('2020-02-23','%YYYY-%MM-%DD'));
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES ('Alice', 'Travel', TO_DATE('2020-02-24','%YYYY-%MM-%DD'), TO_DATE('2020-02-28','%YYYY-%MM-%DD'));
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES ('Bob', 'Travel', TO_DATE('2020-02-11','%YYYY-%MM-%DD'), TO_DATE('2020-02-18','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT username, activity, TO_CHAR(startDate,'YYYY-MM-DD') AS startDate, TO_CHAR(endDate,'YYYY-MM-DD') AS endDate
FROM(SELECT username, activity, startDate, endDate, rank_date, MAX(rank_date) OVER(PARTITION BY username) AS max_rank
FROM(SELECT username, activity, startDate, endDate, DENSE_RANK() OVER(PARTITION BY username ORDER BY startDate DESC) AS rank_date
FROM UserActivity))
WHERE rank_date=(CASE max_rank WHEN 1 THEN 1 ELSE 2 END);

-- Drop unused table
DROP TABLE UserActivity;