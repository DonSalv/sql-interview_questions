# Calculate the Influence of Each Salesperson

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALESPERSON`

| Column Name    | Type    |

| salesperson_id | int     |
| name           | varchar |

`salesperson_id` contains unique values.

Each row in this table shows the ID of a `salesperson`.

**Table**: `CUSTOMER`

| Column Name    | Type |
|----------------|------|
| customer_id    | int  |
| salesperson_id | int  |

`customer_id` contains unique values.

`salesperson_id` is a foreign key (reference column) from the `SALESPERSON` table.

Each row in this table shows the ID of a `customer` and the ID of the `salesperson`. 

**Table**: `SALES`

| Column Name | Type |
|-------------|------|
| sale_id     | int  |
| customer_id | int  |
| price       | int  |

`sale_id` contains unique values.

`customer_id` is a foreign key (reference column) from the `CUSTOMER` table.

Each row in this table shows ID of a `customer` and the `price` they paid for the sale with `sale_id`.

## Task

Write a solution to report the sum of prices paid by the customers of each salesperson. 
If a salesperson does not have any customers, the total value should be `0`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
SALESPERSON table:

| salesperson_id | name  |
|----------------|-------|
| 1              | Alice |
| 2              | Bob   |
| 3              | Jerry |

CUSTOMER table:

| customer_id | salesperson_id |
|-------------|----------------|
| 1           | 1              |
| 2           | 1              |
| 3           | 2              |

SALES table:

| sale_id | customer_id | price |
|---------|-------------|-------|
| 1       | 2           | 892   |
| 2       | 1           | 354   |
| 3       | 3           | 988   |
| 4       | 3           | 856   |

Output: 

| salesperson_id | name  | total |
|----------------|-------|-------|
| 1              | Alice | 1246  |
| 2              | Bob   | 1844  |
| 3              | Jerry | 0     |

## Explanation ##

`Alice` is the salesperson for customers 1 and 2.
  - Customer 1 made one purchase with `354`.
  - Customer 2 made one purchase with `892`.
The total for `Alice` is 354 + 892 = `1246`.

`Bob` is the salesperson for customers 3.
  - Customer 1 made one purchase with `988` and `856`.
The total for `Bob` is 988 + 856 = `1844`.

`Jerry` is not the salesperson of any customer.
The total for `Jerry` is `0`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Salesperson (salesperson_id int, name varchar(30))
Create table If Not Exists Customer (customer_id int, salesperson_id int)
Create table If Not Exists Sales (sale_id int, customer_id int, price int)

-- Populate the salesperson table    
Truncate table Salesperson
insert into Salesperson (salesperson_id, name) values ('1', 'Alice')
insert into Salesperson (salesperson_id, name) values ('2', 'Bob')
insert into Salesperson (salesperson_id, name) values ('3', 'Jerry')

-- Populate the customer table    
Truncate table Customer
insert into Customer (customer_id, salesperson_id) values ('1', '1')
insert into Customer (customer_id, salesperson_id) values ('2', '1')
insert into Customer (customer_id, salesperson_id) values ('3', '2')

-- Populate the sales table    
Truncate table Sales
insert into Sales (sale_id, customer_id, price) values ('1', '2', '892')
insert into Sales (sale_id, customer_id, price) values ('2', '1', '354')
insert into Sales (sale_id, customer_id, price) values ('3', '3', '988')
insert into Sales (sale_id, customer_id, price) values ('4', '3', '856')
```

### Pandas Code

```python
# salesperson data
data = [[1, 'Alice'], [2, 'Bob'], [3, 'Jerry']]

# salesperson dataframe
salesperson = pd.DataFrame(data, 
                           columns=['salesperson_id', 'name']) \
                          .astype({'salesperson_id':'Int64', 'name':'object'})

# customer data
data = [[1, 1], [2, 1], [3, 2]]

# customer dataframe
customer = pd.DataFrame(data, 
                        columns=['customer_id', 'salesperson_id']) \
                       .astype({'customer_id':'Int64', 'salesperson_id':'Int64'})

# sales data
data = [[1, 2, 892], [2, 1, 354], [3, 3, 988], [4, 3, 856]]

# sales dataframe
sales = pd.DataFrame(data, 
                     columns=['sale_id', 'customer_id', 'price']) \
                    .astype({'sale_id':'Int64', 'customer_id':'Int64', 'price':'Int64'})
```