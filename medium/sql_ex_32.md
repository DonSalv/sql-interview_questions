# Monthly Transactions II

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `TRANSACTIONS`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| country     | varchar |
| state       | enum    |
| amount      | int     |
| trans_date  | date    |

`id` is the column of unique values of this table.

The table has information about incoming transactions.

The `state` column is an `ENUM` (category) of type `["approved", "declined"]`.

**Table**: `CHARGEBACKS`

| Column Name | Type |
|-------------|------|
| trans_id    | int  |
| trans_date  | date |

Chargebacks contains basic information regarding incoming chargebacks from some transactions placed in 
Transactions table.

`trans_id` is a foreign key (reference column) to the id column of `TRANSACTIONS` table.

Each chargeback corresponds to a transaction made previously even if they were not approved.

## Task

Write a solution to find for each month and country: the number of approved transactions and their total amount, the number of chargebacks, and their total amount.

**Note**: In your solution, given the month and country, ignore rows with all zeros.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
TRANSACTIONS table:

| id  | country | state    | amount | trans_date |
|-----|---------|----------|--------|------------|
| 101 | US      | approved | 1000   | 2019-05-18 |
| 102 | US      | declined | 2000   | 2019-05-19 |
| 103 | US      | approved | 3000   | 2019-06-10 |
| 104 | US      | declined | 4000   | 2019-06-13 |
| 105 | US      | approved | 5000   | 2019-06-15 |

CHARGEBACKS table:

| trans_id | trans_date |
|----------|------------|
| 102      | 2019-05-29 |
| 101      | 2019-06-30 |
| 105      | 2019-09-18 |

Output: 

| month   | country | approved_count | approved_amount | chargeback_count | chargeback_amount |
|---------|---------|----------------|-----------------|------------------|-------------------|
| 2019-05 | US      | 1              | 1000            | 1                | 2000              |
| 2019-06 | US      | 2              | 8000            | 1                | 1000              |
| 2019-09 | US      | 0              | 0               | 1                | 5000              |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date)
Create table If Not Exists Chargebacks (trans_id int, trans_date date)

-- Populate the transactions table
Truncate table Transactions
insert into Transactions (id, country, state, amount, trans_date) values ('101', 'US', 'approved', '1000', '2019-05-18')
insert into Transactions (id, country, state, amount, trans_date) values ('102', 'US', 'declined', '2000', '2019-05-19')
insert into Transactions (id, country, state, amount, trans_date) values ('103', 'US', 'approved', '3000', '2019-06-10')
insert into Transactions (id, country, state, amount, trans_date) values ('104', 'US', 'declined', '4000', '2019-06-13')
insert into Transactions (id, country, state, amount, trans_date) values ('105', 'US', 'approved', '5000', '2019-06-15')

-- Populate the chargebacks table    
Truncate table Chargebacks
insert into Chargebacks (trans_id, trans_date) values ('102', '2019-05-29')
insert into Chargebacks (trans_id, trans_date) values ('101', '2019-06-30')
insert into Chargebacks (trans_id, trans_date) values ('105', '2019-09-18')
```

### Pandas Code

```python
# transactions data
data = [[101, 'US', 'approved', 1000, '2019-05-18'], [102, 'US', 'declined', 2000, '2019-05-19'], 
        [103, 'US', 'approved', 3000, '2019-06-10'], [104, 'US', 'declined', 4000, '2019-06-13'], 
        [105, 'US', 'approved', 5000, '2019-06-15']]

transactions = pd.DataFrame(data, 
                            columns=['id', 'country', 'state', 'amount', 'trans_date']) \
                           .astype({'id':'Int64', 'country':'object', 'state':'object', 
                                    'amount':'Int64', 'trans_date':'datetime64[ns]'})

# chargebacks data
data = [[102, '2019-05-29'], [101, '2019-06-30'], [105, '2019-09-18']]

# chargebacks dataframe
chargebacks = pd.DataFrame(data, 
                           columns=['trans_id', 'trans_date']) \
                          .astype({'trans_id':'Int64', 'trans_date':'datetime64[ns]'})
```