-- Create the ads table
CREATE TABLE Ads (ad_id int, user_id int, action varchar(10) CHECK(action IN ('Clicked', 'Viewed', 'Ignored')));
    
-- Populate the ads table
TRUNCATE TABLE Ads;
INSERT INTO Ads (ad_id, user_id, action) VALUES ('1', '1', 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('2', '2', 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('3', '3', 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('5', '5', 'Ignored');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('1', '7', 'Ignored');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('2', '7', 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('3', '5', 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('1', '4', 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('2', '11', 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES ('1', '2', 'Clicked');

-- Solve the exercise

SELECT a.ad_id, NVL(ROUND(SUM(CASE WHEN b.action='Clicked' THEN b.counts ELSE 0
                    END)/SUM(b.counts)*100,2),0) AS ctr
FROM Ads a LEFT OUTER JOIN(SELECT ad_id, action, COUNT(user_id) AS counts
                            FROM Ads
                            WHERE action!='Ignored'
                            GROUP BY ad_id, action) b
ON(a.ad_id=b.ad_id)
GROUP BY a.ad_id
ORDER BY ctr DESC, ad_id ASC;

-- Drop unused tables

DROP TABLE Ads;