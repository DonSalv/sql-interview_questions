# Tournament Winners

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PLAYERS`

| Column Name | Type |
|-------------|------|
| player_id   | int  |
| group_id    | int  |

`player_id` is the primary key (column with unique values) of this table.

Each row of this table indicates the `group` of each player.

**Table**: `MATCHES`

| Column Name   | Type |
|---------------|------|
| match_id      | int  |
| first_player  | int  |
| second_player | int  | 
| first_score   | int  |
| second_score  | int  |

`match_id` is the primary key (column with unique values) of this table.

Each row is a record of a match, `first_player` and `second_player` contain the `player_id` of each match.

`first_score` and second_score contain the number of points of the `first_player` and `second_player` respectively.

You may assume that, in each match, players belong to the same group.

## Task

The winner in each group is the player who scored the maximum total points within the group. In the case of a tie, 
the lowest `player_id` wins.

Write a solution to find the winner in each group.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PLAYERS table:

| player_id | group_id |
|-----------|----------|
| 15        | 1        |
| 25        | 1        |
| 30        | 1        |
| 45        | 1        |
| 10        | 2        |
| 35        | 2        |
| 50        | 2        |
| 20        | 3        |
| 40        | 3        |

MATCHES table:

| match_id | first_player | second_player | first_score | second_score |
|----------|--------------|---------------|-------------|--------------|
| 1        | 15           | 45            | 3           | 0            |
| 2        | 30           | 25            | 1           | 2            |
| 3        | 30           | 15            | 2           | 0            |
| 4        | 40           | 20            | 5           | 2            |
| 5        | 35           | 50            | 1           | 1            |

Output: 

| group_id | player_id |
|----------|-----------|
| 1        | 15        |
| 2        | 35        |
| 3        | 40        |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Players (player_id int, group_id int)
Create table If Not Exists Matches (match_id int, first_player int, second_player int, first_score int, second_score int)

-- Populate the players table
Truncate table Players
insert into Players (player_id, group_id) values ('10', '2')
insert into Players (player_id, group_id) values ('15', '1')
insert into Players (player_id, group_id) values ('20', '3')
insert into Players (player_id, group_id) values ('25', '1')
insert into Players (player_id, group_id) values ('30', '1')
insert into Players (player_id, group_id) values ('35', '2')
insert into Players (player_id, group_id) values ('40', '3')
insert into Players (player_id, group_id) values ('45', '1')
insert into Players (player_id, group_id) values ('50', '2')

-- Populate the matches table    
Truncate table Matches
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('1', '15', '45', '3', '0')
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('2', '30', '25', '1', '2')
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('3', '30', '15', '2', '0')
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('4', '40', '20', '5', '2')
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('5', '35', '50', '1', '1')
```

### Pandas Code

```python
# players data
data = [[10, 2], [15, 1], [20, 3], [25, 1], [30, 1], [35, 2], [40, 3], [45, 1], [50, 2]]

# players dataframe
players = pd.DataFrame(data, columns=['player_id', 'group_id']).astype({'player_id':'Int64', 'group_id':'Int64'})

# mathces data
data = [[1, 15, 45, 3, 0], [2, 30, 25, 1, 2], [3, 30, 15, 2, 0], [4, 40, 20, 5, 2], [5, 35, 50, 1, 1]]

# matches dataframe
matches = pd.DataFrame(data, 
                       columns=['match_id', 'first_player', 'second_player', 'first_score', 'second_score']) \
                      .astype({'match_id':'Int64', 'first_player':'Int64', 'second_player':'Int64', 
                               'first_score':'Int64', 'second_score':'Int64'})
```