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

INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (1, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (2, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (3, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (4, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (5, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (6, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (7, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (8, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (9, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (10, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (11, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (12, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (13, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (14, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (15, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (16, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (17, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (18, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (19, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (20, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (21, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (22, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (23, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (24, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (25, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (26, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (27, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (28, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (29, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (30, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (31, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (32, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (33, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (34, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (35, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (36, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (37, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (38, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (39, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (40, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (41, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (42, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (43, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (44, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (45, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (46, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (47, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (48, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (49, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (50, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (51, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (52, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (53, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (54, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (55, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (56, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (57, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (58, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (59, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (60, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (61, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (62, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (63, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (64, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (65, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (66, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (67, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (68, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 7, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (69, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (70, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (71, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (72, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (73, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (74, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (75, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (76, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (77, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (78, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (79, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (80, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (81, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (82, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (83, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (84, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (85, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 8, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (86, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (87, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (88, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (89, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (90, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (91, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (92, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (93, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (94, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (95, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (96, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (97, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (98, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (99, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (100, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (101, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (102, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 5, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (103, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (104, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (105, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (106, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (107, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (108, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (109, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (110, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (111, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (112, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (113, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (114, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (115, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (116, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (117, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (118, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (119, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4, 17);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (120, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 1);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (121, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 2);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (122, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 3);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (123, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 4);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (124, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 5);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (125, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 6);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (126, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 7);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (127, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 8);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (128, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 9);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (129, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 10);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (130, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 11);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (131, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 12);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (132, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 13);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (133, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 14);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (134, 7.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 15);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (135, 7.50, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 16);
INSERT INTO pubproducts (pubprodid, price, date_created, date_updated, pubid, productid) VALUES (136, 8.00, '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 6, 17);


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

