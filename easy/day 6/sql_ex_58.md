# Sellers With No Sales

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMER`

| Column Name   | Type    |
|---------------|---------|
| customer_id   | int     |
| customer_name | varchar |

`customer_id` is the column with unique values for this table.

Each row of this table contains the information of each customer in the WebStore.

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| sale_date   | date |
| order_cost  | int  |
| customer_id | int  |
| seller_id   | int  |

`order_id` is the column with unique values for this table.

`sale_date` is the date when the transaction was made between the customer `(customer_id)`
 and the seller `(seller_id)`.

Each row of this table contains all orders made in the webstore.

**Table**: `SELLER`

| Column Name | Type    |
|-------------|---------|
| seller_id   | int     |
| seller_name | varchar |

`seller_id` is the column with unique values for this table.

Each row of this table contains the information of each seller.

## Task

Write a solution to report the names of all sellers who did not make any sales in `2020`.

Return the result table ordered by `seller_name` in **ascending order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMER table:

| customer_id | customer_name |
|-------------|---------------|
| 101         | Alice         |
| 102         | Bob           |
| 103         | Charlie       |

ORDERS table:

| order_id | sale_date  | order_cost | customer_id | seller_id |
|----------|------------|------------|-------------|-----------|
| 1        | 2020-03-01 | 1500       | 101         | 1         |
| 2        | 2020-05-25 | 2400       | 102         | 2         |
| 3        | 2019-05-25 | 800        | 101         | 3         |
| 4        | 2020-09-13 | 1000       | 103         | 2         |
| 5        | 2019-02-11 | 700        | 101         | 2         |

SELLER table:

| seller_id | seller_name |
|-----------|-------------|
| 1         | Daniel      |
| 2         | Elizabeth   |
| 3         | Frank       |

Output: 

| seller_name |
|-------------|
| Frank       |

## Explanation ##

- `Daniel` made `1` sale in `March 2020`.
- `Elizabeth` made `2` sales in `2020` and 1 sale in `2019`.
- `Frank` made `1` sale in `2019` but no sales in `2020`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customer (customer_id int, customer_name varchar(20))
Create table If Not Exists Orders (order_id int, sale_date date, order_cost int, customer_id int, seller_id int)
Create table If Not Exists Seller (seller_id int, seller_name varchar(20))

-- Populate the customer table
Truncate table Customer
insert into Customer (customer_id, customer_name) values ('101', 'Alice')
insert into Customer (customer_id, customer_name) values ('102', 'Bob')
insert into Customer (customer_id, customer_name) values ('103', 'Charlie')
    
-- Populate the orders table
Truncate table Orders
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('1', '2020-03-01', '1500', '101', '1')
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('2', '2020-05-25', '2400', '102', '2')
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('3', '2019-05-25', '800', '101', '3')
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('4', '2020-09-13', '1000', '103', '2')
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values ('5', '2019-02-11', '700', '101', '2')

-- Populate the seller table
Truncate table Seller
insert into Seller (seller_id, seller_name) values ('1', 'Daniel')
insert into Seller (seller_id, seller_name) values ('2', 'Elizabeth')
insert into Seller (seller_id, seller_name) values ('3', 'Frank')
```

### Pandas Code

```python
# customer data
data = [[101, 'Alice'], [102, 'Bob'], [103, 'Charlie']]

# customer dataframe
customer = pd.DataFrame(data,
                        columns=['customer_id', 'customer_name']) \
                       .astype({'customer_id':'Int64', 'customer_name':'object'})

# orders data
data = [[1, '2020-03-01', 1500, 101, 1], [2, '2020-05-25', 2400, 102, 2], 
        [3, '2019-05-25', 800, 101, 3], [4, '2020-09-13', 1000, 103, 2], 
        [5, '2019-02-11', 700, 101, 2]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'sale_date', 'order_cost', 'customer_id', 'seller_id']) \
                     .astype({'order_id':'Int64', 'sale_date':'datetime64[ns]', 
                              'order_cost':'Int64', 'customer_id':'Int64', 
                              'seller_id':'Int64'})

# seller data
data = [[1, 'Daniel'], [2, 'Elizabeth'], [3, 'Frank']]

# seller dataframe
seller = pd.DataFrame(data, 
                      columns=['seller_id', 'seller_name']) \
                     .astype({'seller_id':'Int64', 'seller_name':'object'})
```