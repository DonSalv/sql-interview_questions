# Customer Order Frequency

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMERS`

| Column Name | Type    |
|-------------|---------|
| customer_id | int     |
| name        | varchar |
| country     | varchar |

`customer_id` is the column with unique values for this table. 

This table contains information about the customers in the company.

**Table**: `PRODUCT`

| Column Name | Type    |
|-------------|---------|
| product_id  | int     |
| description | varchar |
| price       | int     |

`product_id` is the column with unique values for this table.

`price` is the product cost.

 This table contains information on the products in the company.

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| customer_id | int  |
| product_id  | int  |
| order_date  | date |
| quantity    | int  |

`order_id` is the column with unique values for this table.

`customer_id` is the id of the customer who bought `"quantity"` products with id `"product_id"`.

`order_date` is the date in format `('YYYY-MM-DD')` when the order was shipped.

This table contains information on customer orders.

## Task

Write a solution to report the `customer_id` and `customer_name` of customers who have spent at least `$100` in each
month of **June and July 2020**.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMERS table:

| customer_id | name     | country |
|-------------|----------|---------|
| 1           | Winston  | USA     |
| 2           | Jonathan | Peru    |
| 3           | Moustafa | Egypt   |

PRODUCT table:

| product_id | description | price |
|------------|-------------|-------|
| 10         | LC Phone    | 300   |
| 20         | LC T-Shirt  | 10    |
| 30         | LC Book     | 45    |
| 40         | LC Keychain | 2     |

Orders table:

| order_id | customer_id | product_id | order_date | quantity |
|----------|-------------|------------|------------|----------|
| 1        | 1           | 10         | 2020-06-10 | 1        |
| 2        | 1           | 20         | 2020-07-01 | 1        |
| 3        | 1           | 30         | 2020-07-08 | 2        |
| 4        | 2           | 10         | 2020-06-15 | 2        |
| 5        | 2           | 40         | 2020-07-01 | 10       |
| 6        | 3           | 20         | 2020-06-24 | 2        |
| 7        | 3           | 30         | 2020-06-25 | 2        |
| 9        | 3           | 30         | 2020-05-08 | 3        |

Output: 

| customer_id | name    |  
|-------------|---------|
| 1           | Winston |

## Explanation ##

- `Winston` spent `$300` `(300 * 1)` in `June` and `$100 ( 10 * 1 + 45 * 2)` in `July 2020`.
- `Jonathan` spent `$600` `(300 * 2)` in `June` and `$20 ( 2 * 10)` in `July 2020`.
- `Moustafa` spent `$110` `(10 * 2 + 45 * 2)` in `June` and `$0` in `July 2020`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customers (customer_id int, name varchar(30), country varchar(30))
Create table If Not Exists Product (product_id int, description varchar(30), price int)
Create table If Not Exists Orders (order_id int, customer_id int, product_id int, order_date date, quantity int)

-- Populate the customers table
Truncate table Customers
insert into Customers (customer_id, name, country) values ('1', 'Winston', 'USA')
insert into Customers (customer_id, name, country) values ('2', 'Jonathan', 'Peru')
insert into Customers (customer_id, name, country) values ('3', 'Moustafa', 'Egypt')
    
-- Populate the product table
Truncate table Product
insert into Product (product_id, description, price) values ('10', 'LC Phone', '300')
insert into Product (product_id, description, price) values ('20', 'LC T-Shirt', '10')
insert into Product (product_id, description, price) values ('30', 'LC Book', '45')
insert into Product (product_id, description, price) values ('40', 'LC Keychain', '2')

-- Populate the orders table    
Truncate table Orders
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('1', '1', '10', '2020-06-10', '1')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('2', '1', '20', '2020-07-01', '1')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('3', '1', '30', '2020-07-08', '2')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('4', '2', '10', '2020-06-15', '2')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('5', '2', '40', '2020-07-01', '10')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('6', '3', '20', '2020-06-24', '2')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('7', '3', '30', '2020-06-25', '2')
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('9', '3', '30', '2020-05-08', '3')
```

### Pandas Code

```python
# customers data
data = [[1, 'Winston', 'USA'], [2, 'Jonathan', 'Peru'], [3, 'Moustafa', 'Egypt']]

# customers dataframe
customers = pd.DataFrame(data, 
                         columns=['customer_id', 'name', 'country']) \
                        .astype({'customer_id':'Int64', 'name':'object', 'country':'object'})

# product data
data = [[10, 'LC Phone', 300], [20, 'LC T-Shirt', 10], [30, 'LC Book', 45], [40, 'LC Keychain', 2]]

# product dataframe
product = pd.DataFrame(data,
                       columns=['product_id', 'description', 'price']) \
                      .astype({'product_id':'Int64', 'description':'object', 'price':'Int64'})

# orders data
data = [[1, 1, 10, '2020-06-10', 1], [2, 1, 20, '2020-07-01', 1], 
        [3, 1, 30, '2020-07-08', 2], [4, 2, 10, '2020-06-15', 2], 
        [5, 2, 40, '2020-07-01', 10], [6, 3, 20, '2020-06-24', 2], 
        [7, 3, 30, '2020-06-25', 2], [9, 3, 30, '2020-05-08', 3]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'customer_id', 'product_id', 'order_date', 'quantity']) \
                     .astype({'order_id':'Int64', 'customer_id':'Int64', 'product_id':'Int64', 
                              'order_date':'datetime64[ns]', 'quantity':'Int64'})
```
