-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: location
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'karthik','password'),(2,'abcd','abcd'),(3,'sharath','password'),(4,'manoj','password'),(5,'anand','password'),(6,'bala','password'),(7,'admin','admin');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_crop`
--

DROP TABLE IF EXISTS `buyer_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_crop` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `crop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buyer_id_fk_idx` (`buyer_id`),
  KEY `buyer_crop_id_fk_idx` (`crop_id`),
  CONSTRAINT `buyer_crop_id_fk` FOREIGN KEY (`crop_id`) REFERENCES `crop_data` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `buyer_id_fk` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_crop`
--

LOCK TABLES `buyer_crop` WRITE;
/*!40000 ALTER TABLE `buyer_crop` DISABLE KEYS */;
INSERT INTO `buyer_crop` VALUES (1,1,1),(2,2,1),(3,2,2),(4,2,3),(5,3,1),(6,3,2),(7,3,3),(8,3,4),(9,3,5),(10,3,6),(11,3,7),(12,3,8),(13,3,9),(14,3,10),(15,3,11),(16,3,13),(17,3,14),(18,3,15),(19,3,16),(20,3,17),(21,3,18),(22,3,19),(23,3,20),(24,3,21),(25,3,22),(26,3,12),(27,1,2),(28,1,3),(29,1,22),(30,4,3),(31,5,2),(32,1,4),(33,1,5),(34,1,12),(35,1,6),(36,1,7),(37,1,8),(38,1,9),(39,6,4),(40,6,5),(41,6,15),(42,1,10),(43,1,11),(44,5,1),(45,5,3),(46,5,4),(47,1,14),(48,1,15),(49,1,30),(50,1,31),(51,1,13),(52,1,16),(53,1,17),(54,1,18),(55,1,19),(56,7,1),(57,7,2),(58,7,3),(59,7,4),(60,7,5),(61,7,6),(62,1,20),(63,1,24),(64,1,21);
/*!40000 ALTER TABLE `buyer_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `crop_amount` int(11) DEFAULT '0',
  `checkout` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_id_idx` (`customer_id`),
  KEY `fk_crop_id_idx` (`crop_id`),
  CONSTRAINT `fk_crop_id` FOREIGN KEY (`crop_id`) REFERENCES `crop_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,2,0,'2019-01-11'),(2,1,1,2,1,'2019-02-12'),(3,1,1,5,0,'2019-03-07'),(4,1,1,2,0,'2019-03-07'),(5,1,2,1,0,'2019-03-07'),(6,1,1,12,0,'2019-03-07'),(7,1,2,1,0,'2019-03-07'),(8,18,1,2,0,'2019-04-01'),(9,1,1,3,0,'2019-04-01'),(10,1,1,3,0,'2019-04-02'),(11,8,1,1,0,'2019-04-02'),(12,1,10,7,0,'2019-04-21'),(13,26,1,1,0,'2019-04-29'),(14,19,1,1,0,'2019-04-30'),(15,2,11,3,0,'2019-04-30'),(16,2,1,3,0,'2019-05-01'),(17,2,1,3,0,'2019-05-02'),(18,2,12,2,0,'2019-10-09'),(19,5,12,2,0,'2019-10-09'),(20,1,1,1,0,'2019-10-12'),(21,8,1,3,0,'2020-07-13');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_available`
--

DROP TABLE IF EXISTS `crop_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crop_available` (
  `id` int(11) NOT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_crop_available_crop_id_idx` (`crop_id`),
  CONSTRAINT `fk_crop_available_crop_id` FOREIGN KEY (`crop_id`) REFERENCES `crop_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='total crop available amount with respect to crop id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_available`
--

LOCK TABLES `crop_available` WRITE;
/*!40000 ALTER TABLE `crop_available` DISABLE KEYS */;
INSERT INTO `crop_available` VALUES (1,1,26),(2,2,6),(3,3,0),(4,4,0),(5,5,3),(6,6,5),(7,7,0),(8,8,40),(9,9,30),(10,10,0),(11,11,0),(12,12,0),(13,13,0),(14,14,30),(15,15,0),(16,16,0),(17,17,0),(18,18,0),(19,19,14),(20,20,12),(21,21,0),(22,22,0),(23,23,0),(24,24,0),(25,25,0),(26,26,0),(27,27,0),(28,28,0),(29,29,0),(30,30,0),(31,31,0);
/*!40000 ALTER TABLE `crop_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_data`
--

DROP TABLE IF EXISTS `crop_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crop_data` (
  `id` int(11) NOT NULL,
  `crop_name` varchar(45) DEFAULT NULL,
  `crop_available` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_data`
--

LOCK TABLES `crop_data` WRITE;
/*!40000 ALTER TABLE `crop_data` DISABLE KEYS */;
INSERT INTO `crop_data` VALUES (1,'rice',2,180),(2,'wheat',1,120),(3,'cotton',2,100),(4,'groundnut',3,30),(5,'sorghum',1,90),(6,'soybean',1,110),(7,'tobacco',1,100),(8,'sunflower',8,80),(9,'sugarcane',10,70),(10,'sugarbeet',10,40),(11,'sesame',10,100),(12,'jute',10,90),(13,'gram',10,80),(14,'guar',10,70),(15,'castor',5,70),(16,'bottlegaurd',3,60),(17,'ladyfinger',6,80),(18,'tomoto',2,70),(19,'maize',2,55),(20,'blackgram',4,76),(21,'coffee',4,76),(22,'marigold',4,76),(23,'blueberry',4,86),(24,'cranberry',2,76),(25,'cauliflower',4,76),(26,'peartree',4,56),(27,'onion',4,77),(28,'tea',4,88),(29,'pepperplant',4,55),(30,'cucumber',4,66),(31,'broccoli',4,77);
/*!40000 ALTER TABLE `crop_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_information`
--

DROP TABLE IF EXISTS `crop_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crop_information` (
  `id` int(11) NOT NULL,
  `moisture` float DEFAULT NULL,
  `soil_ph` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `avg_rainfall` float DEFAULT NULL,
  `crop_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_information`
--

LOCK TABLES `crop_information` WRITE;
/*!40000 ALTER TABLE `crop_information` DISABLE KEYS */;
INSERT INTO `crop_information` VALUES (1,55,6,29,237.5,'1'),(2,64,6.05,26,75,'7'),(3,56,7.5,32.5,90,'8'),(4,70,6.6,29,97.5,'9'),(5,72.5,10,28.5,72.5,'10'),(6,72.5,6.75,28.25,67.5,'6'),(7,74,7.25,28,80,'5'),(8,75,6.75,26,80,'11'),(9,55,5.25,22.5,100,'2'),(10,62.5,6.75,30.5,153.5,'12'),(11,73,6.25,31,75,'4'),(12,81.5,8.15,22.5,75,'13'),(13,70,6.9,27.5,35,'14'),(14,67.5,6.9,24,60,'3'),(15,77.5,8.5,23.5,44,'15'),(16,65,6.5,25.5,80,'16'),(17,75,6.4,27.5,80,'17'),(18,90,6.15,19,105,'18'),(19,82.5,6.75,27.5,85,'19'),(20,85,7.15,30,67.5,'20'),(21,75,6.25,20,110,'21'),(22,60,6,19,65,'0'),(23,70,4.5,16,130,'23'),(24,71,4.75,4,137.5,'24'),(25,65,7.25,20,155,'25'),(26,65,6.25,7.5,142.5,'26'),(27,71,6,22.5,700,'27'),(28,66.5,5,24,200,'28'),(29,77.5,6.15,22,625,'29'),(30,75,6.5,20.5,105,'30'),(31,66.5,5.9,13,155,'31');
/*!40000 ALTER TABLE `crop_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'karthik','password',NULL),(2,'sharath','password',NULL),(3,'akarsh','akarsh','akarshshady@gmail.com'),(5,'manoj','pass','manoj@gmail.com'),(7,'karthikh','ADFS','karthikhanumanthaiah@gmail.com'),(10,'bala','password','karthikhanumanthaiah@gmail.com'),(11,'mnbv','12345',''),(12,'admin','admin',''),(13,'abc','abc','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer` (
  `id` int(11) NOT NULL,
  `farmer_first_name` varchar(45) NOT NULL,
  `farmer_last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `farmer_address` varchar(45) DEFAULT NULL,
  `water_availablity` float DEFAULT NULL,
  `electricity_availablity` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` VALUES (1,'Karthik','H','karthik','password','tumkur',7,8),(2,'Sharath','H','sharath','password','tumkur',11,12),(3,'akarsh','B','akarsh','password','abcd',6,11),(4,'anand','B','anand','password','abcd',6,11),(5,'Manoj','V','manoj','password','ada',4,3),(6,'Jaya','S','jaya','password','adhf',2,4),(7,'Hanu','B','Hanu','password','afadf',4,6),(8,'abhi','M','abhi','password','akjlfdl',5,5),(9,'admin','admin','admin','password','aikfj',4,4),(10,'dileep','H','dileep','password','lakjdf',5,6),(11,'Supreeth','s','supreeth','password','adsfas',6,7),(12,'H','Bala','bala','password','bangalore',2,4),(13,'Karthik','H','kar','admin','Tumkur',2,2);
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_available_crop`
--

DROP TABLE IF EXISTS `farmer_available_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_available_crop` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `wsn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `famer_id_fk_idx` (`farmer_id`),
  KEY `crop_id_fk_idx` (`crop_id`),
  KEY `wsn_id_fk_idx` (`wsn_id`),
  CONSTRAINT `crop_id_fk` FOREIGN KEY (`crop_id`) REFERENCES `crop_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `famer_id_fk` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `wsn_id_fk` FOREIGN KEY (`wsn_id`) REFERENCES `farmer_wsn` (`wsn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_available_crop`
--

LOCK TABLES `farmer_available_crop` WRITE;
/*!40000 ALTER TABLE `farmer_available_crop` DISABLE KEYS */;
INSERT INTO `farmer_available_crop` VALUES (1,1,2,11),(2,3,14,13),(3,3,8,13),(4,3,5,13),(5,4,1,14),(6,5,8,15),(7,6,1,16),(8,7,9,17),(9,7,14,17),(10,7,19,17),(11,8,1,18),(12,8,19,18),(13,8,20,18),(14,9,2,19),(15,10,1,20),(16,10,9,20),(17,10,6,20),(18,11,6,21),(19,11,5,21),(20,12,1,22),(21,13,19,23),(22,13,20,23);
/*!40000 ALTER TABLE `farmer_available_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_crop`
--

DROP TABLE IF EXISTS `farmer_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_crop` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `iteration` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_farmer_crop_farmer_id_idx` (`farmer_id`),
  KEY `fk_farmer_crop_crop_id_idx` (`crop_id`),
  KEY `fk_farmer_crop_iteration_idx` (`iteration`),
  CONSTRAINT `fk_farmer_crop_crop_id` FOREIGN KEY (`crop_id`) REFERENCES `crop_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_farmer_crop_farmer_id` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='maintain farmer selected crop and iteration and quality of the crop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_crop`
--

LOCK TABLES `farmer_crop` WRITE;
/*!40000 ALTER TABLE `farmer_crop` DISABLE KEYS */;
INSERT INTO `farmer_crop` VALUES (1,1,2,'2019-10-12',0,10),(2,3,14,'2019-10-12',0,10),(3,4,1,'2019-10-12',0,5),(4,5,8,'2019-10-12',0,6),(5,6,1,'2019-10-12',0,7),(6,7,9,'2019-10-12',0,3),(7,8,1,'2019-10-12',0,4),(8,9,2,'2019-10-12',0,1),(9,10,1,'2019-10-12',0,3),(10,11,6,'2019-10-12',0,2),(11,12,1,'2019-10-12',0,3),(12,13,19,'2019-10-12',0,1),(13,3,8,'2019-10-12',1,10),(14,7,14,'2019-10-12',1,1),(15,8,19,'2019-10-12',1,3),(16,10,9,'2019-10-12',1,1),(17,11,5,'2019-10-12',1,4),(18,13,20,'2019-10-12',1,2),(19,1,2,'2019-10-12',2,10),(20,3,5,'2019-10-12',2,7),(21,4,1,'2019-10-12',2,7),(22,5,8,'2019-10-12',2,6),(23,6,1,'2019-10-12',2,5),(24,7,19,'2019-10-12',2,4),(25,8,20,'2019-10-12',2,2),(26,9,2,'2019-10-12',2,3),(27,10,6,'2019-10-12',2,3),(28,11,6,'2019-10-12',2,2),(29,12,1,'2019-10-12',2,4),(30,13,19,'2019-10-12',2,4),(31,3,14,'2019-10-12',3,9),(32,7,9,'2019-10-12',3,1),(33,8,1,'2019-10-12',3,3),(34,10,1,'2019-10-12',3,1),(35,11,5,'2019-10-12',3,3),(36,13,20,'2019-10-12',3,3),(37,1,2,'2019-10-14',4,10),(38,3,8,'2019-10-14',4,7),(39,4,1,'2019-10-14',4,6),(40,5,8,'2019-10-14',4,6),(41,6,1,'2019-10-14',4,7),(42,7,19,'2019-10-14',4,1),(43,8,19,'2019-10-14',4,4),(44,9,2,'2019-10-14',4,2),(45,10,6,'2019-10-14',4,3),(46,11,6,'2019-10-14',4,2),(47,12,1,'2019-10-14',4,2),(48,13,19,'2019-10-14',4,4);
/*!40000 ALTER TABLE `farmer_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_notification`
--

DROP TABLE IF EXISTS `farmer_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_notification` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmer_id_notification_fk_idx` (`farmer_id`),
  KEY `notification_id_fk_idx` (`notification_id`),
  CONSTRAINT `farmer_id_notification_fk` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `notification_id_fk` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_notification`
--

LOCK TABLES `farmer_notification` WRITE;
/*!40000 ALTER TABLE `farmer_notification` DISABLE KEYS */;
INSERT INTO `farmer_notification` VALUES (8,9,1,'2019-04-21'),(12,2,3,'2019-04-30'),(13,4,3,'2019-05-01'),(14,2,2,'2019-05-02'),(15,1,1,'2019-10-12'),(17,3,1,'2019-10-12'),(18,3,4,'2019-10-12'),(19,7,1,'2019-10-12'),(20,7,3,'2019-10-12');
/*!40000 ALTER TABLE `farmer_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_recommendation`
--

DROP TABLE IF EXISTS `farmer_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_recommendation` (
  `farmer_id` int(11) NOT NULL,
  `recommend_crop_id` int(11) DEFAULT NULL,
  `primary_crop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`farmer_id`),
  KEY `recommend_fk_idx` (`recommend_crop_id`),
  KEY `primary_fk_idx` (`primary_crop_id`),
  CONSTRAINT `farmer_id_fk` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `primary_fk` FOREIGN KEY (`primary_crop_id`) REFERENCES `crop_data` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `recommend_fk` FOREIGN KEY (`recommend_crop_id`) REFERENCES `crop_data` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_recommendation`
--

LOCK TABLES `farmer_recommendation` WRITE;
/*!40000 ALTER TABLE `farmer_recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmer_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_wsn`
--

DROP TABLE IF EXISTS `farmer_wsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_wsn` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `wsn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wsn_id_UNIQUE` (`wsn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_wsn`
--

LOCK TABLES `farmer_wsn` WRITE;
/*!40000 ALTER TABLE `farmer_wsn` DISABLE KEYS */;
INSERT INTO `farmer_wsn` VALUES (1,1,11),(2,2,12),(3,3,13),(4,4,14),(5,5,15),(6,6,16),(7,7,17),(8,8,18),(9,9,19),(10,10,20),(11,11,21),(12,12,22),(13,13,23);
/*!40000 ALTER TABLE `farmer_wsn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteration`
--

DROP TABLE IF EXISTS `iteration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iteration` (
  `id` int(11) NOT NULL,
  `iteration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='variable to maintain crop iteration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteration`
--

LOCK TABLES `iteration` WRITE;
/*!40000 ALTER TABLE `iteration` DISABLE KEYS */;
INSERT INTO `iteration` VALUES (1,5);
/*!40000 ALTER TABLE `iteration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `accurecy` float DEFAULT NULL,
  `soil_ph` float DEFAULT NULL,
  `moisture` float(255,0) DEFAULT NULL,
  `temperature` float(255,0) DEFAULT NULL,
  `avg_rainfall` float(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `wns_fk` FOREIGN KEY (`id`) REFERENCES `farmer_wsn` (`wsn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (11,13.1282,77.5873,73,5,5,70,42),(12,13.1282,77.5874,117,6,65,81,42),(13,13.863,77.0205,21.2607,7.97102,77,30,33),(14,13.3603,77.7487,25.4372,5.55577,75,29,177),(15,13.6212,77.6002,20.1181,6.93202,58,29,42),(16,13.841,77.536,18.2997,7.94698,57,30,201),(17,13.8347,77.1389,16.6805,5.99079,61,30,105),(18,13.4446,77.9017,24.176,5.44596,90,30,294),(19,13.738,77.6275,15.6022,5.24554,59,30,65),(20,13.2018,77.3225,23.8489,5.30837,77,29,284),(21,13.8894,77.9202,15.089,5.12944,77,29,64),(22,13.4377,77.5469,10.9495,5.62905,69,30,180),(23,13.6834,77.6807,13.3461,6.74706,86,29,233);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification_topic` varchar(45) DEFAULT NULL,
  `notification_message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'more of water','more water than essesntial please do cut off the water for a day for more info contact us'),(2,'less of water','less water than essesntial please do add the water or else it will reduce crop quality and income  '),(3,'more acidic','your been adding more acidic fertilizers please reduce it and contact us for more info'),(4,'less acidic','your been adding more alkaline fertilizers please reduce it and contact us for more info');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'location'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 14:22:36
