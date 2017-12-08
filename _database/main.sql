CREATE TABLE admin_users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  image TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_DATE,
  last_login TIMESTAMP DEFAULT NULL
);

CREATE TABLE Pub (
	PubID serial NOT NULL,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	location TEXT NOT NULL,
	image TEXT,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PubCatID int,
	CONSTRAINT Pub_pk PRIMARY KEY (PubID)
);

CREATE TABLE Product (
	ProductID serial NOT NULL,
	country_of_origin TEXT NOT NULL,
	name TEXT NOT NULL,
	percentage numeric NOT NULL,
	quantity numeric NOT NULL,
	image TEXT,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ProdCatID int,
	CONSTRAINT Product_pk PRIMARY KEY (ProductID)
);

CREATE TABLE PubProducts (
	PubProdID serial NOT NULL,
	price numeric NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PubID int NOT NULL,
	ProductID int NOT NULL,
	CONSTRAINT PubProducts_pk PRIMARY KEY (PubProdID)
);

CREATE TABLE PubCategories (
	PubCatID serial NOT NULL,
  PubCatName name NOT NULL,
  image text,
	CONSTRAINT PubCategories_pk PRIMARY KEY (PubCatID)
);

CREATE TABLE ProductCategories (
	ProdCatID serial NOT NULL,
    ProdCatName name NOT NULL,
    description text,
    image text,
	CONSTRAINT ProductCategories_pk PRIMARY KEY (ProdCatID)
);

CREATE TABLE Hours (
	HourID serial NOT NULL,
    day text,
    opening_time text,
    closing_time text,
    PubID int NOT NULL,
	CONSTRAINT Hours_pk PRIMARY KEY (HourID)
);

ALTER TABLE Hours ADD CONSTRAINT Hours_PubID FOREIGN KEY (PubID) REFERENCES Pub(PubID);
ALTER TABLE Pub ADD CONSTRAINT Pub_PubCatID FOREIGN KEY (PubCatID) REFERENCES PubCategories(PubCatID);
ALTER TABLE Product ADD CONSTRAINT Product_ProdCatID FOREIGN KEY (ProdCatID) REFERENCES ProductCategories(ProdCatID);
ALTER TABLE PubProducts ADD CONSTRAINT PubProducts_PubID FOREIGN KEY (PubID) REFERENCES Pub(PubID);
ALTER TABLE PubProducts ADD CONSTRAINT PubProducts_ProductID FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2017-12-04 20:08:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2864 (class 0 OID 16924)
-- Dependencies: 204
-- Data for Name: pubcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pubcategories (pubcatid, pubcatname, image) VALUES (1, 'CRAFT PUB', NULL);
INSERT INTO pubcategories (pubcatid, pubcatname, image) VALUES (2, 'PUBLIC HOUSE', NULL);
INSERT INTO pubcategories (pubcatid, pubcatname, image) VALUES (3, 'NIGHTCLUB', NULL);


