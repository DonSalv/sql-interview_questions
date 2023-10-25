# Total Sales Amount by Year

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

`product_id` is the primary key (column with unique values) for this table.

`product_name` is the name of the product.

**Table**: `SALES`

| Column Name         | Type |
|---------------------|------|
| product_id          | int  |
| period_start        | date |
| period_end          | date |
| average_daily_sales | int  |

`product_id` is the primary key (column with unique values) for this table. 

`period_start` and `period_end` indicate the start and end date for the sales period, and both dates are inclusive.

The `average_daily_sales` column holds the average daily sales amount of the items for the period.

The dates of the sales years are between 2018 to 2020.

## Task

Write a solution to report the total sales amount of each item for each year, with corresponding `product_name`, 
`product_id`, `report_year`, and `total_amount`.

**Return** the result table ordered by `product_id` and `report_year`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PRODUCT table:

| product_id | product_name |
|------------|--------------|
| 1          | LC Phone     |
| 2          | LC T-Shirt   |
| 3          | LC Keychain  |

SALES table:

| product_id | period_start | period_end | average_daily_sales |
|------------|--------------|------------|---------------------|
| 1          | 2019-01-25   | 2019-02-28 | 100                 |
| 2          | 2018-12-01   | 2020-01-01 | 10                  |
| 3          | 2019-12-01   | 2020-01-31 | 1                   |

Output: 

| product_id | product_name | report_year | total_amount |
|------------|--------------|-------------|--------------|
| 1          | LC Phone     | 2019        | 3500         |
| 2          | LC T-Shirt   | 2018        | 310          |
| 2          | LC T-Shirt   | 2019        | 3650         |
| 2          | LC T-Shirt   | 2020        | 10           |
| 3          | LC Keychain  | 2019        | 31           |
| 3          | LC Keychain  | 2020        | 31           |

## Explanation ##

- `LC Phone` was sold for the period of `2019-01-25` to `2019-02-28`, and there are `35` days for this period. 
Total amount 35*100 = `3500`. 
- `LC T-shirt` was sold for the period of `2018-12-01` to `2020-01-01`, and there are `31`, `365`, 
1 days for years 2018, 2019 and 2020 respectively.
- `LC Keychain` was sold for the period of `2019-12-01` to `2020-01-31`, and there are `31`, 
31 days for years 2019 and 2020 respectively.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Product (product_id int, product_name varchar(30))
Create table If Not Exists Sales (product_id int, period_start date, period_end date, average_daily_sales int)

-- Populate the product table    
Truncate table Product
insert into Product (product_id, product_name) values ('1', 'LC Phone ')
insert into Product (product_id, product_name) values ('2', 'LC T-Shirt')
insert into Product (product_id, product_name) values ('3', 'LC Keychain')

-- Populate the sales table    
Truncate table Sales
insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('1', '2019-01-25', '2019-02-28', '100')
insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('2', '2018-12-01', '2020-01-01', '10')
insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('3', '2019-12-01', '2020-01-31', '1')
```

### Pandas Code

```python
# product data
data = [[1, 'LC Phone '], [2, 'LC T-Shirt'], [3, 'LC Keychain']]

# product dataframe
product = pd.DataFrame(data, 
                       columns=['product_id', 'product_name']) \
                      .astype({'product_id':'Int64', 'product_name':'object'})

# sales data
data = [[1, '2019-01-25', '2019-02-28', 100], [2, '2018-12-01', '2020-01-01', 10], 
        [3, '2019-12-01', '2020-01-31', 1]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['product_id', 'period_start', 'period_end', 'average_daily_sales']) \
                    .astype({'product_id':'Int64', 'period_start':'datetime64[ns]', 
                             'period_end':'datetime64[ns]', 'average_daily_sales':'Int64'})
```