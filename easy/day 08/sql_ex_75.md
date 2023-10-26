# Convert Date Format

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `DAYS`

| Column Name | Type |
|-------------|------|
| day         | date |

`day` is the column with unique values for this table.

`(customer_id, year)` is the primary key (combination of columns with unique values) for this table.

This table contains the `customer` ID and the `revenue` of customers in different years.

Note that this revenue can be negative.

## Task

Write a solution to convert each date in `DAYS` into a string formatted as 
`"day_name, month_name day, year"`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
DAYS table:

| day        |
|------------|
| 2022-04-12 |
| 2021-08-09 |
| 2020-06-26 |

Output: 

| day                     |
|-------------------------|
| Tuesday, April 12, 2022 |
| Monday, August 9, 2021  |
| Friday, June 26, 2020   |

## Explanation ##

Please note that the output is case-sensitive.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the days table
Create table If Not Exists Days (day date)

-- Populate the days table    
Truncate table Days
insert into Days (day) values ('2022-04-12')
insert into Days (day) values ('2021-08-09')
insert into Days (day) values ('2020-06-26')
```

### Pandas Code

```python
# days data
data = [['2022-04-12'], ['2021-08-09'], ['2020-06-26']]

# days dataframe
days = pd.DataFrame(data, columns=['day']).astype({'day':'datetime64[ns]'})
```