# Election Results

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: VOTES
 
| Column Name | Type    | 
|-------------|---------|
| voter       | varchar | 
| candidate   | varchar |

`(voter, candidate)` is the primary key (combination of unique values) for this table.

Each row of this table contains name of the voter and their candidate.

## Task

The election is conducted in a city where everyone can vote for **one or more** candidates or choose **not** to vote. 
Each person has `1` **vote** so if they vote for multiple candidates, their vote gets equally split across them. 
For example, if a person votes for `2` candidates, these candidates receive an equivalent of` 0.5` votes each.

Write a solution to find `candidate` who got the most votes and won the election. Output the name of the **candidate** 
or If multiple candidates have an **equal numbe**r of votes, display the names of all of them.

**Return** the result table ordered by `candidate` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
VOTES table:

| voter    | candidate |
|----------|-----------|
| Kathy    | null      |
| Charles  | Ryan      |
| Charles  | Christine |
| Charles  | Kathy     |
| Benjamin | Christine |
| Anthony  | Ryan      |
| Edward   | Ryan      |
| Terry    | null      |
| Evelyn   | Kathy     |
| Arthur   | Christine |

Output: 

| candidate | 
|-----------|
| Christine |  
| Ryan      |

## Explanation ##

- `Kathy` and `Terry` opted not to participate in voting, resulting in their votes being recorded as `0`. 
- `Charles` distributed his vote among three candidates, equating to `0.33` for each candidate. 
- `Benjamin`, `Arthur`, `Anthony`, `Edward`, and `Evelyn` each cast their votes for a single candidate.
Candidates 
- `Ryan` and `Christine` amassed a total of 2.33 votes
- `Kathy` received a combined total of 1.33 votes.
Since Ryan and Christine received an equal number of votes, we will display their names in ascending order.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the votes table
Create table if not exists Votes(voter varchar(30), candidate varchar(30))

-- Populate the votes table
Truncate table Votes
insert into Votes (voter, candidate) values ('Kathy', 'None')
insert into Votes (voter, candidate) values ('Charles', 'Ryan')
insert into Votes (voter, candidate) values ('Charles', 'Christine')
insert into Votes (voter, candidate) values ('Charles', 'Kathy')
insert into Votes (voter, candidate) values ('Benjamin', 'Christine')
insert into Votes (voter, candidate) values ('Anthony', 'Ryan')
insert into Votes (voter, candidate) values ('Edward', 'Ryan')
insert into Votes (voter, candidate) values ('Terry', 'None')
insert into Votes (voter, candidate) values ('Evelyn', 'Kathy')
insert into Votes (voter, candidate) values ('Arthur', 'Christine')
```
