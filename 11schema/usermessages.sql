-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com    Database: usermessages
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
-- Table structure for table `aaffinbox`
--

DROP TABLE IF EXISTS `aaffinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aaffinbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL,
  PRIMARY KEY (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaffinbox`
--

LOCK TABLES `aaffinbox` WRITE;
/*!40000 ALTER TABLE `aaffinbox` DISABLE KEYS */;
INSERT INTO `aaffinbox` VALUES ('test6','if you\'re reading this, then messenging works');
/*!40000 ALTER TABLE `aaffinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaffoutbox`
--

DROP TABLE IF EXISTS `aaffoutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aaffoutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL,
  PRIMARY KEY (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaffoutbox`
--

LOCK TABLES `aaffoutbox` WRITE;
/*!40000 ALTER TABLE `aaffoutbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaffoutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amaninbox`
--

DROP TABLE IF EXISTS `amaninbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amaninbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amaninbox`
--

LOCK TABLES `amaninbox` WRITE;
/*!40000 ALTER TABLE `amaninbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `amaninbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amanoutbox`
--

DROP TABLE IF EXISTS `amanoutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amanoutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amanoutbox`
--

LOCK TABLES `amanoutbox` WRITE;
/*!40000 ALTER TABLE `amanoutbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `amanoutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverinbox`
--

DROP TABLE IF EXISTS `driverinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driverinbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverinbox`
--

LOCK TABLES `driverinbox` WRITE;
/*!40000 ALTER TABLE `driverinbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `driverinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driveroutbox`
--

DROP TABLE IF EXISTS `driveroutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveroutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driveroutbox`
--

LOCK TABLES `driveroutbox` WRITE;
/*!40000 ALTER TABLE `driveroutbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `driveroutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiver2inbox`
--

DROP TABLE IF EXISTS `receiver2inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiver2inbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `msgType` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiver2inbox`
--

LOCK TABLES `receiver2inbox` WRITE;
/*!40000 ALTER TABLE `receiver2inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiver2inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiver2outbox`
--

DROP TABLE IF EXISTS `receiver2outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiver2outbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `msgType` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiver2outbox`
--

LOCK TABLES `receiver2outbox` WRITE;
/*!40000 ALTER TABLE `receiver2outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiver2outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiverinbox`
--

DROP TABLE IF EXISTS `receiverinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiverinbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiverinbox`
--

LOCK TABLES `receiverinbox` WRITE;
/*!40000 ALTER TABLE `receiverinbox` DISABLE KEYS */;
INSERT INTO `receiverinbox` VALUES ('sender','foo'),('sender','Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message');
/*!40000 ALTER TABLE `receiverinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiveroutbox`
--

DROP TABLE IF EXISTS `receiveroutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiveroutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiveroutbox`
--

LOCK TABLES `receiveroutbox` WRITE;
/*!40000 ALTER TABLE `receiveroutbox` DISABLE KEYS */;
INSERT INTO `receiveroutbox` VALUES ('sender','barr');
/*!40000 ALTER TABLE `receiveroutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riderinbox`
--

DROP TABLE IF EXISTS `riderinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riderinbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riderinbox`
--

LOCK TABLES `riderinbox` WRITE;
/*!40000 ALTER TABLE `riderinbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `riderinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rideroutbox`
--

DROP TABLE IF EXISTS `rideroutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rideroutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rideroutbox`
--

LOCK TABLES `rideroutbox` WRITE;
/*!40000 ALTER TABLE `rideroutbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `rideroutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender2inbox`
--

DROP TABLE IF EXISTS `sender2inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sender2inbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `msgType` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender2inbox`
--

LOCK TABLES `sender2inbox` WRITE;
/*!40000 ALTER TABLE `sender2inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender2inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender2outbox`
--

DROP TABLE IF EXISTS `sender2outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sender2outbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `msgType` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender2outbox`
--

LOCK TABLES `sender2outbox` WRITE;
/*!40000 ALTER TABLE `sender2outbox` DISABLE KEYS */;
INSERT INTO `sender2outbox` VALUES ('receiver2','you can delete this message',0);
/*!40000 ALTER TABLE `sender2outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senderinbox`
--

DROP TABLE IF EXISTS `senderinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `senderinbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senderinbox`
--

LOCK TABLES `senderinbox` WRITE;
/*!40000 ALTER TABLE `senderinbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `senderinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senderoutbox`
--

DROP TABLE IF EXISTS `senderoutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `senderoutbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senderoutbox`
--

LOCK TABLES `senderoutbox` WRITE;
/*!40000 ALTER TABLE `senderoutbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `senderoutbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test6inbox`
--

DROP TABLE IF EXISTS `test6inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test6inbox` (
  `sender` varchar(20) NOT NULL,
  `message` varchar(150) NOT NULL,
  PRIMARY KEY (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test6inbox`
--

LOCK TABLES `test6inbox` WRITE;
/*!40000 ALTER TABLE `test6inbox` DISABLE KEYS */;
INSERT INTO `test6inbox` VALUES ('santana','yea');
/*!40000 ALTER TABLE `test6inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test6outbox`
--

DROP TABLE IF EXISTS `test6outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test6outbox` (
  `recipient` varchar(20) NOT NULL,
  `message` varchar(150) NOT NULL,
  PRIMARY KEY (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test6outbox`
--

LOCK TABLES `test6outbox` WRITE;
/*!40000 ALTER TABLE `test6outbox` DISABLE KEYS */;
INSERT INTO `test6outbox` VALUES ('aaffinbox','if you\'re reading this, then messenging works');
/*!40000 ALTER TABLE `test6outbox` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 23:25:25
