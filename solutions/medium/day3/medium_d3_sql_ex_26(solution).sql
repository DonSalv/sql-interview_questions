Create table Views (article_id int, author_id int, viewer_id int, view_date date);

insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', TO_DATE('2019-08-01','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '5', TO_DATE('2019-08-01','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', TO_DATE('2019-08-01','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', TO_DATE('2019-08-02','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', TO_DATE('2019-07-22','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', TO_DATE('2019-07-21','YYYY-MM-DD'));
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', TO_DATE('2019-07-21','YYYY-MM-DD'));

SELECT viewer_id AS id FROM
(SELECT viewer_id, view_date, COUNT(DISTINCT article_id) AS num FROM Views
GROUP BY viewer_id, view_date)
WHERE num=2
ORDER BY id;

DROP TABLE Views PURGE;