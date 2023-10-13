# Find the Missing IDs

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `Customers`

| Column Name   | Type    |
|---------------|---------|
| customer_id   | int     |
| customer_name | varchar |

`customer_id` is the column with unique values for this table.

Each row of this table contains the name and the id customer.

## Task

Write a solution to find the missing customer IDs. The missing IDs are ones that are not in the `CUSTOMERS` table but 
are in the range between `1` and the **maximum** `customer_id` present in the table.

Notice that the maximum `customer_id` will not exceed `100`.

**Return** the result table ordered by `ids` in ascending order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMERS table:

| customer_id | customer_name |
|-------------|---------------|
| 1           | Alice         |
| 4           | Bob           |
| 5           | Charlie       |

Output: 

| ids |
|-----|
| 2   |
| 3   |

## Explanation ##

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the customers table
Create table If Not Exists Customers (customer_id int, customer_name varchar(20))

-- Populate the customers table    
Truncate table Customers
insert into Customers (customer_id, customer_name) values ('1', 'Alice')
insert into Customers (customer_id, customer_name) values ('4', 'Bob')
insert into Customers (customer_id, customer_name) values ('5', 'Charlie')
```