# Customers with Maximum Number of Transactions on Consecutive Days

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TRANSACTIONS`

| Column Name      | Type |
|------------------|------|
| transaction_id   | int  |
| customer_id      | int  |
| transaction_date | date |
| amount           | int  |

`transaction_id` is the column with unique values of this table.

Each row contains information about transactions that includes unique `(customer_id, transaction_date)` along 
with the corresponding `customer_id` and `amount`.   

## Task

Write a solution to find all `customer_id` who made the maximum number of transactions on consecutive days.

**Return** all `customer_id` with the maximum number of consecutive transactions. 
Order the result table by `customer_id` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TRANSACTIONS table:

| transaction_id | customer_id | transaction_date | amount |
|----------------|-------------|------------------|--------|
| 1              | 101         | 2023-05-01       | 100    |
| 2              | 101         | 2023-05-02       | 150    |
| 3              | 101         | 2023-05-03       | 200    |
| 4              | 102         | 2023-05-01       | 50     |
| 5              | 102         | 2023-05-03       | 100    |
| 6              | 102         | 2023-05-04       | 200    |
| 7              | 105         | 2023-05-01       | 100    |
| 8              | 105         | 2023-05-02       | 150    |
| 9              | 105         | 2023-05-03       | 200    |

Output: 

| customer_id | 
|-------------|
| 101         | 
| 105         |

## Explanation ##

- `customer_id` `101` has a total of `3` transactions, and all of them are consecutive.
- `customer_id` `102` has a total of `3` transactions, but only `2` of them are consecutive. 
- `customer_id` `105` has a total of `3` transactions, and all of them are consecutive.

In total, the highest number of consecutive transactions is `3`, achieved by `customer_id` `101` and `105`. 
The `customer_id` are sorted in ascending order.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the transactions table
Create table If Not Exists Transactions (transaction_id int, customer_id int, transaction_date date, amount int)

-- Populate the transactions table    
Truncate table Transactions
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('1', '101', '2023-05-01', '100')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('2', '101', '2023-05-02', '150')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('3', '101', '2023-05-03', '200')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('4', '102', '2023-05-01', '50')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('5', '102', '2023-05-03', '100')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('6', '102', '2023-05-04', '200')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('7', '105', '2023-05-01', '100')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('8', '105', '2023-05-02', '150')
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('9', '105', '2023-05-03', '200')
```

### Pandas Code

```python
# transactions data
data = [[1, 101, '2023-05-01', 100], [2, 101, '2023-05-02', 150], [3, 101, '2023-05-03', 200], 
        [4, 102, '2023-05-01', 50], [5, 102, '2023-05-03', 100], [6, 102, '2023-05-04', 200], 
        [7, 105, '2023-05-01', 100], [8, 105, '2023-05-02', 150], [9, 105, '2023-05-03', 200]]

# transactions dataframe
transactions = pd.DataFrame(data, 
                            columns=['transaction_id', 'customer_id', 'transaction_date', 'amount']) \
                           .astype({'transaction_id':'Int64', 'customer_id':'Int64', 
                                    'transaction_date':'datetime64[ns]', 'amount':'Int64'})
```