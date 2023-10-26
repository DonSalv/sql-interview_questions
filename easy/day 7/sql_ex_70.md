# Product's Price for Each Store

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

Table: Products

| Column Name | Type |
|-------------|------|
| product_id  | int  |
| store       | enum |
| price       | int  |

In `SQL`, `(product_id, store)` is the primary key for this table.

`store` is a category of type `('store1', 'store2', 'store3')` where each represents the store this product is 
available at.

`price` is the price of the product at this store.

## Task

Find the price of each product in each store.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PRODUCTS table:

| product_id | store  | price |
|------------|--------|-------|
| 0          | store1 | 95    |
| 0          | store3 | 105   |
| 0          | store2 | 100   |
| 1          | store1 | 70    |
| 1          | store3 | 80    |

Output: 

| product_id | store1 | store2 | store3 |
|------------|--------|--------|--------|
| 0          | 95     | 100    | 105    |
| 1          | 70     | null   | 80     |

## Explanation ##

- Product `0` price's are `95` for `store1`, `100` for `store2` and, `105` for `store3`.
- Product `1` price's are `70` for `store1`, `80` for `store3` and, it's not sold in `store2`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the products table
Create table If Not Exists Products (product_id int, store ENUM('store1', 'store2', 'store3'), price int)

-- Populate the products table    
Truncate table Products
insert into Products (product_id, store, price) values ('0', 'store1', '95')
insert into Products (product_id, store, price) values ('0', 'store3', '105')
insert into Products (product_id, store, price) values ('0', 'store2', '100')
insert into Products (product_id, store, price) values ('1', 'store1', '70')
insert into Products (product_id, store, price) values ('1', 'store3', '80')
```

### Pandas Code

```python
# products data
data = [['0', 'store1', '95'], ['0', 'store3', '105'], ['0', 'store2', '100'], 
        ['1', 'store1', '70'], ['1', 'store3', '80']]

# products dataframe
products = pd.DataFrame(data, 
                        columns=['product_id', 'store', 'price']) \
                       .astype({'product_id':'Int64', 'store':'category', 'price':'Int64'})
```