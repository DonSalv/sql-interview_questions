# Recyclable and Low Fat Products

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PRODUCTS`

| Column Name | Type |
|-------------|------|
| product_id  | int  |
| low_fats    | enum |
| recyclable  | enum |

`product_id` is the primary key (column with unique values) for this table.

`low_fats` is an `ENUM` (category) of type `('Y', 'N')` where `'Y'` means this product is low fat 
and `'N'` means it is not.

`recyclable` is an `ENUM` (category) of types `('Y', 'N')` where `'Y'` means this product is 
recyclable and `'N'` means it is not.

## Task

Write a solution to find the ids of products that are both low fat and recyclable.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PRODUCTS table:

| product_id | low_fats | recyclable |
|------------|----------|------------|
| 0          | Y        | N          |
| 1          | Y        | Y          |
| 2          | N        | Y          |
| 3          | Y        | Y          |
| 4          | N        | N          |

Output: 

| product_id |
|------------|
| 1          |
| 3          |

## Explanation ##

Only products `1` and `3` are both low fat and recyclable.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the products table
Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))

-- Populate the prodcuts table
Truncate table Products
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')
```

### Pandas Code

```python
# products data
data = [['0', 'Y', 'N'], ['1', 'Y', 'Y'], ['2', 'N', 'Y'], ['3', 'Y', 'Y'], ['4', 'N', 'N']]

# products dataframe
products = pd.DataFrame(data, 
                        columns=['product_id', 'low_fats', 'recyclable']) \
                       .astype({'product_id':'int64', 'low_fats':'category', 'recyclable':'category'})
```