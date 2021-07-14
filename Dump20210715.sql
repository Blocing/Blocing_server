-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: bloc
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

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
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holder_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `verifier_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_holder_id_fk_idx` (`holder_id`),
  KEY `attendance_class_id_fk_idx` (`class_id`),
  KEY `attendance_verifier_id_fk_idx` (`verifier_id`),
  CONSTRAINT `attendance_class_id_fk` FOREIGN KEY (`class_id`) REFERENCES `Class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `attendance_holder_id_fk` FOREIGN KEY (`holder_id`) REFERENCES `Holder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `attendance_verifier_id_fk` FOREIGN KEY (`verifier_id`) REFERENCES `Verifier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `days` varchar(45) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES (1,'캡스톤디자인2','소프트웨어학과','화','09:00:00','12:00:00'),(2,'모바일프로그래밍','소프트웨어학과','목','13:00:00','17:00:00'),(3,'임베디드소프트웨어','소프트웨어학과','월','09:00:00','12:00:00'),(4,'네트워크프로그래밍','소프트웨어학과','월','12:00:00','17:00:00');
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Holder`
--

DROP TABLE IF EXISTS `Holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Holder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `university` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `holder_did` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Holder`
--

LOCK TABLES `Holder` WRITE;
/*!40000 ALTER TABLE `Holder` DISABLE KEYS */;
/*!40000 ALTER TABLE `Holder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issuer`
--

DROP TABLE IF EXISTS `Issuer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Issuer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `issuer_did` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issuer`
--

LOCK TABLES `Issuer` WRITE;
/*!40000 ALTER TABLE `Issuer` DISABLE KEYS */;
INSERT INTO `Issuer` VALUES (1,'SCHAdmin','did:sov:FqJcwDjYDtRp9tbD4z2MLRzJbmfWJhdfRzHAj');
/*!40000 ALTER TABLE `Issuer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentIdCard`
--

DROP TABLE IF EXISTS `StudentIdCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentIdCard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_did` varchar(100) NOT NULL,
  `verified_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `holder_id` int(11) NOT NULL,
  `issuer_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studentIdCard_holder_id_fk_idx` (`holder_id`),
  KEY `studentIdCard_issuer_id_fk_idx` (`issuer_id`),
  CONSTRAINT `studentIdCard_holder_id_fk` FOREIGN KEY (`holder_id`) REFERENCES `Holder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `studentIdCard_issuer_id_fk` FOREIGN KEY (`issuer_id`) REFERENCES `Issuer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentIdCard`
--

LOCK TABLES `StudentIdCard` WRITE;
/*!40000 ALTER TABLE `StudentIdCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentIdCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Verifier`
--

DROP TABLE IF EXISTS `Verifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Verifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `verifier_did` varchar(100) NOT NULL,
  `end_point` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Verifier`
--

LOCK TABLES `Verifier` WRITE;
/*!40000 ALTER TABLE `Verifier` DISABLE KEYS */;
INSERT INTO `Verifier` VALUES (1,'전산','YLeJJTsDyWJ2paDDSpVMVSwASZZZIDMDS','0');
/*!40000 ALTER TABLE `Verifier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-15  8:03:59
