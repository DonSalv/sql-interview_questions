-- Creat the twweets table
CREATE TABLE Tweets(tweet_id int, content varchar(50));

-- Populate the tweets table
TRUNCATE TABLE Tweets;
INSERT INTO Tweets (tweet_id, content) VALUES ('1', 'Vote for Biden');
INSERT INTO Tweets (tweet_id, content) VALUES ('2', 'Let us make America great again!');

-- Solve the exercise
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content)>15;

-- Drop unused table
DROP TABLE Tweets;