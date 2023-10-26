# Winning Candidate

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CANDIDATE`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the column with unique values for this table.

Each row of this table contains information about the id and the `name` of a candidate.

**Table**: `VOTE`

| Column Name | Type |
|-------------|------|
| id          | int  |
| candidateId | int  |

`id` is an auto-increment primary key (column with unique values).

`candidateId` is a foreign key (reference column) to id from the `CANDIDATE` table.

Each row of this table determines the candidate who got the ith vote in the elections.

## Task

Write a solution to report the name of the winning candidate (i.e., the candidate who got the largest number of votes).

The test cases are generated so that **exactly one candidate wins** the elections.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CANDIDATE table:

| id  | name |
|-----|------|
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |
| 5   | E    |

VOTE table:

| id  | candidateId |
|-----|-------------|
| 1   | 2           |
| 2   | 4           |
| 3   | 3           |
| 4   | 2           |
| 5   | 5           |

Output: 

| name |
|------|
| B    |


## Explanation ##

- Candidate `B` has `2` votes. 
- Candidates `C`, `D`, and `E` have `1` vote each.
- The winner is candidate `B`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Candidate (id int, name varchar(255))
Create table If Not Exists Vote (id int, candidateId int)

-- Populate the candidate table    
Truncate table Candidate
insert into Candidate (id, name) values ('1', 'A')
insert into Candidate (id, name) values ('2', 'B')
insert into Candidate (id, name) values ('3', 'C')
insert into Candidate (id, name) values ('4', 'D')
insert into Candidate (id, name) values ('5', 'E')

-- Populate the vote table    
Truncate table Vote
insert into Vote (id, candidateId) values ('1', '2')
insert into Vote (id, candidateId) values ('2', '4')
insert into Vote (id, candidateId) values ('3', '3')
insert into Vote (id, candidateId) values ('4', '2')
insert into Vote (id, candidateId) values ('5', '5')
```

### Pandas Code

```python
# candidate data
data = [[1, 'A'], [2, 'B'], [3, 'C'], [4, 'D'], [5, 'E']]

# candidate dataframe
candidate = pd.DataFrame(data, 
                         columns=['id', 'name']) \
                        .astype({'id':'Int64', 'name':'object'})

# vote data
data = [[1, 2], [2, 4], [3, 3], [4, 2], [5, 5]]

# vote dataframe
vote = pd.DataFrame(data, 
                    columns=['id', 'candidateId']) \
                   .astype({'id':'Int64', 'candidateId':'Int64'})
```