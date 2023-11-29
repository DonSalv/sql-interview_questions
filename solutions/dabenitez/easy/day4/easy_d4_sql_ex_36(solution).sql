Create table Submissions (sub_id int, parent_id int);

insert into Submissions (sub_id, parent_id) values ('1', NULL);
insert into Submissions (sub_id, parent_id) values ('2', NULL);
insert into Submissions (sub_id, parent_id) values ('1', NULL);
insert into Submissions (sub_id, parent_id) values ('12', NULL);
insert into Submissions (sub_id, parent_id) values ('3', '1');
insert into Submissions (sub_id, parent_id) values ('5', '2');
insert into Submissions (sub_id, parent_id) values ('3', '1');
insert into Submissions (sub_id, parent_id) values ('4', '1');
insert into Submissions (sub_id, parent_id) values ('9', '1');
insert into Submissions (sub_id, parent_id) values ('10', '2');
insert into Submissions (sub_id, parent_id) values ('6', '7');

SELECT q1.sub_id AS post_id, COALESCE(SUM(q2.total),0) AS number_of_comments  FROM 
(SELECT DISTINCT sub_id FROM submissions WHERE parent_id is null) q1
LEFT JOIN
(SELECT parent_id, COUNT(parent_id) AS total
FROM (SELECT DISTINCT sub_id, parent_id FROM Submissions)
GROUP BY parent_id) q2
ON q1.sub_id=q2.parent_id
GROUP BY q1.sub_id;

DROP TABLE Submissions PURGE;