# Customers Who Bought All Products

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMER`

| Column Name | Type |
|-------------|------|
| customer_id | int  |
| product_key | int  |

This table may contain duplicates rows. 

`customer_id` is not `NULL`.

`product_key` is a foreign key (reference column) to `PRODUCT` table.

**Table**: `PRODUCT`

| Column Name | Type |
|-------------|------|
| product_key | int  |

`product_key` is the primary key (column with unique values) for this table.

## Task

Write a solution to report the customer ids from the `CUSTOMER` table that bought all the products in the `PRODUCT` table.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMER table:

| customer_id | product_key |
|-------------|-------------|
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |

PRODUCT table:

| product_key |
|-------------|
| 5           |
| 6           |

Output: 

| customer_id |
|-------------|
| 1           |
| 3           |

## Explanation ##

The customers who bought all the products (`5` and `6`) are customers with `ID`s `1` and `3`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customer (customer_id int, product_key int)
Create table Product (product_key int)

-- Populate the customer table    
Truncate table Customer
insert into Customer (customer_id, product_key) values ('1', '5')
insert into Customer (customer_id, product_key) values ('2', '6')
insert into Customer (customer_id, product_key) values ('3', '5')
insert into Customer (customer_id, product_key) values ('3', '6')
insert into Customer (customer_id, product_key) values ('1', '6')
    
-- Populate the product table
Truncate table Product
insert into Product (product_key) values ('5')
insert into Product (product_key) values ('6')
```

### Pandas Code

```python
# customer dada
data = [[1, 5], [2, 6], [3, 5], [3, 6], [1, 6]]

# customer dataframe
customer = pd.DataFrame(data, 
                        columns=['customer_id', 'product_key']) \
                       .astype({'customer_id':'Int64', 'product_key':'Int64'})

# product data
data = [[5], [6]]

# product dataframe
product = pd.DataFrame(data, 
                       columns=['product_key']) \
                      .astype({'product_key':'Int64'})
```