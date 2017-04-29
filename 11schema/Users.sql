-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com    Database: Users
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ruEmail` varchar(20) NOT NULL,
  `secEmail` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phonenum` varchar(11) DEFAULT NULL,
  `userType` varchar(45) DEFAULT 'enduser',
  `userBehavior` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES ('aaff','afff','2@rutgers.edu','33@rutgers.edu','sdfa','00004','support',1),('Admin','Admin','Admin','Admin','Admin','Admin','admin',1),('aman','aman','aman@rutgers.edu','aman@rutgers.edu','','','enduser',1),('driver','foo','driver@drivegers.edu','driver@gmail.drive','','','',1),('eric','286931','2@rutgers.edu','3@rutgers.edu','aaa','000','enduser',0),('garvey','foo','kevin@rutgers.edu','kevin@gmail.com','','',NULL,1),('guinea','foo','pig@pig.pig','pig@pig.pig','','','enduser',1),('lamb','sheep','sheep@rutgers.edu','sheep@gmail.com','','',NULL,1),('newtest','foo','t@t.tom','t@t.tom','','','enduser',1),('receiver','foo','old@old.com','old@old.com','','',NULL,1),('receiver2','foo','r@r.rom','r@r.rom','','','',1),('receiver3','foo','se@se.sen','se@se.sen','','','enduser',1),('receiver4','foo','sen@sen.sen','sen@sen.sen','','','enduser',1),('rider','foo','rider@ridgers.edu','rider@gmail.ride','','','',1),('santana','smooth','flow@rutgers.edu','flow@gmail.com','','',NULL,1),('sender','foo','sender@sender.sender','sender@sender.sender','','',NULL,1),('sender2','foo','s@s.som','s@s.som','','','',1),('sender3','foo','se@se.sen','se@se.sen','','','enduser',1),('sender4','foo','sen@sen.sen','sen@sen.sen','','','enduser',1),('test2','foo','test@gmail.com','test@gmail.com','','',NULL,1),('test3','foo','testa@a.com','testo@b.com','','',NULL,1),('test5','foo','testa@gmail.com','testa@gmail.com','','',NULL,1),('test6','foo','test@g.com','test@g.com','','',NULL,1),('testacct','foo','test@test.com','test@test.com','','','enduser',1),('testacct2','foo','test@test.test','test@test.test','','','enduser',1),('testrider','foo','test@test.test','test@test.test','','','enduser',1),('testtttt','tasttttt','22@rutgers.edu','ni@rutgers.edu','aaa','333','support',1),('thedriver','foo','t@t.tom','t@t.tom','','','enduser',1),('therider','foo','t@t.tom','t@t.tom','','','enduser',1);
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car` (
  `carNo` int(1) NOT NULL AUTO_INCREMENT,
  `licensePlate` varchar(7) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `yr` varchar(4) DEFAULT '2017',
  `maker` varchar(30) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `description` varchar(150) NOT NULL,
  `driverName` varchar(30) NOT NULL,
  PRIMARY KEY (`carNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
INSERT INTO `Car` VALUES (1,'0','0','0','0','0','0','thedriver'),(2,'','','','','','test','test5');
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OfferRide`
--

DROP TABLE IF EXISTS `OfferRide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OfferRide` (
  `offerNo` int(11) NOT NULL AUTO_INCREMENT,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  `date` date NOT NULL,
  `departure` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `driverName` varchar(30) NOT NULL,
  `vehicleInfo` int(1) DEFAULT '1',
  `lim` varchar(1) DEFAULT '1',
  `recurring` varchar(1) DEFAULT '0',
  PRIMARY KEY (`offerNo`),
  KEY `vehicleInfo` (`vehicleInfo`),
  CONSTRAINT `OfferRide_ibfk_1` FOREIGN KEY (`vehicleInfo`) REFERENCES `Car` (`carNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OfferRide`
--

LOCK TABLES `OfferRide` WRITE;
/*!40000 ALTER TABLE `OfferRide` DISABLE KEYS */;
/*!40000 ALTER TABLE `OfferRide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestRide`
--

DROP TABLE IF EXISTS `RequestRide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestRide` (
  `requestNo` int(11) NOT NULL AUTO_INCREMENT,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `departure` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `riderName` varchar(30) NOT NULL,
  `lim` varchar(1) DEFAULT '1',
  `accept` varchar(1) DEFAULT '0',
  `driverName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`requestNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestRide`
--

LOCK TABLES `RequestRide` WRITE;
/*!40000 ALTER TABLE `RequestRide` DISABLE KEYS */;
INSERT INTO `RequestRide` VALUES (1,'05:00:00','2017-04-28','College Avenue','College Avenue','therider','1','1','thedriver');
/*!40000 ALTER TABLE `RequestRide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warning`
--

DROP TABLE IF EXISTS `Warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Warning` (
  `reached` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`reached`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warning`
--

LOCK TABLES `Warning` WRITE;
/*!40000 ALTER TABLE `Warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `Warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adTable`
--

DROP TABLE IF EXISTS `adTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adTable` (
  `adID` int(11) NOT NULL AUTO_INCREMENT,
  `adName` varchar(45) DEFAULT NULL,
  `adShown` int(11) DEFAULT '0',
  PRIMARY KEY (`adID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adTable`
--

LOCK TABLES `adTable` WRITE;
/*!40000 ALTER TABLE `adTable` DISABLE KEYS */;
INSERT INTO `adTable` VALUES (1,'ad1',10),(2,'ad2',11),(4,'n7',0);
/*!40000 ALTER TABLE `adTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offeredRides`
--

DROP TABLE IF EXISTS `offeredRides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offeredRides` (
  `riderName` varchar(30) NOT NULL,
  `requestNo` int(11) NOT NULL,
  `offerNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offeredRides`
--

LOCK TABLES `offeredRides` WRITE;
/*!40000 ALTER TABLE `offeredRides` DISABLE KEYS */;
/*!40000 ALTER TABLE `offeredRides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Admin','Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 23:19:13
