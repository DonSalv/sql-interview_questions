Create table Ads (ad_id int, user_id int, action VARCHAR2(15), CONSTRAINT action_check CHECK (action IN ('Clicked', 'Viewed', 'Ignored')));

ALTER TABLE Ads
    ADD PRIMARY KEY (ad_id, user_id) DISABLE;
    
insert into Ads (ad_id, user_id, action) values ('1', '1', 'Clicked');
insert into Ads (ad_id, user_id, action) values ('2', '2', 'Clicked');
insert into Ads (ad_id, user_id, action) values ('3', '3', 'Viewed');
insert into Ads (ad_id, user_id, action) values ('5', '5', 'Ignored');
insert into Ads (ad_id, user_id, action) values ('1', '7', 'Ignored');
insert into Ads (ad_id, user_id, action) values ('2', '7', 'Viewed');
insert into Ads (ad_id, user_id, action) values ('3', '5', 'Clicked');
insert into Ads (ad_id, user_id, action) values ('1', '4', 'Viewed');
insert into Ads (ad_id, user_id, action) values ('2', '11', 'Viewed');
insert into Ads (ad_id, user_id, action) values ('1', '2', 'Clicked');

SELECT s1.ad_id, COALESCE(SUM(ctr0),0) AS ctr FROM 
(SELECT DISTINCT ad_id FROM Ads) S1
LEFT JOIN
(SELECT q1.ad_id, ROUND(100*c/cv,2) AS ctr0 FROM
(SELECT ad_id, COUNT(*) AS c FROM Ads
WHERE action = 'Clicked'
GROUP BY ad_id) Q1
JOIN
(SELECT ad_id, COUNT(*) AS cv FROM Ads
WHERE action = 'Clicked' OR action = 'Viewed'
GROUP BY ad_id) Q2
ON q1.ad_id=q2.ad_id) S2
ON s1.ad_id=s2.ad_id
GROUP BY s1.ad_id
ORDER BY CTR DESC;

DROP TABLE Ads PURGE;