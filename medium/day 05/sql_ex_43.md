# Customers Who Bought Products A and B but Not C

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMERS`

| Column Name   | Type    |
|---------------|---------|
| customer_id   | int     |
| customer_name | varchar |

`customer_id` is the column with unique values for this table.

`customer_name` is the `name` of the customer.

**Table**: `ORDERS`

| Column Name  | Type    |
|--------------|---------|
| order_id     | int     |
| customer_id  | int     |
| product_name | varchar |

`order_id` is the column with unique values for this table.

`customer_id` is the `id` of the customer who bought the product `"product_name"`.

## Task

Write a solution to report the customer_id and customer_name of customers who bought products "**A**", "**B**" but did not 
buy the product "**C**" since we want to recommend them to purchase this product.

**Return** the result table ordered by `customer_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMERS table:

| customer_id | customer_name |
|-------------|---------------|
| 1           | Daniel        |
| 2           | Diana         |
| 3           | Elizabeth     |
| 4           | Jhon          |

ORDERS table:

| order_id | customer_id | product_name |
|----------|-------------|--------------|
| 10       | 1           | A            |
| 20       | 1           | B            |
| 30       | 1           | D            |
| 40       | 1           | C            |
| 50       | 2           | A            |
| 60       | 3           | A            |
| 70       | 3           | B            |
| 80       | 3           | D            |
| 90       | 4           | C            |

Output: 

| customer_id | customer_name |
|-------------|---------------|
| 3           | Elizabeth     |

## Explanation ##

Only the `customer_id` with id `3` bought the product `A` and `B` but not the product `C`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customers (customer_id int, customer_name varchar(30))
Create table If Not Exists Orders (order_id int, customer_id int, product_name varchar(30))

-- Populate the customers table    
Truncate table Customers
insert into Customers (customer_id, customer_name) values ('1', 'Daniel')
insert into Customers (customer_id, customer_name) values ('2', 'Diana')
insert into Customers (customer_id, customer_name) values ('3', 'Elizabeth')
insert into Customers (customer_id, customer_name) values ('4', 'Jhon')

-- Populate the orders table    
Truncate table Orders
insert into Orders (order_id, customer_id, product_name) values ('10', '1', 'A')
insert into Orders (order_id, customer_id, product_name) values ('20', '1', 'B')
insert into Orders (order_id, customer_id, product_name) values ('30', '1', 'D')
insert into Orders (order_id, customer_id, product_name) values ('40', '1', 'C')
insert into Orders (order_id, customer_id, product_name) values ('50', '2', 'A')
insert into Orders (order_id, customer_id, product_name) values ('60', '3', 'A')
insert into Orders (order_id, customer_id, product_name) values ('70', '3', 'B')
insert into Orders (order_id, customer_id, product_name) values ('80', '3', 'D')
insert into Orders (order_id, customer_id, product_name) values ('90', '4', 'C')
```

### Pandas Code

```python
# customers data
data = [[1, 'Daniel'], [2, 'Diana'], [3, 'Elizabeth'], [4, 'Jhon']]

# customers dataframe
customers = pd.DataFrame(data, 
                         columns=['customer_id', 'customer_name']) \
                        .astype({'customer_id':'Int64', 'customer_name':'object'})

# orders data
data = [[10, 1, 'A'], [20, 1, 'B'], [30, 1, 'D'], [40, 1, 'C'], [50, 2, 'A'], [60, 3, 'A'], 
        [70, 3, 'B'], [80, 3, 'D'], [90, 4, 'C']]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'customer_id', 'product_name']) \
                     .astype({'order_id':'Int64', 'customer_id':'Int64', 'product_name':'object'})
```