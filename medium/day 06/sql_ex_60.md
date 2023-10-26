# Find Interview Candidates

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CONTESTS`

| Column Name  | Type |
|--------------|------|
| contest_id   | int  |
| gold_medal   | int  |
| silver_medal | int  |
| bronze_medal | int  |

`contest_id` is the column with unique values for this table.

This table contains the LeetCode `contest` ID and the `user` IDs of the gold, silver, and bronze medalists.

It is guaranteed that any consecutive contests have consecutive IDs and that no ID is skipped.

**Table**: `USERS`

| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| mail        | varchar |
| name        | varchar |

`user_id` is the column with unique values for this table.

This table contains information about the users.

## Task

Write a solution to report the `name` and the `mail` of all **interview candidates**. A user is an 
**interview candidate** if **at least one** of these two conditions is true:
- The user won **any** medal in **three or more consecutive** contests. 
- The user won the **gold** medal in **three or more different** contests (not necessarily consecutive).

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CONTESTS table:

| contest_id | gold_medal | silver_medal | bronze_medal |
|------------|------------|--------------|--------------|
| 190        | 1          | 5            | 2            |
| 191        | 2          | 3            | 5            |
| 192        | 5          | 2            | 3            |
| 193        | 1          | 3            | 5            |
| 194        | 4          | 5            | 2            |
| 195        | 4          | 2            | 1            |
| 196        | 1          | 5            | 2            |

Users table:

| user_id | mail               | name  |
|---------|--------------------|-------|
| 1       | sarah@leetcode.com | Sarah |
| 2       | bob@leetcode.com   | Bob   |
| 3       | alice@leetcode.com | Alice |
| 4       | hercy@leetcode.com | Hercy |
| 5       | quarz@leetcode.com | Quarz |

Output:

| name  | mail               |
|-------|--------------------|
| Sarah | sarah@leetcode.com |
| Bob   | bob@leetcode.com   |
| Alice | alice@leetcode.com |
| Quarz | quarz@leetcode.com |

## Explanation ##

- `Sarah` won `3` gold medals (190, 193, and 196), so we include her in the result table.
- `Bob` won a medal in `3` consecutive contests (190, 191, and 192), so we include him in the result table. 
**Note** that he also won a medal in 3 other consecutive contests (194, 195, and 196).
- `Alice` won a medal in `3` consecutive contests (191, 192, and 193), so we include her in the result table.
- `Quarz` won a medal in `5` consecutive contests (190, 191, 192, 193, and 194), so we include them in the result table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Contests (contest_id int, gold_medal int, silver_medal int, bronze_medal int)
Create table If Not Exists Users (user_id int, mail varchar(50), name varchar(30))

-- Populate the contests table    
Truncate table Contests
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('190', '1', '5', '2')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('191', '2', '3', '5')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('192', '5', '2', '3')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('193', '1', '3', '5')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('194', '4', '5', '2')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('195', '4', '2', '1')
insert into Contests (contest_id, gold_medal, silver_medal, bronze_medal) values ('196', '1', '5', '2')

-- Populate the users table    
Truncate table Users
insert into Users (user_id, mail, name) values ('1', 'sarah@leetcode.com', 'Sarah')
insert into Users (user_id, mail, name) values ('2', 'bob@leetcode.com', 'Bob')
insert into Users (user_id, mail, name) values ('3', 'alice@leetcode.com', 'Alice')
insert into Users (user_id, mail, name) values ('4', 'hercy@leetcode.com', 'Hercy')
insert into Users (user_id, mail, name) values ('5', 'quarz@leetcode.com', 'Quarz')
```

### Pandas Code

```python
# contest data
data = [[190, 1, 5, 2], [191, 2, 3, 5], [192, 5, 2, 3], 
        [193, 1, 3, 5], [194, 4, 5, 2], [195, 4, 2, 1], [196, 1, 5, 2]]

# contests dataframe
contests = pd.DataFrame(data, 
                        columns=['contest_id', 'gold_medal', 'silver_medal', 'bronze_medal']) \
                       .astype({'contest_id':'Int64', 'gold_medal':'Int64', 'silver_medal':'Int64', 
                                'bronze_medal':'Int64'})

# users data
data = [[1, 'sarah@leetcode.com', 'Sarah'], [2, 'bob@leetcode.com', 'Bob'], 
        [3, 'alice@leetcode.com', 'Alice'], [4, 'hercy@leetcode.com', 'Hercy'], [5, 'quarz@leetcode.com', 'Quarz']]

# users dataframe
users = pd.DataFrame(data, columns=['user_id', 'mail', 'name']).astype({'user_id':'Int64', 'mail':'object', 'name':'object'})
```