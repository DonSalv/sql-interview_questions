# Classes More Than 5 Students

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `COURSES`

| Column Name | Type    |
|-------------|---------|
| student     | varchar |
| class       | varchar |

`(student, class)` is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.

## Task

Write a solution to find all the classes that have at least five students.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
Courses table:

| student | class    |
|---------|----------|
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |

Output: 

| class |
|-------|
| Math  |

## Explanation ##

- `Math` has `6` students, so we include it.
- `English` has `1` student, so we do not include it.
- `Biology` has `1` student, so we do not include it.
- `Computer` has `1` student, so we do not include it.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the courses table
Create table If Not Exists Courses (student varchar(255), class varchar(255))

-- Populate the courses table
Truncate table Courses
insert into Courses (student, class) values ('A', 'Math')
insert into Courses (student, class) values ('B', 'English')
insert into Courses (student, class) values ('C', 'Math')
insert into Courses (student, class) values ('D', 'Biology')
insert into Courses (student, class) values ('E', 'Math')
insert into Courses (student, class) values ('F', 'Computer')
insert into Courses (student, class) values ('G', 'Math')
insert into Courses (student, class) values ('H', 'Math')
insert into Courses (student, class) values ('I', 'Math')
```

### Pandas Code

```python
# courses data
data = [['A', 'Math'], 
        ['B', 'English'], 
        ['C', 'Math'], 
        ['D', 'Biology'], 
        ['E', 'Math'], 
        ['F', 'Computer'], 
        ['G', 'Math'], 
        ['H', 'Math'], 
        ['I', 'Math']]

# courses dataframe
courses = pd.DataFrame(data, 
                       columns=['student', 'class']) \
                       .astype({'student':'object', 
                                'class':'object'})
```