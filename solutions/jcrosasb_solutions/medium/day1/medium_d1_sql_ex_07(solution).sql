-- Create the tables
Create table Candidate (id int, name varchar(255));
Create table Vote (id int, candidateId int);

-- Populate the candidate table    
Truncate table Candidate;
insert into Candidate (id, name) values (1, 'A');
insert into Candidate (id, name) values (2, 'B');
insert into Candidate (id, name) values (3, 'C');
insert into Candidate (id, name) values (4, 'D');
insert into Candidate (id, name) values (5, 'E');

-- Populate the vote table    
Truncate table Vote;
insert into Vote (id, candidateId) values (1, 2);
insert into Vote (id, candidateId) values (2, 4);
insert into Vote (id, candidateId) values (3, 3);
insert into Vote (id, candidateId) values (4, 2);
insert into Vote (id, candidateId) values (5, 5);

-- Write a solution to report the name of the winning candidate (i.e., the candidate who got the largest number of votes).
-- The test cases are generated so that exactly one candidate wins the election

-- Drop tables
DROP TABLE Candidate;
DROP TABLE Vote;
