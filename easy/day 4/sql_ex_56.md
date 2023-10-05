# Customer Who Visited but Did Not Make Any Transactions

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `VISITS`

| Column Name | Type |
|-------------|------|
| visit_id    | int  |
| customer_id | int  |

`visit_id` is the column with unique values for this table.

This table contains information about the customers who visited the mall.

**Table**: `TRANSACTIONS`

| Column Name    | Type |
|----------------|------|
| transaction_id | int  |
| visit_id       | int  |
| amount         | int  |

`transaction_id` is column with unique values for this table.

This table contains information about the transactions made during the `visit_id`.

## Task

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

**Return** the result table sorted in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
VISITS

| visit_id | customer_id |
|----------|-------------|
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

TRANSACTIONS

| transaction_id | visit_id | amount |
|----------------|----------|--------|
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

Output: 

| customer_id | count_no_trans |
|-------------|----------------|
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |

## Explanation ##

- Customer with `id = 23` visited the mall once and made one transaction during the visit with `id = 12`.
- Customer with `id = 9` visited the mall once and made one transaction during the visit with `id = 13`.
- Customer with `id = 30` visited the mall once and did not make any transactions.
- Customer with `id = 54` visited the mall three times. During `2` visits they did not make any transactions, 
and during one visit they made `3` transactions.
- Customer with `id = 96` visited the mall once and did not make any transactions.
- As we can see, users with IDs `30` and `96` visited the mall one time without making any transactions. 
Also, user `54` visited the mall twice and did not make any transactions.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Visits(visit_id int, customer_id int)
Create table If Not Exists Transactions(transaction_id int, visit_id int, amount int)
    
-- Populate the vistis table
Truncate table Visits
insert into Visits (visit_id, customer_id) values ('1', '23')
insert into Visits (visit_id, customer_id) values ('2', '9')
insert into Visits (visit_id, customer_id) values ('4', '30')
insert into Visits (visit_id, customer_id) values ('5', '54')
insert into Visits (visit_id, customer_id) values ('6', '96')
insert into Visits (visit_id, customer_id) values ('7', '54')
insert into Visits (visit_id, customer_id) values ('8', '54')
    
-- Populate the transctions table
Truncate table Transactions
insert into Transactions (transaction_id, visit_id, amount) values ('2', '5', '310')
insert into Transactions (transaction_id, visit_id, amount) values ('3', '5', '300')
insert into Transactions (transaction_id, visit_id, amount) values ('9', '5', '200')
insert into Transactions (transaction_id, visit_id, amount) values ('12', '1', '910')
insert into Transactions (transaction_id, visit_id, amount) values ('13', '2', '970')
```

### Pandas Code

```python
# visits data
data = [[1, 23], [2, 9], [4, 30], [5, 54], [6, 96], [7, 54], [8, 54]]

# visits dataframe 
visits = pd.DataFrame(data, 
                      columns=['visit_id', 'customer_id']) \
                     .astype({'visit_id':'Int64', 'customer_id':'Int64'})

# transactions data
data = [[2, 5, 310], [3, 5, 300], [9, 5, 200], [12, 1, 910], [13, 2, 970]]

# transactions dataframe
transactions = pd.DataFrame(data, 
                            columns=['transaction_id', 'visit_id', 'amount']) \
                           .astype({'transaction_id':'Int64', 'visit_id':'Int64', 
                                    'amount':'Int64'})

```