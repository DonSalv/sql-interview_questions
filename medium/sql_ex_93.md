# Find Active Users

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `USERS`
 
| Column Name | Type     | 
|----------|----|
| user_id     | int      | 
| item        | varchar  |
| created_at  | datetime |
| amount      | int      |

This table may contain duplicate records.

Each row includes the `user` ID, the purchased `item`, the `date` of purchase, and the purchase `amount.`

## Task

Write a solution to identify active users. An active user is a user that has made a second purchase **within 7 days** of 
any other of their purchases.

For example, if the ending date is May 31, 2023. So any date between May 31, 2023, and June 7, 2023 (inclusive) would 
be considered "within 7 days" of May 31, 2023.

**Return** a list of `user_id` which denotes the list of active users in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input:
USERS table:
 
| user_id | item              | created_at | amount |  
|---------|-------------------|------------|--------|
| 5       | Smart Crock Pot   | 2021-09-18 | 698882 |
| 6       | Smart Lock        | 2021-09-14 | 11487  |
| 6       | Smart Thermostat  | 2021-09-10 | 674762 |
| 8       | Smart Light Strip | 2021-09-29 | 630773 |
| 4       | Smart Cat Feeder  | 2021-09-02 | 693545 |
| 4       | Smart Bed         | 2021-09-13 | 170249 |
 
Output:

| user_id | 
|---------|
| 6       | 

## Explanation ##
- User with `user_id 5` has only one transaction, so he is not an active user.
- User with `user_id 6` has two transaction his first transaction was on `2021-09-10` and 
second transation was on `2021-09-14`. The distance between the first and second 
transactions date is `<= 7` days. So he is an active user. 
- User with `user_id 8` has only one transaction, so he is not an active user.  
- User with `user_id 4` has two transaction his first transaction was on `2021-09-02` and second 
transation was on `2021-09-13`. The distance between the first and second transactions date is `> 7` days. 
So he is not an active user. 

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the users table
Create table If Not Exists Users (user_id int, item varchar(100),created_at date,amount int)

-- Populate the users table    
Truncate table Users
insert into Users (user_id, item, created_at, amount) values ('5', 'Smart Crock Pot', '2021-09-18', '698882')
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Lock', '2021-09-14', '11487')
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Thermostat', '2021-09-10', '674762')
insert into Users (user_id, item, created_at, amount) values ('8', 'Smart Light Strip', '2021-09-29', '630773')
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Cat Feeder', '2021-09-02', '693545')
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Bed', '2021-09-13', '170249')
```

### Pandas Code

```python
# users data
data = [[5, 'Smart Crock Pot', '2021-09-18', 698882], [6, 'Smart Lock', '2021-09-14', 11487], 
        [6, 'Smart Thermostat', '2021-09-10', 674762], [8, 'Smart Light Strip', '2021-09-29', 630773], 
        [4, 'Smart Cat Feeder', '2021-09-02', 693545], [4, 'Smart Bed', '2021-09-13', 170249]]

# users dataframe
users = pd.DataFrame(data, 
                     columns=['user_id', 'item', 'created_at', 'amount']) \
                    .astype({'user_id':'Int64', 'item':'object', 'created_at':'datetime64[ns]', 'amount':'Int64'})
```