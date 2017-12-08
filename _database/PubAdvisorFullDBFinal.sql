--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-12-08 22:42:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "PubAdvisor";
--
-- TOC entry 2243 (class 1262 OID 16384)
-- Name: PubAdvisor; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "PubAdvisor" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Ireland.1252' LC_CTYPE = 'English_Ireland.1252';


ALTER DATABASE "PubAdvisor" OWNER TO postgres;

\connect "PubAdvisor"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 25454)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(200) NOT NULL,
    image text,
    date_created timestamp without time zone DEFAULT CURRENT_DATE,
    last_login timestamp without time zone
);


ALTER TABLE admin_users OWNER TO pubadvisor_admin;

--
-- TOC entry 196 (class 1259 OID 25452)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 196
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- TOC entry 209 (class 1259 OID 25531)
-- Name: hours; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE hours (
    hourid integer NOT NULL,
    day text,
    opening_time text,
    closing_time text,
    pubid integer NOT NULL
);


ALTER TABLE hours OWNER TO pubadvisor_admin;

--
-- TOC entry 208 (class 1259 OID 25529)
-- Name: hours_hourid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE hours_hourid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hours_hourid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 208
-- Name: hours_hourid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE hours_hourid_seq OWNED BY hours.hourid;


--
-- TOC entry 201 (class 1259 OID 25483)
-- Name: product; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE product (
    productid integer NOT NULL,
    country_of_origin text NOT NULL,
    name text NOT NULL,
    percentage numeric NOT NULL,
    quantity numeric NOT NULL,
    image text,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    prodcatid integer
);


ALTER TABLE product OWNER TO pubadvisor_admin;

--
-- TOC entry 200 (class 1259 OID 25481)
-- Name: product_productid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE product_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_productid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 200
-- Name: product_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE product_productid_seq OWNED BY product.productid;


--
-- TOC entry 207 (class 1259 OID 25520)
-- Name: productcategories; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE productcategories (
    prodcatid integer NOT NULL,
    prodcatname name NOT NULL,
    description text,
    image text
);


ALTER TABLE productcategories OWNER TO pubadvisor_admin;

--
-- TOC entry 206 (class 1259 OID 25518)
-- Name: productcategories_prodcatid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE productcategories_prodcatid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productcategories_prodcatid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 206
-- Name: productcategories_prodcatid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE productcategories_prodcatid_seq OWNED BY productcategories.prodcatid;


--
-- TOC entry 199 (class 1259 OID 25470)
-- Name: pub; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE pub (
    pubid integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    location text NOT NULL,
    image text,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pubcatid integer
);


ALTER TABLE pub OWNER TO pubadvisor_admin;

--
-- TOC entry 198 (class 1259 OID 25468)
-- Name: pub_pubid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE pub_pubid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pub_pubid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 198
-- Name: pub_pubid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE pub_pubid_seq OWNED BY pub.pubid;


--
-- TOC entry 205 (class 1259 OID 25509)
-- Name: pubcategories; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE pubcategories (
    pubcatid integer NOT NULL,
    pubcatname name NOT NULL,
    image text
);


ALTER TABLE pubcategories OWNER TO pubadvisor_admin;

--
-- TOC entry 204 (class 1259 OID 25507)
-- Name: pubcategories_pubcatid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE pubcategories_pubcatid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pubcategories_pubcatid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 204
-- Name: pubcategories_pubcatid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE pubcategories_pubcatid_seq OWNED BY pubcategories.pubcatid;


--
-- TOC entry 203 (class 1259 OID 25496)
-- Name: pubproducts; Type: TABLE; Schema: public; Owner: pubadvisor_admin
--

CREATE TABLE pubproducts (
    pubprodid integer NOT NULL,
    price numeric NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pubid integer NOT NULL,
    productid integer NOT NULL
);


ALTER TABLE pubproducts OWNER TO pubadvisor_admin;

--
-- TOC entry 202 (class 1259 OID 25494)
-- Name: pubproducts_pubprodid_seq; Type: SEQUENCE; Schema: public; Owner: pubadvisor_admin
--

