#  Patients With a Condition

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `PATIENTS`

| Column Name  | Type    |
|--------------|---------|
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |

`patient_id` is the primary key (column with unique values) for this table.

`conditions` contains `0` or more code separated by spaces. 

This table contains information of the patients in the hospital.

## Task

Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I 
Diabetes. Type I Diabetes always starts with `DIAB1` prefix.

**Return** the result table in any order.

## Description of the Solution ##

The result format is in the following example.

Example 1:

Input: 
PATIENTS table:

| patient_id | patient_name | conditions   |
|------------|--------------|--------------|
| 1          | Daniel       | YFEV COUGH   |
| 2          | Alice        |              |
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |
| 5          | Alain        | DIAB201      |

Output: 

| patient_id | patient_name | conditions   |
|------------|--------------|--------------|
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |

## Explanation ##

`Bob` and `George` both have a condition that starts with `DIAB1`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the patients table
Create table If Not Exists Patients (patient_id int, patient_name varchar(30), conditions varchar(100))

-- Populate the patients table
Truncate table Patients
insert into Patients (patient_id, patient_name, conditions) values ('1', 'Daniel', 'YFEV COUGH')
insert into Patients (patient_id, patient_name, conditions) values ('2', 'Alice', '')
insert into Patients (patient_id, patient_name, conditions) values ('3', 'Bob', 'DIAB100 MYOP')
insert into Patients (patient_id, patient_name, conditions) values ('4', 'George', 'ACNE DIAB100')
insert into Patients (patient_id, patient_name, conditions) values ('5', 'Alain', 'DIAB201')
```

### Pandas Code

```python
# patitents data
data = [[1, 'Daniel', 'YFEV COUGH'], [2, 'Alice', ''], [3, 'Bob', 'DIAB100 MYOP'], 
        [4, 'George', 'ACNE DIAB100'], [5, 'Alain', 'DIAB201']]

# patients dataframe
patients = pd.DataFrame(data, 
                        columns=['patient_id', 'patient_name', 'conditions']) \
                       .astype({'patient_id':'int64', 'patient_name':'object', 'conditions':'object'})
```