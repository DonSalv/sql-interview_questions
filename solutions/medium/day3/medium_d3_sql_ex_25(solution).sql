Create table Actions (user_id int, post_id int, action_date date, action VARCHAR2(10), extra varchar(10),
CONSTRAINT action_check CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')));
create table Removals (post_id int, remove_date date, CONSTRAINT Removals_pk PRIMARY KEY (post_id));

insert into Removals (post_id, remove_date) values ('2', TO_DATE('2019-07-20','YYYY-MM-DD'));
insert into Removals (post_id, remove_date) values ('3', TO_DATE('2019-07-18','YYYY-MM-DD'));

insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'like', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'share', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', TO_DATE('2019-07-02','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', TO_DATE('2019-07-02','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', TO_DATE('2019-07-03','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', TO_DATE('2019-07-03','YYYY-MM-DD'), 'report', 'racism');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', TO_DATE('2019-07-03','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', TO_DATE('2019-07-03','YYYY-MM-DD'), 'report', 'racism');

SELECT ROUND(100*AVG(AVG(removed)),2) AS average_daily_percent FROM
(SELECT Q1.action_date, 
CASE WHEN r.remove_date IS NOT NULL THEN 1 ELSE 0 END AS removed FROM
(SELECT post_id, action_date FROM Actions WHERE extra='spam') Q1
LEFT JOIN Removals r ON Q1.post_id=r.post_id)
GROUP BY action_date;

DROP TABLE Removals PURGE;
DROP TABLE Actions PURGE;