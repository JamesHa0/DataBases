-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: sm
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CNo` char(5) NOT NULL,
  `CName` varchar(30) NOT NULL,
  `CPno` char(5) DEFAULT NULL,
  `CTime` decimal(3,0) DEFAULT NULL,
  `CCredits` int DEFAULT '4',
  `CTerm` char(1) NOT NULL,
  PRIMARY KEY (`CNo`),
  UNIQUE KEY `CName` (`CName`),
  KEY `CPno` (`CPno`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`CPno`) REFERENCES `course` (`CNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('00001','数据结构','00005',72,4,'3'),('00002','英语2','00009',36,2,'2'),('00003','C++',NULL,54,3,'3'),('00004','数据库系统','00001',54,3,'4'),('00005','C语言',NULL,72,4,'2'),('00006','信息系统','00004',72,4,'7'),('00007','操作系统','00001',72,4,'5'),('00008','高等数学',NULL,72,4,'1'),('00009','英语1',NULL,54,3,'1');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fstu`
--

DROP TABLE IF EXISTS `fstu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fstu` (
  `SNo` char(8) NOT NULL,
  `SName` varchar(8) NOT NULL,
  `SSex` char(2) NOT NULL,
  `SBir` datetime DEFAULT NULL,
  `Scredits` int DEFAULT NULL,
  PRIMARY KEY (`SNo`),
  UNIQUE KEY `SName` (`SName`),
  CONSTRAINT `fstu_chk_1` CHECK (((`SSex` = _utf8mb4'男') or (`SSex` = _utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fstu`
--

LOCK TABLES `fstu` WRITE;
/*!40000 ALTER TABLE `fstu` DISABLE KEYS */;
INSERT INTO `fstu` VALUES ('16041102','王华','女','1997-10-09 00:00:00',4),('16041104','赵丽','女','1998-01-10 00:00:00',4),('16041105','郝枚','女','1999-05-04 00:00:00',NULL),('16041203','周红','女','1997-10-26 00:00:00',4);
/*!40000 ALTER TABLE `fstu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fstu1`
--

DROP TABLE IF EXISTS `fstu1`;
/*!50001 DROP VIEW IF EXISTS `fstu1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fstu1` AS SELECT 
 1 AS `sno`,
 1 AS `sname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sc`
--

DROP TABLE IF EXISTS `sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc` (
  `SNo` char(8) NOT NULL,
  `CNo` char(5) NOT NULL,
  `Score` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`SNo`,`CNo`),
  KEY `CNo` (`CNo`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`SNo`) REFERENCES `student` (`SNo`),
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`CNo`) REFERENCES `course` (`CNo`),
  CONSTRAINT `sc_chk_1` CHECK (((`Score` >= 0) and (`Score` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc`
--

LOCK TABLES `sc` WRITE;
/*!40000 ALTER TABLE `sc` DISABLE KEYS */;
INSERT INTO `sc` VALUES ('16041101','00001',NULL),('16041101','00005',62.00),('16041101','00008',79.00),('16041101','00009',65.00),('16041102','00001',NULL),('16041102','00005',36.00),('16041102','00008',94.00),('16041102','00009',36.00),('16041103','00001',NULL),('16041103','00005',86.00),('16041103','00008',65.00),('16041103','00009',93.00),('16041104','00005',94.00),('16041104','00008',35.00),('16041104','00009',28.00),('16041202','00001',70.00),('16041202','00005',NULL),('16041202','00009',72.00),('16041203','00001',82.00),('16041203','00005',NULL),('22023237','00005',0.00),('22023237','00008',0.00),('22023237','00009',0.00);
/*!40000 ALTER TABLE `sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st`
--

DROP TABLE IF EXISTS `st`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st` (
  `SNo` char(8) NOT NULL,
  `SName` varchar(8) NOT NULL,
  `SSex` char(2) NOT NULL,
  `SBir` datetime DEFAULT NULL,
  `Scredits` int DEFAULT NULL,
  PRIMARY KEY (`SNo`),
  UNIQUE KEY `SName` (`SName`),
  CONSTRAINT `st_chk_1` CHECK (((`SSex` = _utf8mb4'男') or (`SSex` = _utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st`
--

LOCK TABLES `st` WRITE;
/*!40000 ALTER TABLE `st` DISABLE KEYS */;
INSERT INTO `st` VALUES ('11111111','詹宇昊','男','2001-11-23 00:00:00',99),('22222222','abc','女','2000-01-01 00:00:00',66);
/*!40000 ALTER TABLE `st` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `SNo` char(8) NOT NULL,
  `SName` varchar(8) NOT NULL,
  `SSex` char(2) NOT NULL,
  `SBir` datetime DEFAULT NULL,
  `Scredits` int DEFAULT NULL,
  PRIMARY KEY (`SNo`),
  UNIQUE KEY `SName` (`SName`),
  CONSTRAINT `student_chk_1` CHECK (((`SSex` = _utf8mb4'男') or (`SSex` = _utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('16041101','李刚','男','1998-01-02 00:00:00',11),('16041102','王华','女','1997-10-09 00:00:00',4),('16041103','张强','男','1999-02-12 00:00:00',11),('16041104','赵丽','女','1998-01-10 00:00:00',4),('16041105','郝枚','女','1999-05-04 00:00:00',NULL),('16041201','刘宏','男','2000-08-09 00:00:00',NULL),('16041202','梁栋','男','1998-10-10 00:00:00',7),('16041203','周红','女','1997-10-26 00:00:00',4),('22023237','詹宇昊','男','2001-11-23 00:00:00',99),('22042217','刘星雨','男','2004-06-16 00:00:00',99),('22042224','王玉卓','男','2004-06-13 00:00:00',99),('22042233','赵禹博','男','2004-05-21 00:00:00',99);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `fstu1`
--

/*!50001 DROP VIEW IF EXISTS `fstu1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fstu1` AS select `st`.`SNo` AS `sno`,`st`.`SName` AS `sname` from `st` */;
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

-- Dump completed on 2024-05-24 14:05:09
