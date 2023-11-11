-- Creat the twweets table
Create table Tweets(tweet_id int, content varchar(50));

-- Populate the tweets table
Truncate table Tweets;
insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15
SELECT 
    tweet_id 
FROM Tweets 
WHERE LENGTHB(content) > 15;

-- Drop tables
DROP TABLE Tweets;
