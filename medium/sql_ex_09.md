# Count Student Number in Departments

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `STUDENT`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |
| gender       | varchar |
| dept_id      | int     |

`student_id` is the primary key (column with unique values) for this table.

`dept_id` is a foreign key (reference column) to `dept_id` in the `DEPARTMENT` tables.

Each row of this table indicates the name of a `student`, their `gender`, and the `id` of their `department`.

**Table**: `DEPARTMENT`

| Column Name | Type    |
|-------------|---------|
| dept_id     | int     |
| dept_name   | varchar |

`dept_id` is the primary key (column with unique values) for this table.

Each row of this table contains the `id` and the `name` of a department.

## Task

Write a solution to report the respective department name and number of students majoring in each 
department for all departments in the `DEPARTMENT` table (even ones with no current students).

Return the result table **ordered** by `student_number` **in descending order**. In case of a tie, order them by 
`dept_name` **alphabetically**.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
STUDENT table:

| student_id | student_name | gender | dept_id |
|------------|--------------|--------|---------|
| 1          | Jack         | M      | 1       |
| 2          | Jane         | F      | 1       |
| 3          | Mark         | M      | 2       |

DEPARTMENT table:

| dept_id | dept_name   |
|---------|-------------|
| 1       | Engineering |
| 2       | Science     |
| 3       | Law         |

Output: 

| dept_name   | student_number |
|-------------|----------------|
| Engineering | 2              |
| Science     | 1              |
| Law         | 0              |

## Explanation ##

No explanation provided.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists Student (student_id int,student_name varchar(45), gender varchar(6), dept_id int)
Create table If Not Exists Department (dept_id int, dept_name varchar(255))
    
-- Populate the student table
Truncate table Student
insert into Student (student_id, student_name, gender, dept_id) values ('1', 'Jack', 'M', '1')
insert into Student (student_id, student_name, gender, dept_id) values ('2', 'Jane', 'F', '1')
insert into Student (student_id, student_name, gender, dept_id) values ('3', 'Mark', 'M', '2')
    
-- Populate the department table
Truncate table Department
insert into Department (dept_id, dept_name) values ('1', 'Engineering')
insert into Department (dept_id, dept_name) values ('2', 'Science')
insert into Department (dept_id, dept_name) values ('3', 'Law')
```

### Pandas Code

```python
# student data
data = [[1, 'Jack', 'M', 1], [2, 'Jane', 'F', 1], [3, 'Mark', 'M', 2]]

# student dataframe
student = pd.DataFrame(data, 
                       columns=['student_id', 'student_name', 'gender', 'dept_id']) \
                      .astype({'student_id':'Int64', 'student_name':'object', 'gender':'object', 'dept_id':'Int64'})

# department data
data = [[1, 'Engineering'], [2, 'Science'], [3, 'Law']]

# department dataframe
department = pd.DataFrame(data, 
                          columns=['dept_id', 'dept_name']) \
                         .astype({'dept_id':'Int64', 'dept_name':'object'})
```