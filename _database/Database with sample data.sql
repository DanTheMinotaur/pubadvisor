CREATE TABLE Pub (
	PubID serial NOT NULL,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	location TEXT NOT NULL,
	hours numeric NOT NULL,
	date_created TIMESTAMP NOT NULL,
	PubCatID int NOT NULL,
	CONSTRAINT Pub_pk PRIMARY KEY (PubID)
);

CREATE TABLE Product (
	ProductID serial NOT NULL,
	country_of_origin TEXT NOT NULL,
	name TEXT NOT NULL,
	percentage numeric NOT NULL,
	quantity numeric NOT NULL,
	ProdCatID int NOT NULL,
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
	CatID int NOT NULL,
	CONSTRAINT PubCategories_pk PRIMARY KEY (PubCatID)
);

CREATE TABLE ProductCategories (
	ProdCatID serial NOT NULL,
	CatID int NOT NULL,
	CONSTRAINT ProductCategories_pk PRIMARY KEY (ProdCatID)
);

CREATE TABLE Categories (
	CatID serial NOT NULL,
	name TEXT NOT NULL,
	CONSTRAINT Categories_pk PRIMARY KEY (CatID)
);

ALTER TABLE Pub ADD CONSTRAINT Pub_PubCatID FOREIGN KEY (PubCatID) REFERENCES PubCategories(PubCatID);
ALTER TABLE Product ADD CONSTRAINT Product_ProdCatID FOREIGN KEY (ProdCatID) REFERENCES ProductCategories(ProdCatID);

ALTER TABLE PubProducts ADD CONSTRAINT PubProducts_PubID FOREIGN KEY (PubID) REFERENCES Pub(PubID);
ALTER TABLE PubProducts ADD CONSTRAINT PubProducts_ProductID FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE PubCategories ADD CONSTRAINT PubCategories_CatID FOREIGN KEY (CatID) REFERENCES Categories(CatID);
ALTER TABLE ProductCategories ADD CONSTRAINT ProductCategories_CatID FOREIGN KEY (CatID) REFERENCES Categories(CatID);

INSERT INTO Categories(name)
VALUES ('BEER'),
('PUBLIC HOUSE'),
('CRAFT BEER'),
('COCKTAIL'),
('SPIRITS'),
('CRAFT PUB'),
('NIGHTCLUB');

INSERT INTO PubCategories(CatID)
VALUES ((select CatID from Categories where name = 'CRAFT PUB')),
((select CatID from Categories where name = 'PUBLIC HOUSE')),
((select CatID from Categories where name = 'NIGHTCLUB'));

INSERT INTO ProductCategories(CatID)
VALUES ((select CatID from Categories where name = 'CRAFT BEER')),
((select CatID from Categories where name = 'BEER')),
((select CatID from Categories where name = 'SPIRITS')),
((select CatID from Categories where name = 'COCKTAIL'));

INSERT INTO Pub(name, address, location, Hours, date_created, PubCatID)
VALUES ('Lagoona Bar', 'Unit 4, Custom House Square, Mayor Street Lower, North Dock, Dublin', '53.3495791,-6.2452662', 11, LOCALTIMESTAMP, (select pubcatid from pubcategories where catid in(select catid from categories where name = 'PUBLIC HOUSE'))),
('Drunken Fish', 'The Excise Building, I.F.S.C.,, Mayor Street Lower, International Financial Services Centre, Dublin 1', '53.3492226,-6.2464159', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'PUBLIC HOUSE'))),
('Harbour Master', 'Customs House Dock, IFSC, Dublin 1, D01 W0X8', '53.349762,-6.2512417', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'PUBLIC HOUSE'))),
('Bernard Shaw', '11-12 Richmond St South, Saint Kevins, Dublin 2', '53.3317151,-6.2667638', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'CRAFT PUB'))),
('Dicey Reillys', '21-25 Harcourt St, Saint Kevins, Dublin 2', '53.3358639,-6.2657456', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'NIGHTCLUB'))),
('Against the grain', '11 Wexford St, Dublin 2, DUBLIN 2', '53.3370639,-6.2676721', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'CRAFT PUB'))),
('Chaplins', '1-2 Hawkins St, Dublin 2, D02 K590', '53.3461105,-6.2593373', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'PUBLIC HOUSE'))),
('Howl at the moon', '54-, 74 Merrion Square S, Dublin', '53.3391773,-6.2476444', 7, LOCALTIMESTAMP,(select pubcatid from pubcategories where catid in (select catid from categories where name = 'NIGHTCLUB')));

INSERT INTO Product(name, percentage, country_of_origin, quantity, ProdCatID)
VALUES ('O Brother, The Chancer', 5.4, 'Ireland', 500, (select prodcatid from productcategories where catid in(select catid from categories where name = 'CRAFT BEER'))),
('St Bernardus, ABT', 10, 'Belgium', 330,(select prodcatid from productcategories where catid in(select catid from categories where name = 'CRAFT BEER'))),
('Brewdog, Vagabond', 4.5, 'Scotland', 330, (select prodcatid from productcategories where catid in(select catid from categories where name = 'CRAFT BEER')));

INSERT INTO PubProducts(Price, PubID, ProductID, date_created)
VALUES (7.50, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'O Brother, The Chancer'), LOCALTIMESTAMP),
(8.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'St Bernardus, ABT'), LOCALTIMESTAMP),
(7.00, (select PubID from Pub where name = 'Against the grain'),(select ProductId from Product where name = 'Brewdog, Vagabond'), LOCALTIMESTAMP);




