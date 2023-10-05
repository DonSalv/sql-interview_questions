# Find Users With Valid E-Mails

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
| mail        | varchar |

`user_id` is the primary key (column with unique values) for this table.

This table contains information of the users signed up in a website. Some `e-mails` are invalid.

## Task

Write a solution to find the users who have **valid emails**.

A **valid e-mail** has a prefix name and a domain where:

- **The prefix name** is a string that may contain letters (upper or lower case), digits, underscore `'_'`, period `'.'`, 
and/or dash `'-'`. The prefix name must start with a letter.
- **The domain** is `'@leetcode.com'`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
USERS table:

| user_id | name      | mail                    |
|---------|-----------|-------------------------|
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |

Output: 

| user_id | name      | mail                    |
|---------|-----------|-------------------------|
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |

## Explanation ##

- The `mail` of user `2` does not have a domain.
- The `mail` of user `5` has the `#` sign which is not allowed.
- The `mail` of user `6` does not have the `leetcode` domain.
- The `mail` of user `7` starts with a period.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the users table
Create table If Not Exists Users (user_id int, name varchar(30), mail varchar(50))
    
-- Populate the users table
Truncate table Users
insert into Users (user_id, name, mail) values ('1', 'Winston', 'winston@leetcode.com')
insert into Users (user_id, name, mail) values ('2', 'Jonathan', 'jonathanisgreat')
insert into Users (user_id, name, mail) values ('3', 'Annabelle', 'bella-@leetcode.com')
insert into Users (user_id, name, mail) values ('4', 'Sally', 'sally.come@leetcode.com')
insert into Users (user_id, name, mail) values ('5', 'Marwan', 'quarz#2020@leetcode.com')
insert into Users (user_id, name, mail) values ('6', 'David', 'david69@gmail.com')
insert into Users (user_id, name, mail) values ('7', 'Shapiro', '.shapo@leetcode.com')
```

### Pandas Code

```python
# users data
data = [[1, 'Winston', 'winston@leetcode.com'], [2, 'Jonathan', 'jonathanisgreat'],
        [3, 'Annabelle', 'bella-@leetcode.com'], [4, 'Sally', 'sally.come@leetcode.com'],
        [5, 'Marwan', 'quarz#2020@leetcode.com'], [6, 'David', 'david69@gmail.com'], 
        [7, 'Shapiro', '.shapo@leetcode.com']]

# users dataframe
users = pd.DataFrame(data, 
                     columns=['user_id', 'name', 'mail']) \
                    .astype({'user_id':'int64', 'name':'object', 'mail':'object'})
```