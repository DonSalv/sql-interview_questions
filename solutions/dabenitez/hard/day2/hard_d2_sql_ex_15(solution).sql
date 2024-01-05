Create table UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date);

insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', TO_DATE('2020-02-12','YYYY-MM-DD'), TO_DATE('2020-02-20','YYYY-MM-DD'));
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Dancing', TO_DATE('2020-02-21','YYYY-MM-DD'), TO_DATE('2020-02-23','YYYY-MM-DD'));
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', TO_DATE('2020-02-24','YYYY-MM-DD'), TO_DATE('2020-02-28','YYYY-MM-DD'));
insert into UserActivity (username, activity, startDate, endDate) values ('Bob', 'Travel', TO_DATE('2020-02-11','YYYY-MM-DD'), TO_DATE('2020-02-18','YYYY-MM-DD'));

SELECT username, activity, 
TO_CHAR(startDate,'YYYY-MM-DD') AS startDate, 
TO_CHAR(endDate,'YYYY-MM-DD') AS endDate FROM
(SELECT username, activity, startDate, endDate,
RANK() OVER (PARTITION BY username ORDER BY endDate DESC) AS ranking,
COUNT(username) OVER (PARTITION BY username) As num
FROM UserActivity)
WHERE ranking=2 OR num=1;

DROP TABLE UserActivity PURGE;