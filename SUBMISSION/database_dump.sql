-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: mysql3.cs.stonybrook.edu    Database: aabrol
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DateOpened` date DEFAULT NULL,
  `AccountType` enum('Limited','Unlimited-1','Unlimited-2','Unlimited-3') DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `account_ibfk_1` (`Customer`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Customer`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'2006-10-01','Unlimited-2',444444444),(2,'2006-10-15','Limited',222222222),(3,'2006-10-15','Limited',111111111),(5,'2019-12-04','Limited',555555555);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actor`
--

DROP TABLE IF EXISTS `Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actor` (
  `Id` int(11) NOT NULL,
  `ActorName` char(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actor`
--

LOCK TABLES `Actor` WRITE;
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;
INSERT INTO `Actor` VALUES (1,'Al Pacino',63,'M',5),(2,'Tim Robbins',53,'M',2);
/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppearedIn`
--

DROP TABLE IF EXISTS `AppearedIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppearedIn` (
  `ActorId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`ActorId`,`MovieId`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `appearedin_ibfk_1` FOREIGN KEY (`ActorId`) REFERENCES `Actor` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `appearedin_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppearedIn`
--

LOCK TABLES `AppearedIn` WRITE;
/*!40000 ALTER TABLE `AppearedIn` DISABLE KEYS */;
INSERT INTO `AppearedIn` VALUES (1,1),(2,1),(1,3);
/*!40000 ALTER TABLE `AppearedIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Id` int(11) NOT NULL,
  `Email` char(32) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `CreditCardNumber` char(16) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `Person` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (111111111,'yang@gmail.com',1,'1234567812345888'),(123321000,'test@gmail.com',2,'1111222233334444'),(222222222,'vicdu@cs.sunysb.edu',1,'5678123456781234'),(444444444,'pml@cs.sunysb.edu',1,'6789234567892345'),(555555555,'sue@gmail.com',2,'1111111111111111'),(1112223333,'bob@gmail.com',3,'1111222233334444');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Id` int(11) NOT NULL,
  `SSN` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `Person` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (123456789,123456789,'2005-11-01',60),(444556666,444556666,'2010-10-10',125),(789123456,789123456,'2006-02-02',50);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `ZipCode` int(11) NOT NULL,
  `City` char(20) NOT NULL,
  `State` char(20) NOT NULL,
  PRIMARY KEY (`ZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (10001,'New York','NY'),(11377,'Flushing','NY'),(11399,'Flushing','NY'),(11790,'Stony Brook','NY'),(11794,'Stony Brook','NY'),(43234,'Chicago','IL'),(90001,'Bali','CA'),(93536,'Los Angeles','CA');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Login` (
  `Email` char(32) NOT NULL,
  `Pswd` char(32) DEFAULT NULL,
  `Role` enum('customer','customerRepresentative','manager') DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES ('bob@gmail.com','pass4','customer'),('bottle@gmail.com','pass1','customerRepresentative'),('moses@gmail.com','pass5','customerRepresentative'),('smith@gmail.com','pass1','manager'),('test@gmail.com','test','customer'),('warren@gmail.com','pass2','customerRepresentative'),('yang@gmail.com','pass3','customer');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MovieName` char(20) NOT NULL,
  `MovieType` char(20) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `DistrFee` decimal(13,2) DEFAULT NULL,
  `NumCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'The Godfather','Drama',5,10000.00,3),(2,'Shawshank Redemption','Drama',4,1000.00,2),(3,'Borat','Comedy',3,500.00,1),(4,'Endgame','Action',5,5000.00,8),(5,'DramaMovie','Drama',5,10000.00,10),(6,'ComedyMovie','Comedy',3,100.00,10);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovieQ`
--

DROP TABLE IF EXISTS `MovieQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MovieQ` (
  `AccountId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`,`MovieId`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `movieq_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movieq_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovieQ`
--

LOCK TABLES `MovieQ` WRITE;
/*!40000 ALTER TABLE `MovieQ` DISABLE KEYS */;
/*!40000 ALTER TABLE `MovieQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderTable`
--

DROP TABLE IF EXISTS `OrderTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderTable` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderTableDateTime` datetime DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderTable`
--

LOCK TABLES `OrderTable` WRITE;
/*!40000 ALTER TABLE `OrderTable` DISABLE KEYS */;
INSERT INTO `OrderTable` VALUES (1,'2009-11-11 10:00:00','2009-11-14'),(2,'2009-11-11 18:15:00',NULL),(3,'2009-11-12 09:30:00',NULL),(4,'2009-11-21 22:22:00','2019-12-04'),(5,'2019-12-04 00:00:00',NULL),(6,'2019-12-04 00:00:00',NULL),(7,'2019-12-04 00:00:00',NULL),(8,'2019-12-04 00:00:00',NULL);
/*!40000 ALTER TABLE `OrderTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `SSN` int(11) NOT NULL,
  `LastName` char(20) NOT NULL,
  `FirstName` char(20) NOT NULL,
  `Address` char(20) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `Telephone` varchar(10) DEFAULT NULL,
  `Email` char(32) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `ZipCode` (`ZipCode`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`ZipCode`) REFERENCES `Location` (`ZipCode`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (111111111,'Yang','Shang','123',11377,'5166328959','yang@gmail.com'),(123321000,'user','test','100 green',11399,'3214566523','test@gmail.com'),(123322333,'Bottle','Ann','123 Blue Rd',43234,'9998881212','bottle@gmail.com'),(123456789,'Smith','David','123 College road',11790,'5162152345','smith@gmail.com'),(222222222,'Du','Victor','456 Fortune Road',11790,'5166324360','vicdu@cs.sunysb.edu'),(333333333,'Smith','John','789 Peace Blvd.',93536,'3154434321','jsmith@cs.sunysb.edu'),(444444444,'Philip','Lewis','135 Knowledge Lane',11794,'5166668888','pml@cs.sunysb.edu'),(444556666,'Moses','John','123',90001,'1112224141','moses@gmail.com'),(555555555,'David','Sue','123 Sunken Street',11794,'6316329987','sue@gmail.com'),(789123456,'Warren','David','123 Sunken Street',11794,'6316329987','warren@gmail.com'),(1112223333,'Bobby','Bob','1 Green Ln',10001,'1112221212','bob@gmail.com');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rental`
--

DROP TABLE IF EXISTS `Rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rental` (
  `AccountId` int(11) NOT NULL,
  `CustRepId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`,`CustRepId`,`OrderId`,`MovieId`),
  KEY `CustRepId` (`CustRepId`),
  KEY `OrderId` (`OrderId`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Account` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`CustRepId`) REFERENCES `Employee` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`OrderId`) REFERENCES `OrderTable` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rental_ibfk_4` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rental`
--

LOCK TABLES `Rental` WRITE;
/*!40000 ALTER TABLE `Rental` DISABLE KEYS */;
INSERT INTO `Rental` VALUES (1,123456789,1,1),(1,123456789,3,3),(2,123456789,2,3),(2,123456789,4,2),(2,789123456,4,2),(2,789123456,4,3),(2,789123456,8,1),(3,789123456,4,1),(5,789123456,6,4),(5,789123456,7,1);
/*!40000 ALTER TABLE `Rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `currentmovierentals`
--

DROP TABLE IF EXISTS `currentmovierentals`;
/*!50001 DROP VIEW IF EXISTS `currentmovierentals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `currentmovierentals` AS SELECT 
 1 AS `AccountId`,
 1 AS `CustRepId`,
 1 AS `OrderId`,
 1 AS `MovieId`,
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `Customer`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `OrderTableDateTime`,
 1 AS `ReturnDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customersview`
--

DROP TABLE IF EXISTS `customersview`;
/*!50001 DROP VIEW IF EXISTS `customersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customersview` AS SELECT 
 1 AS `CustomerId`,
 1 AS `Address`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Email`,
 1 AS `Zipcode`,
 1 AS `Telephone`,
 1 AS `CreditCardNumber`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeesview`
--

DROP TABLE IF EXISTS `employeesview`;
/*!50001 DROP VIEW IF EXISTS `employeesview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeesview` AS SELECT 
 1 AS `EmployeeId`,
 1 AS `Address`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Email`,
 1 AS `Zipcode`,
 1 AS `Telephone`,
 1 AS `StartDate`,
 1 AS `HourlyRate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getmovieinfo`
--

DROP TABLE IF EXISTS `getmovieinfo`;
/*!50001 DROP VIEW IF EXISTS `getmovieinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getmovieinfo` AS SELECT 
 1 AS `MovieName`,
 1 AS `MovieId`,
 1 AS `MovieType`,
 1 AS `Actor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getorderhistory`
--

DROP TABLE IF EXISTS `getorderhistory`;
/*!50001 DROP VIEW IF EXISTS `getorderhistory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getorderhistory` AS SELECT 
 1 AS `AccountId`,
 1 AS `CustomerId`,
 1 AS `MovieId`,
 1 AS `OrderId`,
 1 AS `RentDate`,
 1 AS `ReturnDate`,
 1 AS `EmployeeId`,
 1 AS `EmployeeEmail`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mailinglist`
--

DROP TABLE IF EXISTS `mailinglist`;
/*!50001 DROP VIEW IF EXISTS `mailinglist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mailinglist` AS SELECT 
 1 AS `CustomerId`,
 1 AS `CustomerFirstName`,
 1 AS `CustomerLastName`,
 1 AS `Email`,
 1 AS `AccountType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostactivecr`
--

DROP TABLE IF EXISTS `mostactivecr`;
/*!50001 DROP VIEW IF EXISTS `mostactivecr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostactivecr` AS SELECT 
 1 AS `CustRepId`,
 1 AS `RentalNum`,
 1 AS `Address`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Email`,
 1 AS `Zipcode`,
 1 AS `Telephone`,
 1 AS `StartDate`,
 1 AS `HourlyRate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostactivecustomers`
--

DROP TABLE IF EXISTS `mostactivecustomers`;
/*!50001 DROP VIEW IF EXISTS `mostactivecustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostactivecustomers` AS SELECT 
 1 AS `CustomerId`,
 1 AS `RentalNum`,
 1 AS `Address`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Email`,
 1 AS `Zipcode`,
 1 AS `Telephone`,
 1 AS `CreditCardNumber`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrented`
--

DROP TABLE IF EXISTS `mostrented`;
/*!50001 DROP VIEW IF EXISTS `mostrented`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrented` AS SELECT 
 1 AS `RentalNum`,
 1 AS `MovieName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `moviesuggestion`
--

DROP TABLE IF EXISTS `moviesuggestion`;
/*!50001 DROP VIEW IF EXISTS `moviesuggestion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `moviesuggestion` AS SELECT 
 1 AS `CustomerId`,
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `recommended1`
--

DROP TABLE IF EXISTS `recommended1`;
/*!50001 DROP VIEW IF EXISTS `recommended1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recommended1` AS SELECT 
 1 AS `AccountId`,
 1 AS `MovieName`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewbestseller`
--

DROP TABLE IF EXISTS `viewbestseller`;
/*!50001 DROP VIEW IF EXISTS `viewbestseller`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewbestseller` AS SELECT 
 1 AS `MovieId`,
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `DistrFee`,
 1 AS `NumCopies`,
 1 AS `Rating`,
 1 AS `Views`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewcustomerbestseller`
--

DROP TABLE IF EXISTS `viewcustomerbestseller`;
/*!50001 DROP VIEW IF EXISTS `viewcustomerbestseller`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewcustomerbestseller` AS SELECT 
 1 AS `MovieId`,
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `DistrFee`,
 1 AS `NumCopies`,
 1 AS `Rating`,
 1 AS `Views`,
 1 AS `CustomerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewmoviequeue`
--

DROP TABLE IF EXISTS `viewmoviequeue`;
/*!50001 DROP VIEW IF EXISTS `viewmoviequeue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewmoviequeue` AS SELECT 
 1 AS `MovieName`,
 1 AS `MovieRating`,
 1 AS `MovieType`,
 1 AS `MovieId`,
 1 AS `CustomerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'aabrol'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddCust` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddCust`(IN newId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
    IF NOT EXISTS( SELECT * FROM Person WHERE newId = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone, Email)
        VALUES(newId, newLastName, newFirstName, newAddress, newZipcode, newTelephone, newEmail);
    END IF;
    INSERT INTO Customer(Id, Email, Rating, CreditCardNumber)
    VALUES(newId, newEmail, newRating, newCreditCardNumber);
    INSERT INTO Account(DateOpened, AccountType, Customer) 
    VALUES(DATE(now()), "Limited", NewId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddEmployee`(IN newSSN INTEGER, IN newEmail CHAR(32), IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
    IF NOT EXISTS( SELECT * FROM Person WHERE newSSN = SSN ) THEN
        INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone, Email)
        VALUES(newSSN, newLastName, newFirstName, newAddress, newZipcode, newTelephone, newEmail);
    END IF;
    INSERT INTO Employee(Id, SSN, StartDate, HourlyRate)
    VALUES(newSSN, newSSN, newStartDate, newHourlyRate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddLogin`(IN newEmail CHAR(32), IN newPswd CHAR(32), IN newRole CHAR(32) )
BEGIN
    INSERT INTO Login(Email, Pswd, Role)
    VALUES(newEmail, newPswd, newRole);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddMovie`(IN newTitle CHAR(20), IN newGenre CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
    INSERT INTO Movie( MovieName, MovieType, Rating, DistrFee, NumCopies)
    VALUES(newTitle, newGenre, newRating, newDistrFee, newNumCopies);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `CreateOrder`(IN newDateTime DATETIME, IN newReturnDate DATE, IN newAccountId INT, IN newCustRepId INT, IN newMovieId INT)
BEGIN
    INSERT INTO OrderTable(OrderTableDateTime, ReturnDate)
    VALUES(newDateTime, newReturnDate);
    SET @newId = LAST_INSERT_ID();
    INSERT INTO Rental VALUE(newAccountId, newCustRepId, @newId, newMovieId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCust` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `DeleteCust`(IN custId INTEGER )
BEGIN
    DELETE FROM Customer
    WHERE Id = custId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `DeleteEmployee`(IN empId INTEGER)
BEGIN
    DELETE FROM Employee
    WHERE Id=empId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `DeleteMovie`(movieId INTEGER)
BEGIN
	DELETE FROM Movie
	WHERE Id=movieId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `editAccount`(IN CustId INTEGER, IN newAccountType CHAR(32))
BEGIN
    UPDATE ACCOUNT
    SET AccountType = newAccountType
    WHERE Customer = CustId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditCust` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditCust`(IN custId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
	UPDATE Location
    SET ZipCode = newZipcode, City = newCity, State = newState
    WHERE ZipCode = newZipcode;
	UPDATE Person
    SET LastName = newLastName, FirstName = newFirstName, Address = newAddress, Zipcode = newZipcode, Telephone = newTelephone, Email = newEmail
    WHERE SSN = custId;
    UPDATE Customer
    SET Email = newEmail, Rating = newRating, CreditCardNumber = newCreditCardNumber
    WHERE Id = custId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditEmployee`(IN newSSN INTEGER, IN newEmail CHAR(32), IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newCity CHAR(20), IN newState CHAR(2), IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Location WHERE newZipcode = ZipCode ) THEN
        INSERT INTO Location(ZipCode, City, State)
        VALUES(newZipcode, newCity, newState);
    END IF;
	UPDATE Location
    SET ZipCode = newZipcode, City = newCity, State = newState
    WHERE ZipCode = newZipcode;
    UPDATE Person
    SET LastName = newLastName, FirstName = newFirstName, Address = newAddress, Zipcode = newZipcode, Telephone = newTelephone, Email = newEmail
    WHERE SSN = newSSN;
    UPDATE Employee
    SET StartDate = newStartDate, HourlyRate = newHourlyRate
    WHERE Id = newSSN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditMovie`(IN movieId INTEGER, IN newMovieName CHAR(20), IN newMovieType CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
        UPDATE Movie
        SET MovieName = newMovieName, MovieType = newMovieType, Rating = newRating, DistrFee = newDistrFee, NumCopies = newNumCopies
        WHERE Id=movieId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSalesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `getSalesReport`(IN targetDate DATE)
BEGIN
    (SELECT AccountType, COUNT(*) * 10 FROM Account A1 WHERE A1.AccountType = 'Limited' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 15 FROM Account A1 WHERE A1.AccountType = 'Unlimited-1' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 20 FROM Account A1 WHERE A1.AccountType = 'Unlimited-2' AND DateOpened < targetDate )
    UNION
    (SELECT AccountType, COUNT(*) * 25 FROM Account A1 WHERE A1.AccountType = 'Unlimited-3' AND DateOpened < targetDate );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rateMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `rateMovie`(IN currentRating INTEGER, IN numRentals INTEGER)
BEGIN
    SET @currentRating = (Select Rating
    From Movie
    Where ID=movieID );

    SET @numRentals = (Select Count(*)
    From Rental
    Where MovieID=movieID);

    UPDATE Movie M
    SET M.Rating = ((@currentRating*@numRentals+Rating)/@numRentals) 
    WHERE MovieId = ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecordOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `RecordOrder`(IN completedOrder INTEGER)
BEGIN
	UPDATE OrderTable
    SET ReturnDate=DATE(now())
    WHERE Id=completedOrder;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `suggested` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aabrol`@`%` PROCEDURE `suggested`(IN custID INTEGER)
BEGIN
    DROP TABLE IF EXISTS mostWatchedType;
    Create temporary table mostWatchedType (MovieType varchar(20), counts INT);
        
        Insert into mostWatchedType
        Select M.MovieType, Count(*)
		From Rental R, OrderTable O, Account A, Movie M
		Where R.AccountId=A.Id AND R.OrderId=O.Id AND A.Customer=custID AND R.MovieId=M.Id
        Group by MovieType
        Order by Count(*) DESC;

        Select Movie.ID,Movie.MovieName,Movie.Rating,Movie.MovieType
        From Movie,    mostWatchedType
        Where Movie.MovieType = mostWatchedType.MovieType
        and Movie.ID not in (
        Select Movie.ID
        From Rental,Movie, Account
        Where Rental.AccountID=Account.ID and Account.Customer = custID AND Rental.MovieID=Movie.ID);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `currentmovierentals`
--

/*!50001 DROP VIEW IF EXISTS `currentmovierentals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `currentmovierentals` AS (select `R`.`AccountId` AS `AccountId`,`R`.`CustRepId` AS `CustRepId`,`R`.`OrderId` AS `OrderId`,`R`.`MovieId` AS `MovieId`,`M`.`MovieName` AS `MovieName`,`M`.`MovieType` AS `MovieType`,`A`.`Customer` AS `Customer`,`P`.`LastName` AS `LastName`,`P`.`FirstName` AS `FirstName`,`O`.`OrderTableDateTime` AS `OrderTableDateTime`,`O`.`ReturnDate` AS `ReturnDate` from ((((`rental` `R` join `movie` `M`) join `account` `A`) join `ordertable` `O`) join `person` `P`) where ((`R`.`MovieId` = `M`.`Id`) and (`O`.`Id` = `A`.`Id`) and (`R`.`AccountId` = `O`.`Id`) and isnull(`O`.`ReturnDate`) and (`A`.`Customer` = `P`.`SSN`)) group by `R`.`MovieId`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customersview`
--

/*!50001 DROP VIEW IF EXISTS `customersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customersview` AS (select `C`.`Id` AS `CustomerId`,`P`.`Address` AS `Address`,`P`.`LastName` AS `LastName`,`P`.`FirstName` AS `FirstName`,`L`.`City` AS `City`,`L`.`State` AS `State`,`C`.`Email` AS `Email`,`P`.`ZipCode` AS `Zipcode`,`P`.`Telephone` AS `Telephone`,`C`.`CreditCardNumber` AS `CreditCardNumber`,`C`.`Rating` AS `Rating` from ((`customer` `C` join `person` `P`) join `location` `L`) where ((`C`.`Id` = `P`.`SSN`) and (`P`.`ZipCode` = `L`.`ZipCode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeesview`
--

/*!50001 DROP VIEW IF EXISTS `employeesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `employeesview` AS (select `E`.`Id` AS `EmployeeId`,`P`.`Address` AS `Address`,`P`.`LastName` AS `LastName`,`P`.`FirstName` AS `FirstName`,`L`.`City` AS `City`,`L`.`State` AS `State`,`P`.`Email` AS `Email`,`P`.`ZipCode` AS `Zipcode`,`P`.`Telephone` AS `Telephone`,`E`.`StartDate` AS `StartDate`,`E`.`HourlyRate` AS `HourlyRate` from ((`employee` `E` join `person` `P`) join `location` `L`) where ((`E`.`Id` = `P`.`SSN`) and (`P`.`ZipCode` = `L`.`ZipCode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getmovieinfo`
--

/*!50001 DROP VIEW IF EXISTS `getmovieinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getmovieinfo` AS (select `M`.`MovieName` AS `MovieName`,`M`.`Id` AS `MovieId`,`M`.`MovieType` AS `MovieType`,`A`.`ActorName` AS `Actor` from ((`actor` `A` join `appearedin` `AI`) join `movie` `M`) where ((`AI`.`ActorId` = `A`.`Id`) and (`M`.`Id` = `AI`.`MovieId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getorderhistory`
--

/*!50001 DROP VIEW IF EXISTS `getorderhistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getorderhistory` AS (select `R`.`AccountId` AS `AccountId`,`A`.`Customer` AS `CustomerId`,`R`.`MovieId` AS `MovieId`,`O`.`Id` AS `OrderId`,`O`.`OrderTableDateTime` AS `RentDate`,`O`.`ReturnDate` AS `ReturnDate`,`R`.`CustRepId` AS `EmployeeId`,`P`.`Email` AS `EmployeeEmail` from (((`rental` `R` join `ordertable` `O`) join `account` `A`) join `person` `P`) where ((`R`.`AccountId` = `A`.`Id`) and (`R`.`OrderId` = `O`.`Id`) and (`R`.`CustRepId` = `P`.`SSN`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mailinglist`
--

/*!50001 DROP VIEW IF EXISTS `mailinglist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mailinglist` AS (select `c`.`Id` AS `CustomerId`,`c`.`FirstName` AS `CustomerFirstName`,`c`.`LastName` AS `CustomerLastName`,`c`.`Email` AS `Email`,`A`.`AccountType` AS `AccountType` from (`aabrol`.`account` `A` join (select `C1`.`Id` AS `Id`,`P`.`FirstName` AS `FirstName`,`P`.`LastName` AS `LastName`,`C1`.`Email` AS `Email` from (`aabrol`.`customer` `C1` join `aabrol`.`person` `P` on((`C1`.`Id` = `P`.`SSN`)))) `C` on((`A`.`Customer` = `c`.`Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostactivecr`
--

/*!50001 DROP VIEW IF EXISTS `mostactivecr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mostactivecr` AS (select `cr`.`CustRepId` AS `CustRepId`,`cr`.`RentalNum` AS `RentalNum`,`P`.`Address` AS `Address`,`P`.`LastName` AS `LastName`,`P`.`FirstName` AS `FirstName`,`L`.`City` AS `City`,`L`.`State` AS `State`,`P`.`Email` AS `Email`,`P`.`ZipCode` AS `Zipcode`,`P`.`Telephone` AS `Telephone`,`E`.`StartDate` AS `StartDate`,`E`.`HourlyRate` AS `HourlyRate` from ((((select count(`R`.`CustRepId`) AS `RentalNum`,`R`.`CustRepId` AS `CustRepId` from `aabrol`.`rental` `R` group by `R`.`CustRepId` order by `RentalNum` desc) `CR` join `aabrol`.`employee` `E`) join `aabrol`.`person` `P`) join `aabrol`.`location` `L`) where ((`cr`.`CustRepId` = `E`.`Id`) and (`E`.`Id` = `P`.`SSN`) and (`P`.`ZipCode` = `L`.`ZipCode`)) order by `cr`.`RentalNum` desc limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostactivecustomers`
--

/*!50001 DROP VIEW IF EXISTS `mostactivecustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mostactivecustomers` AS (select `cr`.`AccountId` AS `CustomerId`,`cr`.`RentalNum` AS `RentalNum`,`P`.`Address` AS `Address`,`P`.`LastName` AS `LastName`,`P`.`FirstName` AS `FirstName`,`L`.`City` AS `City`,`L`.`State` AS `State`,`P`.`Email` AS `Email`,`P`.`ZipCode` AS `Zipcode`,`P`.`Telephone` AS `Telephone`,`C`.`CreditCardNumber` AS `CreditCardNumber`,`C`.`Rating` AS `Rating` from (((((select `R`.`AccountId` AS `AccountId`,count(`R`.`AccountId`) AS `RentalNum` from `aabrol`.`rental` `R` group by `R`.`AccountId` order by `RentalNum` desc) `CR` join `aabrol`.`account` `A`) join `aabrol`.`customer` `C`) join `aabrol`.`person` `P`) join `aabrol`.`location` `L`) where ((`cr`.`AccountId` = `A`.`Id`) and (`A`.`Customer` = `C`.`Id`) and (`C`.`Id` = `P`.`SSN`) and (`P`.`ZipCode` = `L`.`ZipCode`)) order by `cr`.`RentalNum` desc limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrented`
--

/*!50001 DROP VIEW IF EXISTS `mostrented`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrented` AS (select `rc`.`RentalNum` AS `RentalNum`,`M`.`MovieName` AS `MovieName` from (`aabrol`.`movie` `M` join (select count(0) AS `RentalNum`,`aabrol`.`rental`.`MovieId` AS `MovieId` from `aabrol`.`rental` group by `aabrol`.`rental`.`MovieId`) `RC`) where (`M`.`Id` = `rc`.`MovieId`) order by `rc`.`RentalNum` desc,`M`.`MovieName` limit 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `moviesuggestion`
--

/*!50001 DROP VIEW IF EXISTS `moviesuggestion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `moviesuggestion` AS (select `A`.`Customer` AS `CustomerId`,`M`.`MovieName` AS `MovieName`,`M`.`MovieType` AS `MovieType`,`M`.`Rating` AS `Rating` from (((`movie` `M` join `rental` `R`) join `ordertable` `O`) join `account` `A`) where ((not(`M`.`Id` in (select `M`.`Id` from DUAL  where ((`R`.`AccountId` = `A`.`Customer`) and (`R`.`OrderId` = `O`.`Id`) and (`R`.`MovieId` = `M`.`Id`))))) and `M`.`MovieType` in (select `M`.`MovieType` from DUAL  where ((`R`.`AccountId` = `A`.`Id`) and (`R`.`OrderId` = `O`.`Id`) and (`M`.`Id` = `R`.`MovieId`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recommended1`
--

/*!50001 DROP VIEW IF EXISTS `recommended1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `recommended1` AS select `t`.`Customer` AS `AccountId`,`M`.`MovieName` AS `MovieName`,`M`.`Rating` AS `Rating` from ((select `A`.`Customer` AS `Customer`,`M`.`MovieType` AS `MovieType`,count(0) AS `Count(*)` from ((`aabrol`.`rental` `R` join `aabrol`.`movie` `M`) join `aabrol`.`account` `A`) where ((`R`.`AccountId` = `A`.`Id`) and (`R`.`MovieId` = `M`.`Id`))) `T` join `aabrol`.`movie` `M`) where ((`M`.`MovieType` = `t`.`MovieType`) and (not(`M`.`Id` in (select `M`.`Id` from (`aabrol`.`rental` `R` join `aabrol`.`movie` `M`) where (`R`.`MovieId` = `M`.`Id`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewbestseller`
--

/*!50001 DROP VIEW IF EXISTS `viewbestseller`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `viewbestseller` AS (select `M`.`Id` AS `MovieId`,`M`.`MovieName` AS `MovieName`,`M`.`MovieType` AS `MovieType`,`M`.`DistrFee` AS `DistrFee`,`M`.`NumCopies` AS `NumCopies`,`M`.`Rating` AS `Rating`,count(0) AS `Views` from ((`ordertable` `O` join `rental` `R`) join `movie` `M`) where ((`R`.`MovieId` = `M`.`Id`) and (`O`.`Id` = `R`.`OrderId`)) group by `M`.`Id` order by count(0) desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewcustomerbestseller`
--

/*!50001 DROP VIEW IF EXISTS `viewcustomerbestseller`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcustomerbestseller` AS (select `M`.`Id` AS `MovieId`,`M`.`MovieName` AS `MovieName`,`M`.`MovieType` AS `MovieType`,`M`.`DistrFee` AS `DistrFee`,`M`.`NumCopies` AS `NumCopies`,`M`.`Rating` AS `Rating`,count(0) AS `Views`,`A`.`Customer` AS `CustomerId` from (((`ordertable` `O` join `rental` `R`) join `movie` `M`) join `account` `A`) where ((`R`.`MovieId` = `M`.`Id`) and (`O`.`Id` = `R`.`OrderId`) and (`R`.`AccountId` = `A`.`Id`)) group by `M`.`Id` order by count(0) desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewmoviequeue`
--

/*!50001 DROP VIEW IF EXISTS `viewmoviequeue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `viewmoviequeue` AS (select `M`.`MovieName` AS `MovieName`,`M`.`Rating` AS `MovieRating`,`M`.`MovieType` AS `MovieType`,`M`.`Id` AS `MovieId`,`A`.`Customer` AS `CustomerId` from ((`movieq` `MQ` join `movie` `M`) join `account` `A`) where ((`A`.`Id` = `MQ`.`AccountId`) and (`M`.`Id` = `MQ`.`MovieId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 15:01:48
