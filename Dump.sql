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
  `Id` int(11) NOT NULL,
  `DateOpened` date DEFAULT NULL,
  `AccountType` enum('Limited','Unlimited-1','Unlimited-2','Unlimited-3') DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Customer` (`Customer`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Customer`) REFERENCES `Customer` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'2006-10-01','Unlimited-2',444444444),(2,'2006-10-15','Limited',222222222),(3,'2006-10-15','Limited',222222222);
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
  CONSTRAINT `appearedin_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
INSERT INTO `Customer` VALUES (111111111,'syang@cs.sunysb.edu',1,'1234567812345678'),(222222222,'vicdu@cs.sunysb.edu',1,'5678123456781234'),(333333333,'jsmith@cs.sunysb.edu',1,'2345678923456789'),(444444444,'pml@cs.sunysb.edu',1,'6789234567892345');
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
INSERT INTO `Employee` VALUES (123456789,123456789,'2005-11-01',60),(789123456,789123456,'2006-02-02',50),(987654321,987654321,'2016-10-15',120);
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
INSERT INTO `Location` VALUES (11790,'Stony Brook','NY'),(11794,'Stony Brook','NY'),(93536,'Los Angeles','CA');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Id` int(11) NOT NULL,
  `MovieName` char(20) NOT NULL,
  `MovieType` char(20) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `DistrFee` decimal(13,2) DEFAULT NULL,
  `NumCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'The Godfather','Drama',5,10000.00,3),(2,'Shawshank Redemption','Drama',4,1000.00,2),(3,'Borat','Comedy',3,500.00,1),(5,'Endgame','Action',5,10000.00,5);
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
  CONSTRAINT `movieq_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Account` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movieq_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderTable`
--

LOCK TABLES `OrderTable` WRITE;
/*!40000 ALTER TABLE `OrderTable` DISABLE KEYS */;
INSERT INTO `OrderTable` VALUES (1,'2009-11-11 10:00:00','2009-11-14'),(2,'2009-11-11 18:15:00',NULL),(3,'2009-11-12 09:30:00',NULL),(4,'2009-11-21 22:22:00',NULL),(5,'2010-11-21 10:05:00','2010-11-29'),(6,'2010-01-11 10:00:00','2010-01-29'),(7,'2010-01-11 10:00:00','2010-01-29'),(8,'2010-01-11 10:00:00','2010-01-29'),(9,'2010-01-11 10:00:00','2010-01-29'),(10,'2010-01-11 10:00:00','2010-01-29'),(11,'2010-01-11 10:00:00','2010-01-29');
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
INSERT INTO `Person` VALUES (111111111,'Yang','Shang','123 Success Street',11790,'5166328959'),(123456789,'Smith','David','123 College road',11790,'5162152345'),(222222222,'Du','Victor','456 Fortune Road',11790,'5166324360'),(333333333,'Smith','John','789 Peace Blvd.',93536,'3154434321'),(444444444,'Philip','Lewis','135 Knowledge Lane',11794,'5166668888'),(555555555,'Arpita','Abrol','1 Engineering Drive',11790,'2121111111'),(789123456,'Warren','David','123 Sunken Street',11794,'6316329987'),(987654321,'Paris','Fisher','1 Engineering Drive',11794,'6317185555');
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
  CONSTRAINT `rental_ibfk_4` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rental`
--

LOCK TABLES `Rental` WRITE;
/*!40000 ALTER TABLE `Rental` DISABLE KEYS */;
INSERT INTO `Rental` VALUES (1,123456789,1,1),(1,123456789,3,3),(1,123456789,11,3),(2,123456789,2,3),(2,123456789,4,2);
/*!40000 ALTER TABLE `Rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `currentrentals`
--

DROP TABLE IF EXISTS `currentrentals`;
/*!50001 DROP VIEW IF EXISTS `currentrentals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `currentrentals` AS SELECT 
 1 AS `AccountId`,
 1 AS `OrderTableDateTime`,
 1 AS `MovieId`,
 1 AS `MovieName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostactivecustomers`
--

DROP TABLE IF EXISTS `mostactivecustomers`;
/*!50001 DROP VIEW IF EXISTS `mostactivecustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostactivecustomers` AS SELECT 
 1 AS `Id`,
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
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesreport`
--

DROP TABLE IF EXISTS `salesreport`;
/*!50001 DROP VIEW IF EXISTS `salesreport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesreport` AS SELECT 
 1 AS `AccountType`,
 1 AS `Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `searchmovies`
--

DROP TABLE IF EXISTS `searchmovies`;
/*!50001 DROP VIEW IF EXISTS `searchmovies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `searchmovies` AS SELECT 
 1 AS `Id`,
 1 AS `MovieName`,
 1 AS `MovieType`,
 1 AS `Rating`,
 1 AS `DistrFee`,
 1 AS `NumCopies`*/;
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
 1 AS `MovieRating`*/;
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddCust`(IN newId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16), IN newFirstName CHAR(20), IN newLastName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Person WHERE newId = SSN ) THEN
		INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone)
        VALUES(newId, newLastName, newFirstName, newAddress, newZipcode, newTelephone);
	END IF;
	INSERT INTO Customer(Id, Email, Rating, CreditCardNumber)
    VALUES(newId, newEmail, newRating, newCreditCardNumber);
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddEmployee`(IN newSSN INTEGER, IN newStartDate DATE, IN newHourlyRate INTEGER, IN newLastName CHAR(20), IN newFirstName CHAR(20), IN newAddress CHAR(20), IN newZipcode INTEGER, IN newTelephone VARCHAR(10))
BEGIN
	IF NOT EXISTS( SELECT * FROM Person WHERE newSSN = SSN ) THEN
		INSERT INTO Person(SSN, LastName, FirstName, Address, ZipCode, Telephone)
        VALUES(newSSN, newLastName, newFirstName, newAddress, newZipcode, newTelephone);
	END IF;
	INSERT INTO Employee(Id, SSN, StartDate, HourlyRate)
    VALUES(newSSN, newSSN, newStartDate, newHourlyRate);
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `AddMovie`(
	IN newId INTEGER, IN newTitle CHAR(20), IN newGenre CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER
)
BEGIN
	INSERT INTO Movie(Id, MovieName, MovieType, Rating, DistrFee, NumCopies)
    VALUES(newId, newTitle, newGenre, newRating, newDistrFee, newNumCopies);
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditCust`(IN custId INTEGER, IN newEmail CHAR(32), IN newRating INTEGER, IN newCreditCardNumber CHAR(16))
BEGIN
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditEmployee`(IN SSN INTEGER, IN newStartDate DATE, IN newHourlyRate INTEGER)
BEGIN
	UPDATE Employee
    SET StartDate = newStartDate, HourlyRate = newHourlyRate
    WHERE Id = SSN;
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
CREATE DEFINER=`aabrol`@`%` PROCEDURE `EditMovie`(IN movieId INTEGER, IN newMovieType CHAR(20), IN newRating INTEGER, IN newDistrFee DECIMAL(13,2), IN newNumCopies INTEGER)
BEGIN
        UPDATE Movie
        SET MovieType = newMovieType, Rating = newRating, DistrFee = newDistrFee, NumCopies = newNumCopies
        WHERE Id=movieId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `currentrentals`
