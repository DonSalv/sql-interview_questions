# Team Scores in Football Tournament

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TEAMS`

| Column Name | Type    |
|-------------|---------|
| team_id     | int     |
| team_name   | varchar |

`team_id` is the column with unique values of this table.

Each row of this table represents a single football team.

**Table**: `MATCHES`

| Column Name | Type |
|-------------|------|
| match_id    | int  |
| host_team   | int  |
| guest_team  | int  | 
| host_goals  | int  |
| guest_goals | int  |

`match_id` is the column of unique values of this table.

Each row is a record of a finished match between two different teams. 

Teams `host_team` and `guest_team` are represented by their `IDs` in the `TEAMS` table (`team_id`), and they scored 
`host_goals` and `guest_goals` goals, respectively.

## Task

You would like to compute the scores of all teams after all matches. Points are awarded as follows:
- A team receives **three points** if they win a match (i.e., Scored more goals than the opponent team).
- A team receives **one point** if they draw a match (i.e., Scored the same number of goals as the opponent team).
- A team receives **no points** if they lose a match (i.e., Scored fewer goals than the opponent team).

Write a solution that selects the `team_id`, `team_name` and `num_points` of each team in the tournament after all 
described matches.

Return the result table ordered by `num_points` in **decreasing order**. In case of a tie, order the records by 
`team_id` in **increasing order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TEAMS table:

| team_id | team_name   |
|---------|-------------|
| 10      | Leetcode FC |
| 20      | NewYork FC  |
| 30      | Atlanta FC  |
| 40      | Chicago FC  |
| 50      | Toronto FC  |

MATCHES table:

| match_id | host_team | guest_team | host_goals | guest_goals |
|----------|-----------|------------|------------|-------------|
| 1        | 10        | 20         | 3          | 0           |
| 2        | 30        | 10         | 2          | 2           |
| 3        | 10        | 50         | 5          | 1           |
| 4        | 20        | 30         | 1          | 0           |
| 5        | 50        | 30         | 1          | 0           |

Output: 

| team_id | team_name   | num_points |
|---------|-------------|------------|
| 10      | Leetcode FC | 7          |
| 20      | NewYork FC  | 3          |
| 50      | Toronto FC  | 3          |
| 30      | Atlanta FC  | 1          |
| 40      | Chicago FC  | 0          |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Creat the tables
Create table If Not Exists Teams (team_id int, team_name varchar(30))
Create table If Not Exists Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int)

-- Populate the teams table    
Truncate table Teams
insert into Teams (team_id, team_name) values ('10', 'Leetcode FC')
insert into Teams (team_id, team_name) values ('20', 'NewYork FC')
insert into Teams (team_id, team_name) values ('30', 'Atlanta FC')
insert into Teams (team_id, team_name) values ('40', 'Chicago FC')
insert into Teams (team_id, team_name) values ('50', 'Toronto FC')

-- Populate the matches table
Truncate table Matches
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('1', '10', '20', '3', '0')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('2', '30', '10', '2', '2')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('3', '10', '50', '5', '1')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('4', '20', '30', '1', '0')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('5', '50', '30', '1', '0')
```

### Pandas Code

```python
# teams data
data = [[10, 'Leetcode FC'], [20, 'NewYork FC'], [30, 'Atlanta FC'], [40, 'Chicago FC'], [50, 'Toronto FC']]

# teams dataframe
teams = pd.DataFrame(data, 
                     columns=['team_id', 'team_name']) \
                    .astype({'team_id':'Int64', 'team_name':'object'})

# mathces data
data = [[1, 10, 20, 3, 0], [2, 30, 10, 2, 2], [3, 10, 50, 5, 1], [4, 20, 30, 1, 0], [5, 50, 30, 1, 0]]

# matches dataframe
matches = pd.DataFrame(data, 
                       columns=['match_id', 'host_team', 'guest_team', 'host_goals', 'guest_goals']) \
                      .astype({'match_id':'Int64', 'host_team':'Int64', 'guest_team':'Int64', 
                               'host_goals':'Int64', 'guest_goals':'Int64'})
```