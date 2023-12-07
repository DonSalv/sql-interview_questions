Create table Tree (id int, p_id int, CONSTRAINT Tree_pk PRIMARY KEY (id));

insert into Tree (id, p_id) values ('1', NULL);
insert into Tree (id, p_id) values ('2', '1');
insert into Tree (id, p_id) values ('3', '1');
insert into Tree (id, p_id) values ('4', '2');
insert into Tree (id, p_id) values ('5', '2');

SELECT id, CASE 
WHEN p_id is null THEN 'Root' 
WHEN p_id is not null AND child is null THEN 'Leaf'
WHEN p_id is not null AND child is not null THEN 'Inner'
END AS type FROM 
(SELECT t.id, t.p_id, Q1.child FROM Tree t
LEFT JOIN 
(SELECT p_id, COUNT(p_id) AS child FROM Tree
GROUP BY p_id) Q1
ON t.id=Q1.p_id);

DROP TABLE Tree PURGE;