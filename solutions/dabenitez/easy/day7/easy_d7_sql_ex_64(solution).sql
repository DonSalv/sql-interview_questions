Create table Tweets(tweet_id int, content varchar(50), CONSTRAINT Tweets_pk PRIMARY KEY (tweet_id));

insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');

SELECT tweet_id FROM Tweets
WHERE LENGTH(content) > 15;

DROP TABLE Tweets PURGE;