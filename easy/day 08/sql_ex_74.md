# Find Customers With Positive Revenue this Year

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `CUSTOMERS`

| Column Name | Type |
|-------------|------|
| customer_id | int  |
| year        | int  |
| revenue     | int  |

`(customer_id, year)` is the primary key (combination of columns with unique values) for this table.

This table contains the `customer ID` and the `revenue` of customers in different years.

Note that this revenue can be negative.

## Task

Write a solution to report the customers with positive revenue in the `year 2021`.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
CUSTOMERS table:

| customer_id | year | revenue |
|-------------|------|---------|
| 1           | 2018 | 50      |
| 1           | 2021 | 30      |
| 1           | 2020 | 70      |
| 2           | 2021 | -50     |
| 3           | 2018 | 10      |
| 3           | 2016 | 50      |
| 4           | 2021 | 20      |

Output: 

| customer_id |
|-------------|
| 1           |
| 4           |

## Explanation ##

- Customer `1` has revenue equal to `30` in the `year 2021`.
- Customer `2` has revenue equal to `-50` in the `year 2021`.
- Customer `3` has no revenue in the `year 2021`.
- Customer `4` has revenue equal to `20` in the `year 2021`.
- Thus only customers `1` and `4` have positive revenue in the `year 2021`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the customers table
Create table If Not Exists Customers (customer_id int, year int, revenue int)

-- Populate the customers table    
Truncate table Customers
insert into Customers (customer_id, year, revenue) values ('1', '2018', '50')
insert into Customers (customer_id, year, revenue) values ('1', '2021', '30')
insert into Customers (customer_id, year, revenue) values ('1', '2020', '70')
insert into Customers (customer_id, year, revenue) values ('2', '2021', '-50')
insert into Customers (customer_id, year, revenue) values ('3', '2018', '10')
insert into Customers (customer_id, year, revenue) values ('3', '2016', '50')
insert into Customers (customer_id, year, revenue) values ('4', '2021', '20')
```

### Pandas Code

```python
# customers data
data = [['1', '2018', '50'], ['1', '2021', '30'], ['1', '2020', '70'], 
        ['2', '2021', '-50'], ['3', '2018', '10'], ['3', '2016', '50'], 
        ['4', '2021', '20']]

# customers dataframe
customers = pd.DataFrame(data, 
                         columns=['customer_id', 'year', 'revenue']) \
                        .astype({'customer_id':'Int64', 'year':'Int64', 'revenue':'Int64'})
```