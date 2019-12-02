CREATE TABLE Login (
	Email  CHAR(32),
    Pswd CHAR(32),
	Role ENUM('customer', 'customerRepresentative', 'manager'),
    PRIMARY KEY (Email)
);

CREATE TABLE Location (
    ZipCode INTEGER,
    City    CHAR(20) NOT NULL,
    State   CHAR(20) NOT NULL,
    PRIMARY KEY (ZipCode)  
);

CREATE TABLE Person(
    SSN INTEGER,
    LastName    CHAR(20) NOT NULL,
    FirstName   CHAR(20) NOT NULL,
    Address CHAR(20),
    ZipCode INTEGER,
    Telephone	VARCHAR(10),
    PRIMARY KEY (SSN),
    FOREIGN KEY (ZipCode) REFERENCES Location (ZipCode)
        ON DELETE NO ACTION
        ON UPDATE CASCADE 
);
        
CREATE TABLE Employee (
    Id  INTEGER,
    SSN INTEGER,
    StartDate   DATE,
    HourlyRate  INTEGER,
    PRIMARY KEY (Id),
    FOREIGN KEY (SSN) REFERENCES Person (SSN)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT chk_id CHECK ( Id > 0 AND Id < 1000000000 )
);

CREATE TABLE Customer (
    Id  INTEGER,
    Email CHAR(32),
    Rating INTEGER,
    CreditCardNumber CHAR(16),
    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Person (SSN)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT chk_id CHECK ( Id > 0 AND Id < 1000000000 )
);

CREATE TABLE Account (
    Id INTEGER,
    DateOpened DATE,
    AccountType ENUM('Limited', 'Unlimited-1', 'Unlimited-2', 'Unlimited-3'),
    Customer INTEGER,
    PRIMARY KEY (Id),
    FOREIGN KEY (Customer) REFERENCES Customer (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT chk_id CHECK ( Customer > 0 AND Customer < 1000000000 )
);

CREATE TABLE OrderTable (
    Id INTEGER NOT NULL AUTO_INCREMENT,
    OrderTableDateTime DATETIME,
    ReturnDate  DATE,
    PRIMARY KEY (Id)
);

CREATE TABLE Movie (
    Id  INTEGER NOT NULL AUTO_INCREMENT,
    MovieName   CHAR(20) NOT NULL,
    MovieType   CHAR(20) NOT NULL,
    Rating  INTEGER,
    DistrFee    DECIMAL(13,2),
    NumCopies   INTEGER,
    PRIMARY KEY (Id)
);

CREATE TABLE Actor (
    Id  INTEGER,
    ActorName   CHAR(20) NOT NULL,
    Age INTEGER NOT NULL,
    Gender  CHAR(1) NOT NULL,
    Rating  INTEGER,
    PRIMARY KEY (Id)
);
    
CREATE TABLE Rental (
    AccountId   INTEGER,
    CustRepId   INTEGER,
    OrderId INTEGER,
    MovieId INTEGER,
    PRIMARY KEY (AccountId, CustRepId, OrderId, MovieId),
    FOREIGN KEY (AccountId) REFERENCES Account (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (CustRepId) REFERENCES Employee (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (OrderId) REFERENCES OrderTable (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (MovieId) REFERENCES Movie (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT chk_id CHECK ( CustRepId > 0 AND CustRepId < 1000000000 )
);

CREATE TABLE MovieQ (
    AccountId INTEGER,
    MovieId Integer,
    PRIMARY KEY (AccountId, MovieId),
    FOREIGN KEY (AccountId) REFERENCES Account (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (MovieId) REFERENCES Movie (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE AppearedIn (
    ActorId INTEGER,
    MovieId INTEGER,
    PRIMARY KEY (ActorId, MovieId),
    FOREIGN KEY (ActorId) REFERENCES Actor (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (MovieId) REFERENCES Movie (Id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);