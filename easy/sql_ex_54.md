# Unique Orders and Customers Per Month

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| order_date  | date |
| customer_id | int  |
| invoice     | int  |

`order_id` is the column with unique values for this table.

This table contains information about the orders made by `customer_id`.

## Task

Write a solution to find the number of **unique orders** and the number of **unique customers** with 
`invoices > $20` for each **different month**.

**Return** the result table sorted in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ORDERS table:

| order_id | order_date | customer_id | invoice |
|----------|------------|-------------|---------|
| 1        | 2020-09-15 | 1           | 30      |
| 2        | 2020-09-17 | 2           | 90      |
| 3        | 2020-10-06 | 3           | 20      |
| 4        | 2020-10-20 | 3           | 21      |
| 5        | 2020-11-10 | 1           | 10      |
| 6        | 2020-11-21 | 2           | 15      |
| 7        | 2020-12-01 | 4           | 55      |
| 8        | 2020-12-03 | 4           | 77      |
| 9        | 2021-01-07 | 3           | 31      |
| 10       | 2021-01-15 | 2           | 20      |

Output: 

| month   | order_count | customer_count |
|---------|-------------|----------------|
| 2020-09 | 2           | 2              |
| 2020-10 | 1           | 1              |
| 2020-12 | 2           | 1              |
| 2021-01 | 1           | 1              |

## Explanation ##

- In `September 2020` we have two orders from `2` different customers with `invoices > $20`.
- In `October 2020` we have two orders from `1` customer, and only one of the two orders has `invoice > $20`.
- In `November 2020` we have two orders from `2` different customers but `invoices < $20`, so we don't include that month.
- In `December 2020` we have two orders from `1` customer both with `invoices > $20`.
- In `January 2021` we have two orders from `2` different customers, but only one of them with `invoice > $20`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the orders table
Create table If Not Exists Orders (order_id int, order_date date, customer_id int, invoice int)

-- Populate the orders table
Truncate table Orders
insert into Orders (order_id, order_date, customer_id, invoice) values ('1', '2020-09-15', '1', '30')
insert into Orders (order_id, order_date, customer_id, invoice) values ('2', '2020-09-17', '2', '90')
insert into Orders (order_id, order_date, customer_id, invoice) values ('3', '2020-10-06', '3', '20')
insert into Orders (order_id, order_date, customer_id, invoice) values ('4', '2020-10-20', '3', '21')
insert into Orders (order_id, order_date, customer_id, invoice) values ('5', '2020-11-10', '1', '10')
insert into Orders (order_id, order_date, customer_id, invoice) values ('6', '2020-11-21', '2', '15')
insert into Orders (order_id, order_date, customer_id, invoice) values ('7', '2020-12-01', '4', '55')
insert into Orders (order_id, order_date, customer_id, invoice) values ('8', '2020-12-03', '4', '77')
insert into Orders (order_id, order_date, customer_id, invoice) values ('9', '2021-01-07', '3', '31')
insert into Orders (order_id, order_date, customer_id, invoice) values ('10', '2021-01-15', '2', '20')
```

### Pandas Code

```python
# orders data
data = [[1, '2020-09-15', 1, 30], [2, '2020-09-17', 2, 90], [3, '2020-10-06', 3, 20], 
        [4, '2020-10-20', 3, 21], [5, '2020-11-10', 1, 10], [6, '2020-11-21', 2, 15], 
        [7, '2020-12-01', 4, 55], [8, '2020-12-03', 4, 77], [9, '2021-01-07', 3, 31], 
        [10, '2021-01-15', 2, 20]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'order_date', 'customer_id', 'invoice']) \
                     .astype({'order_id':'Int64', 'order_date':'datetime64[ns]', 
                              'customer_id':'Int64', 'invoice':'Int64'})
```