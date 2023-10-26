# Fix Names in a Table

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `USERS`

| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| name        | varchar |

`user_id` is the primary key (column with unique values) for this table.

This table contains the `ID` and the `name` of the user. The name consists of only lowercase and uppercase 
characters.

## Task

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

**Return** the result table ordered by `user_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
USERS table:

| user_id | name  |
|---------|-------|
| 1       | aLice |
| 2       | bOB   |

Output: 

| user_id | name  |
|---------|-------|
| 1       | Alice |
| 2       | Bob   |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the users table
Create table If Not Exists Users (user_id int, name varchar(40))

-- Populate the users table
Truncate table Users
insert into Users (user_id, name) values ('1', 'aLice')
insert into Users (user_id, name) values ('2', 'bOB')
```

### Pandas Code

```python
# users data
data = [[1, 'aLice'], [2, 'bOB']]

# users dataframe
users = pd.DataFrame(data, 
                     columns=['user_id', 'name']) \
                    .astype({'user_id':'Int64', 'name':'object'})
```