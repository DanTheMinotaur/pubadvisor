--CREATE DATABASE PAAdminUsers;

DROP TABLE users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  image TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_DATE,
  last_login TIMESTAMP DEFAULT NULL
);