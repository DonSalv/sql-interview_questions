# Delete Duplicate Emails

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

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
- For SQL users, please note that you are supposed to write a `DELETE` statement and not a `SELECT` one.
- For Pandas users, please note that you are supposed to modify `PERSON` in place.

After running your script, the answer shown is the `PERSON` table. 
The driver will first compile and run your piece of code and then show the `PERSON` table. 
The final order of the `PERSON` table does not matter.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Person table:

| id   | email            |
|------|------------------|
| 1    | john@example.com |
| 2    | bob@example.com  |
| 3    | john@example.com |

Output: 

| id   | email            |
|------|------------------|
| 1    | john@example.com |
| 2    | bob@example.com  |


## Explanation ##

`john@example.com` is repeated two times. We keep the row with the smallest `Id = 1`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Crete the Person table
Create table If Not Exists Person (Id int, Email varchar(255))

-- Populate the Person table
Truncate table Person
insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')
```

### Pandas Code

```python
# person data
data = [[1, 'john@example.com'], 
        [2, 'bob@example.com'], 
        [3, 'john@example.com']]

# person dataframe
person = pd.DataFrame(data, 
                      columns=['id', 'email']) \
                      .astype({'id':'int64', 
                               'email':'object'})
```