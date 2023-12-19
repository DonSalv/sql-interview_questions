Create table Users (user_id int, mail varchar(50), name varchar(30), CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table Contests (contest_id int, gold_medal int, silver_medal int, bronze_medal int, CONSTRAINT Contests_pk PRIMARY KEY (contest_id),
CONSTRAINT fk_gold FOREIGN KEY (gold_medal) REFERENCES Users(user_id),
CONSTRAINT fk_silver FOREIGN KEY (silver_medal) REFERENCES Users(user_id),
CONSTRAINT fk_bronze FOREIGN KEY (bronze_medal) REFERENCES Users(user_id));

insert into Users (user_id, mail, name) values ('1', 'sarah@leetcode.com', 'Sarah');
insert into Users (user_id, mail, name) values ('2', 'bob@leetcode.com', 'Bob');
insert into Users (user_id, mail, name) values ('3', 'alice@leetcode.com', 'Alice');
insert into Users (user_id, mail, name) values ('4', 'hercy@leetcode.com', 'Hercy');
insert into Users (user_id, mail, name) values ('5', 'quarz@leetcode.com', 'Quarz');

insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('190', '1', '5', '2');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('191', '2', '3', '5');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('192', '5', '2', '3');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('193', '1', '3', '5');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('194', '4', '5', '2');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('195', '4', '2', '1');
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('196', '1', '5', '2');

SELECT u.name, u.mail FROM
(SELECT user_id FROM 
(SELECT * FROM Contests UNPIVOT(user_id FOR medal
IN (gold_medal AS 'gold', silver_medal AS 'silver', bronze_medal AS 'bronze')))
WHERE medal='gold' GROUP BY user_id HAVING COUNT(*)>=3
UNION ALL
SELECT DISTINCT user_id FROM
(SELECT user_id, contest_id-ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id) AS consecutive FROM
(SELECT * FROM Contests UNPIVOT(user_id FOR medal
IN (gold_medal AS 'gold', silver_medal AS 'silver', bronze_medal AS 'bronze'))))
GROUP BY user_id, consecutive
HAVING COUNT(consecutive)>=3) Q1
JOIN Users u ON u.user_id=Q1.user_id;

DROP TABLE Contests PURGE;
DROP TABLE Users PURGE;