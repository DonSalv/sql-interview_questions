Create table Files (file_name varchar(100), content clob , CONSTRAINT Files_pk PRIMARY KEY (file_name));

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

SELECT 'bull' AS word, 
SUM(CASE WHEN content LIKE '% bull %' THEN 1 ELSE 0 END) AS count FROM Files
UNION
SELECT 'bear' AS word, 
SUM(CASE WHEN content LIKE '% bear %' THEN 1 ELSE 0 END) AS count FROM Files;


DROP TABLE Files PURGE;