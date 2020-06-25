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
-- Table structure for table `paragraph`
--

DROP TABLE IF EXISTS `paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragraph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `last_change_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user_lastchange` int(10) unsigned NOT NULL,
  `id_note` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paragraph_unique` (`order`,`id_note`),
  KEY `user_change` (`id_user_lastchange`),
  KEY `note_references` (`id_note`),
  CONSTRAINT `note_references` FOREIGN KEY (`id_note`) REFERENCES `note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_change` FOREIGN KEY (`id_user_lastchange`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (8,'Primo paragrafo di User1 modificato.',1,'2020-06-18 10:34:40',4,8),(10,'Primo paragrafo di Utente2.',1,'2020-06-18 10:06:52',5,9),(11,'Primo paragrafo di Utente3.',1,'2020-06-18 10:06:52',6,10),(12,'Primo paragrafo di Utente4.',1,'2020-06-18 10:06:53',7,11),(13,'Primo paragrafo di Utente5.',1,'2020-06-18 10:06:53',8,12),(14,'Secondo paragrafo di Utente1.',2,'2020-06-18 10:11:28',4,8),(15,'Terzo paragrafo di Utente1.',3,'2020-06-18 10:11:28',4,8),(16,'Quarto paragrafo di Utente1.',4,'2020-06-18 10:11:28',4,8),(17,'Primo paragrafo di Utente1 in seconda nota.',1,'2020-06-18 12:47:17',4,13),(18,'Primo paragrafo di Utente1 in terza nota.',1,'2020-06-18 12:57:55',4,14),(19,'Primo paragrafo di Utente6',1,'2020-06-18 22:12:46',9,15),(20,'Secondo paragrafo di Utente6',2,'2020-06-18 22:12:46',9,15),(21,'Primo paragrafo di Utente7',1,'2020-06-18 22:12:46',10,18),(22,'Secondo paragrafo di Utente7',2,'2020-06-18 22:12:46',10,18);
/*!40000 ALTER TABLE `paragraph` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`simplestNoteUser`@`localhost`*/ /*!50003 TRIGGER validate_paragraph_insert BEFORE INSERT ON paragraph
FOR EACH ROW
BEGIN
CALL user_permit(NEW.id_user_lastchange, NEW.id_note);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`simplestNoteUser`@`localhost`*/ /*!50003 TRIGGER validate_paragraph_update BEFORE UPDATE ON paragraph
FOR EACH ROW
BEGIN
CALL user_permit(NEW.id_user_lastchange, NEW.id_note);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 10:32:02
