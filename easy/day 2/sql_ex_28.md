# Game Play Analysis II

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
Each row is a record of a `player` who logged in and played a number of games (possibly 0) before 
logging out on someday using some device.

## Task

Write a solution to report the **device** that is first logged in for each player.

**Return** the result table in any order.

## Description of the Solution ##

Example 1:

Input: 
ACTIVITY table:

| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

Output: 

| player_id | device_id |
|-----------|-----------|
| 1         | 2         |
| 2         | 3         |
| 3         | 1         |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the activity table
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)
    
-- Populate the activity table
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')
```

### Pandas Code

```python
# activity data
data = [[1, 2, '2016-03-01', 5], [1, 2, '2016-05-02', 6], [2, 3, '2017-06-25', 1], [3, 1, '2016-03-02', 0], [3, 4, '2018-07-03', 5]]

# activity dataframe
activity = pd.DataFrame(data, 
                        columns=['player_id', 'device_id', 'event_date', 'games_played']) \
                        .astype({'player_id':'Int64', 
                                 'device_id':'Int64', 
                                 'event_date':'datetime64[ns]', 
                                 'games_played':'Int64'})
```
