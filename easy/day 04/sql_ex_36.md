# Number of Comments per Post

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `SUBMISSIONS`

| Column Name | Type |
|-------------|------|
| sub_id      | int  |
| parent_id   | int  |

This table may have duplicate rows.
Each row can be a post or comment on the post.
`parent_id` is null for posts.
`parent_id` for comments is sub_id for another post in the table.

## Task

Write a solution to find the number of comments per post. 
The result table should contain `post_id` and its corresponding `number_of_comments`.

The `SUBMISSIONS` table may contain duplicate comments. You should count the number of unique comments per post.

The `SUBMISSIONS` table may contain duplicate posts. You should treat them as one post.

The result table should be **ordered by** `post_id` in ascending order.

## Description of the Solution ##
The result format is in the following example.

Example 1:

Input: 
SUBMISSIONS table:

| sub_id | parent_id |
|--------|-----------|
| 1      | Null      |
| 2      | Null      |
| 1      | Null      |
| 12     | Null      |
| 3      | 1         |
| 5      | 2         |
| 3      | 1         |
| 4      | 1         |
| 9      | 1         |
| 10     | 2         |
| 6      | 7         |

Output: 

| post_id | number_of_comments |
|---------|--------------------|
| 1       | 3                  |
| 2       | 2                  |
| 12      | 0                  |

## Explanation ##

The post with `id 1` has three comments in the table with `id 3`, `4`, and `9`. 
The comment with `id 3` is repeated in the table, **we counted it only once**.

The post with `id 2` has two comments in the table with `id 5` and `10`.

The post with `id 12` has no comments in the table.

The comment with `id 6` is a comment on a deleted post with `id 7` so we ignored it.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the submissions table
Create table If Not Exists Submissions (sub_id int, parent_id int)
    
-- Populate the submissions table
Truncate table Submissions
insert into Submissions (sub_id, parent_id) values ('1', 'None')
insert into Submissions (sub_id, parent_id) values ('2', 'None')
insert into Submissions (sub_id, parent_id) values ('1', 'None')
insert into Submissions (sub_id, parent_id) values ('12', 'None')
insert into Submissions (sub_id, parent_id) values ('3', '1')
insert into Submissions (sub_id, parent_id) values ('5', '2')
insert into Submissions (sub_id, parent_id) values ('3', '1')
insert into Submissions (sub_id, parent_id) values ('4', '1')
insert into Submissions (sub_id, parent_id) values ('9', '1')
insert into Submissions (sub_id, parent_id) values ('10', '2')
insert into Submissions (sub_id, parent_id) values ('6', '7')
```

### Pandas Code

```python
# submissions data
data = [[1, None], [2, None], [1, None], [12, None], 
        [3, 1], [5, 2], [3, 1], [4, 1], [9, 1], [10, 2], [6, 7]]

# submissions dataframe
submissions = pd.DataFrame(data, 
                           columns=['sub_id', 'parent_id']) \
                           .astype({'sub_id':'Int64', 
                                    'parent_id':'Int64'})
```