# Products With Three or More Orders in Two Consecutive Years

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ORDERS`

| Column Name   | Type |
|---------------|------|
| order_id      | int  |
| product_id    | int  |
| quantity      | int  |
| purchase_date | date |

`order_id` contains unique values.

Each row in this table contains the ID of an `order`, the id of the `product` purchased, 
the `quantity`, and the purchase `date`.

## Task

Write a solution to report the IDs of all the products that were ordered three or more times in 
two consecutive years.

**Return** the result table in any order.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
ORDERS table:

| order_id | product_id | quantity | purchase_date |
|----------|------------|----------|---------------|
| 1        | 1          | 7        | 2020-03-16    |
| 2        | 1          | 4        | 2020-12-02    |
| 3        | 1          | 7        | 2020-05-10    |
| 4        | 1          | 6        | 2021-12-23    |
| 5        | 1          | 5        | 2021-05-21    |
| 6        | 1          | 6        | 2021-10-11    |
| 7        | 2          | 6        | 2022-10-11    |

Output: 

| product_id |
|------------|
| 1          |

## Explanation ##

- Product `1` was ordered in `2020` three times and in `2021` three times. Since it was ordered three 
times in two consecutive years, we include it in the answer.
- Product `2` was ordered one time in `2022`. We do not include it in the answer.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the orders table
Create table If Not Exists Orders (order_id int, product_id int, quantity int, purchase_date date)

-- Populate the orders table    
Truncate table Orders
insert into Orders (order_id, product_id, quantity, purchase_date) values ('1', '1', '7', '2020-03-16')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('2', '1', '4', '2020-12-02')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('3', '1', '7', '2020-05-10')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('4', '1', '6', '2021-12-23')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('5', '1', '5', '2021-05-21')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('6', '1', '6', '2021-10-11')
insert into Orders (order_id, product_id, quantity, purchase_date) values ('7', '2', '6', '2022-10-11')
```

### Pandas Code

```python
# orders data
data = [[1, 1, 7, '2020-03-16'], [2, 1, 4, '2020-12-02'], [3, 1, 7, '2020-05-10'], 
        [4, 1, 6, '2021-12-23'], [5, 1, 5, '2021-05-21'], [6, 1, 6, '2021-10-11'], 
        [7, 2, 6, '2022-10-11']]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'product_id', 'quantity', 'purchase_date']) \
                     .astype({'order_id':'Int64', 'product_id':'Int64', 'quantity':'Int64', 
                              'purchase_date':'datetime64[ns]'})
```