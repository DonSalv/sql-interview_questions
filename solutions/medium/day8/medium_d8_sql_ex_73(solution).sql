Create table Candidates (candidate_id int, name varchar(30), years_of_exp int, interview_id int, CONSTRAINT Candidates_pk PRIMARY KEY (candidate_id));
Create table Rounds (interview_id int, round_id int, score int,
CONSTRAINT fk_Rounds FOREIGN KEY (interview_id) REFERENCES Candidates(interview_id));

ALTER TABLE Rounds ADD PRIMARY KEY (interview_id, round_id) DISABLE;

insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('11', 'Atticus', '1', '101');
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('9', 'Ruben', '6', '104');
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('6', 'Aliza', '10', '109');
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('8', 'Alfredo', '0', '107');

insert into Rounds (interview_id, round_id, score) values ('109', '3', '4');
insert into Rounds (interview_id, round_id, score) values ('101', '2', '8');
insert into Rounds (interview_id, round_id, score) values ('109', '4', '1');
insert into Rounds (interview_id, round_id, score) values ('107', '1', '3');
insert into Rounds (interview_id, round_id, score) values ('104', '3', '6');
insert into Rounds (interview_id, round_id, score) values ('109', '1', '4');
insert into Rounds (interview_id, round_id, score) values ('104', '4', '7');
insert into Rounds (interview_id, round_id, score) values ('104', '1', '2');
insert into Rounds (interview_id, round_id, score) values ('109', '2', '1');
insert into Rounds (interview_id, round_id, score) values ('104', '2', '7');
insert into Rounds (interview_id, round_id, score) values ('107', '2', '3');
insert into Rounds (interview_id, round_id, score) values ('101', '1', '8');

SELECT candidate_id FROM
(SELECT c.candidate_id, c.years_of_exp, SUM(r.score) AS score FROM Rounds r
JOIN Candidates c ON r.interview_id = c.interview_id
GROUP BY c.candidate_id, c.years_of_exp)
WHERE years_of_exp>=2 AND score>15;

DROP TABLE Rounds PURGE;
DROP TABLE Candidates PURGE;