Create table Playback(session_id int,customer_id int,start_time int,end_time int, CONSTRAINT Playback_pk PRIMARY KEY (session_id));
Create table Ads (ad_id int, customer_id int, timestamp int, CONSTRAINT Ads_pk PRIMARY KEY (ad_id));

insert into Playback (session_id, customer_id, start_time, end_time) values ('1', '1', '1', '5');
insert into Playback (session_id, customer_id, start_time, end_time) values ('2', '1', '15', '23');
insert into Playback (session_id, customer_id, start_time, end_time) values ('3', '2', '10', '12');
insert into Playback (session_id, customer_id, start_time, end_time) values ('4', '2', '17', '28');
insert into Playback (session_id, customer_id, start_time, end_time) values ('5', '2', '2', '8');

insert into Ads (ad_id, customer_id, timestamp) values ('1', '1', '5');
insert into Ads (ad_id, customer_id, timestamp) values ('2', '2', '17');
insert into Ads (ad_id, customer_id, timestamp) values ('3', '2', '20');

SELECT p.session_id
FROM PLAYBACK p
LEFT JOIN ADS a ON p.customer_id = a.customer_id
AND p.start_time <= a.timestamp AND p.end_time >= a.timestamp
WHERE a.ad_id IS NULL;

DROP TABLE Ads PURGE;
DROP TABLE Playback PURGE;