--CREATE DATABASE PAAdminUsers;

--DROP TABLE paadminusers.users;

DROP TABLE users;

CREATE TABLE admin_users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  phone VARCHAR(30),
  date_created TIMESTAMP DEFAULT CURRENT_DATE,
  last_login TIMESTAMP DEFAULT NULL
);

INSERT INTO admin_users (name, username, email, password, phone)
VALUES ('Dan', 'dan', 'danieldevine74@gmail.com', 'hello', 'test');

SELECT * FROM product
WHERE name LIKE '%O%';

SELECT * FROM productcategories;

-- Query to get all drinks and type of beer
SELECT product.productid, product.name, product.country_of_origin, product.percentage, categories.name FROM product
INNER JOIN productcategories ON product.prodcatid = productcategories.prodcatid
INNER JOIN categories ON productcategories.catid = categories.catid
WHERE product.productid = 1;

SELECT * FROM pub;

SELECT name, address, location FROM pub
WHERE pubid = 1;

SELECT * FROM pubcategories;