CREATE SEQUENCE pubproducts_pubprodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pubproducts_pubprodid_seq OWNER TO pubadvisor_admin;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 202
-- Name: pubproducts_pubprodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pubadvisor_admin
--

ALTER SEQUENCE pubproducts_pubprodid_seq OWNED BY pubproducts.pubprodid;


--
-- TOC entry 2067 (class 2604 OID 25457)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 25534)
-- Name: hours hourid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY hours ALTER COLUMN hourid SET DEFAULT nextval('hours_hourid_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 25486)
-- Name: product productid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY product ALTER COLUMN productid SET DEFAULT nextval('product_productid_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 25523)
-- Name: productcategories prodcatid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY productcategories ALTER COLUMN prodcatid SET DEFAULT nextval('productcategories_prodcatid_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 25473)
-- Name: pub pubid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pub ALTER COLUMN pubid SET DEFAULT nextval('pub_pubid_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 25512)
-- Name: pubcategories pubcatid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubcategories ALTER COLUMN pubcatid SET DEFAULT nextval('pubcategories_pubcatid_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 25499)
-- Name: pubproducts pubprodid; Type: DEFAULT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubproducts ALTER COLUMN pubprodid SET DEFAULT nextval('pubproducts_pubprodid_seq'::regclass);


--
-- TOC entry 2226 (class 0 OID 25454)
-- Dependencies: 197
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO admin_users VALUES (1, 'Daniel Devine', 'neonlampshade', 'danieldevine74@gmail.com', '$2y$10$dF9QA5Vfe.WfwYBFCQW5heej1aK6fdaBOeKOuthtRqWj7kvxh97uy', 'images/admin/neonlampshade.jpg', '2017-12-08 00:00:00', NULL);
INSERT INTO admin_users VALUES (2, 'Daniel Devine', 'god', 'dan@dan.com', '$2y$10$cqpwpCr9dnrfqKMke48Z6uQxdM4mA0GyxIWzVL/QUCDmFmEA4yLAS', 'images/admin/god.jpg', '2017-12-08 00:00:00', NULL);


--
-- TOC entry 2238 (class 0 OID 25531)
-- Dependencies: 209
-- Data for Name: hours; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO hours VALUES (1, 'MONDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (2, 'TUESDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (3, 'WEDNESDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (4, 'THURSDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (5, 'FRIDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (6, 'SATURDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (7, 'SUNDAY', '12:30PM -', ' 02:00AM', 1);
INSERT INTO hours VALUES (8, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours VALUES (9, 'SATURDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours VALUES (10, 'SUNDAY', '12:30PM -', ' 02:00AM', 2);
INSERT INTO hours VALUES (11, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours VALUES (12, 'SATURDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours VALUES (13, 'SUNDAY', '12:30PM -', ' 02:00AM', 3);
INSERT INTO hours VALUES (14, 'MONDAY - FRIDAY', '12:30PM -', ' 02:00AM', 7);
INSERT INTO hours VALUES (15, 'SATURDAY', '12:30PM -', ' 02:00AM', 7);
INSERT INTO hours VALUES (16, 'SUNDAY', '12:30PM -', ' 02:00AM', 7);


--
-- TOC entry 2230 (class 0 OID 25483)
-- Dependencies: 201
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO product VALUES (12, 'Ireland', 'Kopparberg', 5.4, 500, '/images/kopparberg.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (11, 'Belgium', 'Strawberry Daqiuri', 10, 330, '/images/strawberry.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4);
INSERT INTO product VALUES (14, 'Belgium', 'Vodka', 10, 330, '/images/vodka.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product VALUES (13, 'Belgium', 'Erdinger', 10, 330, '/images/erdinger.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (16, 'Belgium', 'Jack Daniels', 10, 330, '/images/jdaniels.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product VALUES (15, 'Ireland', 'Captain Morgans', 5.4, 500, '/images/cmorgans.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO product VALUES (17, 'Scotland', 'Budweiser', 4.5, 330, '/images/budweiser.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (2, 'Belgium', 'St Bernardus, ABT', 10, 330, '/images/stbernardus.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product VALUES (1, 'Ireland', 'O Brother, The Chancer', 5.4, 500, '/images/oboc.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product VALUES (4, 'Holland', 'Heineken', 5.4, 500, '/images/heineken.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (3, 'Scotland', 'Brewdog, Vagabond', 4.5, 330, '/images/vagabond.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO product VALUES (6, 'Holland', '1664', 5.4, 500, '/images/1664.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (5, 'Belgium', 'Stella Artois', 10, 330, '/images/stella_artois.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (8, 'Ireland', 'Paulaner', 5.4, 500, '/images/paulaner.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (7, 'Ireland', 'Guinness', 10, 330, '/images/guinness.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (10, 'Ireland', 'White Russian', 5.4, 500, '/images/wrussian.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 4);
INSERT INTO product VALUES (9, 'Belgium', 'Carlsberg', 10, 330, '/images/carlsberg.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO product VALUES (18, 'djsna', 'Test', 0.2, 1, 'Hello', '2017-12-08 16:18:34.058337', '2017-12-08 16:18:34.058337', 3);
INSERT INTO product VALUES (19, 'dsf', 'dsf', 0.3, 1, 'dsfdsf', '2017-12-08 21:29:03.770811', '2017-12-08 21:29:03.770811', 1);


--
-- TOC entry 2236 (class 0 OID 25520)
-- Dependencies: 207
-- Data for Name: productcategories; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO productcategories VALUES (2, 'Beer', 'Largers etc', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories VALUES (1, 'Craft Beer', 'Pale ales and IPAs etc', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories VALUES (4, 'Cocktail', 'Mojitos and mixed spirits drinks', 'C:\Users\lenovo\Downloads\heineken.svg');
INSERT INTO productcategories VALUES (3, 'Spirit', 'Spirits such as vodka, jack daniesl etc', 'C:\Users\lenovo\Downloads\heineken.svg');


--
-- TOC entry 2228 (class 0 OID 25470)
-- Dependencies: 199
-- Data for Name: pub; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO pub VALUES (2, 'Drunken Fish', 'The Excise Building, I.F.S.C.,, Mayor Street Lower, International Financial Services Centre, Dublin 1', '53.3492226,-6.2464159', '/images/drunken_fish.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub VALUES (1, 'Lagoona Bar', 'Unit 4, Custom House Square, Mayor Street Lower, North Dock, Dublin', '53.3495791,-6.2452662', '/images/lagoona.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub VALUES (4, 'Bernard Shaw', '11-12 Richmond St South, Saint Kevins, Dublin 2', '53.3317151,-6.2667638', '/images/bernard_shaw.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO pub VALUES (3, 'Harbour Master', 'Customs House Dock, IFSC, Dublin 1, D01 W0X8', '53.349762,-6.2512417', '/images/harbour_master.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub VALUES (6, 'Against the grain', '11 Wexford St, Dublin 2, DUBLIN 2', '53.3370639,-6.2676721', '/images/against_the_grain.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 1);
INSERT INTO pub VALUES (5, 'Dicey Reillys', '21-25 Harcourt St, Saint Kevins, Dublin 2', '53.3358639,-6.2657456', '/images/diceys.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO pub VALUES (8, 'Howl at the moon', '54-, 74 Merrion Square S, Dublin', '53.3391773,-6.2476444', '/images/howl_at_the_moon.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 3);
INSERT INTO pub VALUES (7, 'Chaplins', '1-2 Hawkins St, Dublin 2, D02 K590', '53.3461105,-6.2593373', '/images/chaplins.png', '2017-12-03 16:23:22.353145', '2017-12-03 16:23:22.353145', 2);
INSERT INTO pub VALUES (9, 'Daniel', 'ADJSnkajd', 'ssadlk', 'img', '2017-12-08 17:52:21.066817', '2017-12-08 17:52:21.066817', 1);
INSERT INTO pub VALUES (10, 'Helloq', 'dnfakjd', 'dslkfmldsf', 'dsfdsfsdf', '2017-12-08 20:43:45.025337', '2017-12-08 20:43:45.025337', 1);


--
-- TOC entry 2234 (class 0 OID 25509)
-- Dependencies: 205
-- Data for Name: pubcategories; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
--

INSERT INTO pubcategories VALUES (1, 'CRAFT PUB', NULL);
INSERT INTO pubcategories VALUES (2, 'PUBLIC HOUSE', NULL);
INSERT INTO pubcategories VALUES (3, 'NIGHTCLUB', NULL);


--
-- TOC entry 2232 (class 0 OID 25496)
-- Dependencies: 203
-- Data for Name: pubproducts; Type: TABLE DATA; Schema: public; Owner: pubadvisor_admin
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
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 196
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('admin_users_id_seq', 2, true);


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 208
-- Name: hours_hourid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('hours_hourid_seq', 16, true);


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 200
-- Name: product_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('product_productid_seq', 19, true);


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 206
-- Name: productcategories_prodcatid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('productcategories_prodcatid_seq', 4, true);


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 198
-- Name: pub_pubid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('pub_pubid_seq', 10, true);


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 204
-- Name: pubcategories_pubcatid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('pubcategories_pubcatid_seq', 3, true);


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 202
-- Name: pubproducts_pubprodid_seq; Type: SEQUENCE SET; Schema: public; Owner: pubadvisor_admin
--

SELECT pg_catalog.setval('pubproducts_pubprodid_seq', 136, true);


--
-- TOC entry 2082 (class 2606 OID 25467)
-- Name: admin_users admin_users_email_key; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_email_key UNIQUE (email);


--
-- TOC entry 2084 (class 2606 OID 25463)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 25465)
-- Name: admin_users admin_users_username_key; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_username_key UNIQUE (username);


--
-- TOC entry 2098 (class 2606 OID 25539)
-- Name: hours hours_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY hours
    ADD CONSTRAINT hours_pk PRIMARY KEY (hourid);


--
-- TOC entry 2090 (class 2606 OID 25493)
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pk PRIMARY KEY (productid);


--
-- TOC entry 2096 (class 2606 OID 25528)
-- Name: productcategories productcategories_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY productcategories
    ADD CONSTRAINT productcategories_pk PRIMARY KEY (prodcatid);


--
-- TOC entry 2088 (class 2606 OID 25480)
-- Name: pub pub_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pub
    ADD CONSTRAINT pub_pk PRIMARY KEY (pubid);


--
-- TOC entry 2094 (class 2606 OID 25517)
-- Name: pubcategories pubcategories_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubcategories
    ADD CONSTRAINT pubcategories_pk PRIMARY KEY (pubcatid);


--
-- TOC entry 2092 (class 2606 OID 25506)
-- Name: pubproducts pubproducts_pk; Type: CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_pk PRIMARY KEY (pubprodid);


--
-- TOC entry 2103 (class 2606 OID 25540)
-- Name: hours hours_pubid; Type: FK CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY hours
    ADD CONSTRAINT hours_pubid FOREIGN KEY (pubid) REFERENCES pub(pubid);


--
-- TOC entry 2100 (class 2606 OID 25550)
-- Name: product product_prodcatid; Type: FK CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_prodcatid FOREIGN KEY (prodcatid) REFERENCES productcategories(prodcatid);


--
-- TOC entry 2099 (class 2606 OID 25545)
-- Name: pub pub_pubcatid; Type: FK CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pub
    ADD CONSTRAINT pub_pubcatid FOREIGN KEY (pubcatid) REFERENCES pubcategories(pubcatid);


--
-- TOC entry 2102 (class 2606 OID 25560)
-- Name: pubproducts pubproducts_productid; Type: FK CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_productid FOREIGN KEY (productid) REFERENCES product(productid);


--
-- TOC entry 2101 (class 2606 OID 25555)
-- Name: pubproducts pubproducts_pubid; Type: FK CONSTRAINT; Schema: public; Owner: pubadvisor_admin
--

ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_pubid FOREIGN KEY (pubid) REFERENCES pub(pubid);


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-12-08 22:42:11

--
-- PostgreSQL database dump complete
--

