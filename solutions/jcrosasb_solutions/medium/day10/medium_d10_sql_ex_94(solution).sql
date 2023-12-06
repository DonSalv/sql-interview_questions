-- Create the files table
Create table Files (file_name varchar(100), content varchar2(350));

-- Populate the files table    
Truncate table Files;
insert into Files (file_name, content) values ('draft1.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy.');
insert into Files (file_name, content) values ('draft2.txt', 'The stock exchange predicts a bull market which ' ||
                                              'would make many investors happy, but analysts warn of possibility of ' ||
                                              'too much optimism and that in fact we are awaiting a bear market.');
insert into Files (file_name, content) values ('final.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy, but analysts warn of possibility of too much ' ||
                                              'optimism and that in fact we are awaiting a bear market. ' ||
                                              'As always predicting the future market is an uncertain game and all ' ||
                                              'investors should follow their instincts and best practices.');
                                              
-- Write a solution to find the number of files that have at least one occurrence of the words 'bull' and 'bear' as a standalone word, 
-- respectively, disregarding any instances where it appears without space on either side (e.g. 'bullet', 'bears', 'bull', or 'bear' at 
-- the beginning or end of a sentence will not be considered)
-- Return the word 'bull' and 'bear' along with the corresponding number of occurrences in any order.                                            
SELECT 
    'bull' AS word, 
    COUNT(*) AS count
FROM Files 
WHERE content LIKE '% bull %'
UNION ALL
SELECT 
    'bear' AS word, 
    COUNT(*) AS count
FROM Files 
WHERE content LIKE '% bear %';
                         
-- Drop tables
DROP TABLE
Files;
