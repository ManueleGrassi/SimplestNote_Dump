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
-- Table structure for table `paragraph_stt`
--

DROP TABLE IF EXISTS `paragraph_stt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragraph_stt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `last_change_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user_lastchange` int(10) unsigned NOT NULL,
  `id_paragraph` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `old_user_change` (`id_user_lastchange`),
  KEY `actual_paragraph` (`id_paragraph`),
  CONSTRAINT `actual_paragraph` FOREIGN KEY (`id_paragraph`) REFERENCES `paragraph` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `old_user_change` FOREIGN KEY (`id_user_lastchange`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph_stt`
--

LOCK TABLES `paragraph_stt` WRITE;
/*!40000 ALTER TABLE `paragraph_stt` DISABLE KEYS */;
INSERT INTO `paragraph_stt` VALUES (1,'Primo paragrafo di Utente1.',1,'2020-06-18 09:37:01',4,8),(2,'Primo paragrafo di User1 modificato.',1,'2020-06-18 10:34:40',4,8),(3,'Primo paragrafo di Utente6',1,'2020-06-18 22:20:39',9,19),(4,'Prima modifica del paragrafo di Utente6',1,'2020-06-18 22:21:08',9,19),(5,'Primo paragrafo di Utente7',1,'2020-06-18 22:37:03',10,21),(6,'Prima modifica del paragrafo di Utente7',1,'2020-06-18 22:37:03',10,21);
/*!40000 ALTER TABLE `paragraph_stt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 10:32:02
