# Find the Start and End Number of Continuous Ranges

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `LOGS`

| Column Name | Type |
|-------------|------|
| log_id      | int  |

`log_id` is the column of unique values for this table.

Each row of this table contains the `ID` in a `LOG` Table.

## Task

Write a solution to find the start and end number of continuous ranges in the table `LOGS`.

**Return** the result table ordered by `start_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
LOGS table:

| log_id |
|--------|
| 1      |
| 2      |
| 3      |
| 7      |
| 8      |
| 10     |

Output: 

| start_id | end_id |
|----------|--------|
| 1        | 3      |
| 7        | 8      |
| 10       | 10     |

## Explanation ##

The result table should contain all ranges in table Logs.
- From 1 to 3 is contained in the table.
- From 4 to 6 is missing in the table
- From 7 to 8 is contained in the table.
- Number 9 is missing from the table.
- Number 10 is contained in the table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the logs table
Create table If Not Exists Logs (log_id int)
    
-- Populate the logs table
Truncate table Logs
insert into Logs (log_id) values ('1')
insert into Logs (log_id) values ('2')
insert into Logs (log_id) values ('3')
insert into Logs (log_id) values ('7')
insert into Logs (log_id) values ('8')
insert into Logs (log_id) values ('10')
```

### Pandas Code

```python
# logs data
data = [[1], [2], [3], [7], [8], [10]]

# logs dataframe
logs = pd.DataFrame(data, 
                    columns=['log_id']) \
                   .astype({'log_id':'Int64'})
```