# Longest Winning Streak

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `MATCHES`

| Column Name | Type |
|-------------|------|
| player_id   | int  |
| match_day   | date |
| result      | enum |

`(player_id, match_day)` is the primary key (combination of columns with unique values) for this table.

Each row of this table contains the ID of a `player`, the `day` of the match they played, and the `result` of that match.

The result column is an `ENUM` (category) type of `('Win', 'Draw', 'Lose')`.

## Task

The winning streak of a player is the number of consecutive wins uninterrupted by draws or losses.

Write a solution to count the longest winning streak for each player.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
MATCHES table:

| player_id | match_day  | result |
|-----------|------------|--------|
| 1         | 2022-01-17 | Win    |
| 1         | 2022-01-18 | Win    |
| 1         | 2022-01-25 | Win    |
| 1         | 2022-01-31 | Draw   |
| 1         | 2022-02-08 | Win    |
| 2         | 2022-02-06 | Lose   |
| 2         | 2022-02-08 | Lose   |
| 3         | 2022-03-30 | Win    |

Output: 

| player_id | longest_streak |
|-----------|----------------|
| 1         | 3              |
| 2         | 0              |
| 3         | 1              |

## Explanation ##

Player 1:
- From `2022-01-17` to `2022-01-25`, player `1` won `3` consecutive matches.
- On `2022-01-31`, player `1` had a draw.
- On `2022-02-08`, player `1` won a match.
The longest winning streak was `3` matches.

Player 2:
- From `2022-02-06` to `2022-02-08`, player `2` lost `2` consecutive matches.
The longest winning streak was `0` matches.

Player 3:
- On `2022-03-30`, player `3` won a match.
The longest winning streak was `1` match.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the matches table
Create table If Not Exists Matches (player_id int, match_day date, result ENUM('Win', 'Draw', 'Lose'))

-- Populate the matches table    
Truncate table Matches
insert into Matches (player_id, match_day, result) values ('1', '2022-01-17', 'Win')
insert into Matches (player_id, match_day, result) values ('1', '2022-01-18', 'Win')
insert into Matches (player_id, match_day, result) values ('1', '2022-01-25', 'Win')
insert into Matches (player_id, match_day, result) values ('1', '2022-01-31', 'Draw')
insert into Matches (player_id, match_day, result) values ('1', '2022-02-08', 'Win')
insert into Matches (player_id, match_day, result) values ('2', '2022-02-06', 'Lose')
insert into Matches (player_id, match_day, result) values ('2', '2022-02-08', 'Lose')
insert into Matches (player_id, match_day, result) values ('3', '2022-03-30', 'Win')
```

### Pandas Code

```python
# matches data
data = [[1, '2022-01-17', 'Win'], [1, '2022-01-18', 'Win'], [1, '2022-01-25', 'Win'],
        [1, '2022-01-31', 'Draw'], [1, '2022-02-08', 'Win'], [2, '2022-02-06', 'Lose'], 
        [2, '2022-02-08', 'Lose'], [3, '2022-03-30', 'Win']]

# mathces dataframe
matches = pd.DataFrame(data, 
                       columns=['player_id', 'match_day', 'result']) \
                      .astype({'player_id':'Int64', 'match_day':'datetime64[ns]', 'result':'object'})
```