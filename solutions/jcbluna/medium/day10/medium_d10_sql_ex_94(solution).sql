-- Create the files table
CREATE TABLE Files (file_name varchar(100), content clob);

-- Populate the files table    
TRUNCATE TABLE Files;
INSERT INTO Files (file_name, content) VALUES ('draft1.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy.');
INSERT INTO Files (file_name, content) VALUES ('draft2.txt', 'The stock exchange predicts a bull market which ' ||
                                              'would make many investors happy, but analysts warn of possibility of ' ||
                                              'too much optimism and that in fact we are awaiting a bear market.');
INSERT INTO Files (file_name, content) VALUES ('final.txt', 'The stock exchange predicts a bull market which would ' ||
                                              'make many investors happy, but analysts warn of possibility of too much ' ||
                                              'optimism and that in fact we are awaiting a bear market. ' ||
                                              'As always predicting the future market is an uncertain game and all ' ||
                                              'investors should follow their instincts and best practices.');

-- Solve the exercise
-- Fix: Count the number of files where the words appear, not how many times the word appears.
SELECT 'bull' AS word, SUM(CASE WHEN content LIKE '% bull %' THEN 1 ELSE 0 END) OVER() AS count FROM Files
UNION
SELECT 'bear' AS word, SUM(CASE WHEN content LIKE '% bear %' THEN 1 ELSE 0 END) OVER() AS count FROM Files;

-- Drop unused tables
DROP TABLE Files;