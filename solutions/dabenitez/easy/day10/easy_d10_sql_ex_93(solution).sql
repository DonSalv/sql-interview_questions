Create table Spotify (id int,track_name varchar(100),artist varchar(100), CONSTRAINT Spotify_pk PRIMARY KEY (id));

insert into Spotify (id, track_name, artist) values ('303651', 'Heart Wont Forget', 'Ed Sheeran');
insert into Spotify (id, track_name, artist) values ('1046089', 'Shape of you', 'Sia');
insert into Spotify (id, track_name, artist) values ('33445', 'Im the one', 'DJ Khalid');
insert into Spotify (id, track_name, artist) values ('811266', 'Young Dumb and Broke', 'DJ Khalid');
insert into Spotify (id, track_name, artist) values ('505727', 'Happier', 'Ed Sheeran');

SELECT artist, COUNT(artist) AS Ocurrences FROM Spotify
GROUP BY artist
ORDER BY Ocurrences DESC,  artist;

DROP TABLE Spotify PURGE;