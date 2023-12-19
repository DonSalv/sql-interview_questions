Create table Subscriptions (account_id int, start_date date, end_date date, CONSTRAINT Subscriptions_pk PRIMARY KEY (account_id));
Create table Streams (session_id int, account_id int, stream_date date, CONSTRAINT Streams_pk PRIMARY KEY (session_id),
CONSTRAINT fk_Streams FOREIGN KEY (account_id) REFERENCES Subscriptions(account_id));

insert into Subscriptions (account_id, start_date, end_date) values ('9', TO_DATE('2020-02-18','YYYY-MM-DD'), TO_DATE('2021-10-30','YYYY-MM-DD'));
insert into Subscriptions (account_id, start_date, end_date) values ('3', TO_DATE('2021-09-21','YYYY-MM-DD'), TO_DATE('2021-11-13','YYYY-MM-DD'));
insert into Subscriptions (account_id, start_date, end_date) values ('11', TO_DATE('2020-02-28','YYYY-MM-DD'), TO_DATE('2020-08-18','YYYY-MM-DD'));
insert into Subscriptions (account_id, start_date, end_date) values ('13', TO_DATE('2021-04-20','YYYY-MM-DD'), TO_DATE('2021-09-22','YYYY-MM-DD'));
insert into Subscriptions (account_id, start_date, end_date) values ('4', TO_DATE('2020-10-26','YYYY-MM-DD'), TO_DATE('2021-05-08','YYYY-MM-DD'));
insert into Subscriptions (account_id, start_date, end_date) values ('5', TO_DATE('2020-09-11','YYYY-MM-DD'), TO_DATE('2021-01-17','YYYY-MM-DD'));

insert into Streams (session_id, account_id, stream_date) values ('14', '9', TO_DATE('2020-05-16','YYYY-MM-DD'));
insert into Streams (session_id, account_id, stream_date) values ('16', '3', TO_DATE('2021-10-27','YYYY-MM-DD'));
insert into Streams (session_id, account_id, stream_date) values ('18', '11', TO_DATE('2020-04-29','YYYY-MM-DD'));
insert into Streams (session_id, account_id, stream_date) values ('17', '13', TO_DATE('2021-08-08','YYYY-MM-DD'));
insert into Streams (session_id, account_id, stream_date) values ('19', '4', TO_DATE('2020-12-31','YYYY-MM-DD'));
insert into Streams (session_id, account_id, stream_date) values ('13', '5', TO_DATE('2021-01-05','YYYY-MM-DD'));

SELECT COUNT(account_id) AS accounts_count FROM
(SELECT s1.account_id, s1.start_date, s1.end_date, s2.stream_date FROM Subscriptions s1
JOIN Streams s2 ON s1.account_id=s2.account_id)
WHERE (EXTRACT(YEAR FROM start_date)=2021 or EXTRACT(YEAR FROM end_date)=2021)
AND EXTRACT(YEAR FROM stream_date)<>2021;

DROP TABLE Streams PURGE;
DROP TABLE Subscriptions PURGE;