--

/*!50001 DROP VIEW IF EXISTS `currentrentals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `currentrentals` AS (select `rental`.`AccountId` AS `AccountId`,`ordertable`.`OrderTableDateTime` AS `OrderTableDateTime`,`rental`.`MovieId` AS `MovieId`,`movie`.`MovieName` AS `MovieName` from ((`rental` join `ordertable` on((`rental`.`OrderId` = `ordertable`.`Id`))) join `movie` on((`rental`.`MovieId` = `movie`.`Id`))) where isnull(`ordertable`.`ReturnDate`) order by `rental`.`AccountId`,`ordertable`.`OrderTableDateTime`) */;
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
/*!50001 VIEW `mostactivecustomers` AS (select distinct `C`.`Id` AS `Id`,`C`.`Rating` AS `Rating` from (`customer` `C` join `account` `A`) where (`C`.`Id` = `A`.`Customer`) order by `C`.`Rating` desc,`C`.`Id` limit 10) */;
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
/*!50001 VIEW `moviesuggestion` AS (select `M`.`MovieName` AS `MovieName`,`M`.`MovieType` AS `MovieType`,`M`.`Rating` AS `Rating` from `movie` `M` where ((not(`M`.`Id` in (select `M1`.`Id` from ((`rental` `R` join `ordertable` `O`) join `movie` `M1`) where ((`R`.`AccountId` = 1) and (`R`.`OrderId` = `O`.`Id`) and (`R`.`MovieId` = `M1`.`Id`))))) and `M`.`Id` in (select `M2`.`Id` from ((`rental` `R` join `ordertable` `O`) join `movie` `M2`) where ((`R`.`AccountId` = 2) and (`R`.`OrderId` = `O`.`Id`) and (`R`.`MovieId` = `M2`.`Id`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesreport`
--

/*!50001 DROP VIEW IF EXISTS `salesreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `salesreport` AS (select `A1`.`AccountType` AS `AccountType`,(count(0) * 10) AS `Value` from `account` `A1` where ((`A1`.`AccountType` = 'Limited') and (`A1`.`DateOpened` < '2006-10-15'))) union (select `A1`.`AccountType` AS `AccountType`,(count(0) * 20) AS `COUNT(*) * 20` from `account` `A1` where ((`A1`.`AccountType` = 'Unlimited-1') and (`A1`.`DateOpened` < '2006-10-15'))) union (select `A1`.`AccountType` AS `AccountType`,(count(0) * 30) AS `COUNT(*) * 30` from `account` `A1` where ((`A1`.`AccountType` = 'Unlimited-2') and (`A1`.`DateOpened` < '2006-10-15'))) union (select `A1`.`AccountType` AS `AccountType`,(count(0) * 40) AS `COUNT(*) * 40` from `account` `A1` where ((`A1`.`AccountType` = 'Unlimited-3') and (`A1`.`DateOpened` < '2006-10-15'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchmovies`
--

/*!50001 DROP VIEW IF EXISTS `searchmovies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aabrol`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `searchmovies` AS select `movie`.`Id` AS `Id`,`movie`.`MovieName` AS `MovieName`,`movie`.`MovieType` AS `MovieType`,`movie`.`Rating` AS `Rating`,`movie`.`DistrFee` AS `DistrFee`,`movie`.`NumCopies` AS `NumCopies` from `movie` where (`movie`.`MovieName` like '%fat%') */;
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
/*!50001 VIEW `viewmoviequeue` AS (select `M`.`MovieName` AS `MovieName`,`M`.`Rating` AS `MovieRating` from ((`movieq` `MQ` join `movie` `M`) join `account` `A`) where ((`A`.`Id` = 3) and (`A`.`Id` = `MQ`.`AccountId`) and (`M`.`Id` = `MQ`.`MovieId`))) */;
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

-- Dump completed on 2019-11-19 19:47:21
