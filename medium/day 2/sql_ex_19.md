# Game Play Analysis III

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

`(player_id, event_date)` is the primary key (column with unique values) of this table.

This table shows the `activity` of players of some games.

Each row is a record of a player who logged in and played a number of games (possibly `0`) before lo

## Task

Write a solution to report for each player and date, how many games played **so far** by the player. 
That is, the total number of games played by the player until that date. Check the example for clarity.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
`ACTIVITY` table:

| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 1         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

Output: 

| player_id | event_date | games_played_so_far |
|-----------|------------|---------------------|
| 1         | 2016-03-01 | 5                   |
| 1         | 2016-05-02 | 11                  |
| 1         | 2017-06-25 | 12                  |
| 3         | 2016-03-02 | 0                   |
| 3         | 2018-07-03 | 5                   |

## Explanation ##

- For the player with `id 1,` `5 + 6 = 11` games played by `2016-05-02`, and `5 + 6 + 1 = 12` games played by `2017-06-25`.
- For the player with `id 3`, `0 + 5 = 5` games played by `2018-07-03`.

- **Note** that for each player we only care about the days when the player logged in.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the activity table
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)
    
-- Populate the activity table
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')
```

### Pandas Code

```python
# activity data
data = [[1, 2, '2016-03-01', 5], [1, 2, '2016-05-02', 6], [1, 3, '2017-06-25', 1], 
        [3, 1, '2016-03-02', 0], [3, 4, '2018-07-03', 5]]

# activity dataframe
activity = pd.DataFrame(data, 
                        columns=['player_id', 'device_id', 'event_date', 'games_played']) \
                       .astype({'player_id':'Int64', 'device_id':'Int64', 'event_date':'datetime64[ns]', 
                                'games_played':'Int64'})
```