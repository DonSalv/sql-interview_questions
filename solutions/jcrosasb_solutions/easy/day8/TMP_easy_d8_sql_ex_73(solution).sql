-- Create the tables
Create table Playback(session_id int,customer_id int,start_time int,end_time int);
Create table Ads (ad_id int, customer_id int, timestamp int);

-- Populate the playback table    
Truncate table Playback;
insert into Playback (session_id, customer_id, start_time, end_time) values (1, 1, 1, 5);
insert into Playback (session_id, customer_id, start_time, end_time) values (2, 1, 15, 23);
insert into Playback (session_id, customer_id, start_time, end_time) values (3, 2, 10, 12);
insert into Playback (session_id, customer_id, start_time, end_time) values (4, 2, 17, 28);
insert into Playback (session_id, customer_id, start_time, end_time) values (5, 2, 2, 8);

-- Populate the ads table    
Truncate table Ads;
insert into Ads (ad_id, customer_id, timestamp) values (1, 1, 5);
insert into Ads (ad_id, customer_id, timestamp) values (2, 2, 17);
insert into Ads (ad_id, customer_id, timestamp) values (3, 2, 20);

-- Write a solution to report all the sessions that did not get shown any ads
SELECT p.session_id, a.ad_id, p.start_time, p.end_time FROM Playback p INNER JOIN Ads a USING (customer_id);

-- Drop tables
DROP TABLE Playback;
DROP TABLE Ads;
