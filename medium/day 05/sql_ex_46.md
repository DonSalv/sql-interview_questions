# Active Users

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ACCOUNTS`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key (column with unique values) for this table.

This table contains the account `id` and the user `name` of each account.

**Table**: `LOGINS`

| Column Name | Type |
|-------------|------|
| id          | int  |
| login_date  | date |

This table may contain duplicate rows.

This table contains the account `id` of the user who logged in and the `login date`. 

A user may log in multiple times in the day.

## Task

**Active users** are those who logged in to their accounts for five or more consecutive days.

Write a solution to find the id and the name of **active users**.

**Return** the result table ordered by `id`.

**Follow up** Could you write a general solution if the active users are those who logged in to their 
accounts for `n` or more consecutive days?

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ACCOUNTS table:

| id  | name     |
|-----|----------|
| 1   | Winston  |
| 7   | Jonathan |

LOGINS table:

| id  | login_date |
|-----|------------|
| 7   | 2020-05-30 |
| 1   | 2020-05-30 |
| 7   | 2020-05-31 |
| 7   | 2020-06-01 |
| 7   | 2020-06-02 |
| 7   | 2020-06-02 |
| 7   | 2020-06-03 |
| 1   | 2020-06-07 |
| 7   | 2020-06-10 |

Output: 

| id  | name     |
|-----|----------|
| 7   | Jonathan |

## Explanation ##

- User `Winston` with `id = 1` logged in `2` times only in `2` different days, so, 
`Winston` is not an active user.
- User `Jonathan` with `id = 7` logged in `7` times in 6 different days, five of them were consecutive days, so, 
`Jonathan` is an active user.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Accounts (id int, name varchar(10))
Create table If Not Exists Logins (id int, login_date date)

-- Populate the accounts table    
Truncate table Accounts
insert into Accounts (id, name) values ('1', 'Winston')
insert into Accounts (id, name) values ('7', 'Jonathan')

-- Populate the logins table
Truncate table Logins
insert into Logins (id, login_date) values ('7', '2020-05-30')
insert into Logins (id, login_date) values ('1', '2020-05-30')
insert into Logins (id, login_date) values ('7', '2020-05-31')
insert into Logins (id, login_date) values ('7', '2020-06-01')
insert into Logins (id, login_date) values ('7', '2020-06-02')
insert into Logins (id, login_date) values ('7', '2020-06-02')
insert into Logins (id, login_date) values ('7', '2020-06-03')
insert into Logins (id, login_date) values ('1', '2020-06-07')
insert into Logins (id, login_date) values ('7', '2020-06-10')
```

### Pandas Code

```python
# accounts data
data = [[1, 'Winston'], [7, 'Jonathan']]

# accounts dataframe
accounts = pd.DataFrame(data, 
                        columns=['id', 'name']) \
                       .astype({'id':'Int64', 'name':'object'})

# logings data
data = [[7, '2020-05-30'], [1, '2020-05-30'], [7, '2020-05-31'], [7, '2020-06-01'], 
        [7, '2020-06-02'], [7, '2020-06-02'], [7, '2020-06-03'], [1, '2020-06-07'], [7, '2020-06-10']]

# logins dataframe
logins = pd.DataFrame(data, 
                      columns=['id', 'login_date']) \
                     .astype({'id':'Int64', 'login_date':'datetime64[ns]'})
```