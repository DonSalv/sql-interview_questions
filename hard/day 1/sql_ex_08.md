# Students Report By Geography

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `STUDENT`

| Column Name | Type    |
|-------------|---------|
| name        | varchar |
| continent   | varchar |

This table may contain duplicate rows.

Each row of this table indicates the name of a `student` and the `continent` they came from.

## Task

A school has students from Asia, Europe, and America.

Write a solution to pivot the continent column in the Student table so that each name is **sorted alphabetically** 
and displayed underneath its corresponding continent. The output headers should be `America`, `Asia`, and `Europe`, 
respectively.

The test cases are generated so that the student number from America is not less than either Asia or Europe.

**Follow up**: 
If it is unknown which continent has the most students, could you write a solution to generate the student report?

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
STUDENT table:

| name   | continent |
|--------|-----------|
| Jane   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jack   | America   |

Output: 

| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    | null | null   |

## Explanation ##

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the student table
Create table If Not Exists Student (name varchar(50), continent varchar(7))

-- Populate the student table    
Truncate table Student
insert into Student (name, continent) values ('Jane', 'America')
insert into Student (name, continent) values ('Pascal', 'Europe')
insert into Student (name, continent) values ('Xi', 'Asia')
insert into Student (name, continent) values ('Jack', 'America')
```

### Pandas Code

```python
# student data
data = [['Jane', 'America'], ['Pascal', 'Europe'], ['Xi', 'Asia'], ['Jack', 'America']]

# student dataframe
student = pd.DataFrame(data, 
                       columns=['name', 'continent']) \
                      .astype({'name':'object', 'continent':'object'})
```