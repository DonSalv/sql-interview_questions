# All the Matches of the League

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TEAMS`

| Column Name | Type    |
|-------------|---------|
| team_name   | varchar |

`team_name` is the column with unique values of this table.

Each row of this table shows the name of a team.

## Task

Write a solution to report all the possible matches of the league. 
Note that every two teams play two matches with each other, with one team being the 
`home_team` once and the other time being the `away_team`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TEAMS table:

| team_name   |
|-------------|
| Leetcode FC |
| Ahly SC     |
| Real Madrid |

Output: 

| home_team   | away_team   |
|-------------|-------------|
| Real Madrid | Leetcode FC |
| Real Madrid | Ahly SC     |
| Leetcode FC | Real Madrid |
| Leetcode FC | Ahly SC     |
| Ahly SC     | Real Madrid |
| Ahly SC     | Leetcode FC |

## Explanation ##

All the matches of the league are shown in the table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the teams table
Create table If Not Exists Teams (team_name varchar(50))
    
-- Populate the teams table
Truncate table Teams
insert into Teams (team_name) values ('Leetcode FC')
insert into Teams (team_name) values ('Ahly SC')
insert into Teams (team_name) values ('Real Madrid')
```

### Pandas Code

```python
# teams data
data = [['Leetcode FC'], ['Ahly SC'], ['Real Madrid']]

# teams dataframe
teams = pd.DataFrame(data, columns=['team_name']).astype({'team_name':'object'})
```