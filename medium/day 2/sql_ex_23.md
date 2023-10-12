# Highest Grade For Each Student

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `ENROLLMENTS`

| Column Name | Type |
|-------------|------|
| student_id  | int  |
| course_id   | int  |
| grade       | int  |

`(student_id, course_id)` is the primary key (combination of columns with unique values) of this table.

`grade` is never `NULL`.

## Task

Write a solution to find the highest grade with its corresponding course for each student. 
In case of a tie, you should find the course with the smallest `course_id`.

**Return** the result table ordered by `student_id` in **ascending order**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
ENROLLMENTS table:

| student_id | course_id | grade |
|------------|-----------|-------|
| 2          | 2         | 95    |
| 2          | 3         | 95    |
| 1          | 1         | 90    |
| 1          | 2         | 99    |
| 3          | 1         | 80    |
| 3          | 2         | 75    |
| 3          | 3         | 82    |

Output: 

| student_id | course_id | grade |
|------------|-----------|-------|
| 1          | 2         | 99    |
| 2          | 2         | 95    |
| 3          | 3         | 82    |

## Explanation ##

No explanation provided

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the enrollments table
Create table If Not Exists Enrollments (student_id int, course_id int, grade int)

-- Populate the enrollments table    
Truncate table Enrollments
insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95')
insert into Enrollments (student_id, course_id, grade) values ('2', '3', '95')
insert into Enrollments (student_id, course_id, grade) values ('1', '1', '90')
insert into Enrollments (student_id, course_id, grade) values ('1', '2', '99')
insert into Enrollments (student_id, course_id, grade) values ('3', '1', '80')
insert into Enrollments (student_id, course_id, grade) values ('3', '2', '75')
insert into Enrollments (student_id, course_id, grade) values ('3', '3', '82')
```

### Pandas Code

```python
# enrollments data
data = [[2, 2, 95], [2, 3, 95], [1, 1, 90], [1, 2, 99], [3, 1, 80], [3, 2, 75], [3, 3, 82]]

# enrollments dataframe
enrollments = pd.DataFrame(data, 
                           columns=['student_id', 'course_id', 'grade']) \
                          .astype({'student_id':'Int64', 'course_id':'Int64', 'grade':'Int64'})
```