# Unpopular Books

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `BOOKS`

| Column Name    | Type    |

| book_id        | int     |
| name           | varchar |
| available_from | date    |

`book_id` is the primary key (column with unique values) of this table.

**Table**: `ORDERS`

| Column Name    | Type    |

| order_id       | int     |
| book_id        | int     |
| quantity       | int     |
| dispatch_date  | date    |

`order_id` is the primary key (column with unique values) of this table.
`book_id` is a foreign key (reference column) to the `BOOKS` table.

## Task

Write a solution to report the **books** that have sold **less than** `10` copies in the last year, excluding books that 
have been available for less than one month from today. **Assume today is** `2019-06-23`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
BOOKS table:

| book_id | name               | available_from |
|---------|--------------------|----------------|
| 1       | "Kalila And Demna" | 2010-01-01     |
| 2       | "28 Letters"       | 2012-05-12     |
| 3       | "The Hobbit"       | 2019-06-10     |
| 4       | "13 Reasons Why"   | 2019-06-01     |
| 5       | "The Hunger Games" | 2008-09-21     |

ORDERS table:

| order_id | book_id | quantity | dispatch_date |
|----------|---------|----------|---------------|
| 1        | 1       | 2        | 2018-07-26    |
| 2        | 1       | 1        | 2018-11-05    |
| 3        | 3       | 8        | 2019-06-11    |
| 4        | 4       | 6        | 2019-06-05    |
| 5        | 4       | 5        | 2019-06-20    |
| 6        | 5       | 9        | 2009-02-02    |
| 7        | 5       | 8        | 2010-04-13    |

Output: 

| book_id | name               |
|---------|--------------------|
| 1       | "Kalila And Demna" |
| 2       | "28 Letters"       |
| 5       | "The Hunger Games" |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Books (book_id int, name varchar(50), available_from date)
Create table If Not Exists Orders (order_id int, book_id int, quantity int, dispatch_date date)

-- Populate the books table    
Truncate table Books
insert into Books (book_id, name, available_from) values ('1', 'Kalila And Demna', '2010-01-01')
insert into Books (book_id, name, available_from) values ('2', '28 Letters', '2012-05-12')
insert into Books (book_id, name, available_from) values ('3', 'The Hobbit', '2019-06-10')
insert into Books (book_id, name, available_from) values ('4', '13 Reasons Why', '2019-06-01')
insert into Books (book_id, name, available_from) values ('5', 'The Hunger Games', '2008-09-21')
    
-- Populate the orders table
Truncate table Orders
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('1', '1', '2', '2018-07-26')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('2', '1', '1', '2018-11-05')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('3', '3', '8', '2019-06-11')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('4', '4', '6', '2019-06-05')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('5', '4', '5', '2019-06-20')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('6', '5', '9', '2009-02-02')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('7', '5', '8', '2010-04-13')
```

### Pandas Code
[sql_ex_25.md](sql_ex_25.md)
```python
# books data
data = [[1, 'Kalila And Demna', '2010-01-01'], [2, '28 Letters', '2012-05-12'], 
        [3, 'The Hobbit', '2019-06-10'], [4, '13 Reasons Why', '2019-06-01'], [5, 'The Hunger Games', '2008-09-21']]

# books dataframe
books = pd.DataFrame(data, 
                     columns=['book_id', 'name', 'available_from']) \
                    .astype({'book_id':'Int64', 'name':'object', 'available_from':'datetime64[ns]'})

# orders data
data = [[1, 1, 2, '2018-07-26'], [2, 1, 1, '2018-11-05'], [3, 3, 8, '2019-06-11'], 
        [4, 4, 6, '2019-06-05'], [5, 4, 5, '2019-06-20'], [6, 5, 9, '2009-02-02'], [7, 5, 8, '2010-04-13']]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'book_id', 'quantity', 'dispatch_date']) \
                     .astype({'order_id':'Int64', 'book_id':'Int64', 'quantity':'Int64', 
                              'dispatch_date':'datetime64[ns]'})
```