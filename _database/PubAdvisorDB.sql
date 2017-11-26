CREATE TABLE Pub (
	PubID serial NOT NULL,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	location TEXT NOT NULL,
	hours numeric,
	date_created TIMESTAMP NOT NULL,
	PubCatID int,
  image text,
	CONSTRAINT Pub_pk PRIMARY KEY (PubID)
);

CREATE TABLE Product (
	ProductID serial NOT NULL,
	country_of_origin TEXT NOT NULL,
	name TEXT NOT NULL,
	percentage numeric NOT NULL,
	quantity numeric NOT NULL,
	ProdCatID int,
  image text,
	CONSTRAINT Product_pk PRIMARY KEY (ProductID)
);

CREATE TABLE PubProducts (
	PubProdID serial NOT NULL,
	price numeric NOT NULL,
	date_created TIMESTAMP NOT NULL,
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

INSERT INTO PubCategories(pubcatname)
VALUES ('CRAFT PUB'),
('PUBLIC HOUSE'),
('NIGHTCLUB');

INSERT INTO ProductCategories(prodcatname, description, image)
VALUES ('CRAFT BEER','Pale ales and IPAs etc', 'C:\Users\lenovo\Downloads\heineken.svg'),
('BEER','Largers etc','C:\Users\lenovo\Downloads\heineken.svg'),
('SPIRITS','Spirits such as vodka, jack daniesl etc','C:\Users\lenovo\Downloads\heineken.svg'),
('COCKTAIL','Mojitos and mixed spirits drinks','C:\Users\lenovo\Downloads\heineken.svg');

INSERT INTO Pub(name, address, location, date_created, PubCatID)
VALUES ('Lagoona Bar', 'Unit 4, Custom House Square, Mayor Street Lower, North Dock, Dublin', '53.3495791,-6.2452662', LOCALTIMESTAMP, (select pubcatid from pubcategories where pubcatname = 'PUBLIC HOUSE')),
('Drunken Fish', 'The Excise Building, I.F.S.C.,, Mayor Street Lower, International Financial Services Centre, Dublin 1', '53.3492226,-6.2464159', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'PUBLIC HOUSE')),
('Harbour Master', 'Customs House Dock, IFSC, Dublin 1, D01 W0X8', '53.349762,-6.2512417', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'PUBLIC HOUSE')),
('Bernard Shaw', '11-12 Richmond St South, Saint Kevins, Dublin 2', '53.3317151,-6.2667638', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'CRAFT PUB')),
('Dicey Reillys', '21-25 Harcourt St, Saint Kevins, Dublin 2', '53.3358639,-6.2657456', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'NIGHTCLUB')),
('Against the grain', '11 Wexford St, Dublin 2, DUBLIN 2', '53.3370639,-6.2676721', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'CRAFT PUB')),
('Chaplins', '1-2 Hawkins St, Dublin 2, D02 K590', '53.3461105,-6.2593373', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'PUBLIC HOUSE')),
('Howl at the moon', '54-, 74 Merrion Square S, Dublin', '53.3391773,-6.2476444', LOCALTIMESTAMP,(select pubcatid from pubcategories where pubcatname = 'NIGHTCLUB'));

INSERT INTO Hours (day, opening_time, closing_time, PubID)
VALUES('MONDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('TUESDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('WEDNESDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('THURSDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('FRIDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('SATURDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar')),
('SUNDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Lagoona Bar'));

-- OR -- 

INSERT INTO Hours (day, opening_time, closing_time, PubID)
VALUES('MONDAY - FRIDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Drunken Fish')),
('SATURDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Drunken Fish')),
('SUNDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Drunken Fish')),
('MONDAY - FRIDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Harbour Master')),
('SATURDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Harbour Master')),
('SUNDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Harbour Master')),
('MONDAY - FRIDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Chaplins')),
('SATURDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Chaplins')),
('SUNDAY','12:30PM -',' 02:00AM',(select pubid from pub where name = 'Chaplins'));

INSERT INTO Product(name, percentage, country_of_origin, quantity, image, ProdCatID)
VALUES ('O Brother, The Chancer', 5.4, 'Ireland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'CRAFT BEER')),
('St Bernardus, ABT', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'CRAFT BEER')),
('Brewdog, Vagabond', 4.5, 'Scotland', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'CRAFT BEER')),
('Heineken', 5.4, 'Holland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Stella Artois', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('1664', 5.4, 'Holland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Guinness', 10, 'Ireland', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Paulaner', 5.4, 'Ireland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Carlsberg', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('White Russian', 5.4, 'Ireland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'COCKTAIL')),
('Strawberry Daqiuri', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'COCKTAIL')),
('Kopparberg', 5.4, 'Ireland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Erdinger', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER')),
('Vodka', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories  where prodcatname = 'SPIRITS')),
('Captain Morgans', 5.4, 'Ireland', 500, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'SPIRITS')),
('Jack Daniels', 10, 'Belgium', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'SPIRITS')),
('Budweiser', 4.5, 'Scotland', 330, 'C:\Users\lenovo\Downloads\heineken.svg', (select prodcatid from productcategories where prodcatname = 'BEER'));

INSERT INTO PubProducts(Price, PubID, ProductID, date_created)
VALUES --Lagoona bar products
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Lagoona Bar'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--harbour master products
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Harbour Master'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--Drunken Fish products
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Drunken Fish'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--Chaplins
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Chaplins'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--Howl at the moon
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Howl at the moon'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--Diceys
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Dicey Reillys'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--Bernard Shaw
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Bernard Shaw'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP),
--against the grain 
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Heineken'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Stella Artois'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = '1664'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Guinness'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Paulaner'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Carlsberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'White Russian'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Strawberry Daqiuri'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Kopparberg'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Erdinger'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Vodka'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Captain Morgans'), LOCALTIMESTAMP),
(7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Jack Daniels'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Budweiser'), LOCALTIMESTAMP);

--queries
--top part of drink page - Heineken example
select prod.productid
,prod.name
,prod.percentage
,prod.country_of_origin
,prod.prodcatid
,prod.image
,pc.prodcatname
from product prod
join productcategories pc on prod.prodcatid = pc.prodcatid
where prod.productid = 4;

--table on bottom of drink page - Heineken example
select pbprod.price
,pb.name
,pb.pubid
,pbc.pubcatname
from pubproducts pbprod
join pub pb on pbprod.pubid = pb.pubid
join pubcategories pbc on pb.pubcatid = pbc.pubcatid
join product prod on pbprod.productid = prod.productid 
where prod.productid = 4;

--pub page query, pub name, address, pub logo, opening and closing hours - mini table of hours showing monday - friday and sat - sun or we can do each day of the week directly under the address on the pub page. - Lagoona bar example
select pb.name
,pb.address
,h.day
,h.opening_time || closing_time AS "Opening Hours"
,pb.image
from pub pb
join hours h on pb.pubid = h.pubid
where pb.pubid = 1;

--table at bottom of pub page - product name, price, prodcatname - Lagoona bar example
select prod.name
,pbprod.price
,pc.prodcatname
from product prod
join pubproducts pbprod on prod.productid = pbprod.productid
join productcategories pc on prod.prodcatid = pc.prodcatid
join pub pb on pbprod.pubid = pb.pubid
where pb.pubid = 1;

--Type of product search results table
select prod.name
,pbprod.price
,pb.address
,pc.prodcatname
,pc.description
--,prod.prodcatid
from productcategories pc
join product prod on prod.prodcatid = pc.prodcatid
join pubproducts pbprod on prod.productid = pbprod.productid
join pub pb on pbprod.pubid = pb.pubid
where pc.prodcatid = 4;


