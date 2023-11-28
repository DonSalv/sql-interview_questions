# Market Analysis II
- 
- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `USERS`

| Column Name    | Type    |
|----------------|---------|
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |

`user_id` is the primary key (column with unique values) of this table.

This table has the info of the users of an online shopping website where users can sell and buy items.

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| order_date  | date |
| item_id     | int  |
| buyer_id    | int  |
| seller_id   | int  |

`order_id` is the primary key (column with unique values) of this table.

`item_id` is a foreign key (reference column) to the `ITEMS` table.

`buyer_id` and `seller_id` are foreign keys to the Users table.

**Table**: `ITEMS`

| Column Name | Type    |
|-------------|---------|
| item_id     | int     |
| item_brand  | varchar |

`item_id` is the primary key (column with unique values) of this table.

## Task

Write a solution to find for each seller if they sell their favorite brand. Use boolean values `yes` if the favorite 
brand was sold or `no` for other case.

**Return** the result table order `by seller_id`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
USERS table:

| user_id | join_date  | favorite_brand |
|---------|------------|----------------|
| 1       | 2019-01-01 | Lenovo         |
| 2       | 2019-02-09 | Samsung        |
| 3       | 2019-01-19 | LG             |
| 4       | 2019-05-21 | HP             |

ORDERS table:

| order_id | order_date | item_id | buyer_id | seller_id |
|----------|------------|---------|----------|-----------|
| 1        | 2019-08-01 | 4       | 1        | 2         |
| 2        | 2019-08-02 | 2       | 1        | 3         |
| 3        | 2019-08-03 | 3       | 2        | 3         |
| 4        | 2019-08-04 | 1       | 4        | 2         |
| 5        | 2019-08-04 | 1       | 3        | 4         |
| 6        | 2019-08-05 | 2       | 2        | 4         |

ITEMS table:

| item_id | item_brand |
|---------|------------|
| 1       | Samsung    |
| 2       | Lenovo     |
| 3       | LG         |
| 4       | HP         |

Output: 

| seller_id | 2nd_item_fav_brand |
|-----------|--------------------|
| 1         | no                 |
| 2         | yes                |
| 3         | yes                |
| 4         | no                 |

## Explanation ##

- The answer for the user with `id 1` is no because they sold nothing.
- The answer for the users with `id 2` and `3` is yes because the brands of their second sold items are their 
favorite brands.
- The answer for the user with `id 4` is no because the brand of their second sold item is not their favorite brand.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Users (user_id int, join_date date, favorite_brand varchar(10))
Create table If Not Exists Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int)
Create table If Not Exists Items (item_id int, item_brand varchar(10))

-- Populate the users table    
Truncate table Users
insert into Users (user_id, join_date, favorite_brand) values ('1', '2019-01-01', 'Lenovo')
insert into Users (user_id, join_date, favorite_brand) values ('2', '2019-02-09', 'Samsung')
insert into Users (user_id, join_date, favorite_brand) values ('3', '2019-01-19', 'LG')
insert into Users (user_id, join_date, favorite_brand) values ('4', '2019-05-21', 'HP')

-- Populate the orders table    
Truncate table Orders
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('1', '2019-08-01', '4', '1', '2')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('2', '2019-08-02', '2', '1', '3')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('3', '2019-08-03', '3', '2', '3')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('4', '2019-08-04', '1', '4', '2')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('5', '2019-08-04', '1', '3', '4')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('6', '2019-08-05', '2', '2', '4')

-- Populate the items table    
Truncate table Items
insert into Items (item_id, item_brand) values ('1', 'Samsung')
insert into Items (item_id, item_brand) values ('2', 'Lenovo')
insert into Items (item_id, item_brand) values ('3', 'LG')
insert into Items (item_id, item_brand) values ('4', 'HP')
```

### Pandas Code

```python
# users data
data = [[1, '2019-01-01', 'Lenovo'], [2, '2019-02-09', 'Samsung'], [3, '2019-01-19', 'LG'], [4, '2019-05-21', 'HP']]

# users dataframe
users = pd.DataFrame(data,
                     columns=['user_id', 'join_date', 'favorite_brand']) \
                    .astype({'user_id':'Int64', 'join_date':'datetime64[ns]', 'favorite_brand':'object'})

# orders data
data = [[1, '2019-08-01', 4, 1, 2], [2, '2019-08-02', 2, 1, 3], [3, '2019-08-03', 3, 2, 3], 
        [4, '2019-08-04', 1, 4, 2], [5, '2019-08-04', 1, 3, 4], [6, '2019-08-05', 2, 2, 4]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'order_date', 'item_id', 'buyer_id', 'seller_id']) \
                     .astype({'order_id':'Int64', 'order_date':'datetime64[ns]', 'item_id':'Int64', 'buyer_id':'Int64', 'seller_id':'Int64'})

# items data
data = [[1, 'Samsung'], [2, 'Lenovo'], [3, 'LG'], [4, 'HP']]

# items dataframe
items = pd.DataFrame(data, 
                     columns=['item_id', 'item_brand']) \
                    .astype({'item_id':'Int64', 'item_brand':'object'})
```