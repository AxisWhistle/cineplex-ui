-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: final
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `qid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`qid`,`sid`),
  KEY `FK_1iaplcjlt826b418p3a4lqgt4` (`sid`),
  CONSTRAINT `FK_1iaplcjlt826b418p3a4lqgt4` FOREIGN KEY (`sid`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FK_99mkytcr4ghflj15r22p3at17` FOREIGN KEY (`qid`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `oid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`oid`,`mid`),
  KEY `FK_7beai862hbf1330wx35rdbvhl` (`mid`),
  CONSTRAINT `FK_7beai862hbf1330wx35rdbvhl` FOREIGN KEY (`mid`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_h5ohpoyhhft8i2rg4iiprvuxg` FOREIGN KEY (`oid`) REFERENCES `options` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'南京');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consume`
--

DROP TABLE IF EXISTS `consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_of8e42bxr9nulg0lsbybynya7` (`mid`),
  CONSTRAINT `FK_of8e42bxr9nulg0lsbybynya7` FOREIGN KEY (`mid`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consume`
--

LOCK TABLES `consume` WRITE;
/*!40000 ALTER TABLE `consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge` double NOT NULL,
  `disaccount` double NOT NULL,
  `level` int(11) NOT NULL,
  `muticredit` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seatcolumn` int(11) NOT NULL,
  `seatrow` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'我是1号',10,10),(2,'我是2号',10,10),(3,'我是3号',10,10);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` date DEFAULT NULL,
  `balance` double NOT NULL,
  `birthday` date DEFAULT NULL,
  `credit` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `register` date DEFAULT NULL,
  `resumn` date DEFAULT NULL,
  `state` int(11) NOT NULL,
  `total` double NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dscqjykjgn0la47fs2iav5533` (`cid`),
  KEY `FK_jsa854io5vwuoucihmpwtelsb` (`did`),
  KEY `FK_hjme2qjwkdqp9lwmghidnpn6w` (`uid`),
  CONSTRAINT `FK_dscqjykjgn0la47fs2iav5533` FOREIGN KEY (`cid`) REFERENCES `city` (`id`),
  CONSTRAINT `FK_hjme2qjwkdqp9lwmghidnpn6w` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_jsa854io5vwuoucihmpwtelsb` FOREIGN KEY (`did`) REFERENCES `discount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,NULL,0,'1990-01-01',0,'m','axis','2015-05-25',NULL,0,0,1,NULL,'0000001'),(2,NULL,0,'1998-06-19',0,'m','?','2015-05-28',NULL,0,0,1,NULL,'0000002'),(3,NULL,0,'1990-01-01',0,'m','?','2015-05-28',NULL,0,0,1,NULL,'0000003'),(4,NULL,0,'1990-01-01',0,'m','axis','2015-05-29',NULL,0,0,1,NULL,'0000004');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `introduction` text,
  `name` varchar(255) DEFAULT NULL,
  `offTime` date DEFAULT NULL,
  `onTime` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'刘青云',NULL,120,'','暴疯语','2015-06-01','2015-05-01',NULL),(2,'Robert',NULL,150,NULL,'复仇者联盟2','2015-06-01','2015-05-01',NULL),(3,'','movieCover/3.jpeg',120,'????????????????','????3','2015-07-31','2015-05-18','???');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_45kt5lfkg4p0ronpdn5o97d` (`qid`),
  CONSTRAINT `FK_45kt5lfkg4p0ronpdn5o97d` FOREIGN KEY (`qid`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` int(11) NOT NULL,
  `ques` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kctn00u7a8eyy9r0w3mse7fcl` (`mid`),
  CONSTRAINT `FK_kctn00u7a8eyy9r0w3mse7fcl` FOREIGN KEY (`mid`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recharge`
--

DROP TABLE IF EXISTS `recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `money` double NOT NULL,
  `bid` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qa7shkmxxleboxcdtbdxw8fo8` (`bid`),
  KEY `FK_1arfdmws1pq8ye25l6v8eg93i` (`mid`),
  CONSTRAINT `FK_1arfdmws1pq8ye25l6v8eg93i` FOREIGN KEY (`mid`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_qa7shkmxxleboxcdtbdxw8fo8` FOREIGN KEY (`bid`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recharge`
--

LOCK TABLES `recharge` WRITE;
/*!40000 ALTER TABLE `recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `end` datetime DEFAULT NULL,
  `granted` int(11) NOT NULL,
  `price` double NOT NULL,
  `time` datetime DEFAULT NULL,
  `hid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_osqewnqvdp5hgrqfheyknr0tk` (`hid`),
  KEY `FK_5ris1tv9ikcxd5yubtl9lhpls` (`mid`),
  CONSTRAINT `FK_5ris1tv9ikcxd5yubtl9lhpls` FOREIGN KEY (`mid`) REFERENCES `movie` (`id`),
  CONSTRAINT `FK_osqewnqvdp5hgrqfheyknr0tk` FOREIGN KEY (`hid`) REFERENCES `hall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2015-05-28 20:00:00',1,35,'2015-05-28 18:00:00',1,1),(2,'2015-05-31 10:00:00',1,20,'2015-05-31 08:00:00',1,1),(3,'2015-05-31 12:30:00',0,20,'2015-05-31 10:00:00',3,2);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colnum` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `isCash` bit(1) NOT NULL,
  `price` double NOT NULL,
  `rownum` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ied60jolx6s4fmwp040ieisrg` (`sid`),
  KEY `FK_bh2v9gyxpf6wg2qc5f8iw8c59` (`uid`),
  CONSTRAINT `FK_bh2v9gyxpf6wg2qc5f8iw8c59` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_ied60jolx6s4fmwp040ieisrg` FOREIGN KEY (`sid`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `gid` char(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0000001','2','M@DBACBGGFBFDCGFECBM@L@MF'),('0000002','2','MBCMFELMBACFMFA@MAGGDEEF'),('0000003','2','MBCMFELMBACFMFA@MAGGDEEF'),('0000004','2','EDGM@MAMABDACFDLLG'),('c001','1','@E@BGMGLAFEMA@@AA'),('c002','1','DBGDA@A@LACCGGBFAAM'),('c003','1','LBBFAAFELDLDMGGAEFMCC'),('c004','1','MEGE@AABLCCFA@MFCGECCAG'),('c005','1','L@CAGDFMC@DLEBEEFF'),('m001','0','GCAE@MGCECDCCACLBADAAG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-30 21:34:48
