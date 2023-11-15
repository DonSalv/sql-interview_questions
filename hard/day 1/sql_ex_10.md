# User Purchase Platform

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SPENDING`

| Column Name | Type |
|-------------|------|
| user_id     | int  |
| spend_date  | date |
| platform    | enum | 
| amount      | int  |

The table logs the history of the spending of users that make purchases from an online shopping website that has a 
desktop and a mobile application.

`(user_id, spend_date, platform) `is the primary key (combination of columns with unique values) of this table.

The platform column is an `ENUM` (category) type of `('desktop', 'mobile')`.

## Task

Write a solution to find the total number of users and the total amount spent using the mobile only, 
the desktop only, and both mobile and desktop together for each date.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SPENDING table:

| user_id | spend_date | platform | amount |
|---------|------------|----------|--------|
| 1       | 2019-07-01 | mobile   | 100    |
| 1       | 2019-07-01 | desktop  | 100    |
| 2       | 2019-07-01 | mobile   | 100    |
| 2       | 2019-07-02 | mobile   | 100    |
| 3       | 2019-07-01 | desktop  | 100    |
| 3       | 2019-07-02 | desktop  | 100    |

Output: 

| spend_date | platform | total_amount | total_users |
|------------|----------|--------------|-------------|
| 2019-07-01 | desktop  | 100          | 1           |
| 2019-07-01 | mobile   | 100          | 1           |
| 2019-07-01 | both     | 200          | 1           |
| 2019-07-02 | desktop  | 100          | 1           |
| 2019-07-02 | mobile   | 100          | 1           |
| 2019-07-02 | both     | 0            | 0           | 

## Explanation ##

- On `2019-07-01`, `user 1` purchased using both desktop and mobile, 
`user 2` purchased using mobile only and `user 3` purchased using desktop only.
- On `2019-07-02`, `user 2` purchased using mobile only, `user 3` purchased using desktop only and no one purchased 
using both platforms.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the spending table
Create table If Not Exists Spending (user_id int, spend_date date, platform ENUM('desktop', 'mobile'), amount int)

-- Populate the spending table    
Truncate table Spending
insert into Spending (user_id, spend_date, platform, amount) values ('1', '2019-07-01', 'mobile', '100')
insert into Spending (user_id, spend_date, platform, amount) values ('1', '2019-07-01', 'desktop', '100')
insert into Spending (user_id, spend_date, platform, amount) values ('2', '2019-07-01', 'mobile', '100')
insert into Spending (user_id, spend_date, platform, amount) values ('2', '2019-07-02', 'mobile', '100')
insert into Spending (user_id, spend_date, platform, amount) values ('3', '2019-07-01', 'desktop', '100')
insert into Spending (user_id, spend_date, platform, amount) values ('3', '2019-07-02', 'desktop', '100')
```

### Pandas Code

```python
# spending data
data = [[1, '2019-07-01', 'mobile', 100], [1, '2019-07-01', 'desktop', 100], [2, '2019-07-01', 'mobile', 100], 
        [2, '2019-07-02', 'mobile', 100], [3, '2019-07-01', 'desktop', 100], [3, '2019-07-02', 'desktop', 100]]

# spending dataframe
spending = pd.DataFrame(data, 
                        columns=['user_id', 'spend_date', 'platform', 'amount']) \
                       .astype({'user_id':'Int64', 'spend_date':'datetime64[ns]', 
                                'platform':'object', 'amount':'Int64'})

```