# Fix Product Name Format

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALES`

| Column Name  | Type    |
|--------------|---------|
| sale_id      | int     |
| product_name | varchar |
| sale_date    | date    |

`sale_id` is the column with unique values for this table.

Each row of this table contains the product name and the date it was sold.

## Task

Since table Sales was filled manually in the year `2000`, `product_name` may contain leading and/or 
trailing white spaces, also they are case-insensitive.

Write a solution to report

- `product_name` in lowercase without leading or trailing white spaces.
- `sale_date` in the format `('YYYY-MM')`.
- `total` the number of times the product was sold in this month.

**Return** the result table ordered by `product_name` in **ascending order**. 
In case of a tie, order it by `sale_date` in **ascending order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SALES table:

| sale_id | product_name | sale_date  |
|---------|--------------|------------|
| 1       | LCPHONE      | 2000-01-16 |
| 2       | LCPhone      | 2000-01-17 |
| 3       | LcPhOnE      | 2000-02-18 |
| 4       | LCKeyCHAiN   | 2000-02-19 |
| 5       | LCKeyChain   | 2000-02-28 |
| 6       | Matryoshka   | 2000-03-31 |

Output: 

| product_name | sale_date | total |
|--------------|-----------|-------|
| lckeychain   | 2000-02   | 2     |
| lcphone      | 2000-01   | 2     |
| lcphone      | 2000-02   | 1     |
| matryoshka   | 2000-03   | 1     |

## Explanation ##

- In `January`, `2 LcPhones` were sold. Please note that the product names are not case sensitive 
and may contain spaces.
- In `February`, `2 LCKeychains` and `1 LCPhone` were sold.
- In `March`, `one matryoshka` was sold.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the sales table
Create table If Not Exists Sales (sale_id int, product_name varchar(30), sale_date date)

-- Populate the sales table
Truncate table Sales
insert into Sales (sale_id, product_name, sale_date) values ('1', 'LCPHONE', '2000-01-16')
insert into Sales (sale_id, product_name, sale_date) values ('2', 'LCPhone', '2000-01-17')
insert into Sales (sale_id, product_name, sale_date) values ('3', 'LcPhOnE', '2000-02-18')
insert into Sales (sale_id, product_name, sale_date) values ('4', 'LCKeyCHAiN', '2000-02-19')
insert into Sales (sale_id, product_name, sale_date) values ('5', 'LCKeyChain', '2000-02-28')
insert into Sales (sale_id, product_name, sale_date) values ('6', 'Matryoshka', '2000-03-31')
```

### Pandas Code

```python
# sales data
data = [[1, 'LCPHONE', '2000-01-16'], [2, 'LCPhone', '2000-01-17'], [3, 'LcPhOnE', '2000-02-18'], 
        [4, 'LCKeyCHAiN', '2000-02-19'], [5, 'LCKeyChain', '2000-02-28'], [6, 'Matryoshka', '2000-03-31']]

# sales datafrane
sales = pd.DataFrame(data, 
                     columns=['sale_id', 'product_name', 'sale_date']) \
                    .astype({'sale_id':'Int64', 'product_name':'object', 'sale_date':'datetime64[ns]'})
```