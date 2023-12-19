Create table Genders (user_id int, gender VARCHAR2(10), CONSTRAINT Genders_pk PRIMARY KEY (user_id),
CONSTRAINT gender_check CHECK (gender IN ('female', 'other', 'male')));

insert into Genders (user_id, gender) values ('4', 'male');
insert into Genders (user_id, gender) values ('7', 'female');
insert into Genders (user_id, gender) values ('2', 'other');
insert into Genders (user_id, gender) values ('5', 'male');
insert into Genders (user_id, gender) values ('3', 'female');
insert into Genders (user_id, gender) values ('8', 'male');
insert into Genders (user_id, gender) values ('6', 'other');
insert into Genders (user_id, gender) values ('1', 'other');
insert into Genders (user_id, gender) values ('9', 'female');

SELECT user_id, gender FROM
(SELECT user_id, gender,
CASE WHEN gender='female' THEN 1 WHEN gender='other' THEN 2 ELSE 3 END AS rank_gender,
RANK() OVER (PARTITION BY gender ORDER BY user_id) AS ranking FROM Genders)
ORDER BY ranking, rank_gender;

DROP TABLE Genders PURGE;