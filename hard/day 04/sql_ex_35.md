# Generate the Invoice

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PRODUCTS`

| Column Name | Type |

| product_id  | int  |
| price       | int  |

`product_id` contains unique values.

Each row in this table shows the ID of a product and the `price` of one unit.

**Table**: `PURCHASES`

| Column Name | Type |

| invoice_id  | int  |
| product_id  | int  |
| quantity    | int  |

`(invoice_id, product_id)` is the primary key (combination of columns with unique values) for this table.

Each row in this table shows the `quantity` ordered from one product in an `invoice`. 

## Task

Write a solution to show the details of the invoice with the highest price. If two or more invoices have 
the same price, return the details of the one with the smallest `invoice_id`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
PRODUCTS table:

| product_id | price |
|------------|-------|
| 1          | 100   |
| 2          | 200   |

PURCHASES table:

| invoice_id | product_id | quantity |
|------------|------------|----------|
| 1          | 1          | 2        |
| 3          | 2          | 1        |
| 2          | 2          | 3        |
| 2          | 1          | 4        |
| 4          | 1          | 10       |

Output: 

| product_id | quantity | price |
|------------|----------|-------|
| 2          | 3        | 600   |
| 1          | 4        | 400   |

## Explanation ##

- `Invoice 1`: `price` = (2 * 100) = `$200`
- `Invoice 2`: `price` = (4 * 100) + (3 * 200) = `$1000`
- `Invoice 3`: `price` = (1 * 200) = `$200`
- `Invoice 4`: `price` = (10 * 100) = `$1000`

The highest price is `$1000`, and the invoices with the highest prices are `2` and `4`. 
We return the details of the one with the smallest ID, which is invoice `2`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Crate the tables
Create table If Not Exists Products (product_id int, price int)
Create table If Not Exists Purchases (invoice_id int, product_id int, quantity int)

-- Populate the products table    
Truncate table Products
insert into Products (product_id, price) values ('1', '100')
insert into Products (product_id, price) values ('2', '200')

-- Populate the purchases table    
Truncate table Purchases
insert into Purchases (invoice_id, product_id, quantity) values ('1', '1', '2')
insert into Purchases (invoice_id, product_id, quantity) values ('3', '2', '1')
insert into Purchases (invoice_id, product_id, quantity) values ('2', '2', '3')
insert into Purchases (invoice_id, product_id, quantity) values ('2', '1', '4')
insert into Purchases (invoice_id, product_id, quantity) values ('4', '1', '10')
```

### Pandas Code

```python
# products data
data = [[1, 100], [2, 200]]

# products dataframe
products = pd.DataFrame(data, 
                        columns=['product_id', 'price']) \
                       .astype({'product_id':'Int64', 'price':'Int64'})

# purchases data
data = [[1, 1, 2], [3, 2, 1], [2, 2, 3], [2, 1, 4], [4, 1, 10]]

# purchases dataframe
purchases = pd.DataFrame(data, 
                         columns=['invoice_id', 'product_id', 'quantity']) \
                        .astype({'invoice_id':'Int64', 'product_id':'Int64', 'quantity':'Int64'})
```