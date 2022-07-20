/*
Design a schema for a simple sports league. Your schema should keep track of

- All of the teams in the league
- All of the goals scored by every player for each game
- All of the players in the league and their corresponding teams
- All of the referees who have been part of each game
- All of the matches played between teams
- All of the start and end dates for season that a league has
- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
*/

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

/*
teams (includes points to capture standings)
          id              |  team_name  | points |
--------------------------+-------------+---------
   SERIAL PRIMARY KEY       TEXT UNIQUE   INTEGER
*/
CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name TEXT UNIQUE,
  points INTEGER
);


/*
players
          id              |  player_name  |             team_id
--------------------------+---------------+----------------------------------
   SERIAL PRIMARY KEY           TEXT        FOREIGN KEY REFERENCES teams (id)
*/
CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_name TEXT,
  team_id INTEGER REFERENCES teams (id)
);

/* 
matches (schema handles scores though that can be gotten from goals) 
          id           |           home_team_id           |           away_team_id           | home_score | away_score | date
-----------------------+----------------------------------+----------------------------------+------------+------------+------
   SERIAL PRIMARY KEY   FOREIGN KEY REFERENCES teams (id)   FOREIGN KEY REFERENCES teams (id)    INTEGER      INTEGER    DATE
*/
CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES teams (id),
  away_team_id INTEGER REFERENCES teams (id),
  home_score INTEGER,
  away_score INTEGER,
  date DATE
);



/* 
referees 
        id         | name
-------------------+------
SERIAL PRIMARY KEY   TEXT
*/
CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  name TEXT
);


/* 
referee_assignments 
        id        |             referee_id              |               match_id
------------------+-------------------------------------+------------------------------------
SERIAL PRIMARY KEY  FOREIGN KEY REFERENCES referees (id)  FOREIGN KEY REFERENCES matches (id) 
*/
CREATE TABLE referee_assignments (
  id SERIAL PRIMARY KEY,
  referee_id INTEGER REFERENCES referees (id),
  match_id INTEGER REFERENCES matches (id)
);


/*
goals (keeping team_id due to possibility of player changing teams)
          id              |            player_id                |             match_id              |              team_id
--------------------------+-------------------------------------+-----------------------------------+----------------------------------
   SERIAL PRIMARY KEY      FOREIGN KEY REFERENCES players (id)   FOREIGN KEY REFERENCES matches (id)  FOREIGN KEY REFERENCES teams (id)
*/
CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players (id),
  match_id INTEGER REFERENCES matches (id),
  team_id INTEGER REFERENCES teams (id)
);


/* 
league_dates (assuming each row is one season)
         id        | start_date |         end_date
-------------------+------------+-------------------------
SERIAL PRIMARY KEY     DATE       DATE CHECK > start_date
*/
CREATE TABLE league_dates (
  id SERIAL PRIMARY KEY,
  start_date INTEGER,
  end_date INTEGER CHECK (end_date > start_date)
)