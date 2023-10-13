# Grand Slam Titles

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PLAYERS`

| Column Name | Type    |
|-------------|---------|
| player_id   | int     |
| player_name | varchar |

`player_id` is the primary key (column with unique values) for this table.

Each row in this table contains the `name` and the `ID` of a tennis player.

**Table**: `CHAMPIONSHIPS`

| Column Name | Type |
|-------------|------|
| year        | int  |
| Wimbledon   | int  |
| Fr_open     | int  |
| US_open     | int  |
| Au_open     | int  |

`year` is the primary key (column with unique values) for this table.

Each row of this table contains the IDs of the players who won one each tennis tournament of the grand slam.

## Task

Write a solution to report the number of grand slam tournaments won by each player. Do not include the players who did not win any tournament.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PLAYERS table:

| player_id | player_name |
|-----------|-------------|
| 1         | Nadal       |
| 2         | Federer     |
| 3         | Novak       |

CHAMPIONSHIPS table:

| year | Wimbledon | Fr_open | US_open | Au_open |
|------|-----------|---------|---------|---------|
| 2018 | 1         | 1       | 1       | 1       |
| 2019 | 1         | 1       | 2       | 2       |
| 2020 | 2         | 1       | 2       | 2       |

Output: 

| player_id | player_name | grand_slams_count |
|-----------|-------------|-------------------|
| 2         | Federer     | 5                 |
| 1         | Nadal       | 7                 |

## Explanation ##

- Player 1 (`Nadal`) won `7` titles: Wimbledon (2018, 2019), Fr_open (2018, 2019, 2020), US_open (2018), 
and Au_open (2018).
- Player 2 (`Federer`) won `5` titles: Wimbledon (2020), US_open (2019, 2020), and Au_open (2019, 2020).
- Player 3 (`Novak`) did not win anything, we did not include them in the result table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Players (player_id int, player_name varchar(20))
Create table If Not Exists Championships (year int, Wimbledon int, Fr_open int, US_open int, Au_open int)

-- Populate the players table
Truncate table Players
insert into Players (player_id, player_name) values ('1', 'Nadal')
insert into Players (player_id, player_name) values ('2', 'Federer')
insert into Players (player_id, player_name) values ('3', 'Novak')
    
-- Populate the championships table
Truncate table Championships
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2018', '1', '1', '1', '1')
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2019', '1', '1', '2', '2')
insert into Championships (year, Wimbledon, Fr_open, US_open, Au_open) values ('2020', '2', '1', '2', '2')
```

### Pandas Code

```python
# players data
data = [[1, 'Nadal'], [2, 'Federer'], [3, 'Novak']]

# players dataframe
players = pd.DataFrame(data, 
                       columns=['player_id', 'player_name']) \
                      .astype({'player_id':'Int64', 'player_name':'object'})

# championships data
data = [[2018, 1, 1, 1, 1], [2019, 1, 1, 2, 2], [2020, 2, 1, 2, 2]]

# championships dataframe
championships = pd.DataFrame(data, 
                             columns=['year', 'Wimbledon', 'Fr_open', 'US_open', 'Au_open']) \
                            .astype({'year':'Int64', 'Wimbledon':'Int64', 'Fr_open':'Int64', 
                                     'US_open':'Int64', 'Au_open':'Int64'})
```