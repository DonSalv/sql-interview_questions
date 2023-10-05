# NPV Queries

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `NPV`

| Column Name | Type |
|-------------|------|
| id          | int  |
| year        | int  |
| npv         | int  |

`(id, year)` is the primary key (combination of columns with unique values) of this table.
The table has information about the `id` and the `year` of each inventory and 
the corresponding net present value.

**Table**: `QUERIES`

| Column Name | Type |
|-------------|------|
| id          | int  |
| year        | int  |

`(id, year)` is the primary key (combination of columns with unique values) of this table.
The table has information about the `id` and the `year` of each inventory query.

## Task

Write a solution to find the `npv` of each query of the `QUERIES` table.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
NPV table:

| id  | year | npv |
|-----|------|-----|
| 1   | 2018 | 100 |
| 7   | 2020 | 30  |
| 13  | 2019 | 40  |
| 1   | 2019 | 113 |
| 2   | 2008 | 121 |
| 3   | 2009 | 12  |
| 11  | 2020 | 99  |
| 7   | 2019 | 0   |

Queries table:

| id  | year |
|-----|------|
| 1   | 2019 |
| 2   | 2008 |
| 3   | 2009 |
| 7   | 2018 |
| 7   | 2019 |
| 7   | 2020 |
| 13  | 2019 |

Output: 

| id  | year | npv |
|-----|------|-----|
| 1   | 2019 | 113 |
| 2   | 2008 | 121 |
| 3   | 2009 | 12  |
| 7   | 2018 | 0   |
| 7   | 2019 | 0   |
| 7   | 2020 | 30  |
| 13  | 2019 | 40  |

## Explanation ##

- The `npv` value of `(7, 2018)` is not present in the `NPV` table, we consider it `0`.
- The `npv` values of all other queries can be found in the `NPV` table.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create Table If Not Exists NPV (id int, year int, npv int)
Create Table If Not Exists Queries (id int, year int)
    
-- Populate the npv table
Truncate table NPV
insert into NPV (id, year, npv) values ('1', '2018', '100')
insert into NPV (id, year, npv) values ('7', '2020', '30')
insert into NPV (id, year, npv) values ('13', '2019', '40')
insert into NPV (id, year, npv) values ('1', '2019', '113')
insert into NPV (id, year, npv) values ('2', '2008', '121')
insert into NPV (id, year, npv) values ('3', '2009', '21')
insert into NPV (id, year, npv) values ('11', '2020', '99')
insert into NPV (id, year, npv) values ('7', '2019', '0')
    
-- Populate the queries table
Truncate table Queries
insert into Queries (id, year) values ('1', '2019')
insert into Queries (id, year) values ('2', '2008')
insert into Queries (id, year) values ('3', '2009')
insert into Queries (id, year) values ('7', '2018')
insert into Queries (id, year) values ('7', '2019')
insert into Queries (id, year) values ('7', '2020')
insert into Queries (id, year) values ('13', '2019')
```

### Pandas Code

```python
# nov data
data = [[1, 2018, 100], [7, 2020, 30], 
        [13, 2019, 40], [1, 2019, 113], 
        [2, 2008, 121], [3, 2009, 21], 
        [11, 2020, 99], [7, 2019, 0]]

# npv dataframe
npv = pd.DataFrame(data, 
                   columns=['id', 'year', 'npv']) \
                   .astype({'id':'Int64', 
                            'year':'Int64', 
                            'npv':'Int64'})

# queries data
data = [[1, 2019], [2, 2008], [3, 2009], [7, 2018], 
        [7, 2019], [7, 2020], [13, 2019]]

# queries dataframe
queries = pd.DataFrame(data, 
                       columns=['id', 'year']) \
                       .astype({'id':'Int64', 
                                'year':'Int64'})
```
