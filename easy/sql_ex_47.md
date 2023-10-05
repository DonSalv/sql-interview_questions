# Create a Session Bar Chart

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SESSIONS`

| Column Name | Type |
|-------------|------|
| session_id  | int  |
| duration    | int  |

`session_id` is the column of unique values for this table.

`duration` is the time in seconds that a user has visited the application.

## Task

You want to know how long a user visits your application. 
You decided to create bins of `"[0-5>"`, `"[5-10>"`, `"[10-15>"`, and `"15 minutes or more"`
and count the number of sessions on it.

Write a solution to report the `(bin, total)`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SESSIONS table:

| session_id | duration |
|------------|----------|
| 1          | 30       |
| 2          | 199      |
| 3          | 299      |
| 4          | 580      |
| 5          | 1000     |

Output: 

| bin         | total |
|-------------|-------|
| [0-5>       | 3     |
| [5-10>      | 1     |
| [10-15>     | 0     |
| 15 or more  | 1     |

## Explanation ##

- For `session_id` `1`, `2`, and `3` have a duration greater or equal than `0` minutes and less than `5` minutes.
- For `session_id` `4` has a duration greater or equal than `5` minutes and less than `10` minutes.
- There is no `session` with a duration greater than or equal to `10` minutes and less than `15` minutes.
- For `session_id` 5 has a duration greater than or equal to `15` minutes.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the sessions table
Create table If Not Exists Sessions (session_id int, duration int)

-- Populate the sessions table    
Truncate table Sessions
insert into Sessions (session_id, duration) values ('1', '30')
insert into Sessions (session_id, duration) values ('2', '199')
insert into Sessions (session_id, duration) values ('3', '299')
insert into Sessions (session_id, duration) values ('4', '580')
insert into Sessions (session_id, duration) values ('5', '1000')
```

### Pandas Code

```python
# sessions data
data = [[1, 30], [2, 199], [3, 299], [4, 580], [5, 1000]]

# sesissions dataframe
sessions = pd.DataFrame(data, 
                        columns=['session_id', 'duration']) \
                        .astype({'session_id':'Int64', 
                                 'duration':'Int64'})
```