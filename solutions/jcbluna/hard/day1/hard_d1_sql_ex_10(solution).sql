-- Create the spending table
CREATE TABLE Spending (user_id int, spend_date date, platform varchar(7) CHECK(platform IN ('desktop', 'mobile')), amount int);

-- Populate the spending table    
TRUNCATE TABLE Spending;
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'mobile', '100');
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'desktop', '100');
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('2', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'mobile', '100');
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('2', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'mobile', '100');
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('3', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'desktop', '100');
INSERT INTO Spending (user_id, spend_date, platform, amount) VALUES ('3', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'desktop', '100');

-- Solve the exercise
WITH PivotedSpending AS
(SELECT s1.spend_date, COUNT(DISTINCT CASE WHEN s1.platform='mobile' AND s2.platform IS NULL THEN 1 ELSE NULL END) AS mobile_users,
COUNT(DISTINCT CASE WHEN s1.platform='desktop' AND s2.platform IS NULL THEN 1 ELSE NULL END) AS desktop_users,
SUM(CASE WHEN s1.platform='mobile' AND s2.platform IS NULL THEN s1.amount ELSE 0 END) AS mobile_amount,
SUM(CASE WHEN s1.platform='desktop' AND s2.platform IS NULL THEN s1.amount ELSE 0 END) AS desktop_amount,
COUNT(DISTINCT CASE WHEN s2.platform IS NOT NULL THEN 1 ELSE NULL END) AS both_users,
SUM(CASE WHEN s2.platform IS NOT NULL THEN s1.amount ELSE 0 END) AS both_amount
FROM Spending s1 LEFT OUTER JOIN Spending s2
ON(s1.user_id=s2.user_id
AND s1.spend_date=s2.spend_date
AND s1.platform!=s2.platform)
GROUP BY s1.spend_date)
SELECT * FROM PivotedSpending
UNPIVOT(
    (total_amount, total_users) FOR platform
    IN ((mobile_amount,mobile_users) AS 'mobile', 
        (desktop_amount,desktop_users) AS 'desktop', 
        (both_amount,both_users) AS 'both'));

-- Drop unused table
DROP TABLE Spending;