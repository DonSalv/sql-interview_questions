Create table Votes(voter varchar(30), candidate varchar(30));

ALTER TABLE Votes ADD PRIMARY KEY (voter, candidate) DISABLE;

insert into Votes (voter, candidate) values ('Kathy', NULL);
insert into Votes (voter, candidate) values ('Charles', 'Ryan');
insert into Votes (voter, candidate) values ('Charles', 'Christine');
insert into Votes (voter, candidate) values ('Charles', 'Kathy');
insert into Votes (voter, candidate) values ('Benjamin', 'Christine');
insert into Votes (voter, candidate) values ('Anthony', 'Ryan');
insert into Votes (voter, candidate) values ('Edward', 'Ryan');
insert into Votes (voter, candidate) values ('Terry', NULL);
insert into Votes (voter, candidate) values ('Evelyn', 'Kathy');
insert into Votes (voter, candidate) values ('Arthur', 'Christine');

SELECt candidate FROM
(SELECT v.candidate, SUM(CASE WHEN num>0 THEN 1/num ELSE 0 END) AS votes,
RANK() OVER (ORDER BY SUM(CASE WHEN num>0 THEN 1/num ELSE 0 END) DESC) AS ranking
FROM Votes v JOIN
(SELECT voter, COUNT(candidate) AS num FROM Votes GROUP BY voter) Q1
ON v.voter=q1.voter GROUP BY v.candidate
HAVING v.candidate IS NOT NULL)
WHERE ranking=1 ORDER BY candidate;

DROP TABLE Votes PURGE;
