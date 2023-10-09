# Product Sales Analysis V

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALES`

| Column Name | Type |
|-------------|------|
| sale_id     | int  |
| product_id  | int  |
| user_id     | int  |
| quantity    | int  |

`sale_id` contains unique values.

`product_id` is a foreign key (column with unique values) to `PRODUCT` table.

Each row of this table shows the ID of the `product` and the `quantity` purchased by a `user`.

**Table**: `PRODUCT`

| Column Name | Type |
|-------------|------|
| product_id  | int  |
| price       | int  |

`product_id` contains unique values.

Each row of this table indicates the `price` of each product.

## Task

Write a solution to report the spending of each user.

Return the resulting table ordered by `spending` in **descending order**. 
In case of a tie, order them by `user_id` in **ascending order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALES table:

| sale_id | product_id | user_id | quantity |
|---------|------------|---------|----------|
| 1       | 1          | 101     | 10       |
| 2       | 2          | 101     | 1        |
| 3       | 3          | 102     | 3        |
| 4       | 3          | 102     | 2        |
| 5       | 2          | 103     | 3        |

PRODUCT table:

| product_id | price |
|------------|-------|
| 1          | 10    |
| 2          | 25    |
| 3          | 15    |

Output: 

| user_id | spending |
|---------|----------|
| 101     | 125      |
| 102     | 75       |
| 103     | 75       |

## Explanation ##

- User `101` spent `10 * 10 + 1 * 25 = 125.`
- User `102` spent `3 * 15 + 2 * 15 = 75`.
- User `103` spent `3 * 25 = 75`.
- Users `102` and `103` spent the same amount and we break the tie by their ID while user `101` is on the top.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Sales (sale_id int, product_id int, user_id int, quantity int)
Create table If Not Exists Product (product_id int, price int)

-- Populate the sales table    
Truncate table Sales
insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10')
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '2', '101', '1')
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '3', '102', '3')
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '3', '102', '2')
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '2', '103', '3')

-- Populate the product table    
Truncate table Product
insert into Product (product_id, price) values ('1', '10')
insert into Product (product_id, price) values ('2', '25')
insert into Product (product_id, price) values ('3', '15')
```

### Pandas Code

```python
# sales data
data = [[1, 1, 101, 10], [2, 2, 101, 1], [3, 3, 102, 3], [4, 3, 102, 2], [5, 2, 103, 3]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['sale_id', 'product_id', 'user_id', 'quantity']) \
                    .astype({'sale_id':'Int64', 'product_id':'Int64', 
                             'user_id':'Int64', 'quantity':'Int64'})

# products data
data = [[1, 10], [2, 25], [3, 15]]

# products dataframe
product = pd.DataFrame(data, 
                       columns=['product_id', 'price']) \
                      .astype({'product_id':'Int64', 'price':'Int64'})
```