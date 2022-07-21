-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries (id)
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat_id INTEGER REFERENCES seats (id),
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines (id),
  from_id INTEGER REFERENCES cities (id),
  to_id INTEGER REFERENCES cities (id)
);


INSERT INTO seats (name) 
  VALUES 
  ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('32B'),
  ('10D');


INSERT INTO airlines (name)
  VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO countries (name)
  VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');


INSERT INTO cities (name, country_id)
  VALUES
  ('Washington DC', (SELECT id FROM countries WHERE name='United States')),
  ('Seattle', (SELECT id FROM countries WHERE name='United States')),
  ('Tokyo', (SELECT id FROM countries WHERE name='Japan')),
  ('London', (SELECT id FROM countries WHERE name='United Kingdom')),
  ('Los Angeles', (SELECT id FROM countries WHERE name='United States')),
  ('Las Vegas', (SELECT id FROM countries WHERE name='United States')),
  ('Mexico City', (SELECT id FROM countries WHERE name='Mexico')),
  ('Paris', (SELECT id FROM countries WHERE name='France')),
  ('Casablanca', (SELECT id FROM countries WHERE name='Morocco')),
  ('Dubai', (SELECT id FROM countries WHERE name='UAE')),
  ('Beijing', (SELECT id FROM countries WHERE name='China')),
  ('New York', (SELECT id FROM countries WHERE name='United States')),
  ('Charlotte', (SELECT id FROM countries WHERE name='United States')),
  ('Cedar Rapids', (SELECT id FROM countries WHERE name='United States')),
  ('Chicago', (SELECT id FROM countries WHERE name='United States')),
  ('Sao Paolo', (SELECT id FROM countries WHERE name='Brazil')),
  ('Santiago', (SELECT id FROM countries WHERE name='Chile'));





INSERT INTO tickets
  (first_name, last_name, seat_id, departure, arrival, airline, from_id, to_id)
VALUES
  ('Jennifer', 'Finch', (SELECT id FROM seats WHERE name='33B'), '2018-04-08 09:00:00', '2018-04-08 12:00:00', (SELECT id FROM airlines WHERE name='United'), (SELECT id FROM cities WHERE name='Washington DC'), (SELECT id FROM cities WHERE name='Seattle')),
  ('Thadeus', 'Gathercoal', (SELECT id FROM seats WHERE name='8A'), '2018-12-19 12:45:00', '2018-12-19 16:15:00', (SELECT id FROM airlines WHERE name='British Airways'), (SELECT id FROM cities WHERE name='Tokyo'), (SELECT id FROM cities WHERE name='London')),
  ('Sonja', 'Pauley', (SELECT id FROM seats WHERE name='12F'), '2018-01-02 07:00:00', '2018-01-02 08:03:00', (SELECT id FROM airlines WHERE name='Delta'), (SELECT id FROM cities WHERE name='Los Angeles'), (SELECT id FROM cities WHERE name='Las Vegas')),
  ('Jennifer', 'Finch', (SELECT id FROM seats WHERE name='20A'), '2018-04-15 16:50:00', '2018-04-15 21:00:00', (SELECT id FROM airlines WHERE name='Delta'), (SELECT id FROM cities WHERE name='Seattle'), (SELECT id FROM cities WHERE name='Mexico City')),
  ('Waneta', 'Skeleton', (SELECT id FROM seats WHERE name='23D'), '2018-08-01 18:30:00', '2018-08-01 21:50:00', (SELECT id FROM airlines WHERE name='Tui Fly Belgium'), (SELECT id FROM cities WHERE name='Paris'), (SELECT id FROM cities WHERE name='Casablanca')),
  ('Thadeus', 'Gathercoal', (SELECT id FROM seats WHERE name='18C'), '2018-10-31 01:15:00', '2018-10-31 12:55:00', (SELECT id FROM airlines WHERE name='Air China'), (SELECT id FROM cities WHERE name='Dubai'), (SELECT id FROM cities WHERE name='Beijing')),
  ('Berkie', 'Wycliff', (SELECT id FROM seats WHERE name='9E'), '2019-02-06 06:00:00', '2019-02-06 07:47:00', (SELECT id FROM airlines WHERE name='United'), (SELECT id FROM cities WHERE name='New York'), (SELECT id FROM cities WHERE name='Charlotte')),
  ('Alvin', 'Leathes', (SELECT id FROM seats WHERE name='1A'), '2018-12-22 14:42:00', '2018-12-22 15:56:00', (SELECT id FROM airlines WHERE name='American Airlines'), (SELECT id FROM cities WHERE name='Cedar Rapids'), (SELECT id FROM cities WHERE name='Chicago')),
  ('Berkie', 'Wycliff', (SELECT id FROM seats WHERE name='32B'), '2019-02-06 16:28:00', '2019-02-06 19:18:00', (SELECT id FROM airlines WHERE name='American Airlines'), (SELECT id FROM cities WHERE name='Charlotte'), (SELECT id FROM cities WHERE name='New Orleans')),
  ('Cory', 'Squibbes', (SELECT id FROM seats WHERE name='10D'), '2019-01-20 19:30:00', '2019-01-20 22:45:00', (SELECT id FROM airlines WHERE name='Avianca Brasil'), (SELECT id FROM cities WHERE name='Sao Paolo'), (SELECT id FROM cities WHERE name='Santiago'));


