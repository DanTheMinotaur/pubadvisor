--CREATE DATABASE PAAdminUsers;

DROP TABLE paadminusers.users;

CREATE TABLE paadminusers.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  phone VARCHAR(30),
  date_created TIMESTAMP DEFAULT CURRENT_DATE,
  last_login TIMESTAMP DEFAULT NULL
);