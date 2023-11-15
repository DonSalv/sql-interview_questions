#  Product Sales Analysis IV

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

`product_id` is a foreign key (reference column) to Product table.

Each row of this table shows the ID of the product and the quantity purchased by a user.

**Table**: `PRODUCT`

| Column Name | Type |
|-------------|------|
| product_id  | int  |
| price       | int  |

`product_id` contains unique values.

Each row of this table indicates the price of each product.

## Task

Write a solution that reports for each user the product id on which the user spent the most money. 
In case the same user spent the most money on two or more products, report all of them.

**Return** the resulting table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALES table:

| sale_id | product_id | user_id | quantity |
|---------|------------|---------|----------|
| 1       | 1          | 101     | 10       |
| 2       | 3          | 101     | 7        |
| 3       | 1          | 102     | 9        |
| 4       | 2          | 102     | 6        |
| 5       | 3          | 102     | 10       |
| 6       | 1          | 102     | 6        |

PRODUCT table:

| product_id | price |
|------------|-------|
| 1          | 10    |
| 2          | 25    |
| 3          | 15    |

Output: 

| user_id | product_id |
|---------|------------|
| 101     | 3          |
| 102     | 1          |
| 102     | 2          |
| 102     | 3          | 

## Explanation ##

User 101:
- Spent 10 * 10 = `100` on product `1`.
- Spent 7 * 15 = `105` on product `3`.
User 101 spent the most money on product `3`.
User 102:
- Spent (9 + 7) * 10 = `150` on product `1`.
- Spent 6 * 25 = `150` on product `2`.
- Spent 10 * 15 = `150` on product `3`.

User 102 spent the most money on products 1, 2, and 3.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Sales (sale_id int, product_id int, user_id int, quantity int)
Create table If Not Exists Product (product_id int, price int)

-- Populate the sales table    
Truncate table Sales
insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10')
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '3', '101', '7')
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '1', '102', '9')
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '2', '102', '6')
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '3', '102', '10')
insert into Sales (sale_id, product_id, user_id, quantity) values ('6', '1', '102', '6')
    
-- Populate the product table
Truncate table Product
insert into Product (product_id, price) values ('1', '10')
insert into Product (product_id, price) values ('2', '25')
insert into Product (product_id, price) values ('3', '15')
```

### Pandas Code

```python
# sales data
data = [[1, 1, 101, 10], [2, 3, 101, 7], [3, 1, 102, 9], [4, 2, 102, 6], [5, 3, 102, 10], [6, 1, 102, 6]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['sale_id', 'product_id', 'user_id', 'quantity']) \
                    .astype({'sale_id':'Int64', 'product_id':'Int64', 'user_id':'Int64', 'quantity':'Int64'})

# product data
data = [[1, 10], [2, 25], [3, 15]]

# product dataframe
product = pd.DataFrame(data, 
                       columns=['product_id', 'price']) \
                      .astype({'product_id':'Int64', 'price':'Int64'})
```