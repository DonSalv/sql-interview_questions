Create table Members (member_id int, name varchar(30), CONSTRAINT Members_pk PRIMARY KEY (member_id));
Create table Visits (visit_id int, member_id int, visit_date date, CONSTRAINT Visits_pk PRIMARY KEY (visit_id),
CONSTRAINT fk_Visits FOREIGN KEY (member_id) REFERENCES Members(member_id));
Create table Purchases (visit_id int, charged_amount int, CONSTRAINT Purchases_pk PRIMARY KEY (visit_id),
CONSTRAINT fk_Purchases FOREIGN KEY (visit_id) REFERENCES Visits(visit_id));

insert into Members (member_id, name) values ('9', 'Alice');
insert into Members (member_id, name) values ('11', 'Bob');
insert into Members (member_id, name) values ('3', 'Winston');
insert into Members (member_id, name) values ('8', 'Hercy');
insert into Members (member_id, name) values ('1', 'Narihan');

insert into Visits (visit_id, member_id, visit_date) values ('22', '11', TO_DATE('2021-10-28','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('16', '11', TO_DATE('2021-01-12','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('18', '9', TO_DATE('2021-12-10','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('19', '3', TO_DATE('2021-10-19','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('12', '11', TO_DATE('2021-03-01','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('17', '8', TO_DATE('2021-05-07','YYYY-MM-DD'));
insert into Visits (visit_id, member_id, visit_date) values ('21', '9', TO_DATE('2021-05-12','YYYY-MM-DD'));

insert into Purchases (visit_id, charged_amount) values ('12', '2000');
insert into Purchases (visit_id, charged_amount) values ('18', '9000');
insert into Purchases (visit_id, charged_amount) values ('17', '7000');

SELECT member_id, name, CASE
WHEN num_visits=0 THEN 'Bronze'
WHEN 100*num_purchases/num_visits<50 THEN 'Silver'
WHEN 100*num_purchases/num_visits>=50 AND 100*num_purchases/num_visits<80 THEN 'Gold'
WHEN 100*num_purchases/num_visits>=80 THEN 'Diamond'
END AS category FROM
(SELECT Q1.member_id, Q1.name, 
COUNT(Q1.visit_id) AS num_visits, COUNT(p.visit_id) AS num_purchases FROM
(SELECT m.member_id, m.name, v.visit_id FROM Members m
LEFT JOIN Visits v ON m.member_id=v.member_id) Q1
LEFT JOIN Purchases p ON Q1.visit_id=p.visit_id
GROUP BY Q1.member_id, Q1.name)
ORDER BY member_id;

DROP TABLE Purchases PURGE;
DROP TABLE Visits PURGE;
DROP TABLE Members PURGE;