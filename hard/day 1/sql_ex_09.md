# Game Play Analysis V

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ACTIVITY`

| Column Name  | Type |
|--------------|------|
| player_id    | int  |
| device_id    | int  |
| event_date   | date |
| games_played | int  |

`(player_id, event_date)` is the primary key (combination of columns with unique values) of this table.

This table shows the activity of players of some games.

Each row is a record of a `player` who logged in and played a number of games (possibly 0) before logging out on 
someday using some device.

## Task

The **install date** of a player is the first login day of that player.

We define **day one retention** of some date x to be the number of players whose **install date** is `x` and they logged 
back in on the day right after `x`, divided by the number of players whose install date is `x`, rounded to `2` decimal places.

Write a solution to report for each install date, the number of players that installed the game on that day, and 
the **day one retention**.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ACTIVITY table:

| player_id | device_id | event_date | games_played |

| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-01 | 0            |
| 3         | 4         | 2016-07-03 | 5            |

Output: 

| install_dt | installs | Day1_retention |

| 2016-03-01 | 2        | 0.50           |
| 2017-06-25 | 1        | 0.00           |

## Explanation ##

- Player `1` and `3` installed the game on `2016-03-01` but only player `1` logged back in on `2016-03-02` so the day 
1 retention of `2016-03-01` is 1 / 2 = `0.50`
- Player `2` installed the game on `2017-06-25` but didn't log back in on `2017-06-26` so the day 1 retention of 
`2017-06-25` is 0 / 1 = `0.00`

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the activity table
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)

-- Populate the activity table    
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-01', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')
```

### Pandas Code

```python
# activity data
data = [[1, 2, '2016-03-01', 5], [1, 2, '2016-03-02', 6], [2, 3, '2017-06-25', 1], 
        [3, 1, '2016-03-01', 0], [3, 4, '2018-07-03', 5]]

# activity dataframe
activity = pd.DataFrame(data, 
                        columns=['player_id', 'device_id', 'event_date', 'games_played']) \
                       .astype({'player_id':'Int64', 'device_id':'Int64', 'event_date':'datetime64[ns]', 
                                'games_played':'Int64'})

```