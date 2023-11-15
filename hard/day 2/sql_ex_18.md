# Sales by Day of the Week

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ORDERS`

| Column Name | Type    |
|-------------|---------|
| order_id    | int     |
| customer_id | int     |
| order_date  | date    | 
| item_id     | varchar |
| quantity    | int     |

`(ordered_id, item_id)` is the primary key (combination of columns with unique values) for this table.

This table contains information on the orders placed.

`order_date` is the date `item_id` was ordered by the customer with id `customer_id`.

**Table**: `ITEMS`

| Column Name   | Type    |
|---------------|---------|
| item_id       | varchar |
| item_name     | varchar |
| item_category | varchar |

`item_id` is the primary key (column with unique values) for this table.

`item_name` is the name of the item.

`item_category` is the category of the item.

## Task

You are the business owner and would like to obtain a sales report for category items and the day of the week.

Write a solution to report how many units in each category have been ordered on each **day of the week**.

**Return** the result table ordered by `category`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ORDERS table:

| order_id | customer_id | order_date | item_id | quantity |
|----------|-------------|------------|---------|----------|
| 1        | 1           | 2020-06-01 | 1       | 10       |
| 2        | 1           | 2020-06-08 | 2       | 10       |
| 3        | 2           | 2020-06-02 | 1       | 5        |
| 4        | 3           | 2020-06-03 | 3       | 5        |
| 5        | 4           | 2020-06-04 | 4       | 1        |
| 6        | 4           | 2020-06-05 | 5       | 5        |
| 7        | 5           | 2020-06-05 | 1       | 10       |
| 8        | 5           | 2020-06-14 | 4       | 5        |
| 9        | 5           | 2020-06-21 | 3       | 5        |

ITEMS table:

| item_id | item_name      | item_category |
|---------|----------------|---------------|
| 1       | LC Alg. Book   | Book          |
| 2       | LC DB. Book    | Book          |
| 3       | LC SmarthPhone | Phone         |
| 4       | LC Phone 2020  | Phone         |
| 5       | LC SmartGlass  | Glasses       |
| 6       | LC T-Shirt XL  | T-Shirt       |

Output: 

| Category | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
|----------|--------|---------|-----------|----------|--------|----------|--------|
| Book     | 20     | 5       | 0         | 0        | 10     | 0        | 0      |
| Glasses  | 0      | 0       | 0         | 0        | 5      | 0        | 0      |
| Phone    | 0      | 0       | 5         | 1        | 0      | 0        | 10     |
| T-Shirt  | 0      | 0       | 0         | 0        | 0      | 0        | 0      |

## Explanation ##

- On `Monday` (`2020-06-01`, `2020-06-08`) were sold a total of `20` units (10 + 10) in the category `Book` (ids: 1, 2).
- On `Tuesday` (`2020-06-02`) were sold a total of `5` units in the category `Book` (ids: 1, 2).
- On `Wednesday` (`2020-06-03`) were sold a total of `5` units in the category `Phone` (ids: 3, 4).
- On `Thursday` (`2020-06-04`) were sold a total of `1` unit in the category `Phone` (ids: 3, 4).
- On `Friday` (`2020-06-05`) were sold 10 units in the category `Book` (ids: 1, 2) and 5 units in `Glasses` (ids: 5).
- On `Saturday` there are no items sold.
- On `Sunday` (`2020-06-14`, `2020-06-21`) were sold a total of `10` units (5 +5) in the category `Phone` (ids: 3, 4).
There are no sales of T-shirts.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Orders (order_id int, customer_id int, order_date date, item_id varchar(30), quantity int)
Create table If Not Exists Items (item_id varchar(30), item_name varchar(30), item_category varchar(30))

-- Populate the orders table    
Truncate table Orders
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('1', '1', '2020-06-01', '1', '10')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('2', '1', '2020-06-08', '2', '10')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('3', '2', '2020-06-02', '1', '5')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('4', '3', '2020-06-03', '3', '5')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('5', '4', '2020-06-04', '4', '1')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('6', '4', '2020-06-05', '5', '5')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('7', '5', '2020-06-05', '1', '10')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('8', '5', '2020-06-14', '4', '5')
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('9', '5', '2020-06-21', '3', '5')

-- Populate the items table    
Truncate table Items
insert into Items (item_id, item_name, item_category) values ('1', 'LC Alg. Book', 'Book')
insert into Items (item_id, item_name, item_category) values ('2', 'LC DB. Book', 'Book')
insert into Items (item_id, item_name, item_category) values ('3', 'LC SmarthPhone', 'Phone')
insert into Items (item_id, item_name, item_category) values ('4', 'LC Phone 2020', 'Phone')
insert into Items (item_id, item_name, item_category) values ('5', 'LC SmartGlass', 'Glasses')
insert into Items (item_id, item_name, item_category) values ('6', 'LC T-Shirt XL', 'T-shirt')
```

### Pandas Code

```python
# orders data
data = [[1, 1, '2020-06-01', 1, 10], [2, 1, '2020-06-08', 2, 10], 
        [3, 2, '2020-06-02', 1, 5], [4, 3, '2020-06-03', 3, 5], 
        [5, 4, '2020-06-04', 4, 1], [6, 4, '2020-06-05', 5, 5],
        [7, 5, '2020-06-05', 1, 10], [8, 5, '2020-06-14', 4, 5], [9, 5, '2020-06-21', 3, 5]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'customer_id', 'order_date', 'item_id', 'quantity']) \
                     .astype({'order_id':'Int64', 'customer_id':'Int64', 'order_date':'datetime64[ns]', 
                              'item_id':'object', 'quantity':'Int64'})

# items data
data = [[1, 'LC Alg. Book', 'Book'], [2, 'LC DB. Book', 'Book'], [3, 'LC SmarthPhone', 'Phone'], 
        [4, 'LC Phone 2020', 'Phone'], [5, 'LC SmartGlass', 'Glasses'], [6, 'LC T-Shirt XL', 'T-shirt']]

# items dataframe
items = pd.DataFrame(data, 
                     columns=['item_id', 'item_name', 'item_category']) \
                    .astype({'item_id':'object', 'item_name':'object', 'item_category':'object'})
```