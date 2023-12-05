Create table Candidate (id int, name varchar(255), CONSTRAINT Candidate_pk PRIMARY KEY (id));
Create table Vote (id int, candidateId int, CONSTRAINT Vote_pk PRIMARY KEY (id),
CONSTRAINT fk_Vote FOREIGN KEY (candidateId) REFERENCES Candidate(id));

insert into Candidate (id, name) values ('1', 'A');
insert into Candidate (id, name) values ('2', 'B');
insert into Candidate (id, name) values ('3', 'C');
insert into Candidate (id, name) values ('4', 'D');
insert into Candidate (id, name) values ('5', 'E');

insert into Vote (id, candidateId) values ('1', '2');
insert into Vote (id, candidateId) values ('2', '4');
insert into Vote (id, candidateId) values ('3', '3');
insert into Vote (id, candidateId) values ('4', '2');
insert into Vote (id, candidateId) values ('5', '5');

SELECT name FROM
(SELECT c.name, q1.votes FROM 
(SELECT candidateId, COUNT(*) AS Votes
FROM Vote GROUP BY candidateId) Q1
JOIN Candidate c ON c.id=q1.candidateId
ORDER BY q1.votes DESC)
FETCH FIRST 1 ROWS ONLY;

DROP TABLE Vote PURGE;
DROP TABLE Candidate PURGE;