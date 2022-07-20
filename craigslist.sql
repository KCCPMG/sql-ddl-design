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
          id              |  regionName  |
--------------------------+----------------
   SERIAL PRIMARY KEY        TEXT UNIQUE
*/
CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  regionName TEXT
);


/* 
users
          id              |  username  |  prefRegionId
--------------------------+------------+----------------------------------
   SERIAL PRIMARY KEY         TEXT      FOREIGN KEY REFERENCES regions (id)
*/
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT,
  prefRegionId INTEGER REFERENCES regions (id)
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
         id       | title | postText |             userId              | location |               regionId           |             categoryId
------------------+-------+-----------+----------------------------------+----------+-----------------------------------+-------------------------------------    
SERIAL PRIMARY KEY   TEXT     TEXT      FOREIGN KEY REFERENCES users (id)    TEXT     FOREIGN KEY REFERENCES regions(id)  FOREIGN KEY REFERENCES categories (id)
*/
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title TEXT,
  postText TEXT,
  userId INTEGER REFERENCES users (id),
  location TEXT,
  regionId INTEGER REFERENCES regions (id),
  categoryId INTEGER REFERENCES categories (id)
);



