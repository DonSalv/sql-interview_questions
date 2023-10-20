# Count Occurrences in Text

- [Tables for the problem](#tables)
- [Task](#task)
- [Description of the Solution](#description-of-the-solution)
- [Explanation](#explanation)
- [Schemas & Scripts](#schemas--scripts)

## Tables 

**Table**: `FILES`


| Column Name | Type    |
|-------------|---------|
| file_name   | varchar |
| content     | text    |

`file_name` is the column with unique values of this table. 

Each row contains `file_name` and the content of that file.

## Task

Write a solution to find the number of files that have at least one occurrence of the words `'bull'` and `'bear'` 
as a standalone word, respectively, disregarding any instances where it appears without space on either side 
(e.g. `'bullet'`, `'bears'`, `'bull'`, or `'bear'` at the beginning or end of a sentence will not be considered) 

**Return** the word `'bull'` and `'bear'` along with the corresponding number of occurrences in any order.

## Description of the Solution ##

Example 1:

Input: 
FILES table:

| file_name  | contenet                                                                         | 
|------------|----------------------------------------------------------------------------------|
| draft1.txt | The stock exchange predicts a bull market which would make many investors happy. | 
| draft2.txt | The stock exchange predicts a bull market which would make many investors happy, |
|            | but analysts warn of possibility of too much optimism and that in fact we are    |
|            | awaiting a bear market.                                                          | 
| draft3.txt | The stock exchange predicts a bull market which would make many investors happy, |
|            | but analysts warn of possibility of too much optimism and that in fact we are    |
|            | awaiting a bear market. As always predicting the future market is an uncertain   |
|            | game and all investors should follow their instincts and best practices.         | 

Output: 

| word | count |  
|------|-------|
| bull | 3     | 
| bear | 2     | 

## Explanation ##

- The word `"bull"` appears `1` time in `"draft1.txt"`, `1` time in `"draft2.txt"`, and `1` time in `"draft3.txt"`. 
Therefore, the total number of occurrences for the word `"bull"` is `3`.
- The word `"bear"` appears `1` time in `"draft2.txt"`, and `1` time in `"draft3.txt"`. 
Therefore, the total number of occurrences for the word `"bear"` is `2`.

## Schemas & scripts

### SQL Schema

```genericsql
-- Create the files table
Create table If Not Exists Files (file_name varchar(100), content text )

-- Populate the files table    
Truncate table Files
insert into Files (file_name, content) values ('draft1.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy.')
insert into Files (file_name, content) values ('draft2.txt', 'The stock exchange predicts a bull market which ' ||
                                              'would make many investors happy, but analysts warn of possibility of ' ||
                                              'too much optimism and that in fact we are awaiting a bear market.')
insert into Files (file_name, content) values ('final.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy, but analysts warn of possibility of too much ' ||
                                              'optimism and that in fact we are awaiting a bear market. ' ||
                                              'As always predicting the future market is an uncertain game and all ' ||
                                              'investors should follow their instincts and best practices.')
```

### Pandas Code

```python
# files data
data = [['draft1.txt', 'The stock exchange predicts a bull market which would make many investors happy.'], 
        ['draft2.txt', 'The stock exchange predicts a bull market which would make many investors happy, \
        but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.'], 
        ['final.txt', 'The stock exchange predicts a bull market which would make many investors happy, but \
        analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As \
        always predicting the future market is an uncertain game and all investors should follow their instincts \
        and best practices.']]

# files dataframe
files = pd.DataFrame(data, 
                     columns=['file_name', 'content']) \
                    .astype({'file_name':'object', 'content':'object'})
```