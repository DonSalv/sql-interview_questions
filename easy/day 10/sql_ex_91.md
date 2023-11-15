# Concatenate the Name and the Profession

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PERSON`

| Column Name | Type    |
|-------------|---------|
| person_id   | int     |
| name        | varchar |
| profession  | ENUM    |

`person_id` is the primary key (column with a unique value) for this table.

Each row in this table contains a person's ID, `name`, and `profession`.

The profession column in an enum of the type `('Doctor', 'Singer', 'Actor', 'Player', 'Engineer', or 'Lawyer')`

## Task

Write a solution to report each person's name followed by the first letter of their profession enclosed in parentheses.

**Return** the result table **ordered** by `person_id` in **descending order**.

## Description of the Solution ##

The result format is shown in the following example.

Example 1:

Input: 
PERSON table:

| person_id | name  | profession |
|-----------|-------|------------|
| 1         | Alex  | Singer     |
| 3         | Alice | Actor      |
| 2         | Bob   | Player     |
| 4         | Messi | Doctor     |
| 6         | Tyson | Engineer   |
| 5         | Meir  | Lawyer     |

Output: 

| person_id | name     |
|-----------|----------|
| 6         | Tyson(E) |
| 5         | Meir(L)  |
| 4         | Messi(D) |
| 3         | Alice(A) |
| 2         | Bob(P)   |
| 1         | Alex(S)  |

## Explanation ##

Note that there should not be any white space between the name and the first letter of the profession.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the person table
Create table If Not Exists Person (person_id int, name varchar(30), profession ENUM('Doctor','Singer','Actor','Player','Engineer','Lawyer'))
    
-- Populate the person table
Truncate table Person
insert into Person (person_id, name, profession) values ('1', 'Alex', 'Singer')
insert into Person (person_id, name, profession) values ('3', 'Alice', 'Actor')
insert into Person (person_id, name, profession) values ('2', 'Bob', 'Player')
insert into Person (person_id, name, profession) values ('4', 'Messi', 'Doctor')
insert into Person (person_id, name, profession) values ('6', 'Tyson', 'Engineer')
insert into Person (person_id, name, profession) values ('5', 'Meir', 'Lawyer')
```

### Pandas Code

```python
# person data
data = [[1, 'Alex', 'Singer'], [3, 'Alice', 'Actor'], [2, 'Bob', 'Player'],
        [4, 'Messi', 'Doctor'], [6, 'Tyson', 'Engineer'], [5, 'Meir', 'Lawyer']]

# person dataframe
person = pd.DataFrame(data, 
                      columns=['person_id', 'name', 'profession']) \
                     .astype({'person_id':'Int64', 'name':'object', 'profession':'object'})
```