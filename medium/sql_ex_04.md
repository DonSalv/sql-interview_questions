# Consecutive Numbers

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `LOGS`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| num         | varchar |

In `SQL`, `id` is the primary key for this table.
id is an autoincrement column.

## Task

Find all numbers that appear at least three times consecutively.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
LOGS table:

| id  | num |
|-----|-----|
| 1   | 1   |
| 2   | 1   |
| 3   | 1   |
| 4   | 2   |
| 5   | 1   |
| 6   | 2   |
| 7   | 2   |

Output: 

| ConsecutiveNums |
|-----------------|
| 1               |

## Explanation ##

`1` is the only number that appears consecutively for at least three times.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the logs table
Create table If Not Exists Logs (id int, num int)
    
-- Populate the logs table
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')
```

### Pandas Code

```python
# logs data
data = [[1, 1], [2, 1], [3, 1], [4, 2], [5, 1], [6, 2], [7, 2]]

# logs dataframe
logs = pd.DataFrame(data, 
                    columns=['id', 'num']) \
                   .astype({'id':'Int64', 'num':'Int64'})
```