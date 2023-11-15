# Actors and Directors Who Cooperated At Least Three Times

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ACTORDIRECTOR`

| Column Name | Type    |
|-------------|---------|
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |

`timestamp` is the primary key (column with unique values) for this table.

## Task

Write a solution to find all the pairs `(actor_id, director_id)` where the actor has cooperated with 
the director at least three times.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ACTORDIRECTOR table:

| actor_id  | director_id | timestamp |
|-----------|-------------|-----------|
| 1         | 1           | 0         |
| 1         | 1           | 1         |
| 1         | 1           | 2         |
| 1         | 2           | 3         |
| 1         | 2           | 4         |
| 2         | 1           | 5         |
| 2         | 1           | 6         |

Output: 

| actor_id | director_id |
|----------|-------------|
| 1        | 1           |

## Explanation ##

The only pair is `(1, 1)` where they cooperated exactly `3` times.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the actordirector table
Create table If Not Exists ActorDirector (actor_id int, director_id int, timestamp int)
    
-- Populate the actordirector table
Truncate table ActorDirector
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '0')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '1')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '2')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '3')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '4')
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '5')
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '6')
```

### Pandas Code

```python
# actor_director data
data = [[1, 1, 0], [1, 1, 1], [1, 1, 2], [1, 2, 3], [1, 2, 4], [2, 1, 5], [2, 1, 6]]

# actor_director dataframe
actor_director = pd.DataFrame(data, 
                              columns=['actor_id', 'director_id', 'timestamp']) \
                              .astype({'actor_id':'int64', 
                                       'director_id':'int64', 
                                       'timestamp':'int64'})
```
