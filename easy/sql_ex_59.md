# All Valid Triplets That Can Represent a Country

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SCHOOLA`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |

`student_id` is the column with unique values for this table.

Each row of this table contains the `name` and the `id` of a student in `school A`.

All `student_name` are distinct.

**Table**: `SCHOOLB`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |

`student_id` is the column with unique values for this table.

Each row of this table contains the `name` and the `id` of a student in `school B`.

All `student_name` are distinct.

**Table**: `SCHOOLC`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| student_name | varchar |

`student_id` is the column with unique values for this table.

Each row of this table contains the `name` and the `id` of a student in `school C`.

All `student_name` are distinct.

## Task

There is a country with three schools, where each student is enrolled in exactly one school. The country is joining a competition and wants to select one student from each school to represent the country such that:

- `member_A` is selected from `SCHOOLA`,
- `member_B` is selected from `SCHOOLB`,
- `member_C` is selected from `SCHOOLC`, and
- The selected students' names and IDs are pairwise distinct (i.e. no two students share 
- the same name, and no two students share the same ID).

Write a solution to find all the possible triplets representing the country under the given constraints.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
SCHOOLA table:

| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |

SCHOOLB table:

| student_id | student_name |
|------------|--------------|
| 3          | Tom          |

SCHOOLC table:

| student_id | student_name |
|------------|--------------|
| 3          | Tom          |
| 2          | Jerry        |
| 10         | Alice        |

Output: 

| member_A | member_B | member_C |
|----------|----------|----------|
| Alice    | Tom      | Jerry    |
| Bob      | Tom      | Alice    |

## Explanation ##

Let us see all the possible triplets.
- `(Alice, Tom, Tom) --> Rejected` because member_B and member_C have the same name and the same ID.
- `(Alice, Tom, Jerry) --> Valid triplet`.
- `(Alice, Tom, Alice) --> Rejected` because member_A and member_C have the same name.
- `(Bob, Tom, Tom) --> Rejected` because member_B and member_C have the same name and the same ID.
- `(Bob, Tom, Jerry) --> Rejected` because member_A and member_C have the same ID.
- `(Bob, Tom, Alice) --> Valid triplet`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tables
Create table If Not Exists SchoolA (student_id int, student_name varchar(20))
Create table If Not Exists SchoolB (student_id int, student_name varchar(20))
Create table If Not Exists SchoolC (student_id int, student_name varchar(20))

-- Populate the schoola table
Truncate table SchoolA
insert into SchoolA (student_id, student_name) values ('1', 'Alice')
insert into SchoolA (student_id, student_name) values ('2', 'Bob')

-- Populate the schoolb table
Truncate table SchoolB
insert into SchoolB (student_id, student_name) values ('3', 'Tom')

-- Populate the schoolc table
Truncate table SchoolC
insert into SchoolC (student_id, student_name) values ('3', 'Tom')
insert into SchoolC (student_id, student_name) values ('2', 'Jerry')
insert into SchoolC (student_id, student_name) values ('10', 'Alice')
```

### Pandas Code

```python
# school_a data
data = [[1, 'Alice'], [2, 'Bob']]

# school_a dataframe
school_a = pd.DataFrame(data, 
                        columns=['student_id', 'student_name']) \
                       .astype({'student_id':'Int64', 'student_name':'object'})

# school_b data
data = [[3, 'Tom']]

# school_b dataframe
school_b = pd.DataFrame(data, 
                        columns=['student_id', 'student_name']) \
                       .astype({'student_id':'Int64', 'student_name':'object'})

# school_c data
data = [[3, 'Tom'], [2, 'Jerry'], [10, 'Alice']]

# school_c dataframe
school_c = pd.DataFrame(data, 
                        columns=['student_id', 'student_name']) \
                       .astype({'student_id':'Int64', 'student_name':'object'})
```