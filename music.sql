-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

create TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

create TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

create TABLE artist_credits(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artists (id),
  song_id INTEGER REFERENCES songs (id)
);

create TABLE producer_credits(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers (id),
  song_id INTEGER REFERENCES songs (id)
);


INSERT INTO artists (name) 
  VALUES 
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny&apos;s Child');
  


INSERT INTO producers (name) 
  VALUES 
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');



INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975',  'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream' ),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born' ),
  ('How You Remind Me', 223, '08-21-2001',  'Silver Side Up' ),
  ('New York State of Mind', 276, '10-20-2009',  'The Blueprint 3' ),
  ('Dark Horse', 215, '12-17-2013',  'Prism' ),
  ('Moves Like Jagger', 201, '06-21-2011',  'Hands All Over' ),
  ('Complicated', 244, '05-14-2002', 'Let Go' ),
  ('Say My Name', 240, '11-07-1999', 'The Writing&apos;s on the Wall' );



INSERT INTO artist_credits (artist_id, song_id) 
  VALUES
  ((SELECT id FROM artists WHERE name='Hanson'), 1),
  ((SELECT id FROM artists WHERE name='Queen'), 2),
  ((SELECT id FROM artists WHERE name='Mariah Cary'), 3),
  ((SELECT id FROM artists WHERE name='Boyz II Men'), 3),
  ((SELECT id FROM artists WHERE name='Lady Gaga'), 4),
  ((SELECT id FROM artists WHERE name='Bradley Cooper'), 4),
  ((SELECT id FROM artists WHERE name='Nickelback'), 5),
  ((SELECT id FROM artists WHERE name='Jay Z'), 6),
  ((SELECT id FROM artists WHERE name='Alicia Keys'), 6),
  ((SELECT id FROM artists WHERE name='Katy Perry'), 7),
  ((SELECT id FROM artists WHERE name='Juicy J'), 7),
  ((SELECT id FROM artists WHERE name='Maroon 5'), 8), 
  ((SELECT id FROM artists WHERE name='Christina Aguilera'), 8),
  ((SELECT id FROM artists WHERE name='Avril Lavigne'), 9),
  ((SELECT id FROM artists WHERE name='Destiny&apos;s Child'), 10);

/*
                artists              | id
-----------------------------------+----
 {Hanson}                          |  1
 {Queen}                           |  2
 {"Mariah Cary","Boyz II Men"}     |  3
 {"Lady Gaga","Bradley Cooper"}    |  4
 {Nickelback}                      |  5
 {"Jay Z","Alicia Keys"}           |  6
 {"Katy Perry","Juicy J"}          |  7
 {"Maroon 5","Christina Aguilera"} |  8
 {"Avril Lavigne"}                 |  9
 {"Destiny's Child"}               | 10
*/



INSERT INTO producer_credits (producer_id, song_id)
  VALUES
  ((SELECT id FROM producers WHERE name='Dust Brothers'), 1),
  ((SELECT id FROM producers WHERE name='Stephen Lironi'), 1),
  ((SELECT id FROM producers WHERE name='Roy Thomas Baker'), 2),
  ((SELECT id FROM producers WHERE name='Walter Afanasieff'), 3),
  ((SELECT id FROM producers WHERE name='Benjamin Rice'), 4),
  ((SELECT id FROM producers WHERE name='Rick Parashar'), 5),
  ((SELECT id FROM producers WHERE name='Al Shux'), 6),
  ((SELECT id FROM producers WHERE name='Max Martin'), 7),
  ((SELECT id FROM producers WHERE name='Cirkut'), 7),
  ((SELECT id FROM producers WHERE name='Shellback'), 8),
  ((SELECT id FROM producers WHERE name='Benny Blanco'), 8),
  ((SELECT id FROM producers WHERE name='The Matrix'), 9),
  ((SELECT id FROM producers WHERE name='Darkchild'), 10);


/*
               producers              | id
------------------------------------+----
 {"Dust Brothers","Stephen Lironi"} |  1
 {"Roy Thomas Baker"}               |  2
 {"Walter Afanasieff"}              |  3
 {"Benjamin Rice"}                  |  4
 {"Rick Parashar"}                  |  5
 {"Al Shux"}                        |  6
 {"Max Martin",Cirkut}              |  7
 {Shellback,"Benny Blanco"}         |  8
 {"The Matrix"}                     |  9
 {Darkchild}                        | 10
  */ 



