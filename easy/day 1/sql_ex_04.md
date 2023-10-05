# Customers Who Never Order

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMERS`

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key (column with unique values) for this table.
Each row of this table indicates the `ID` and `name` of a customer.

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| id          | int  |
| customerId  | int  |

`id` is the primary key (column with unique values) for this table.
`customerId` is a foreign key (reference columns) of the ID from the `CUSTOMERS` table.
Each row of this table indicates the `ID` of an `order` and the `ID` of the `customer` who ordered it.

## Task

Write a solution to find all customers who never order anything.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Customers table:

| id   | name  |
|------|-------|
| 1    | Joe   |
| 2    | Henry |
| 3    | Sam   |
| 4    | Max   |

Orders table:

| id  | customerId |
|-----|------------|
| 1   | 3          |
| 2   | 1          |

Output: 

| Customers |
|-----------|
| Henry     |
| Max       |

## Explanation ##

No explanation provided

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Customers (id int, name varchar(255))
Create table If Not Exists Orders (id int, customerId int)

-- Populate the customers table
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')

-- Populate the orders table
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')
```

### Pandas Code

```python
# customers data
data = [[1, 'Joe'], 
        [2, 'Henry'], 
        [3, 'Sam'], 
        [4, 'Max']]

# customers dataframe
customers = pd.DataFrame(data, 
                         columns=['id', 'name']) \
                         .astype({'id':'Int64', 
                                  'name':'object'})

# orders data
data = [[1, 3], 
        [2, 1]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['id', 'customerId']) \
                      .astype({'id':'Int64', 
                               'customerId':'Int64'})
```