-- Create the tables
CREATE TABLE Members (member_id int, name varchar(30));
CREATE TABLE Visits (visit_id int, member_id int, visit_date date);
CREATE TABLE Purchases (visit_id int, charged_amount int);

-- Populate the members table    
TRUNCATE TABLE Members;
INSERT INTO Members (member_id, name) VALUES ('9', 'Alice');
INSERT INTO Members (member_id, name) VALUES ('11', 'Bob');
INSERT INTO Members (member_id, name) VALUES ('3', 'Winston');
INSERT INTO Members (member_id, name) VALUES ('8', 'Hercy');
INSERT INTO Members (member_id, name) VALUES ('1', 'Narihan');

-- Populate the visits table    
TRUNCATE TABLE Visits;
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('22', '11', TO_DATE('2021-10-28','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('16', '11', TO_DATE('2021-01-12','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('18', '9', TO_DATE('2021-12-10','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('19', '3', TO_DATE('2021-10-19','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('12', '11', TO_DATE('2021-03-01','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('17', '8', TO_DATE('2021-05-07','%YYYY-%MM-%DD'));
INSERT INTO Visits (visit_id, member_id, visit_date) VALUES ('21', '9', TO_DATE('2021-05-12','%YYYY-%MM-%DD'));

-- Populate the purchases table
TRUNCATE TABLE Purchases;
INSERT INTO Purchases (visit_id, charged_amount) VALUES ('12', '2000');
INSERT INTO Purchases (visit_id, charged_amount) VALUES ('18', '9000');
INSERT INTO Purchases (visit_id, charged_amount) VALUES ('17', '7000');

-- Solve the exercise
SELECT member_id, name, (CASE WHEN conversion_rate IS NULL THEN 'Bronze'
WHEN conversion_rate<50 THEN 'Silver'
WHEN conversion_rate>=50 AND conversion_rate<80 THEN 'Gold'
WHEN conversion_rate>=80 THEN 'Diamond' END) AS category
FROM (SELECT m.member_id, name, (CASE WHEN COUNT(v.visit_id)=0 THEN NULL
ELSE 100*COUNT(charged_amount)/COUNT(v.visit_id) END) AS conversion_rate
FROM Members m LEFT OUTER JOIN Visits v
ON(m.member_id=v.member_id)
LEFT OUTER JOIN Purchases p
ON(v.visit_id=p.visit_id)
GROUP BY m.member_id, name);

-- Drop unused tables
DROP TABLE Members;
DROP TABLE Visits;
DROP TABLE Purchases;