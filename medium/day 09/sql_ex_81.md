# Users With Two Purchases Within Seven Days

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PURCHASES`

| Column Name   | Type |
|---------------|------|
| purchase_id   | int  |
| user_id       | int  |
| purchase_date | date |

`purchase_id` contains unique values.

This table contains logs of the dates that users purchased from a certain retailer.

## Task

Write a solution to report the IDs of the users that made any two purchases **at most** `7` days apart.

**Return** the result table ordered by `user_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PURCHASES table:

| purchase_id | user_id | purchase_date |
|-------------|---------|---------------|
| 4           | 2       | 2022-03-13    |
| 1           | 5       | 2022-02-11    |
| 3           | 7       | 2022-06-19    |
| 6           | 2       | 2022-03-20    |
| 5           | 7       | 2022-06-19    |
| 2           | 2       | 2022-06-08    |

Output: 

| user_id |
|---------|
| 2       |
| 7       |

## Explanation ##

- `User 2` had two purchases on `2022-03-13` and `2022-03-20`. Since the second purchase is within `7` 
days of the first purchase, we add their ID.
- `User 5` had only `1` purchase.
- `User 7` had two purchases on the same day so we add their ID.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the purchases table
Create table If Not Exists Purchases (purchase_id int, user_id int, purchase_date date)
    
-- Populate the purchases table
Truncate table Purchases
insert into Purchases (purchase_id, user_id, purchase_date) values ('4', '2', '2022-03-13')
insert into Purchases (purchase_id, user_id, purchase_date) values ('1', '5', '2022-02-11')
insert into Purchases (purchase_id, user_id, purchase_date) values ('3', '7', '2022-06-19')
insert into Purchases (purchase_id, user_id, purchase_date) values ('6', '2', '2022-03-20')
insert into Purchases (purchase_id, user_id, purchase_date) values ('5', '7', '2022-06-19')
insert into Purchases (purchase_id, user_id, purchase_date) values ('2', '2', '2022-06-08')
```

### Pandas Code

```python
# purchases data
data = [[4, 2, '2022-03-13'], [1, 5, '2022-02-11'], 
        [3, 7, '2022-06-19'], [6, 2, '2022-03-20'], 
        [5, 7, '2022-06-19'], [2, 2, '2022-06-08']]

# purchases dataframe
purchases = pd.DataFrame(data, 
                         columns=['purchase_id', 'user_id', 'purchase_date']) \
                        .astype({'purchase_id':'Int64', 'user_id':'Int64', 
                                 'purchase_date':'datetime64[ns]'})
```