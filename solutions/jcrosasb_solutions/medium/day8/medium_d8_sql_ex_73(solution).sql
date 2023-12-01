-- Create the tables
Create table Candidates (candidate_id int, name varchar(30), years_of_exp int, interview_id int);
Create table Rounds (interview_id int, round_id int, score int);

-- Populate the candidates table    
Truncate table Candidates;
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values (11, 'Atticus', 1, 101);
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values (9, 'Ruben', 6, 104);
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values (6, 'Aliza', 10, 109);
insert into Candidates (candidate_id, name, years_of_exp, interview_id) values (8, 'Alfredo', 0, 107);

-- Populate the rounds table    
Truncate table Rounds;
insert into Rounds (interview_id, round_id, score) values (109, 3, 4);
insert into Rounds (interview_id, round_id, score) values (101, 2, 8);
insert into Rounds (interview_id, round_id, score) values (109, 4, 1);
insert into Rounds (interview_id, round_id, score) values (107, 1, 3);
insert into Rounds (interview_id, round_id, score) values (104, 3, 6);
insert into Rounds (interview_id, round_id, score) values (109, 1, 4);
insert into Rounds (interview_id, round_id, score) values (104, 4, 7);
insert into Rounds (interview_id, round_id, score) values (104, 1, 2);
insert into Rounds (interview_id, round_id, score) values (109, 2, 1);
insert into Rounds (interview_id, round_id, score) values (104, 2, 7);
insert into Rounds (interview_id, round_id, score) values (107, 2, 3);
insert into Rounds (interview_id, round_id, score) values (101, 1, 8);

-- Write a solution to report the IDs of the candidates who have at least two years
-- of experience and the sum of the score of their interview rounds is strictly greater than 15
SELECT
    c.candidate_id
FROM
    Rounds r
LEFT JOIN
    Candidates c
ON
    c.interview_id = r.interview_id
WHERE
    c.candidate_id IN (SELECT
                           candidate_id
                       FROM
                           Candidates
                       WHERE
                           years_of_exp >= 2)
GROUP BY
    c.candidate_id
HAVING
    SUM(r.score) > 15;

-- Drop tables
DROP TABLE Candidates;
DROP TABLE Rounds;
