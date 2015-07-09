CREATE DATABASE  IF NOT EXISTS `final` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `final`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
--
-- Host: localhost    Database: final
-- ------------------------------------------------------
-- Server version	5.6.21-enterprise-commercial-advanced-log

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
INSERT INTO `bank` VALUES ('123456',123456,'123456'),('123457',123456,'123456'),('123458',123456,'123456'),('123459',123456,'123456');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'南京'),(2,'北京'),(3,'上海'),(4,'天津'),(5,'重庆'),(6,'杭州'),(7,'香港'),(8,'澳门'),(9,'台湾');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,0,1,1,1,'路人'),(2,20,0.9,2,2,'龙套'),(3,40,0.85,3,4,'群演'),(4,80,0.8,4,8,'替身'),(5,120,0.75,5,12,'配角'),(6,200,0.6,6,20,'主角'),(7,400,0.2,7,40,'影帝');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'春花',20,12),(2,'秋月',15,10),(3,'听雨',15,10),(4,'赏荷',15,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,NULL,0,'1994-01-08',0,'f','千千酱','2015-07-09',NULL,0,0,1,1,'0000001');
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
  `director` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `introduction` text,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offTime` datetime DEFAULT NULL,
  `onTime` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'王宝强，郭富城，张震，林志玲，范伟，元华，王学圻','movieCover/1.jpeg','陈凯歌',123,'民国时期军阀林立，各种势力与江湖帮派汇聚，一个忍受不了山中寂寞的小道士何安下偷偷下山，却阴差阳错地被卷入了乱世中的一场场阴谋。他周旋于军方、帮派和日本人之间，经历了一系列诡异奇幻的人物与事件，却在危难中慢慢悟出了武术的至理与境界，从而人生也随之改变。','国语','道士下山','2015-08-31 00:00:00','2015-07-02 00:00:00','奇幻,冒险,喜剧'),(2,'万国鹏，姜涛，覃培军，魏星，寇骏，张喜来，王昭，周鹏','movieCover/2.jpeg','尔冬升',90,'《我是路人甲》讲述的是漂泊并奋斗在横店追寻影视梦的“横漂”一族的故事。一群年轻人，怀揣着各种不同的梦想来到了横店电影城，去追寻自己的演艺梦想。杨光、晓帆素不相识，但却坐着同一辆大巴带着各自的理想和信念来到了横店，这个被称为“中国好莱坞”的最大影视基地。失恋的晓帆碰到了横店的老群众演员“李钊”，在李钊的帮助下慢慢融入横店的各个剧组。来自各地的他们，在横店开始了自己的演员“寻梦”。','国语','我是路人甲','2015-08-31 00:00:00','2015-07-03 00:00:00','剧情'),(3,'克里斯·帕拉特，布莱丝·达拉斯·霍华德，尼克·罗宾森，泰·辛普金斯，黄荣亮','movieCover/3.jpeg','科林·特莱沃若',124,'《侏罗纪世界》的背景设置在《侏罗纪公园》故事发生22年后，纳布拉尔岛已经发展成为一个庞大的主题公园和度假胜地——侏罗纪世界。游客可以乘着船、驾着车，或者坐在透明的旋转球里欣赏身边的恐龙，优美的景色和宁静的气氛令人们流连忘返，但是这一派热闹之中似乎暗藏危机。[3]  如同公园曾经的创始人约翰·哈蒙德（理查德·阿滕伯勒饰）所期望的那样。但如今的国际基因科技公司（InGen）在制造恐龙的同时还力图打造“混血儿”，将不同种类甚至不同物种的DNA相结合，最终意外制造出可怕的D-Rex掠食者恐龙。以欧文（克里斯·帕拉特饰）为首的研究小组来到这里研究迅猛龙，却接连发生意外。','英语','侏罗纪世界','2015-09-02 00:00:00','2015-06-12 00:00:00','动作，冒险，科幻');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2015-07-10 16:43:00',1,60,'2015-07-10 14:40:00',1,1),(2,'2015-07-10 20:48:00',1,60,'2015-07-10 18:45:00',1,1),(3,'2015-07-10 11:34:00',1,80,'2015-07-10 09:30:00',1,3),(4,'2015-07-10 20:14:00',1,123,'2015-07-10 18:10:00',4,3),(5,'2015-07-10 15:55:00',1,120,'2015-07-10 14:25:00',2,2),(6,'2015-07-11 16:43:00',1,60,'2015-07-11 14:40:00',1,1),(7,'2015-07-11 20:48:00',1,60,'2015-07-11 18:45:00',1,1),(8,'2015-07-11 11:34:00',1,80,'2015-07-11 09:30:00',1,3),(9,'2015-07-11 20:14:00',1,123,'2015-07-11 18:10:00',4,3),(10,'2015-07-11 15:55:00',1,120,'2015-07-11 14:25:00',2,2);
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
INSERT INTO `user` VALUES ('0000001','2','EDGM@MAMABDACFDLLG'),('c001','1','EDGM@MAMABDACFDLLG'),('m001','0','EDGM@MAMABDACFDLLG');
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

-- Dump completed on 2015-07-09 11:36:44
