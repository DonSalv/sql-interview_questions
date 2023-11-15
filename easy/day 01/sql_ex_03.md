# Duplicate Emails

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PERSON`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| email       | varchar |

`id` is the primary key (column with unique values) for this table.
Each row of this table contains an `email`. The emails will not contain uppercase letters.

## Task

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Person table:

| id   | email   |
|------|---------|
| 1    | a@b.com |
| 2    | c@d.com |
| 3    | a@b.com |

Output: 

| Email   | 
|---------|
| Email   |
| a@b.com |

## Explanation ##

`a@b.com` is repeated two times.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the person table
Create table If Not Exists Person (id int, email varchar(255))

-- Populate the person table
Truncate table Person
insert into Person (id, email) values ('1', 'a@b.com')
insert into Person (id, email) values ('2', 'c@d.com')
insert into Person (id, email) values ('3', 'a@b.com')
```

### Pandas Code

```python
# person data
data = [[1, 'a@b.com'], 
        [2, 'c@d.com'], 
        [3, 'a@b.com']]

# person dataframe
person = pd.DataFrame(data, 
                      columns=['id', 'email']) \
                      .astype({'id':'Int64', 
                               'email':'object'})
```