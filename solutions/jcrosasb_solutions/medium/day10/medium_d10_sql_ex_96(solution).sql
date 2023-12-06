-- Create the votes table
Create table Votes(voter varchar(30), candidate varchar(30));

-- Populate the votes table
Truncate table Votes;
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

-- The election is conducted in a city where everyone can vote for one or more 
-- candidates or choose not to vote. Each person has 1 vote so if they vote for 
-- multiple candidates, their vote gets equally split across them. For example, 
-- if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 votes each.
-- Write a solution to find candidate who got the most votes and won the election. Output the name 
-- of the candidate or If multiple candidates have an equal number of votes, display the names of all of them.
-- Return the result table ordered by candidate in ascending order
WITH votes_by_voter AS (
    SELECT
        voter,
        SUM(CASE WHEN Candidate IS NOT NULL THEN 1 ELSE 0 END) AS vote_cnt
    FROM
        Votes
    GROUP BY
        voter),
candidate_value AS (
    SELECT
        v.candidate,
        SUM(CASE WHEN vv.vote_cnt != 0 THEN 1/vv.vote_cnt
                 ELSE 0
            END) AS vote_value
    FROM 
        Votes v
    LEFT JOIN
        votes_by_voter vv
    ON
        v.voter = vv.voter
    GROUP BY
        v.candidate
)
SELECT
    candidate
FROM
    candidate_value
WHERE
    vote_value = (SELECT MAX(vote_value) FROM candidate_value)
ORDER BY
    candidate;

-- Drop tables
DROP TABLE Votes;
