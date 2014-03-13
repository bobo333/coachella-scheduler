-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: coachella_scheduler
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `band_scheduler_band`
--

DROP TABLE IF EXISTS `band_scheduler_band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `band_scheduler_band` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `stage` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band_scheduler_band`
--

LOCK TABLES `band_scheduler_band` WRITE;
/*!40000 ALTER TABLE `band_scheduler_band` DISABLE KEYS */;
INSERT INTO `band_scheduler_band` VALUES (1,'A$ap Ferg','1',NULL,NULL,NULL),(2,'AFI','1',NULL,NULL,NULL),(3,'Aloe Blacc','1',NULL,NULL,NULL),(4,'Anthony Green','1',NULL,NULL,NULL),(5,'Anti-Flag','1',NULL,NULL,NULL),(6,'Austra','1',NULL,NULL,NULL),(7,'Bastille','1',NULL,NULL,NULL),(8,'Bonobo','1',NULL,NULL,NULL),(9,'Broken Bells','1',NULL,NULL,NULL),(10,'Bryan Ferry','1',NULL,NULL,NULL),(11,'Caravan Palace','1',NULL,NULL,NULL),(12,'Carnage','1',NULL,NULL,NULL),(13,'Chromeo','1',NULL,NULL,NULL),(14,' ††† (Crosses)','1',NULL,NULL,NULL),(15,'Damien Lazarus','1',NULL,NULL,NULL),(16,'Davide Squillace','1',NULL,NULL,NULL),(17,'Deorro','1',NULL,NULL,NULL),(18,'Dixon','1',NULL,NULL,NULL),(19,'DJ Falcon','1',NULL,NULL,NULL),(20,'Duke Dumont','1',NULL,NULL,NULL),(21,'Dum Dum Girls','1',NULL,NULL,NULL),(22,'Ellie Goulding','1',NULL,NULL,NULL),(23,'Flatbrush Zombies','1',NULL,NULL,NULL),(24,'Flume','1',NULL,NULL,NULL),(25,'Gabba Gabba Heys','1',NULL,NULL,NULL),(26,'Gareth Emery','1',NULL,NULL,NULL),(27,'Girl Talk','1',NULL,NULL,NULL),(28,'GOAT','1',NULL,NULL,NULL),(29,'Grouplove','1',NULL,NULL,NULL),(30,'HAIM','1',NULL,NULL,NULL),(31,'Hot Sauce 82','1',NULL,NULL,NULL),(32,'Jagwar Ma','1',NULL,NULL,NULL),(33,'Kate Nash','1',NULL,NULL,NULL),(34,'Mako','1',NULL,NULL,NULL),(35,'Martin Garrix','1',NULL,NULL,NULL),(36,'Michael Brun','1',NULL,NULL,NULL),(37,'MS MR','1',NULL,NULL,NULL),(38,'Neko Case','1',NULL,NULL,NULL),(39,'Nina Kraviz','1',NULL,NULL,NULL),(40,'Outkast','1',NULL,NULL,NULL),(41,'Shlomo','1',NULL,NULL,NULL),(42,'The Afghan Whigs','1',NULL,NULL,NULL),(43,'The Bots','1',NULL,NULL,NULL),(44,'The Cult','1',NULL,NULL,NULL),(45,'The Glitch Mob','1',NULL,NULL,NULL),(46,'The Jon Spencer Blues Explosion','1',NULL,NULL,NULL),(47,'The Knife','1',NULL,NULL,NULL),(48,'The Preatures','1',NULL,NULL,NULL),(49,'The Replacements','1',NULL,NULL,NULL),(50,'Title Fight','1',NULL,NULL,NULL),(51,'Tom Odell','1',NULL,NULL,NULL),(52,'Waxahatchee','1',NULL,NULL,NULL),(53,'Woodkid','1',NULL,NULL,NULL),(54,'Wye Oak','1',NULL,NULL,NULL),(55,'Zedd','1',NULL,NULL,NULL),(56,'ZZ Ward','1',NULL,NULL,NULL),(57,'Banks','2',NULL,NULL,NULL),(58,'Bear Hands','2',NULL,NULL,NULL),(59,'Bicep','2',NULL,NULL,NULL),(60,'Blood Orange','2',NULL,NULL,NULL),(61,'Bombay Bicycle Club','2',NULL,NULL,NULL),(62,'Cage the Elephant','2',NULL,NULL,NULL),(63,'Cajmere','2',NULL,NULL,NULL),(64,'Capital Cities','2',NULL,NULL,NULL),(65,'Carbon Airways','2',NULL,NULL,NULL),(66,'Chvrches','2',NULL,NULL,NULL),(67,'City and Colour','2',NULL,NULL,NULL),(68,'DARKSIDE','2',NULL,NULL,NULL),(69,'Dillon Francis','2',NULL,NULL,NULL),(70,'Drowners','2',NULL,NULL,NULL),(71,'Empire of the Sun','2',NULL,NULL,NULL),(72,'Fatboy Slim','2',NULL,NULL,NULL),(73,'Foster The People','2',NULL,NULL,NULL),(74,'Foxygen','2',NULL,NULL,NULL),(75,'Future Islands','2',NULL,NULL,NULL),(76,'Galantis','2',NULL,NULL,NULL),(77,'Graveyard','2',NULL,NULL,NULL),(78,'GTA','2',NULL,NULL,NULL),(79,'Guy Gerber','2',NULL,NULL,NULL),(80,'Headhunterz','2',NULL,NULL,NULL),(81,'Holy Ghost!','2',NULL,NULL,NULL),(82,'Kid Cudi','2',NULL,NULL,NULL),(83,'Laura Mvula','2',NULL,NULL,NULL),(84,'Lorde','2',NULL,NULL,NULL),(85,'MAKJ','2',NULL,NULL,NULL),(86,'MGMT','2',NULL,NULL,NULL),(87,'Mogwai','2',NULL,NULL,NULL),(88,'Muse','2',NULL,NULL,NULL),(89,'Nas','2',NULL,NULL,NULL),(90,'Netsky','2',NULL,NULL,NULL),(91,'Nicole Moudaber','2',NULL,NULL,NULL),(92,'Pet Shop Boys','2',NULL,NULL,NULL),(93,'Pharrell Williams','2',NULL,NULL,NULL),(94,'Queens of the Stone Age','2',NULL,NULL,NULL),(95,'RL Grime','2',NULL,NULL,NULL),(96,'Saints of Valory','2',NULL,NULL,NULL),(97,'Skrillex','2',NULL,NULL,NULL),(98,'Sleigh Bells','2',NULL,NULL,NULL),(99,'Solange','2',NULL,NULL,NULL),(100,'Syd Arthur','2',NULL,NULL,NULL),(101,'Temples','2',NULL,NULL,NULL),(102,'The Dismemberment Plan','2',NULL,NULL,NULL),(103,'The Head and the Heart','2',NULL,NULL,NULL),(104,'The Internet','2',NULL,NULL,NULL),(105,'The Magician','2',NULL,NULL,NULL),(106,'The Naked and Famous','2',NULL,NULL,NULL),(107,'Tiga','2',NULL,NULL,NULL),(108,'TJR','2',NULL,NULL,NULL),(109,'Ty Segall','2',NULL,NULL,NULL),(110,'Unlocking the Truth','2',NULL,NULL,NULL),(111,'UZ','2',NULL,NULL,NULL),(112,'Warpaint','2',NULL,NULL,NULL),(113,'Washed Out','2',NULL,NULL,NULL),(114,'White Lies','2',NULL,NULL,NULL),(115,'Young & Sick','2',NULL,NULL,NULL),(116,'Adventure Club','3',NULL,NULL,NULL),(117,'Aeroplane','3',NULL,NULL,NULL),(118,'Alesso','3',NULL,NULL,NULL),(119,'AlunaGeorge','3',NULL,NULL,NULL),(120,'Anna Lunoe','3',NULL,NULL,NULL),(121,'Art Department','3',NULL,NULL,NULL),(122,'Arcade Fire','3',NULL,NULL,NULL),(123,'Bad Manners','3',NULL,NULL,NULL),(124,'Beady Eye','3',NULL,NULL,NULL),(125,'Beck','3',NULL,NULL,NULL),(126,'Big Gigantic','3',NULL,NULL,NULL),(127,'Bo Ningen','3',NULL,NULL,NULL),(128,'Bombino','3',NULL,NULL,NULL),(129,'Calvin Harris','3',NULL,NULL,NULL),(130,'Chance the Rapper','3',NULL,NULL,NULL),(131,'Classixx','3',NULL,NULL,NULL),(132,'Daughter','3',NULL,NULL,NULL),(133,'Disclosure','3',NULL,NULL,NULL),(134,'Duck Sauce','3',NULL,NULL,NULL),(135,'Factory Floor','3',NULL,NULL,NULL),(136,'Fishbone','3',NULL,NULL,NULL),(137,'Flight Facilities','3',NULL,NULL,NULL),(138,'Flosstradamus','3',NULL,NULL,NULL),(139,'Frank Turner','3',NULL,NULL,NULL),(140,'J. Roddy Walston & the Business','3',NULL,NULL,NULL),(141,'James Vincent McMorrow','3',NULL,NULL,NULL),(142,'Jhene Aiko','3',NULL,NULL,NULL),(143,'John Beaver','3',NULL,NULL,NULL),(144,'John Newman','3',NULL,NULL,NULL),(145,'Krewella','3',NULL,NULL,NULL),(146,'Lana Del Rey','3',NULL,NULL,NULL),(147,'Laurent Garnier','3',NULL,NULL,NULL),(148,'Lee Burridge','3',NULL,NULL,NULL),(149,'Little Dragon','3',NULL,NULL,NULL),(150,'Maceo Plex','3',NULL,NULL,NULL),(151,'Neutral Milk Hotel','3',NULL,NULL,NULL),(152,'Poolside','3',NULL,NULL,NULL),(153,'Preservation Hall Jazz Band','3',NULL,NULL,NULL),(154,'Ratking','3',NULL,NULL,NULL),(155,'Rudimental','3',NULL,NULL,NULL),(156,'Scuba','3',NULL,NULL,NULL),(157,'Showtek','3',NULL,NULL,NULL),(158,'STRFKR','3',NULL,NULL,NULL),(159,'Superchunk','3',NULL,NULL,NULL),(160,'Surfer Blood','3',NULL,NULL,NULL),(161,'The 1975','3',NULL,NULL,NULL),(162,'The Martinez Brothers','3',NULL,NULL,NULL),(163,'The Toy Dolls','3',NULL,NULL,NULL),(164,'Trombone Shorty','3',NULL,NULL,NULL);
/*!40000 ALTER TABLE `band_scheduler_band` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-13  0:05:18
