# Sort the Olympic Table

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `OLYMPIC`

| Column Name   | Type    |
|---------------|---------|
| country       | varchar |
| gold_medals   | int     |
| silver_medals | int     |
| bronze_medals | int     |

In `SQL`, country is the primary key for this table.

Each row in this table shows a country name and the number of `gold`, `silver`, and `bronze` 
medals it won in the Olympic games.

## Task

The Olympic table is sorted according to the following rules:

- The country with more gold medals comes first. 
- If there is a tie in the gold medals, the country with more silver medals comes first. 
- If there is a tie in the silver medals, the country with more bronze medals comes first. 
- If there is a tie in the bronze medals, the countries with the tie are sorted in ascending order lexicographically.

Write a solution to sort the Olympic table.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
OLYMPIC table:

| country     | gold_medals | silver_medals | bronze_medals |
|-------------|-------------|---------------|---------------|
| China       | 10          | 10            | 20            |
| South Sudan | 0           | 0             | 1             |
| USA         | 10          | 10            | 20            |
| Israel      | 2           | 2             | 3             |
| Egypt       | 2           | 2             | 2             |

Output: 

| country     | gold_medals | silver_medals | bronze_medals |
|-------------|-------------|---------------|---------------|
| China       | 10          | 10            | 20            |
| USA         | 10          | 10            | 20            |
| Israel      | 2           | 2             | 3             |
| Egypt       | 2           | 2             | 2             |
| South Sudan | 0           | 0             | 1             |

## Explanation ##

The tie between `China` and `USA` is broken by their lexicographical names. 
Since "`China`" is lexicographically smaller than "`USA`", it comes first.
`Israel` comes before `Egypt` because it has more bronze medals.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the olynpic table
Create table If Not Exists Olympic (country varchar(50), gold_medals int, silver_medals int, bronze_medals int)

-- Populate the olympic table    
Truncate table Olympic
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('China', '10', '10', '20')
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('South Sudan', '0', '0', '1')
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('USA', '10', '10', '20')
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Israel', '2', '2', '3')
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Egypt', '2', '2', '2')
```

### Pandas Code

```python
# olympic data
data = [['China', 10, 10, 20], ['South Sudan', 0, 0, 1], ['USA', 10, 10, 20], 
        ['Israel', 2, 2, 3], ['Egypt', 2, 2, 2]]

# olympic dataframe
olympic = pd.DataFrame(data, 
                       columns=['country', 'gold_medals', 'silver_medals', 'bronze_medals']) \
                      .astype({'country':'object', 'gold_medals':'Int64', 
                               'silver_medals':'Int64', 'bronze_medals':'Int64'})
```