-- medium day 01 ex 07

-- Create the tables
Create table  Candidate (id number, name varchar(255));
Create table  Vote (id number, candidateId number);

-- Populate the candidate table    
Truncate table Candidate;
insert into Candidate (id, name) values (1, 'A');
insert into Candidate (id, name) values (2, 'B');
insert into Candidate (id, name) values (3, 'C');
insert into Candidate (id, name) values (4, 'D');
insert into Candidate (id, name) values (5, 'E');

-- Populate the vote table    
Truncate table Vote
insert into Vote (id, candidateId) values (1, 2);
insert into Vote (id, candidateId) values (2, 4);
insert into Vote (id, candidateId) values (3, 3);
insert into Vote (id, candidateId) values (4, 2);
insert into Vote (id, candidateId) values (5, 5);

-- solution 1
select  c.name from (
        select candidateId, count(candidateId) as votes,
                row_number() over (order by count(candidateId) desc) as rn
        from Vote
group by candidateId) v join candidate c
on v.candidateId = c.id
where v.rn=1;

-- solution 2
SELECT c.name 
FROM Vote v 
JOIN Candidate c ON v.candidateId = c.id
GROUP BY v.candidateId, c.name
ORDER BY COUNT(v.candidateId) DESC
FETCH FIRST 1 ROW ONLY;  

-- drop tables
drop table candidate;
drop table vote;