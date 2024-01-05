Create table Spending (user_id int, spend_date date, platform VARCHAR2(10), amount int,
CONSTRAINT platform_check CHECK (platform IN ('desktop', 'mobile')));

ALTER TABLE Spending ADD PRIMARY KEY (user_id, spend_date, platform) DISABLE;

insert into Spending (user_id, spend_date, platform, amount) values ('1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'desktop', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('2', TO_DATE('2019-07-01','YYYY-MM-DD'), 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('2', TO_DATE('2019-07-02','YYYY-MM-DD'), 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('3', TO_DATE('2019-07-01','YYYY-MM-DD'), 'desktop', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('3', TO_DATE('2019-07-02','YYYY-MM-DD'), 'desktop', '100');

SELECT * FROM
(SELECT spend_date, 
COUNT(CASE WHEN platform1='mobile' AND platform2 IS NULL THEN 1 ELSE NULL END) AS m_count,
SUM(CASE WHEN platform1='mobile' AND platform2 IS NULL THEN amount1 ELSE 0 END) AS m_amount,
COUNT(CASE WHEN platform1='desktop' AND platform2 IS NULL THEN 1 ELSE NULL END) AS d_count,
SUM(CASE WHEN platform1='desktop' AND platform2 IS NULL THEN amount1 ELSE 0 END) AS d_amount,
COUNT(CASE WHEN platform2 IS NOT NULL THEN 1 ELSE NULL END)/2 AS b_count,
SUM(CASE WHEN platform2 IS NOT NULL THEN amount1 ELSE 0 END) AS b_amount FROM
(SELECT s1.user_id, s1.spend_date, s1.platform AS platform1, s1.amount AS amount1, 
s2.platform AS platform2, s2.amount AS amount2 FROM Spending s1 LEFT JOIN Spending s2
ON s1.user_id=s2.user_id AND s1.spend_date=s2.spend_date AND s1.platform!=s2.platform)
GROUP BY spend_date)
UNPIVOT((total_amount, total_users) FOR platform IN 
((m_amount,m_count) AS 'mobile', (d_amount,d_count) AS 'desktop', (b_amount,b_count) AS 'both'))
ORDER BY spend_date;
        
DROP TABLE Spending PURGE;