--
-- TOC entry 2862 (class 0 OID 16914)
-- Dependencies: 202
-- Data for Name: pub; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (2, 'Drunken Fish', 'The Excise Building, I.F.S.C.,, Mayor Street Lower, International Financial Services Centre, Dublin 1', '53.3492226,-6.2464159', '/images/drunken_fish.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (1, 'Lagoona Bar', 'Unit 4, Custom House Square, Mayor Street Lower, North Dock, Dublin', '53.3495791,-6.2452662', '/images/lagoona.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (4, 'Bernard Shaw', '11-12 Richmond St South, Saint Kevins, Dublin 2', '53.3317151,-6.2667638', '/images/bernard_shaw.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (3, 'Harbour Master', 'Customs House Dock, IFSC, Dublin 1, D01 W0X8', '53.349762,-6.2512417', '/images/harbour_master.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (6, 'Against the grain', '11 Wexford St, Dublin 2, DUBLIN 2', '53.3370639,-6.2676721', '/images/against_the_grain.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (5, 'Dicey Reillys', '21-25 Harcourt St, Saint Kevins, Dublin 2', '53.3358639,-6.2657456', '/images/diceys.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (8, 'Howl at the moon', '54-, 74 Merrion Square S, Dublin', '53.3391773,-6.2476444', '/images/howl_at_the_moon.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO pub (pubid, name, address, location, image, date_created, date_updated, pubcatid) VALUES (7, 'Chaplins', '1-2 Hawkins St, Dublin 2, D02 K590', '53.3461105,-6.2593373', '/images/chaplins.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);


--
-- TOC entry 2856 (class 0 OID 16888)
-- Dependencies: 196
-- Data for Name: hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (1, 'MONDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (2, 'TUESDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (3, 'WEDNESDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (4, 'THURSDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (5, 'FRIDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (6, 'SATURDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (7, 'SUNDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (8, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (9, 'SATURDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (10, 'SUNDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (11, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (12, 'SATURDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (13, 'SUNDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (14, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 7);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (15, 'SATURDAY', '12:30PM -', ' 02:00AM', 7);
INSERT INTO hours (hourid, day, opening_time, closing_time, pubid) VALUES (16, 'SUNDAY', '12:30PM -', ' 02:00AM', 7);


--
-- TOC entry 2860 (class 0 OID 16906)
-- Dependencies: 200
-- Data for Name: productcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO productcategories (prodcatid, prodcatname, description, image) VALUES (2, 'Beer', 'Largers etc', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories (prodcatid, prodcatname, description, image) VALUES (1, 'Craft Beer', 'Pale ales and IPAs etc', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories (prodcatid, prodcatname, description, image) VALUES (4, 'Cocktail', 'Mojitos and mixed spirits drinks', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories (prodcatid, prodcatname, description, image) VALUES (3, 'Spirit', 'Spirits such as vodka, jack daniesl etc', 'C:\Users\lenovo\Downloads\heineken.svg');


--
-- TOC entry 2858 (class 0 OID 16896)
-- Dependencies: 198
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (12, 'Ireland', 'Kopparberg', 5.4, 500, '/images/kopparberg.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (11, 'Belgium', 'Strawberry Daqiuri', 10, 330, '/images/strawberry.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (14, 'Belgium', 'Vodka', 10, 330, '/images/vodka.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (13, 'Belgium', 'Erdinger', 10, 330, '/images/erdinger.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (16, 'Belgium', 'Jack Daniels', 10, 330, '/images/jdaniels.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (15, 'Ireland', 'Captain Morgans', 5.4, 500, '/images/cmorgans.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (17, 'Scotland', 'Budweiser', 4.5, 330, '/images/budweiser.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (2, 'Belgium', 'St Bernardus, ABT', 10, 330, '/images/stbernardus.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (1, 'Ireland', 'O Brother, The Chancer', 5.4, 500, '/images/oboc.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (4, 'Holland', 'Heineken', 5.4, 500, '/images/heineken.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (3, 'Scotland', 'Brewdog, Vagabond', 4.5, 330, '/images/vagabond.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (6, 'Holland', '1664', 5.4, 500, '/images/1664.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (5, 'Belgium', 'Stella Artois', 10, 330, '/images/stella_artois.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (8, 'Ireland', 'Paulaner', 5.4, 500, '/images/paulaner.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (7, 'Ireland', 'Guinness', 10, 330, '/images/guinness.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (10, 'Ireland', 'White Russian', 5.4, 500, '/images/wrussian.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4);
INSERT INTO product (productid, country_of_origin, name, percentage, quantity, image, date_created, date_updated, prodcatid) VALUES (9, 'Belgium', 'Carlsberg', 10, 330, '/images/carlsberg.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);


--
-- TOC entry 2866 (class 0 OID 16932)
-- Dependencies: 206
-- Data for Name: pubproducts; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO pubproducts VALUES (1, 5.48, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 1);
INSERT INTO pubproducts VALUES (2, 4.07, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 2);
INSERT INTO pubproducts VALUES (3, 4.32, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 3);
INSERT INTO pubproducts VALUES (4, 6.53, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 4);
INSERT INTO pubproducts VALUES (5, 6.77, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 5);
INSERT INTO pubproducts VALUES (6, 4.08, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 6);
INSERT INTO pubproducts VALUES (7, 6.94, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 7);
INSERT INTO pubproducts VALUES (8, 6.53, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 8);
INSERT INTO pubproducts VALUES (9, 6.85, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 9);
INSERT INTO pubproducts VALUES (10, 4.85, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 10);
INSERT INTO pubproducts VALUES (11, 6.86, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 11);
INSERT INTO pubproducts VALUES (12, 5.79, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 12);
INSERT INTO pubproducts VALUES (13, 5.28, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 13);
INSERT INTO pubproducts VALUES (14, 6.75, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 14);
INSERT INTO pubproducts VALUES (15, 6.18, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 15);
INSERT INTO pubproducts VALUES (16, 4.33, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 16);
INSERT INTO pubproducts VALUES (17, 6.98, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 17);
INSERT INTO pubproducts VALUES (18, 5.53, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 1);
INSERT INTO pubproducts VALUES (19, 4.71, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 2);
INSERT INTO pubproducts VALUES (20, 5.73, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 3);
INSERT INTO pubproducts VALUES (21, 6.21, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 4);
INSERT INTO pubproducts VALUES (22, 4.76, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 5);
INSERT INTO pubproducts VALUES (23, 6.80, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 6);
INSERT INTO pubproducts VALUES (24, 5.02, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 7);
INSERT INTO pubproducts VALUES (25, 4.54, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 8);
INSERT INTO pubproducts VALUES (26, 4.08, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 9);
INSERT INTO pubproducts VALUES (27, 4.39, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 10);
INSERT INTO pubproducts VALUES (28, 4.01, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 11);
INSERT INTO pubproducts VALUES (29, 5.21, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 12);
INSERT INTO pubproducts VALUES (30, 4.60, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 13);
INSERT INTO pubproducts VALUES (31, 4.40, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 14);
INSERT INTO pubproducts VALUES (32, 6.44, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 15);
INSERT INTO pubproducts VALUES (55, 5.91, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 4);
INSERT INTO pubproducts VALUES (56, 6.79, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 5);
INSERT INTO pubproducts VALUES (57, 4.84, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 6);
INSERT INTO pubproducts VALUES (58, 6.38, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 7);
INSERT INTO pubproducts VALUES (59, 5.78, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 8);
INSERT INTO pubproducts VALUES (60, 6.14, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 9);
INSERT INTO pubproducts VALUES (61, 4.39, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 10);
INSERT INTO pubproducts VALUES (62, 6.79, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 11);
INSERT INTO pubproducts VALUES (63, 6.86, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 12);
INSERT INTO pubproducts VALUES (64, 4.51, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 13);
INSERT INTO pubproducts VALUES (65, 6.71, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 14);
INSERT INTO pubproducts VALUES (66, 6.18, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 15);
INSERT INTO pubproducts VALUES (67, 4.24, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 16);
INSERT INTO pubproducts VALUES (68, 5.67, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 17);
INSERT INTO pubproducts VALUES (69, 5.90, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 1);
INSERT INTO pubproducts VALUES (70, 5.12, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 2);
INSERT INTO pubproducts VALUES (71, 6.95, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 3);
INSERT INTO pubproducts VALUES (72, 4.16, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 4);
INSERT INTO pubproducts VALUES (73, 5.52, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 5);
INSERT INTO pubproducts VALUES (74, 6.79, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 6);
INSERT INTO pubproducts VALUES (75, 4.95, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 7);
INSERT INTO pubproducts VALUES (76, 5.04, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 8);
INSERT INTO pubproducts VALUES (77, 6.36, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 9);
INSERT INTO pubproducts VALUES (78, 4.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 10);
INSERT INTO pubproducts VALUES (79, 4.62, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 11);
INSERT INTO pubproducts VALUES (80, 5.98, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 12);
INSERT INTO pubproducts VALUES (81, 6.20, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 13);
INSERT INTO pubproducts VALUES (82, 6.25, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 14);
INSERT INTO pubproducts VALUES (83, 5.45, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 15);
INSERT INTO pubproducts VALUES (84, 6.97, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 16);
INSERT INTO pubproducts VALUES (85, 5.84, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 17);
INSERT INTO pubproducts VALUES (86, 6.53, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 1);
INSERT INTO pubproducts VALUES (87, 5.40, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 2);
INSERT INTO pubproducts VALUES (88, 6.23, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 3);
INSERT INTO pubproducts VALUES (89, 6.53, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 4);
INSERT INTO pubproducts VALUES (90, 5.05, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 5);
INSERT INTO pubproducts VALUES (91, 4.01, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 6);
INSERT INTO pubproducts VALUES (92, 5.98, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 7);
INSERT INTO pubproducts VALUES (93, 5.18, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 8);
INSERT INTO pubproducts VALUES (94, 4.64, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 9);
INSERT INTO pubproducts VALUES (95, 5.54, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 10);
INSERT INTO pubproducts VALUES (96, 4.04, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 11);
INSERT INTO pubproducts VALUES (97, 5.40, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 12);
INSERT INTO pubproducts VALUES (98, 4.19, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 13);
INSERT INTO pubproducts VALUES (99, 6.87, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 14);
INSERT INTO pubproducts VALUES (100, 6.03, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 15);
INSERT INTO pubproducts VALUES (101, 6.41, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 16);
INSERT INTO pubproducts VALUES (102, 4.13, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 17);
INSERT INTO pubproducts VALUES (33, 4.74, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 16);
INSERT INTO pubproducts VALUES (34, 4.10, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 17);
INSERT INTO pubproducts VALUES (35, 5.88, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 1);
INSERT INTO pubproducts VALUES (36, 6.84, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 2);
INSERT INTO pubproducts VALUES (37, 6.67, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 3);
INSERT INTO pubproducts VALUES (38, 5.21, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 4);
INSERT INTO pubproducts VALUES (39, 5.35, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 5);
INSERT INTO pubproducts VALUES (40, 6.25, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 6);
INSERT INTO pubproducts VALUES (41, 5.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 7);
INSERT INTO pubproducts VALUES (42, 4.70, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 8);
INSERT INTO pubproducts VALUES (43, 6.84, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 9);
INSERT INTO pubproducts VALUES (44, 6.39, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 10);
INSERT INTO pubproducts VALUES (45, 6.43, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 11);
INSERT INTO pubproducts VALUES (46, 5.45, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 12);
INSERT INTO pubproducts VALUES (47, 4.31, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 13);
INSERT INTO pubproducts VALUES (48, 6.63, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 14);
INSERT INTO pubproducts VALUES (49, 5.99, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 15);
INSERT INTO pubproducts VALUES (50, 5.97, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 16);
INSERT INTO pubproducts VALUES (51, 6.20, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 17);
INSERT INTO pubproducts VALUES (52, 4.19, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 1);
INSERT INTO pubproducts VALUES (53, 6.87, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 2);
INSERT INTO pubproducts VALUES (54, 4.47, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 3);
INSERT INTO pubproducts VALUES (103, 5.65, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 1);
INSERT INTO pubproducts VALUES (104, 6.86, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 2);
INSERT INTO pubproducts VALUES (105, 4.49, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 3);
INSERT INTO pubproducts VALUES (106, 6.17, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 4);
INSERT INTO pubproducts VALUES (107, 4.96, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 5);
INSERT INTO pubproducts VALUES (108, 6.25, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 6);
INSERT INTO pubproducts VALUES (109, 6.27, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 7);
INSERT INTO pubproducts VALUES (110, 4.94, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 8);
INSERT INTO pubproducts VALUES (111, 5.57, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 9);
INSERT INTO pubproducts VALUES (112, 5.33, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 10);
INSERT INTO pubproducts VALUES (113, 4.84, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 11);
INSERT INTO pubproducts VALUES (114, 5.58, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 12);
INSERT INTO pubproducts VALUES (115, 4.07, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 13);
INSERT INTO pubproducts VALUES (116, 5.42, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 14);
INSERT INTO pubproducts VALUES (117, 4.82, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 15);
INSERT INTO pubproducts VALUES (118, 6.86, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 16);
INSERT INTO pubproducts VALUES (119, 5.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 17);
INSERT INTO pubproducts VALUES (120, 5.39, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 1);
INSERT INTO pubproducts VALUES (121, 5.55, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 2);
INSERT INTO pubproducts VALUES (122, 4.87, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 3);
INSERT INTO pubproducts VALUES (123, 4.77, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 4);
INSERT INTO pubproducts VALUES (124, 4.42, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 5);
INSERT INTO pubproducts VALUES (125, 4.56, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 6);
INSERT INTO pubproducts VALUES (126, 5.03, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 7);
INSERT INTO pubproducts VALUES (127, 4.67, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 8);
INSERT INTO pubproducts VALUES (128, 5.31, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 9);
INSERT INTO pubproducts VALUES (129, 4.33, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 10);
INSERT INTO pubproducts VALUES (130, 6.69, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 11);
INSERT INTO pubproducts VALUES (131, 5.72, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 12);
INSERT INTO pubproducts VALUES (132, 5.25, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 13);
INSERT INTO pubproducts VALUES (133, 5.86, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 14);
INSERT INTO pubproducts VALUES (134, 5.05, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 15);
INSERT INTO pubproducts VALUES (135, 5.49, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 16);
INSERT INTO pubproducts VALUES (136, 4.61, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 17);


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 197
-- Name: hours_hourid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hours_hourid_seq', 16, true);


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 199
-- Name: product_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_productid_seq', 17, true);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 201
-- Name: productcategories_prodcatid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('productcategories_prodcatid_seq', 4, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 203
-- Name: pub_pubid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pub_pubid_seq', 8, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 205
-- Name: pubcategories_pubcatid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pubcategories_pubcatid_seq', 3, true);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 207
-- Name: pubproducts_pubprodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pubproducts_pubprodid_seq', 136, true);


-- Completed on 2017-12-04 20:08:20

--
-- PostgreSQL database dump complete
--

