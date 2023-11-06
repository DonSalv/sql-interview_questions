# Percentage of Users Attended a Contest

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
| user_name   | varchar |

`user_id` is the primary key (column with unique values) for this table.

Each row of this table contains the name and the id of a user.

**Table**: `REGISTER`

| Column Name | Type |
|-------------|------|
| contest_id  | int  |
| user_id     | int  |

`(contest_id, user_id)` is the primary key (combination of columns with unique values) for this table.

Each row of this table contains the id of a user and the contest they registered into.

## Task

Write a solution to find the percentage of the users registered in each contest 
**rounded to two decimals**.

Return the result table ordered by `percentage` in **descending order**. In case of a tie, 
order it by `contest_id` in **ascending order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
USERS table:

| user_id | user_name |
|---------|-----------|
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |

REGISTER table:

| contest_id | user_id |
|------------|---------|
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |

Output: 

| contest_id | percentage |
|------------|------------|
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |

## Explanation ##

- All the users registered in contests `208`, `209`, and `210`. The `percentage` is `100%` and we sort them in the 
answer table by contest_id in ascending order.
- `Alice` and `Alex` registered in contest `215` and the `percentage` is `((2/3) * 100) = 66.67%`
- `Bob` registered in contest `207` and the `percentage` is `((1/3) * 100) = 33.33%`

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Users (user_id int, user_name varchar(20))
Create table If Not Exists Register (contest_id int, user_id int)

-- Populate the users table
Truncate table Users
insert into Users (user_id, user_name) values ('6', 'Alice')
insert into Users (user_id, user_name) values ('2', 'Bob')
insert into Users (user_id, user_name) values ('7', 'Alex')

-- Populate the register table
Truncate table Register
insert into Register (contest_id, user_id) values ('215', '6')
insert into Register (contest_id, user_id) values ('209', '2')
insert into Register (contest_id, user_id) values ('208', '2')
insert into Register (contest_id, user_id) values ('210', '6')
insert into Register (contest_id, user_id) values ('208', '6')
insert into Register (contest_id, user_id) values ('209', '7')
insert into Register (contest_id, user_id) values ('209', '6')
insert into Register (contest_id, user_id) values ('215', '7')
insert into Register (contest_id, user_id) values ('208', '7')
insert into Register (contest_id, user_id) values ('210', '2')
insert into Register (contest_id, user_id) values ('207', '2')
insert into Register (contest_id, user_id) values ('210', '7')
```

### Pandas Code

```python
# users data
data = [[6, 'Alice'], [2, 'Bob'], [7, 'Alex']]

# users dataframe
users = pd.DataFrame(data,
                     columns=['user_id', 'user_name']) \
                    .astype({'user_id':'Int64', 'user_name':'object'})

# register data
data = [[215, 6], [209, 2], [208, 2], [210, 6], [208, 6], 
        [209, 7], [209, 6], [215, 7], [208, 7], [210, 2], [207, 2], [210, 7]]

# register dataframe
register = pd.DataFrame(data, 
                        columns=['contest_id', 'user_id']) \
                       .astype({'contest_id':'Int64', 'user_id':'Int64'})
```