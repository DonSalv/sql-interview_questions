# Sales Person

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SALESPERSON`

| Column Name     | Type    |
|-----------------|---------|
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |

`sales_id` is the primary key (column with unique values) for this table.
Each row of this table indicates the `name` and the `ID` of a salesperson alongside their `salary`, 
`commission rate`, and `hire date`.

**Table**: `COMPANY`

| Column Name | Type    |
|-------------|---------|
| com_id      | int     |
| name        | varchar |
| city        | varchar |

`com_id` is the primary key (column with unique values) for this table.
Each row of this table indicates the `name` and the `ID` of a company and the `city` in which the 
company is located.

**Table**: `ORDERS`

| Column Name | Type |
|-------------|------|
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |

`order_id` is the primary key (column with unique values) for this table.
`com_id` is a foreign key (reference column) to com_id from the Company table.
`sales_id` is a foreign key (reference column) to sales_id from the SalesPerson table.
Each row of this table contains information about one order. This includes the `ID` of the company, 
the `ID` of the salesperson, the `date` of the order, and the `amount` paid.

## Task

Write a solution to find the names of all the salespersons who did not have any orders related to the 
company with the name `"RED"`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 

SALESPERSON table:

| sales_id | name | salary | commission_rate | hire_date  |
|----------|------|--------|-----------------|------------|
| 1        | John | 100000 | 6               | 4/1/2006   |
| 2        | Amy  | 12000  | 5               | 5/1/2010   |
| 3        | Mark | 65000  | 12              | 12/25/2008 |
| 4        | Pam  | 25000  | 25              | 1/1/2005   |
| 5        | Alex | 5000   | 10              | 2/3/2007   |

COMPANY table:

| com_id | name   | city     |
|--------|--------|----------|
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |

ORDERS table:

| order_id | order_date | com_id | sales_id | amount |
|----------|------------|--------|----------|--------|
| 1        | 1/1/2014   | 3      | 4        | 10000  |
| 2        | 2/1/2014   | 4      | 5        | 5000   |
| 3        | 3/1/2014   | 1      | 1        | 50000  |
| 4        | 4/1/2014   | 1      | 4        | 25000  |

Output: 

| name |
|------|
| Amy  |
| Mark |
| Alex |

## Explanation ##

According to orders `3` and `4` in the `orders` table, it is easy to tell that only salesperson 
`John` and `Pam` have sales to company `RED`, so we report all the other names in the table salesperson.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date)
Create table If Not Exists Company (com_id int, name varchar(255), city varchar(255))
Create table If Not Exists Orders (order_id int, order_date date, com_id int, sales_id int, amount int)

-- Populate the salesperson table    
Truncate table SalesPerson
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '4/1/2006')
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '5/1/2010')
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '12/25/2008')
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '1/1/2005')
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2/3/2007')

-- Populate the company table
Truncate table Company
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston')
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York')
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston')
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin')

-- Populate the orders table
Truncate table Orders
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', '1/1/2014', '3', '4', '10000')
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', '2/1/2014', '4', '5', '5000')
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', '3/1/2014', '1', '1', '50000')
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', '4/1/2014', '1', '4', '25000')
```

### Pandas Code

```python
# sales_person data
data = [[1, 'John', 100000, 6, '4/1/2006'], 
        [2, 'Amy', 12000, 5, '5/1/2010'], 
        [3, 'Mark', 65000, 12, '12/25/2008'], 
        [4, 'Pam', 25000, 25, '1/1/2005'], 
        [5, 'Alex', 5000, 10, '2/3/2007']]

# sales_person dataframe
sales_person = pd.DataFrame(data, 
                            columns=['sales_id', 'name', 'salary', 'commission_rate', 'hire_date']) \
                            .astype({'sales_id':'Int64', 
                                     'name':'object', 
                                     'salary':'Int64', 
                                     'commission_rate':'Int64', 
                                     'hire_date':'datetime64[ns]'})

# company data
data = [[1, 'RED', 'Boston'], 
        [2, 'ORANGE', 'New York'], 
        [3, 'YELLOW', 'Boston'], 
        [4, 'GREEN', 'Austin']]

# company dataframe
company = pd.DataFrame(data, 
                       columns=['com_id', 'name', 'city']) \
                       .astype({'com_id':'Int64', 
                                'name':'object', 
                                'city':'object'})

# orders data
data = [[1, '1/1/2014', 3, 4, 10000], 
        [2, '2/1/2014', 4, 5, 5000], 
        [3, '3/1/2014', 1, 1, 50000], 
        [4, '4/1/2014', 1, 4, 25000]]

# orders dataframe
orders = pd.DataFrame(data, 
                      columns=['order_id', 'order_date', 'com_id', 'sales_id', 'amount']) \
                      .astype({'order_id':'Int64', 
                               'order_date':'datetime64[ns]', 
                               'com_id':'Int64', 
                               'sales_id':'Int64', 
                               'amount':'Int64'})

```