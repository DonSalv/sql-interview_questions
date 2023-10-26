# Reformat Department Table

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `DEPARTMENT`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| revenue     | int     |
| month       | varchar |

In `SQL`, `(id, month)` is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in `["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]`.

## Task

Reformat the table such that there is a `department id` column and a revenue column for each month.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
DEPARTMENT table:

| id  | revenue | month |
|-----|---------|-------|
| 1   | 8000    | Jan   |
| 2   | 9000    | Jan   |
| 3   | 10000   | Feb   |
| 1   | 7000    | Feb   |
| 1   | 6000    | Mar   |

Output: 

| id  | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
|-----|-------------|-------------|-------------|-----|-------------|
| 1   | 8000        | 7000        | 6000        | ... | null        |
| 2   | 9000        | null        | null        | ... | null        |
| 3   | null        | 10000       | null        | ... | null        |

## Explanation ##

The revenue from `Apr` to `Dec` is `null`.
Note that the result table has `13` columns (1 for the `department id + 12` for the months).

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the department table
Create table If Not Exists Department (id int, revenue int, month varchar(5))
    
-- Populate the department table
Truncate table Department
insert into Department (id, revenue, month) values ('1', '8000', 'Jan')
insert into Department (id, revenue, month) values ('2', '9000', 'Jan')
insert into Department (id, revenue, month) values ('3', '10000', 'Feb')
insert into Department (id, revenue, month) values ('1', '7000', 'Feb')
insert into Department (id, revenue, month) values ('1', '6000', 'Mar')
```

### Pandas Code

```python
# department data
data = [[1, 8000, 'Jan'], 
        [2, 9000, 'Jan'], 
        [3, 10000, 'Feb'], 
        [1, 7000, 'Feb'], 
        [1, 6000, 'Mar']]

# department dataframe
department = pd.DataFrame(data, 
                          columns=['id', 'revenue', 'month']) \
                          .astype({'id':'Int64', 
                                   'revenue':'Int64', 
                                   'month':'object'})
```