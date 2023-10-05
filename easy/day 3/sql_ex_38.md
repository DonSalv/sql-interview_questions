# Students and Examinations

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `STUDENTS`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |

`student_id` is the primary key (column with unique values) for this table.
Each row of this table contains the `ID` and the `name` of one student in the school.

**Table**: `SUBJECTS`

| Column Name  | Type    |
|--------------|---------|
| subject_name | varchar |

`subject_name` is the primary key (column with unique values) for this table.
Each row of this table contains the `name` of one subject in the school.

**Table**: `EXAMINATIONS`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| subject_name | varchar |

There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the `STUDENTS` table takes every course from the `SUBJECTS` table.
Each row of this table indicates that a student with ID `student_id` attended the exam of `subject_name`.

## Task

Write a solution to find the number of times each student attended each exam.

**Return** the result table ordered by `student_id` and `subject_name`.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
STUDENTS table:

| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |

SUBJECTS table:

| subject_name |
|--------------|
| Math         |
| Physics      |
| Programming  |

EXAMINATIONS table:

| student_id | subject_name |
|------------|--------------|
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |

Output: 

| student_id | student_name | subject_name | attended_exams |
|------------|--------------|--------------|----------------|
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |

## Explanation ##

The result table should contain all students and all subjects.
- `Alice` attended the `Math` exam `3` times, the `Physics` exam `2` times, and the `Programming` exam `1` time.
- `Bob` attended the `Math` exam `1` time, the `Programming` exam `1` time, and did not attend the `Physics` exam.
- `Alex` did not attend any exams.
- `John` attended the `Math` exam `1` time, the `Physics` exam `1` time, and the `Programming` exam `1` time.

## Schemas & scripts

### SQL Schema

```genericsql
-- Creates the tables
Create table If Not Exists Students (student_id int, student_name varchar(20))
Create table If Not Exists Subjects (subject_name varchar(20))
Create table If Not Exists Examinations (student_id int, subject_name varchar(20))
    
-- Populate the students table
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
    
-- Populate the subjects talbe
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
    
-- Populate the examinations table
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
```

### Pandas Code

```python
# students data
data = [[1, 'Alice'], [2, 'Bob'], [13, 'John'], [6, 'Alex']]

# students dataframe
students = pd.DataFrame(data, 
                        columns=['student_id', 'student_name']) \
                        .astype({'student_id':'Int64', 
                                 'student_name':'object'})

# subjects data
data = [['Math'], ['Physics'], ['Programming']]

# subjects dataframe
subjects = pd.DataFrame(data, 
                        columns=['subject_name']) \
                        .astype({'subject_name':'object'})

# examinations data
data = [[1, 'Math'],  [1, 'Physics'],  [1, 'Programming'],[2, 'Programming'], 
        [1, 'Physics'], [1, 'Math'], [13, 'Math'], [13, 'Programming'], 
        [13, 'Physics'], [2, 'Math'], [1, 'Math']]

# examinations dataframe
examinations = pd.DataFrame(data, 
                            columns=['student_id', 'subject_name']) \
                            .astype({'student_id':'Int64', 
                                     'subject_name':'object'})
```