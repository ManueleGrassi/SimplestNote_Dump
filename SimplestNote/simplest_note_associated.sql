CREATE DATABASE  IF NOT EXISTS `simplest_note` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `simplest_note`;
-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for osx10.10 (x86_64)
--
-- Host: 127.0.0.1    Database: simplest_note
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `associated`
--

DROP TABLE IF EXISTS `associated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associated` (
  `id_tag` int(10) unsigned NOT NULL,
  `id_note` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tag`,`id_note`),
  KEY `associated_with_note` (`id_note`),
  CONSTRAINT `associated_with_note` FOREIGN KEY (`id_note`) REFERENCES `note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `associated_with_tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated`
--

LOCK TABLES `associated` WRITE;
/*!40000 ALTER TABLE `associated` DISABLE KEYS */;
INSERT INTO `associated` VALUES (1,18),(2,15),(3,16);
/*!40000 ALTER TABLE `associated` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 10:32:01
