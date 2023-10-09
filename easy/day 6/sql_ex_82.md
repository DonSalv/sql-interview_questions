# The Winner University

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `NEWYORK`

| Column Name | Type |
|-------------|------|
| student_id  | int  |
| score       | int  |

In `SQL`, `student_id` is the primary key for this table.

Each row contains information about the score of one student from New York University in an 
exam.

**Table**: `CALIFORNIA`

| Column Name | Type |
|-------------|------|
| student_id  | int  |
| score       | int  |

In `SQL`, `student_id` is the primary key for this table.

Each row contains information about the score of one student from California University in 
an exam.

## Task

There is a competition between New York University and California University. 
The competition is held between the same number of students from both universities. 
The university that has more **excellent students** wins the competition. 
If the two universities have the same number of **excellent students**, the competition ends in a draw.

An **excellent student** is a student that scored `90%` or more in the exam.

**Return**:
- **"New York University"** if New York University wins the competition.
- **"California University"** if California University wins the competition.
- **"No Winner"** if the competition ends in a draw.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
NEWYORK table:

| student_id | score |
|------------|-------|
| 1          | 90    |
| 2          | 87    |

CALIFORNIA table:

| student_id | score |
|------------|-------|
| 2          | 89    |
| 3          | 88    |

Output: 

| winner              |
|---------------------|
| New York University |

Example 2:

Input: 
NEWYORK table:

| student_id | score |
|------------|-------|
| 1          | 89    |
| 2          | 88    |

CALIFORNIA table:

| student_id | score |
|------------|-------|
| 2          | 90    |
| 3          | 87    |

Output: 

| winner                |
|-----------------------|
| California University |

Example 3:

Input: 
NEWYORK table:

| student_id | score |
|------------|-------|
| 1          | 89    |
| 2          | 90    |

CALIFORNIA table:

| student_id | score |
|------------|-------|
| 2          | 87    |
| 3          | 99    |

Output: 

| winner    |
|-----------|
| No Winner |


## Explanation ##
- Explanation 1: New York University has `1` excellent student, and California University has `0` excellent students.
- Explanation 2: New York University has `0` excellent students, and California University has `1` excellent student.
- Explanation 3: Both New York University and California University have `1` excellent student.
## Schemas & scripts

### SQL Schema

```genericsql
-- Create the tabkes
Create table If Not Exists NewYork (student_id int, score int)
Create table If Not Exists California (student_id int, score int)
    
-- Populate the newyork table
Truncate table NewYork
insert into NewYork (student_id, score) values ('1', '90')
insert into NewYork (student_id, score) values ('2', '87')
    
-- Populate the california table
Truncate table California
insert into California (student_id, score) values ('2', '89')
insert into California (student_id, score) values ('3', '88')
```

### Pandas Code

```python
# newyork data
data = [[1, 90], [2, 87]]

# newyork dataframe
new_york = pd.DataFrame(data, 
                        columns=['student_id', 'score']) \
                       .astype({'student_id':'Int64', 'score':'Int64'})

# california data
data = [[2, 89], [3, 88]]

# california dataframe
california = pd.DataFrame(data, 
                          columns=['student_id', 'score']) \
                         .astype({'student_id':'Int64', 'score':'Int64'})
```