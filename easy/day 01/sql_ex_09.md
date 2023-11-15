# Customer Placing the Largest Number of Orders

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ORDERS`

| Column Name     | Type |
|-----------------|------|
| order_number    | int  |
| customer_number | int  |

`order_number` is the primary key (column with unique values) for this table.
This table contains information about the order ID and the customer ID.

## Task

Write a solution to find the `customer_number` for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Orders table:

| order_number | customer_number |
|--------------|-----------------|
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |

Output: 

| customer_number |
|-----------------|
| 3               |

## Explanation ##

The customer with number `3` has two orders, which is greater than either customer `1` or `2` because each of them only 
has one order. So the result is `customer_number` 3.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the orders table
Create table If Not Exists orders (order_number int, customer_number int)

-- Populate the orders table    
Truncate table orders
insert into orders (order_number, customer_number) values ('1', '1')
insert into orders (order_number, customer_number) values ('2', '2')
insert into orders (order_number, customer_number) values ('3', '3')
insert into orders (order_number, customer_number) values ('4', '3')
```

### Pandas Code

```python
# orders data
data = [[1, 1], 
        [2, 2], 
        [3, 3], 
        [4, 3]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_number', 'customer_number']) \
                      .astype({'order_number':'Int64', 
                               'customer_number':'Int64'})
```