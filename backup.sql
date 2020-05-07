-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Linux (x86_64)
--
-- Host: classdb2.csc.ncsu.edu    Database: rshah25
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `artID` int(11) NOT NULL DEFAULT '0',
  `topic` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`artID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (1,'health','1',NULL,'ABC'),(2,'science','1',NULL,'AAA');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `staffID` int(11) NOT NULL,
  `type` char(8) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `Author_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (3003,'external'),(9995,'internal');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthorAssignedArticle`
--

DROP TABLE IF EXISTS `AuthorAssignedArticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthorAssignedArticle` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `artID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`artID`),
  KEY `artID` (`artID`),
  CONSTRAINT `AuthorAssignedArticle_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthorAssignedArticle_ibfk_2` FOREIGN KEY (`artID`) REFERENCES `Article` (`artID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorAssignedArticle`
--

LOCK TABLES `AuthorAssignedArticle` WRITE;
/*!40000 ALTER TABLE `AuthorAssignedArticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthorAssignedArticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthorAssignedEdition`
--

DROP TABLE IF EXISTS `AuthorAssignedEdition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthorAssignedEdition` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `editionID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`editionID`,`pubID`),
  KEY `editionID` (`editionID`),
  KEY `pubID` (`pubID`),
  CONSTRAINT `AuthorAssignedEdition_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthorAssignedEdition_ibfk_2` FOREIGN KEY (`editionID`) REFERENCES `Edition` (`editionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthorAssignedEdition_ibfk_3` FOREIGN KEY (`pubID`) REFERENCES `Edition` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorAssignedEdition`
--

LOCK TABLES `AuthorAssignedEdition` WRITE;
/*!40000 ALTER TABLE `AuthorAssignedEdition` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthorAssignedEdition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOKS`
--

DROP TABLE IF EXISTS `BOOKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOKS` (
  `BOOK_TITLE` varchar(32) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `AVAILABLE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKS`
--

LOCK TABLES `BOOKS` WRITE;
/*!40000 ALTER TABLE `BOOKS` DISABLE KEYS */;
INSERT INTO `BOOKS` VALUES ('All about DBMS',17,13.49,5),('Jack the Ripper',13,9.99,1),('Queen Lucia',72,5.99,0),('A Calendar of Sonnets',101,3.49,15),('Napoleon and Blucher',5,9.99,0);
/*!40000 ALTER TABLE `BOOKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `billID` int(11) NOT NULL AUTO_INCREMENT,
  `billAmt` float NOT NULL,
  `billDetails` varchar(1000) NOT NULL,
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES (1,630,'-------------------------BILL-------------------------------\nOrder ID: 4001                       Bill Date: 2020-04-07\nPublication: introduction to database (Pub ID: 1001)\nEdition ID: 1\nDistributor: BookSell (Dist ID: 2001) City: charlotte\n\nNumber of Copies: 30  x Price Per Copy: 20.0\nShipping Cost: 30.0\n------------------------------------------------------------\nTotal Amount Owed: 630.0\n------------------------------------------------------------\n'),(2,215,'-------------------------BILL-------------------------------\nOrder ID: 4002                       Bill Date: 2020-04-07\nPublication: introduction to database (Pub ID: 1001)\nEdition ID: 1\nDistributor: BookSell (Dist ID: 2001) City: charlotte\n\nNumber of Copies: 10  x Price Per Copy: 20.0\nShipping Cost: 15.0\n------------------------------------------------------------\nTotal Amount Owed: 215.0\n------------------------------------------------------------\n'),(3,115,'-------------------------BILL-------------------------------\nOrder ID: 4003                       Bill Date: 2020-04-07\nPublication: Animal Science (Pub ID: 1003)\nIssue ID: 1\nDistributor: BookDist (Dist ID: 2002) City: Raleigh\n\nNumber of Copies: 10  x Price Per Copy: 10.0\nShipping Cost: 15.0\n------------------------------------------------------------\nTotal Amount Owed: 115.0\n------------------------------------------------------------\n');
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillConnectedToOrder`
--

DROP TABLE IF EXISTS `BillConnectedToOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BillConnectedToOrder` (
  `billID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billID`,`orderID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `BillConnectedToOrder_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `Bill` (`billID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BillConnectedToOrder_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillConnectedToOrder`
--

LOCK TABLES `BillConnectedToOrder` WRITE;
/*!40000 ALTER TABLE `BillConnectedToOrder` DISABLE KEYS */;
INSERT INTO `BillConnectedToOrder` VALUES (1,4001),(2,4002),(3,4003);
/*!40000 ALTER TABLE `BillConnectedToOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `topic` varchar(100) NOT NULL,
  PRIMARY KEY (`pubID`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1001,'technology');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATS`
--

DROP TABLE IF EXISTS `CATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATS` (
  `CNAME` varchar(20) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `WEIGHT` float DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATS`
--

LOCK TABLES `CATS` WRITE;
/*!40000 ALTER TABLE `CATS` DISABLE KEYS */;
INSERT INTO `CATS` VALUES ('Oscar','Egyptian Mau',3,23.4,'F'),('Max','Turkish Van Cats',2,21.8,'M'),('Tiger','Russian Blue',1,13.3,'M'),('Sam','Persian Cats',5,24.3,'M'),('Simba','Americal Bobtail',3,19.8,'F'),('Lucy','Turkish Angora Cats',2,22.4,'F');
/*!40000 ALTER TABLE `CATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chapter`
--

DROP TABLE IF EXISTS `Chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chapter` (
  `chapID` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`chapID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chapter`
--

LOCK TABLES `Chapter` WRITE;
/*!40000 ALTER TABLE `Chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistAssigned`
--

DROP TABLE IF EXISTS `DistAssigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistAssigned` (
  `distID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`distID`,`orderID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `DistAssigned_ibfk_1` FOREIGN KEY (`distID`) REFERENCES `Distributors` (`distID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DistAssigned_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistAssigned`
--

LOCK TABLES `DistAssigned` WRITE;
/*!40000 ALTER TABLE `DistAssigned` DISABLE KEYS */;
INSERT INTO `DistAssigned` VALUES (2001,4001),(2001,4002),(2002,4003);
/*!40000 ALTER TABLE `DistAssigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistGetsBill`
--

DROP TABLE IF EXISTS `DistGetsBill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistGetsBill` (
  `distID` int(11) NOT NULL DEFAULT '0',
  `billID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`distID`,`billID`),
  KEY `billID` (`billID`),
  CONSTRAINT `DistGetsBill_ibfk_1` FOREIGN KEY (`distID`) REFERENCES `Distributors` (`distID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DistGetsBill_ibfk_2` FOREIGN KEY (`billID`) REFERENCES `Bill` (`billID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistGetsBill`
--

LOCK TABLES `DistGetsBill` WRITE;
/*!40000 ALTER TABLE `DistGetsBill` DISABLE KEYS */;
INSERT INTO `DistGetsBill` VALUES (2001,1),(2001,2),(2002,3);
/*!40000 ALTER TABLE `DistGetsBill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistGetsPayment`
--

DROP TABLE IF EXISTS `DistGetsPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistGetsPayment` (
  `distID` int(11) NOT NULL DEFAULT '0',
  `payID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`distID`,`payID`),
  KEY `payID` (`payID`),
  CONSTRAINT `DistGetsPayment_ibfk_1` FOREIGN KEY (`distID`) REFERENCES `Distributors` (`distID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DistGetsPayment_ibfk_2` FOREIGN KEY (`payID`) REFERENCES `Payment` (`payID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistGetsPayment`
--

LOCK TABLES `DistGetsPayment` WRITE;
/*!40000 ALTER TABLE `DistGetsPayment` DISABLE KEYS */;
INSERT INTO `DistGetsPayment` VALUES (2001,4),(2002,5);
/*!40000 ALTER TABLE `DistGetsPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistMngCreateUpdate`
--

DROP TABLE IF EXISTS `DistMngCreateUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistMngCreateUpdate` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `distID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`distID`),
  KEY `distID` (`distID`),
  CONSTRAINT `DistMngCreateUpdate_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DistMngCreateUpdate_ibfk_2` FOREIGN KEY (`distID`) REFERENCES `Distributors` (`distID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistMngCreateUpdate`
--

LOCK TABLES `DistMngCreateUpdate` WRITE;
/*!40000 ALTER TABLE `DistMngCreateUpdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `DistMngCreateUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DistributionManager`
--

DROP TABLE IF EXISTS `DistributionManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DistributionManager` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `DistributionManager_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DistributionManager`
--

LOCK TABLES `DistributionManager` WRITE;
/*!40000 ALTER TABLE `DistributionManager` DISABLE KEYS */;
INSERT INTO `DistributionManager` VALUES (9993);
/*!40000 ALTER TABLE `DistributionManager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distributors`
--

DROP TABLE IF EXISTS `Distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distributors` (
  `distID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contactPerson` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `strAddr` varchar(30) NOT NULL,
  `city` varchar(10) NOT NULL,
  `phone` char(10) NOT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (`distID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `strAddr` (`strAddr`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distributors`
--

LOCK TABLES `Distributors` WRITE;
/*!40000 ALTER TABLE `Distributors` DISABLE KEYS */;
INSERT INTO `Distributors` VALUES (2001,'BookSell','Jason','bookstore','2200, A Street, NC','charlotte','9191234567',430),(2002,'BookDist','Alex','wholesaler','2200, B Street, NC','Raleigh','9291234567',0);
/*!40000 ALTER TABLE `Distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Edition`
--

DROP TABLE IF EXISTS `Edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Edition` (
  `editionID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  `ISBN` char(30) NOT NULL,
  `date` date NOT NULL,
  `tabOfCont` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`editionID`,`pubID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `pubID` (`pubID`),
  CONSTRAINT `Edition_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Edition`
--

LOCK TABLES `Edition` WRITE;
/*!40000 ALTER TABLE `Edition` DISABLE KEYS */;
INSERT INTO `Edition` VALUES (2,1001,'12345','2018-10-10',NULL);
/*!40000 ALTER TABLE `Edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EditionContains`
--

DROP TABLE IF EXISTS `EditionContains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EditionContains` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `editionID` int(11) NOT NULL DEFAULT '0',
  `chapID` int(11) NOT NULL DEFAULT '0',
  `chapNum` int(11) NOT NULL,
  PRIMARY KEY (`pubID`,`editionID`,`chapID`),
  KEY `editionID` (`editionID`),
  KEY `chapID` (`chapID`),
  CONSTRAINT `EditionContains_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EditionContains_ibfk_2` FOREIGN KEY (`editionID`) REFERENCES `Edition` (`editionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EditionContains_ibfk_3` FOREIGN KEY (`chapID`) REFERENCES `Chapter` (`chapID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EditionContains`
--

LOCK TABLES `EditionContains` WRITE;
/*!40000 ALTER TABLE `EditionContains` DISABLE KEYS */;
/*!40000 ALTER TABLE `EditionContains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editor`
--

DROP TABLE IF EXISTS `Editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Editor` (
  `staffID` int(11) NOT NULL,
  `type` char(8) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `Editor_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editor`
--

LOCK TABLES `Editor` WRITE;
/*!40000 ALTER TABLE `Editor` DISABLE KEYS */;
INSERT INTO `Editor` VALUES (3001,'internal'),(3002,'internal'),(9994,'internal');
/*!40000 ALTER TABLE `Editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EditorAssigned`
--

DROP TABLE IF EXISTS `EditorAssigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EditorAssigned` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`pubID`),
  KEY `pubID` (`pubID`),
  CONSTRAINT `EditorAssigned_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Editor` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EditorAssigned_ibfk_2` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EditorAssigned`
--

LOCK TABLES `EditorAssigned` WRITE;
/*!40000 ALTER TABLE `EditorAssigned` DISABLE KEYS */;
INSERT INTO `EditorAssigned` VALUES (3001,1001),(3002,1002);
/*!40000 ALTER TABLE `EditorAssigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enter`
--

DROP TABLE IF EXISTS `Enter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enter` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `payID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`payID`),
  KEY `payID` (`payID`),
  CONSTRAINT `Enter_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Enter_ibfk_2` FOREIGN KEY (`payID`) REFERENCES `Payment` (`payID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enter`
--

LOCK TABLES `Enter` WRITE;
/*!40000 ALTER TABLE `Enter` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GetsPaid`
--

DROP TABLE IF EXISTS `GetsPaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GetsPaid` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `payID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`payID`),
  KEY `payID` (`payID`),
  CONSTRAINT `GetsPaid_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GetsPaid_ibfk_2` FOREIGN KEY (`payID`) REFERENCES `Payment` (`payID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GetsPaid`
--

LOCK TABLES `GetsPaid` WRITE;
/*!40000 ALTER TABLE `GetsPaid` DISABLE KEYS */;
INSERT INTO `GetsPaid` VALUES (3001,1),(3002,2),(3003,3);
/*!40000 ALTER TABLE `GetsPaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Issue` (
  `issueID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `tabOfCont` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`issueID`,`pubID`),
  KEY `pubID` (`pubID`),
  CONSTRAINT `Issue_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue`
--

LOCK TABLES `Issue` WRITE;
/*!40000 ALTER TABLE `Issue` DISABLE KEYS */;
INSERT INTO `Issue` VALUES (1,1002,'2020-02-24','ArticleNO.1\ntitle : 1\n'),(1,1003,'2020-03-01','ArticleNO.1\ntitle : 1\n');
/*!40000 ALTER TABLE `Issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssueContains`
--

DROP TABLE IF EXISTS `IssueContains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueContains` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `issueID` int(11) NOT NULL DEFAULT '0',
  `artID` int(11) NOT NULL DEFAULT '0',
  `artNum` int(11) NOT NULL,
  PRIMARY KEY (`pubID`,`issueID`,`artID`),
  KEY `issueID` (`issueID`),
  KEY `artID` (`artID`),
  CONSTRAINT `IssueContains_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IssueContains_ibfk_2` FOREIGN KEY (`issueID`) REFERENCES `Issue` (`issueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IssueContains_ibfk_3` FOREIGN KEY (`artID`) REFERENCES `Article` (`artID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueContains`
--

LOCK TABLES `IssueContains` WRITE;
/*!40000 ALTER TABLE `IssueContains` DISABLE KEYS */;
INSERT INTO `IssueContains` VALUES (1002,1,1,1),(1003,1,2,1);
/*!40000 ALTER TABLE `IssueContains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journals`
--

DROP TABLE IF EXISTS `Journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Journals` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `periodicity` varchar(100) NOT NULL,
  PRIMARY KEY (`pubID`),
  CONSTRAINT `Journals_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journals`
--

LOCK TABLES `Journals` WRITE;
/*!40000 ALTER TABLE `Journals` DISABLE KEYS */;
INSERT INTO `Journals` VALUES (1003,'monthly');
/*!40000 ALTER TABLE `Journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kings`
--

DROP TABLE IF EXISTS `Kings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kings` (
  `name` varchar(30) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `house` varchar(20) DEFAULT NULL,
  `beginReign` int(11) DEFAULT NULL,
  `endReign` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kings`
--

LOCK TABLES `Kings` WRITE;
/*!40000 ALTER TABLE `Kings` DISABLE KEYS */;
INSERT INTO `Kings` VALUES ('Charles','The Unready','Stark',1004,1054),('Charles II','Rowdy','Stark',1148,1170),('Charles III','Gutei','Stark',1168,1190),('Charles IV','Honest','Stark',1190,1205),('Edward I',NULL,'Tudor',950,1005),('Edward II',NULL,'Tudor',1006,1050),('Edward III',NULL,'Tudor',1051,1070),('Edward IV',NULL,'Tudor',1071,1080),('Edward IX',NULL,'Tudor',1130,1150),('Edward The Confessor',NULL,'Lannister',970,1000),('Edward V',NULL,'Tudor',1081,1101),('Edward VI',NULL,'Tudor',1101,1110),('Edward VII',NULL,'Tudor',1111,1120),('Edward VIII',NULL,'Tudor',1121,1130);
/*!40000 ALTER TABLE `Kings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazines`
--

DROP TABLE IF EXISTS `Magazines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Magazines` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `periodicity` varchar(100) NOT NULL,
  PRIMARY KEY (`pubID`),
  CONSTRAINT `Magazines_ibfk_1` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazines`
--

LOCK TABLES `Magazines` WRITE;
/*!40000 ALTER TABLE `Magazines` DISABLE KEYS */;
INSERT INTO `Magazines` VALUES (1002,'monthly');
/*!40000 ALTER TABLE `Magazines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderHasEdition`
--

DROP TABLE IF EXISTS `OrderHasEdition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderHasEdition` (
  `orderID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  `editionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderID`,`pubID`,`editionID`),
  KEY `pubID` (`pubID`),
  KEY `editionID` (`editionID`),
  CONSTRAINT `OrderHasEdition_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderHasEdition_ibfk_2` FOREIGN KEY (`pubID`) REFERENCES `Edition` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderHasEdition_ibfk_3` FOREIGN KEY (`editionID`) REFERENCES `Edition` (`editionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderHasEdition`
--

LOCK TABLES `OrderHasEdition` WRITE;
/*!40000 ALTER TABLE `OrderHasEdition` DISABLE KEYS */;
INSERT INTO `OrderHasEdition` VALUES (4001,1001,2),(4002,1001,2);
/*!40000 ALTER TABLE `OrderHasEdition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderHasIssue`
--

DROP TABLE IF EXISTS `OrderHasIssue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderHasIssue` (
  `orderID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  `issueID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pubID`,`orderID`,`issueID`),
  KEY `orderID` (`orderID`),
  KEY `issueID` (`issueID`),
  CONSTRAINT `OrderHasIssue_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderHasIssue_ibfk_2` FOREIGN KEY (`pubID`) REFERENCES `Issue` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderHasIssue_ibfk_3` FOREIGN KEY (`issueID`) REFERENCES `Issue` (`issueID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderHasIssue`
--

LOCK TABLES `OrderHasIssue` WRITE;
/*!40000 ALTER TABLE `OrderHasIssue` DISABLE KEYS */;
INSERT INTO `OrderHasIssue` VALUES (4003,1003,1);
/*!40000 ALTER TABLE `OrderHasIssue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `orderID` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `deliveryDate` date NOT NULL,
  `price` float NOT NULL,
  `numCopies` int(11) NOT NULL,
  `shipCost` float NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (4001,'2020-01-02','2020-01-15',20,30,30),(4002,'2020-02-05','2020-02-15',20,10,15),(4003,'2020-02-10','2020-02-25',10,10,15);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parents`
--

DROP TABLE IF EXISTS `Parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parents` (
  `child` varchar(30) NOT NULL DEFAULT '',
  `parent` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`child`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parents`
--

LOCK TABLES `Parents` WRITE;
/*!40000 ALTER TABLE `Parents` DISABLE KEYS */;
INSERT INTO `Parents` VALUES ('Charles II','Charles'),('Charles III','Charles'),('Charles IV','Charles III'),('Edward II','Edward I'),('Edward III','Edward II'),('Edward IV','Edward II'),('Edward IX','Edward IV'),('Edward V','Edward III'),('Edward VI','Edward III'),('Edward VII','Edward IV'),('Edward VIII','Edward IV');
/*!40000 ALTER TABLE `Parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `payID` int(11) NOT NULL,
  `generatedDate` date NOT NULL,
  `amount` int(11) NOT NULL,
  `claimedDate` date DEFAULT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,'2020-04-01',1000,NULL),(2,'2020-04-01',1000,NULL),(3,'2020-04-01',1200,NULL),(4,'2020-02-01',630,'2020-02-01'),(5,'2020-03-01',115,'2020-03-01');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentConnectedToOrder`
--

DROP TABLE IF EXISTS `PaymentConnectedToOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentConnectedToOrder` (
  `payID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payID`,`orderID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `PaymentConnectedToOrder_ibfk_1` FOREIGN KEY (`payID`) REFERENCES `Payment` (`payID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PaymentConnectedToOrder_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentConnectedToOrder`
--

LOCK TABLES `PaymentConnectedToOrder` WRITE;
/*!40000 ALTER TABLE `PaymentConnectedToOrder` DISABLE KEYS */;
INSERT INTO `PaymentConnectedToOrder` VALUES (4,4001),(5,4003);
/*!40000 ALTER TABLE `PaymentConnectedToOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PubMngCreateUpdate`
--

DROP TABLE IF EXISTS `PubMngCreateUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PubMngCreateUpdate` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `pubID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`,`pubID`),
  KEY `pubID` (`pubID`),
  CONSTRAINT `PubMngCreateUpdate_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PubMngCreateUpdate_ibfk_2` FOREIGN KEY (`pubID`) REFERENCES `Publication` (`pubID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PubMngCreateUpdate`
--

LOCK TABLES `PubMngCreateUpdate` WRITE;
/*!40000 ALTER TABLE `PubMngCreateUpdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `PubMngCreateUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
  `pubID` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`pubID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publication`
--

LOCK TABLES `Publication` WRITE;
/*!40000 ALTER TABLE `Publication` DISABLE KEYS */;
INSERT INTO `Publication` VALUES (1001,'introduction to database'),(1002,'Healthy Diet'),(1003,'Animal Science');
/*!40000 ALTER TABLE `Publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PublicationManager`
--

DROP TABLE IF EXISTS `PublicationManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PublicationManager` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `PublicationManager_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `Staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PublicationManager`
--

LOCK TABLES `PublicationManager` WRITE;
/*!40000 ALTER TABLE `PublicationManager` DISABLE KEYS */;
INSERT INTO `PublicationManager` VALUES (9992);
/*!40000 ALTER TABLE `PublicationManager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schools`
--

DROP TABLE IF EXISTS `Schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schools` (
  `Name` varchar(10) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  `TuitonFees` int(11) DEFAULT NULL,
  `LivingExpenses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schools`
--

LOCK TABLES `Schools` WRITE;
/*!40000 ALTER TABLE `Schools` DISABLE KEYS */;
INSERT INTO `Schools` VALUES ('NC State','North Carolina',24000,20000),('Stanford','California',44000,35000),('UNC','North Carolina',34000,20000),('Harvard','Massachusetts',50000,38000),('UCLA','California',36000,30000),('NYU','New York',15000,41000);
/*!40000 ALTER TABLE `Schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `staffID` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `joinDate` date NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (3001,'John',36,'3001@gmail.com','9391234567','M','21 ABC St, NC 27','2020-03-01','John','John',1000),(3002,'Ethen',30,'3002@gmail.com','9491234567','M','21 ABC St, NC 27606','2020-03-01','Ethen','Ethen',1000),(3003,'Cathy',28,'3003@gmail.com','9591234567','F','3300 AAA St, NC 27606','2020-03-01','Cathy','Cathy',0),(9991,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-07','admin','admin',NULL),(9992,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-07','pub','pub',NULL),(9993,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-07','dist','dist',NULL),(9994,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-07','editor','editor',NULL),(9995,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-07','author','author',NULL);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `Name` varchar(20) DEFAULT NULL,
  `School` varchar(10) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `FundingReceived` int(11) DEFAULT NULL,
  `Income` int(11) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES ('Todd','NC State',18,16000,30000,'M'),('Max','Stanford',21,20000,70000,'M'),('Alex','UNC',19,8000,40000,'M'),('Natasha','Harvard',22,15000,75000,'F'),('Kelly','UCLA',23,2000,50000,'F'),('Angela','NYU',18,8000,55000,'F');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-07 21:08:19
