-- Create the tables
Create table Members (member_id int, name varchar(30));
Create table Visits (visit_id int, member_id int, visit_date date);
Create table Purchases (visit_id int, charged_amount int);

-- Populate the members table    
Truncate table Members;
insert into Members (member_id, name) values (9, 'Alice');
insert into Members (member_id, name) values (11, 'Bob');
insert into Members (member_id, name) values (3, 'Winston');
insert into Members (member_id, name) values (8, 'Hercy');
insert into Members (member_id, name) values (1, 'Narihan');

-- Populate the visits table    
Truncate table Visits;
insert into Visits (visit_id, member_id, visit_date) values (22, 11, DATE '2021-10-28');
insert into Visits (visit_id, member_id, visit_date) values (16, 11, DATE '2021-01-12');
insert into Visits (visit_id, member_id, visit_date) values (18, 9, DATE '2021-12-10');
insert into Visits (visit_id, member_id, visit_date) values (19, 3, DATE '2021-10-19');
insert into Visits (visit_id, member_id, visit_date) values (12, 11, DATE '2021-03-01');
insert into Visits (visit_id, member_id, visit_date) values (17, 8, DATE '2021-05-07');
insert into Visits (visit_id, member_id, visit_date) values (21, 9, DATE '2021-05-12');

-- Populate the purchases table
Truncate table Purchases;
insert into Purchases (visit_id, charged_amount) values (12, 2000);
insert into Purchases (visit_id, charged_amount) values (18, 9000);
insert into Purchases (visit_id, charged_amount) values (17, 7000);

-- A store wants to categorize its members. There are three tiers:
--    * "Diamond": if the conversion rate is greater than or equal to 80.
--    * "Gold": if the conversion rate is greater than or equal to 50 and less than 80.
--    * "Silver": if the conversion rate is less than 50.
--    * "Bronze": if the member never visited the store.
--    * The conversion rate of a member is (100 * total number of purchases for the member) / total number of visits for the member.
-- Write a solution to report the id, the name, and the category of each member.
WITH Visits_and_purchases AS (
    SELECT 
        t3.member_id, 
        t3.name, 
        t3.visit_count, 
        t4.purchase_count
    FROM
        (SELECT m.member_id, m.name, COUNT(v.visit_date) AS visit_count
         FROM Members m LEFT JOIN Visits v
         ON m.member_id = v.member_id
         GROUP BY m.member_id, m.name) t3
    INNER JOIN
        (SELECT m.member_id, m.name, NVL(t.purchase_count, 0) AS purchase_count
         FROM Members m LEFT JOIN
                  (SELECT v.member_id, COUNT(p.charged_amount) AS purchase_count
                   FROM Purchases p LEFT JOIN Visits v
                   ON v.visit_id = p.visit_id
                   GROUP BY v.member_id) t
         ON m.member_id = t.member_id) t4
    ON t3.name = t4.name)  
SELECT 
    member_id,
    name,
    CASE WHEN visit_count = 0 THEN 'Bronze'
         WHEN 100*purchase_count/visit_count <  50 THEN 'Silver'
         WHEN 100*purchase_count/visit_count >= 50 AND
              100*purchase_count/visit_count <  80 THEN 'Gold'
        ELSE 'Diamond'
    END AS category
FROM
    Visits_and_purchases
ORDER BY
    member_id;

-- Drop tables
DROP TABLE Members;
DROP TABLE Visits;
DROP TABLE Purchases;
