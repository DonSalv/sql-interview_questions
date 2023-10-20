# Count Salary Categories

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ACCOUNTS`

| Column Name | Type |
|-------------|------|
| account_id  | int  |
| income      | int  |

`account_id` is the primary key (column with unique values) for this table.

Each row contains information about the monthly income for one bank account.

## Task

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:
- `"Low Salary"`: All the salaries **strictly less** than `$20000`.
- `"Average Salary"`: All the salaries in the **inclusive** range `[$20000, $50000]`.
- `"High Salary"`: All the salaries **strictly greater** than `$50000`.

The result table `must` contain all three categories. If there are no accounts in a category, return `0`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ACCOUNTS table:

| account_id | income |
|------------|--------|
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |

Output: 

| category       | accounts_count |
|----------------|----------------|
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |

## Explanation ##

- Low Salary: Account `2`.
- Average Salary: No accounts.
- High Salary: Accounts `3`, `6`, and `8`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the accounts table
Create table If Not Exists Accounts (account_id int, income int)

-- Populate the accounts table    
Truncate table Accounts
insert into Accounts (account_id, income) values ('3', '108939')
insert into Accounts (account_id, income) values ('2', '12747')
insert into Accounts (account_id, income) values ('8', '87709')
insert into Accounts (account_id, income) values ('6', '91796')
```

### Pandas Code

```python
# accounts data
data = [[3, 108939], [2, 12747], [8, 87709], [6, 91796]]

# accounts dataframe
accounts = pd.DataFrame(data, 
                        columns=['account_id', 'income']) \
                       .astype({'account_id':'Int64', 'income':'Int64'})
```