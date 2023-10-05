# Combine Two Tables

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: ```PERSON```

| Column Name | Type     |
|-------------|----------|
| personId    | int      |
| lastName    | varchar  |
| firstName   | varchar  |

```personId``` is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.

**Table**: ```ADDRESS```

| Column Name | Type    |
|-------------|---------|
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |

```addressId``` is the primary key (column with unique values) for this table. 
Each row of this table contains information about the ```city``` and ```state``` of one person with ```ID = PersonId```.

## Task

Write a solution to report the ```first name```, ```last name```, ```city```, and ```state``` of each person in the 
```PERSON``` table. If the address of a ```personId``` is not present in the ```ADDRESS``` table, report ```null``` 
instead.

**Return** the result table in any order.

## Description of the Solution ## 

The result format is in the following example.

Example 1:

Input: 

Person table:

| personId | lastName | firstName |
|----------|----------|-----------|
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |

Address table:

| addressId | personId | city          | state      |
|-----------|----------|---------------|------------|
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |

Output: 

| firstName | lastName | city          | state    |
|-----------|----------|---------------|----------|
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |

## Explanation ##
There is no address in the address table for the ```personId = 1``` so we return ```null``` in their ```city``` and ```state```.
```addressId = 1``` contains information about the address of ```personId = 2```.

## Schemas & scripts

### SQL Schema

```genericsql
-- Table creation
Create table If Not Exists Person (personId int, firstName varchar(255), lastName varchar(255))
Create table If Not Exists Address (addressId int, personId int, city varchar(255), state varchar(255))

-- Populate person table
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')

-- Populate adress table
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')
```

### Pandas Code

```python
# persons data
data = [[1, 'Wang', 'Allen'], 
        [2, 'Alice', 'Bob']]

# person dataframe
person = pd.DataFrame(data, 
                      columns=['personId', 'firstName', 'lastName']) \
                      .astype({'personId':'Int64', 'firstName':'object', 'lastName':'object'})

# address data
data = [[1, 2, 'New York City', 'New York'], 
        [2, 3, 'Leetcode', 'California']]

# address dataframe
address = pd.DataFrame(data, 
                       columns=['addressId', 'personId', 'city', 'state']) \
                       .astype({'addressId':'Int64', 
                                'personId':'Int64', 
                                'city':'object', 
                                'state':'object'})
```
