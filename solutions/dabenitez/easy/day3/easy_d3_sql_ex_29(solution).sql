CREATE TABLE Actions (user_id INT, post_id INT, action_date DATE, action VARCHAR2(10) CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), extra VARCHAR2(10) NOT NULL);

insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'like', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', TO_DATE('2019-07-01','YYYY-MM-DD'), 'share', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', TO_DATE('2019-07-02','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', TO_DATE('2019-07-02','YYYY-MM-DD'), 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'racism');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', TO_DATE('2019-07-04','YYYY-MM-DD'), 'view', 'None');
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', TO_DATE('2019-07-04','YYYY-MM-DD'), 'report', 'racism');

SELECT extra as report_reason, 
COUNT(DISTINCT post_id) as report_count 
FROM Actions
WHERE action = 'report' 
AND action_date = TO_DATE('2019-07-04','YYYY-MM-DD')
GROUP BY extra;

DROP TABLE Actions PURGE;