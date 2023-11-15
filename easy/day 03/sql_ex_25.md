# Sales Analysis II

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PRODUCT`

| Column Name  | Type    |
|--------------|---------|
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |

`product_id` is the primary key (column with unique values) of this table.
Each row of this table indicates the `name` and the `price` of each product.

**Table**: `SALES`

| Column Name | Type |
|-------------|------|
| seller_id   | int  |
| product_id  | int  |
| buyer_id    | int  |
| sale_date   | date |
| quantity    | int  |
| price       | int  |

This table can have repeated rows.
`product_id` is a foreign key (reference column) to the `PRODUCT` table.
`buyer_id` is never NULL. 
`sale_date` is never NULL. 
Each row of this table contains some information about one sale.

## Task

Write a solution to report the **buyers** who have bought *S8* but not *iPhone*. 
Note that *S8* and *iPhone* are products presented in the `PRODUCT` table.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PRODUCT table:

| product_id | product_name | unit_price |
|------------|--------------|------------|
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |

SALES table:

| seller_id | product_id | buyer_id | sale_date  | quantity | price |
|-----------|------------|----------|------------|----------|-------|
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |

Output: 

| buyer_id |
|----------|
| 1        |

## Explanation ##

The buyer with `id = 1` bought an *S8* but did not buy an *iPhone*. 
The buyer with `id=3` bought both.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Product (product_id int, product_name varchar(10), unit_price int)
Create table If Not Exists Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int)
    
-- Populate the product table
Truncate table Product
insert into Product (product_id, product_name, unit_price) values ('1', 'S8', '1000')
insert into Product (product_id, product_name, unit_price) values ('2', 'G4', '800')
insert into Product (product_id, product_name, unit_price) values ('3', 'iPhone', '1400')
    
-- Pooulate the sales table
Truncate table Sales
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '1', '1', '2019-01-21', '2', '2000')
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('1', '2', '2', '2019-02-17', '1', '800')
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('2', '2', '3', '2019-06-02', '1', '800')
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values ('3', '3', '4', '2019-05-13', '2', '2800')
```

### Pandas Code

```python
# product data
data = [[1, 'S8', 1000], 
        [2, 'G4', 800], 
        [3, 'iPhone', 1400]]

# product dataframe
product = pd.DataFrame(data, 
                       columns=['product_id', 'product_name', 'unit_price']) \
                       .astype({'product_id':'Int64', 
                                'product_name':'object', 
                                'unit_price':'Int64'})

# sales data
data = [[1, 1, 1, '2019-01-21', 2, 2000], 
        [1, 2, 2, '2019-02-17', 1, 800],
        [2, 2, 3, '2019-06-02', 1, 800],
        [3, 3, 4, '2019-05-13', 2, 2800]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['seller_id', 'product_id', 'buyer_id', 'sale_date', 'quantity', 'price']) \
                     .astype({'seller_id':'Int64', 
                              'product_id':'Int64', 
                              'buyer_id':'Int64', 
                              'sale_date':'datetime64[ns]', 
                              'quantity':'Int64', 
                              'price':'Int64'})
```
