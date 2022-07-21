/* 
Design a schema for Craigslist! Your schema should keep track of the following

- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
- Users and preferred region
- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
- Categories that each post belongs to
*/
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


/* 
regions
          id              |  region_name  |
--------------------------+----------------
   SERIAL PRIMARY KEY          TEXT 
*/
CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  region_name TEXT
);


/* 
users
          id              |  username  |            pref_region_id
--------------------------+------------+----------------------------------
   SERIAL PRIMARY KEY         TEXT      FOREIGN KEY REFERENCES regions (id)
*/
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT,
  pref_region_id INTEGER REFERENCES regions (id)
);

/*
categories
          id              |    category   |
--------------------------+----------------
   SERIAL PRIMARY KEY        TEXT UNIQUE
*/
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category TEXT UNIQUE
);


/*
posts
         id       | title | post_text |             user_id              | location |               region_id           |             category_id
------------------+-------+-----------+----------------------------------+----------+-----------------------------------+-------------------------------------    
SERIAL PRIMARY KEY   TEXT     TEXT      FOREIGN KEY REFERENCES users (id)    POINT    FOREIGN KEY REFERENCES regions(id)  FOREIGN KEY REFERENCES categories (id)
*/
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title TEXT,
  post_text TEXT,
  user_id INTEGER REFERENCES users (id),
  location POINT,
  region_id INTEGER REFERENCES regions (id),
  category_id INTEGER REFERENCES categories (id)
);



