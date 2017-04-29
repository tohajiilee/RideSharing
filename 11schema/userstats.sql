-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com    Database: userstats
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
-- Table structure for table `daystats`
--

DROP TABLE IF EXISTS `daystats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daystats` (
  `dayid` varchar(20) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dayid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daystats`
--

LOCK TABLES `daystats` WRITE;
/*!40000 ALTER TABLE `daystats` DISABLE KEYS */;
INSERT INTO `daystats` VALUES ('4-26-2017',1),('4-27-2017',5);
/*!40000 ALTER TABLE `daystats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deststats`
--

DROP TABLE IF EXISTS `deststats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deststats` (
  `destination` varchar(30) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deststats`
--

LOCK TABLES `deststats` WRITE;
/*!40000 ALTER TABLE `deststats` DISABLE KEYS */;
/*!40000 ALTER TABLE `deststats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthstats`
--

DROP TABLE IF EXISTS `monthstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthstats` (
  `monthid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`monthid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthstats`
--

LOCK TABLES `monthstats` WRITE;
/*!40000 ALTER TABLE `monthstats` DISABLE KEYS */;
INSERT INTO `monthstats` VALUES (1,0),(2,0),(3,0),(4,8),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0);
/*!40000 ALTER TABLE `monthstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `originstats`
--

DROP TABLE IF EXISTS `originstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `originstats` (
  `origin` varchar(30) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `originstats`
--

LOCK TABLES `originstats` WRITE;
/*!40000 ALTER TABLE `originstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `originstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermonthstats`
--

DROP TABLE IF EXISTS `usermonthstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermonthstats` (
  `username` varchar(20) NOT NULL,
  `month` varchar(20) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermonthstats`
--

LOCK TABLES `usermonthstats` WRITE;
/*!40000 ALTER TABLE `usermonthstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermonthstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userratings`
--

DROP TABLE IF EXISTS `userratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userratings` (
  `username` varchar(30) NOT NULL,
  `avgRating` double NOT NULL DEFAULT '0',
  `totalRating` int(11) NOT NULL DEFAULT '0',
  `timesRated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userratings`
--

LOCK TABLES `userratings` WRITE;
/*!40000 ALTER TABLE `userratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `userratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstats`
--

DROP TABLE IF EXISTS `userstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userstats` (
  `username` varchar(30) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstats`
--

LOCK TABLES `userstats` WRITE;
/*!40000 ALTER TABLE `userstats` DISABLE KEYS */;
INSERT INTO `userstats` VALUES ('1123',0),('a',0),('aaff',0),('admin',3),('aman',0),('asdfasdf',0),('biggum',5),('driver',0),('ee',0),('eric',1),('foo',1),('garvey',0),('guinea',1),('lamb',0),('receiver',0),('receiver2',0),('rider',0),('santana',0),('sender',5),('sender2',0),('sender3',1),('test12',2),('test2',0),('test3',0),('test343',0),('test5',0),('test6',0),('testacct',1),('testrider',1),('testtttt',0),('ziegler',2);
/*!40000 ALTER TABLE `userstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearstats`
--

DROP TABLE IF EXISTS `yearstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearstats` (
  `yearid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`yearid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearstats`
--

LOCK TABLES `yearstats` WRITE;
/*!40000 ALTER TABLE `yearstats` DISABLE KEYS */;
INSERT INTO `yearstats` VALUES (2017,7);
/*!40000 ALTER TABLE `yearstats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 23:25:54
