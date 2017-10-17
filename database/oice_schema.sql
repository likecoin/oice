-- MySQL dump 10.16  Distrib 10.2.6-MariaDB, for osx10.12 (x86_64)
--
-- Host: localhost    Database: modmod
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('5a75f1d14bfe');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `name_jp` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_tw` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `credits_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `library_id` (`library_id`),
  KEY `library_id_deleted` (`is_deleted`,`library_id`),
  CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_asset_types`
--

DROP TABLE IF EXISTS `asset_asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_asset_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `asset_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id_asset_type_id` (`asset_id`,`asset_type_id`),
  KEY `asset_id` (`asset_id`),
  KEY `asset_type_id` (`asset_type_id`),
  CONSTRAINT `asset_asset_types_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `asset_asset_types_ibfk_2` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_asset_types`
--

LOCK TABLES `asset_asset_types` WRITE;
/*!40000 ALTER TABLE `asset_asset_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_asset_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_type`
--

DROP TABLE IF EXISTS `asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_type`
--

LOCK TABLES `asset_type` WRITE;
/*!40000 ALTER TABLE `asset_type` DISABLE KEYS */;
INSERT INTO `asset_type` VALUES (1,'動畫檔案','animation','2016-04-20 06:48:52','2016-04-20 06:48:52','animation'),(2,'效果音','se','2016-04-20 06:48:52','2016-11-21 02:41:14','audio'),(3,'背景圖片','bgimage','2016-04-20 06:48:52','2016-12-15 09:49:31','image'),(4,'圖片','image','2016-04-20 06:48:52','2016-12-02 11:58:20','image'),(5,'背景音樂','bgm','2016-04-20 06:48:52','2016-07-05 09:18:23','audio'),(6,'其他','others','2016-04-20 06:48:52','2016-04-20 06:48:52','others'),(7,'影片','video','2016-04-20 06:48:52','2016-04-20 06:48:52','video'),(8,'未分類','not-categorized','2016-04-20 06:48:52','2016-04-20 06:48:52','others'),(9,'頭像','face','2016-04-20 06:48:52','2016-05-30 08:46:26','image'),(10,'前景（立繪）','fgimage','2016-04-20 06:48:52','2016-12-15 03:56:47','image');
/*!40000 ALTER TABLE `asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_user`
--

DROP TABLE IF EXISTS `asset_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id_user_id` (`asset_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `asset_user_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `asset_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_user`
--

LOCK TABLES `asset_user` WRITE;
/*!40000 ALTER TABLE `asset_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_definition_id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `asset_id` int(11) DEFAULT NULL,
  `block_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_definition_id` (`attribute_definition_id`),
  KEY `asset_id` (`asset_id`),
  KEY `attribute_ibfk_3` (`block_id`),
  CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`attribute_definition_id`) REFERENCES `attribute_definition` (`id`),
  CONSTRAINT `attribute_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `attribute_ibfk_3` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_definition`
--

DROP TABLE IF EXISTS `attribute_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_id` int(11) NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localizable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `macro_id` (`macro_id`),
  KEY `asset_type_id` (`asset_type_id`),
  CONSTRAINT `attribute_definition_ibfk_1` FOREIGN KEY (`macro_id`) REFERENCES `macro` (`id`),
  CONSTRAINT `attribute_definition_ibfk_2` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_definition`
--

LOCK TABLES `attribute_definition` WRITE;
/*!40000 ALTER TABLE `attribute_definition` DISABLE KEYS */;
INSERT INTO `attribute_definition` VALUES (1,1,'文字','text','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,1),(2,2,'槽','buf','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(3,2,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(4,4,'調到檔案','storage','ks_file',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(5,4,'圖片','graphic','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(6,4,'目標','target','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(7,5,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(8,6,'檔案','storage','reference',5,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(9,6,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(10,6,'覆蓋時間','overlap','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(11,6,'重複播放','loop','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(12,6,'音量','volume','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(14,7,'目標','target','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(15,8,'檔案','storage','reference',5,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(16,8,'重複播放','loop','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(17,9,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(18,11,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(19,13,'色調強度','mopacity','number255',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(20,13,'影子位移（左）','shadowx','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'10',0),(21,13,'影子位移（上）','shadowy','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'10',0),(22,13,'色調','mcolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(23,13,'可視','visible','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(24,13,'模糊影子','shadowblur','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'3',0),(25,13,'檔案','storage','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(26,13,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(27,13,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(28,13,'透明度','opacity','number255',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(29,13,'影子透明度','shadowopacity','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'200',0),(30,13,'頁','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(31,13,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(32,13,'影子','shadow','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(33,15,'影子顏色','o2_shadowcolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(34,15,'顏色','color','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(35,15,'大小','size','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(36,15,'斜體','italic','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(37,15,'粗體','bold','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(38,15,'影子','o2_shadow','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(39,15,'邊框顏色','edgecolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(40,15,'字體','face','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(41,15,'邊框','edge','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(42,17,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-07-07 08:23:20',0,'0',0),(43,17,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-07-07 08:23:17',0,'false',0),(44,18,'檔案','storage','reference',5,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(45,18,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(46,18,'重複播放','loop','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(47,19,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(48,19,'固定','fix','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(49,19,'等待換頁的檔案','page','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(50,19,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(51,19,'等待換行的檔案','line','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(52,20,'檔案','storage','reference',7,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(53,22,'寬','width','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(54,22,'高','height','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(55,22,'音量','volume','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(56,22,'可視','visible','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(57,22,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(58,22,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(59,22,'重複播放','loop','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(60,23,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(61,23,'音量','volume','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(62,24,'行距','linespacing','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(63,24,'字距','pitch','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(64,24,'行高','linesize','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(65,27,'檔案','storage','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(66,27,'目標座標（左）','dx','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(67,27,'來源寬度','sw','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(68,27,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(69,27,'來源座標（上）','sy','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(70,27,'來源高度','sh','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(71,27,'目標座標（上）','dy','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(72,27,'頁面','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(73,27,'來源座標（左）','sx','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(74,28,'左','x','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(75,28,'上','y','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(76,29,'可視','visible','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(77,29,'下邊邊緣','marginb','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(78,29,'寬','width','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(79,29,'右邊邊緣','marginr','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(80,29,'背景圖片','frame','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(81,29,'上邊邊緣','margint','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(82,29,'高','height','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(83,29,'左邊邊緣','marginl','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(84,29,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(85,29,'顏色','color','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(86,29,'文字圖層','layer','message_layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(87,29,'透明度','opacity','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(88,29,'垂直','vertical','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(89,29,'頁','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(90,29,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(91,30,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(92,30,'頁','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(93,31,'速度','speed','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(94,32,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(95,33,'輸出','output','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(96,33,'啓動','enabled','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(97,34,'檔案','storage','reference',7,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(98,35,'檔案','storage','ks_file',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(99,35,'目標','target','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(100,36,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(101,36,'檔案','storage','reference',2,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(102,36,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(103,36,'重複播放','loop','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(104,37,'描述(選填)','caption','string',NULL,'2016-04-20 06:48:52','2016-04-27 20:36:33',0,NULL,1),(105,37,'標籤*','name','string',NULL,'2016-04-20 06:48:52','2016-04-27 20:36:56',1,NULL,0),(106,38,'檔案','storage','ks_file',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(107,38,'目標','target','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(108,39,'圖層','layer','image_layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(109,39,'槽','seg','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(110,39,'頁面','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(111,41,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(112,41,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(113,41,'透明度','opacity','number255',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(114,41,'可視','visible','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(115,41,'頁面','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(116,41,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(117,42,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(118,42,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(119,43,'切換規則','rule','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(120,43,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(121,43,'方式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'crossfade',0),(122,43,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'base',0),(123,43,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(124,43,'曖昧值','vague','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'64',0),(125,43,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(126,44,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(127,45,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(128,46,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(129,49,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(130,50,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(131,50,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'2000',0),(132,50,'音量','volume','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'50',0),(133,51,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'1000',0),(134,51,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(135,53,'音量','volume','number100',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(136,54,'槽','buf','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(137,54,'全域音量','gvolume','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(138,54,'音量','volume','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(139,55,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(140,56,'來自圖層','srclayer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(141,56,'目標圖層','destlayer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(142,56,'來自頁','srcpage','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(143,56,'目標頁','destpage','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(144,58,'文字靠齊','align','align',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(145,58,'行距','linespacing','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(146,58,'字距','pitch','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(147,58,'自動換行','autoreturn','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(148,58,'行高','linesize','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(149,59,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(151,60,'檔案','storage','reference',2,'2016-04-20 06:48:52','2016-06-24 03:32:21',1,NULL,0),(153,61,'影子顏色','o2_shadowcolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(154,61,'顏色','color','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(155,61,'字體大小','size','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(156,61,'邊框顏色','edgecolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(157,61,'粗體','bold','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(158,61,'影子','o2_shadow','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(159,61,'字體','face','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(160,61,'邊框','edge','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(161,62,'圖層','layer','message_layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(162,62,'頁','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(163,63,'文字','text','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,1),(164,64,'路徑','path','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(165,64,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(166,64,'圖層','layer','layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(167,64,'自動曲線','spline','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(168,64,'延遲','delay','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(169,64,'頁面','page','page',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'fore',0),(170,64,'加速度','accel','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'0',0),(171,66,'震動時間','time','number',NULL,'2016-04-20 06:48:52','2016-07-05 02:46:36',1,'200',0),(172,66,'最大垂直幅度','vmax','number',NULL,'2016-04-20 06:48:52','2016-07-05 02:46:40',0,'50',0),(173,66,'最大水平幅度','hmax','number',NULL,'2016-04-20 06:48:52','2016-07-05 02:46:44',0,'50',0),(174,68,'前景（立繪）','fg','reference',10,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(175,68,'對白','dialog','paragraph',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'',1),(176,68,'角色','character','character',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(177,68,'位置','position','position',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(178,68,'左右反轉','fliplr','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(179,68,'退場指令','fgexit','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(180,69,'左右反轉','fliplr','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(181,69,'檔案','storage','reference',10,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(182,69,'切換時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'500',0),(183,69,'左','left','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(184,69,'圖層','layer','image_layer',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(185,69,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(186,69,'切換規則','rule','reference',6,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(187,69,'切換樣式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'crossfade',0),(188,69,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(189,69,'上','top','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(190,69,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(191,71,'隱藏按鈕層','hidesysbutton','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(192,71,'隱藏對話層','hidemes','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(193,72,'切換規則','rule','reference',6,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(194,72,'切換時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'700',0),(195,72,'切換樣式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'crossfade',0),(196,72,'消除對話框','hidemes','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(197,72,'清除立繪','clfg','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(198,72,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(199,72,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(200,72,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(201,75,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(202,75,'切換時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'700',0),(203,75,'切換樣式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'crossfade',0),(204,75,'清除全部','layer','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(205,75,'連同對話框','hidemes','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(206,75,'切換規則','rule','reference',6,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(207,75,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(208,75,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(209,75,'清除頭像','clface','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(210,76,'檔案','storage','ks_file',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(211,76,'指下去的圖像','over','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(212,76,'目標標籤','target','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(213,76,'文字','text','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,1),(214,76,'按下圖像','on','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(215,76,'普通圖像','normal','reference',4,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(216,77,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(217,77,'時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,'300',0),(218,77,'切換樣式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,'crossfade',0),(219,77,'切換規則','rule','reference',6,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(220,77,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(221,77,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(222,78,'調色強度','mopacity','number255',NULL,'2016-04-20 06:48:52','2016-08-04 09:08:19',0,'0',0),(223,78,'反色效果','convert','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(224,78,'切換樣式','method','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'crossfade',0),(225,78,'切換規則','rule','reference',6,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,NULL,0),(226,78,'黑白效果','grayscale','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(227,78,'調色','mcolor','color',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'#000000',0),(228,78,'停留','stay','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'nostay',0),(229,78,'可以跳過','canskip','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'true',0),(230,78,'檔案','storage','reference',3,'2016-04-20 06:48:52','2016-04-20 06:48:52',1,NULL,0),(231,78,'切換時間','time','number',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'700',0),(232,78,'消除對話框','hidemes','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(233,78,'清除立繪','clfg','boolean',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'false',0),(234,78,'來自','from','string',NULL,'2016-04-20 06:48:52','2016-04-20 06:48:52',0,'left',0),(235,80,'問題','text','string',NULL,'2016-04-21 02:51:43','2016-04-22 07:06:02',1,'問題？',1),(236,81,'目標','target','string',NULL,'2016-04-21 02:51:43','2016-04-21 02:51:43',0,NULL,0),(237,81,'文字','text','string',NULL,'2016-04-21 02:51:43','2016-04-22 07:07:29',0,NULL,1),(238,85,'對白','talk','paragraph',NULL,'2016-04-27 04:11:58','2016-04-27 04:11:58',1,NULL,1),(239,86,'旁白','text','paragraph',NULL,'2016-04-27 04:12:51','2016-04-27 04:12:51',1,NULL,1),(240,87,'問題','question','string',NULL,'2016-04-27 15:23:23','2016-04-27 15:23:23',1,NULL,1),(241,88,'前往標籤','target','string',NULL,'2016-04-27 15:24:28','2016-04-27 18:23:58',1,NULL,0),(242,88,'選項內容','text','string',NULL,'2016-04-27 15:25:29','2016-04-27 15:25:29',1,NULL,1),(244,91,'延遲(微秒)','delayspeed','number',NULL,'2016-06-10 03:41:47','2016-06-10 03:44:50',0,'60',0),(245,91,'停頓(微秒)','autoWaitTimeInterval','number',NULL,'2016-06-10 07:47:49','2016-06-10 07:47:49',0,'2000',0),(246,3,'淡出時間 (微秒)','time','number',NULL,'2016-06-23 09:16:33','2016-06-23 09:16:33',0,'500',0),(247,8,'淡入淡出時間(微秒)','fadetime','number',NULL,'2016-06-23 09:19:33','2016-06-23 09:19:33',0,'500',0),(248,8,'BGM重疊時間(微秒)','overlap','number',NULL,'2016-06-23 09:19:55','2016-06-23 09:19:55',0,'500',0),(249,8,'聲量 (0-100)','volume','number100',NULL,'2016-06-23 09:20:18','2016-06-23 09:20:18',0,'30',0),(250,60,'頻度','buf','number100',NULL,'2016-06-28 07:10:44','2016-06-28 07:10:44',0,'0',0),(251,92,'顏色','color','color',NULL,'2016-07-06 10:11:07','2016-07-06 10:11:07',0,'#ff0000',0),(252,68,'等待音效完結','waitse','boolean',NULL,'2016-07-26 09:26:25','2016-07-26 09:26:25',0,'false',0),(253,86,'等待音效完結','waitse','boolean',NULL,'2016-07-26 10:44:44','2016-07-26 10:44:50',0,'false',0),(254,85,'等待音效完結','waitse','boolean',NULL,'2016-07-26 10:45:23','2016-07-26 10:45:23',0,'false',0),(255,96,'問題','question','paragraph',NULL,'2016-08-05 04:20:01','2016-08-05 04:20:01',0,'',1),(256,96,'答案','answers','composedAnswer',NULL,'2016-08-05 04:20:25','2016-08-05 04:20:25',1,NULL,1),(259,97,'調色強度','mopacity','number255',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'0',0),(262,97,'反色效果','convert','boolean',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'false',0),(263,97,'切換樣式','method','string',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'crossfade',0),(265,97,'黑白效果','grayscale','boolean',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'false',0),(267,97,'調色','mcolor','color',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'#ff0000',0),(268,97,'停留','stay','string',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'nostay',0),(269,97,'可以跳過','canskip','boolean',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'true',0),(270,97,'檔案','storage','reference',4,'2017-01-04 18:23:00','2017-01-04 18:23:00',1,NULL,0),(271,97,'時間','time','number',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'700',0),(272,97,'隱藏對話層','hidemes','boolean',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'false',0),(273,97,'清除立繪','clfg','boolean',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'false',0),(274,97,'來自','from','string',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'left',0),(276,97,'等待時間','waitingtime','number',NULL,'2017-01-04 18:23:00','2017-01-04 18:23:00',0,'1000',0),(277,86,'全屏','fullscreen','boolean',NULL,'2017-03-10 12:01:00','2017-03-10 12:01:00',0,'false',0),(278,93,'調色','color','color',NULL,'2017-03-10 13:06:00','2017-03-10 13:06:00',0,'#000000',0),(279,93,'調色強度','coloropacity','number255',NULL,'2017-03-10 13:06:00','2017-03-10 13:06:00',0,'255',0),(280,68,'角色名字','name','string',NULL,'2017-03-27 04:18:00','2017-03-27 04:18:00',0,NULL,1),(281,68,'隱藏對話框','hidedialog','boolean',NULL,'2017-08-03 10:10:00','2017-08-03 10:10:00',0,'false',0);
/*!40000 ALTER TABLE `attribute_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL,
  `oice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `macro_id` (`macro_id`),
  KEY `ks_position_idx` (`oice_id`,`position`),
  CONSTRAINT `block_ibfk_2` FOREIGN KEY (`macro_id`) REFERENCES `macro` (`id`),
  CONSTRAINT `block_ibfk_3` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uuid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `width` smallint(6) NOT NULL DEFAULT '540',
  `height` smallint(6) NOT NULL DEFAULT '540',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `library_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_generic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `library_id` (`library_id`,`uuid`),
  KEY `library_id_deleted` (`is_deleted`,`library_id`),
  CONSTRAINT `character_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_fgimages`
--

DROP TABLE IF EXISTS `character_fgimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_fgimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `character_id_asset_id` (`character_id`,`asset_id`),
  KEY `character_fgimages_ibfk_1` (`character_id`),
  KEY `character_fgimages_ibfk_2` (`asset_id`),
  CONSTRAINT `character_fgimages_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `character_fgimages_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_fgimages`
--

LOCK TABLES `character_fgimages` WRITE;
/*!40000 ALTER TABLE `character_fgimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_fgimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_localization`
--

DROP TABLE IF EXISTS `character_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_localization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `character_id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT 'zh-HK',
  PRIMARY KEY (`id`),
  KEY `characterlocalization_character_language_idx` (`character_id`,`language`),
  CONSTRAINT `character_localization_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_localization`
--

LOCK TABLES `character_localization` WRITE;
/*!40000 ALTER TABLE `character_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_library`
--

DROP TABLE IF EXISTS `featured_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `library_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `list_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `library_id` (`library_id`),
  KEY `featured_library_ibfk1` (`list_id`),
  CONSTRAINT `featured_library_ibfk1` FOREIGN KEY (`list_id`) REFERENCES `featured_library_list` (`id`),
  CONSTRAINT `featured_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_library`
--

LOCK TABLES `featured_library` WRITE;
/*!40000 ALTER TABLE `featured_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_library_list`
--

DROP TABLE IF EXISTS `featured_library_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_library_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_featured_library_list_alias` (`alias`),
  KEY `ix_featured_library_list_order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_library_list`
--

LOCK TABLES `featured_library_list` WRITE;
/*!40000 ALTER TABLE `featured_library_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_library_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_library_list_localization`
--

DROP TABLE IF EXISTS `featured_library_list_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_library_list_localization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'zh-HK',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`),
  CONSTRAINT `featured_library_list_localization_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `featured_library_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_library_list_localization`
--

LOCK TABLES `featured_library_list_localization` WRITE;
/*!40000 ALTER TABLE `featured_library_list_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_library_list_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_oice`
--

DROP TABLE IF EXISTS `featured_oice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_oice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oice_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oice_id` (`oice_id`),
  CONSTRAINT `featured_oice_ibfk_1` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_oice`
--

LOCK TABLES `featured_oice` WRITE;
/*!40000 ALTER TABLE `featured_oice` DISABLE KEYS */;
INSERT INTO `featured_oice` VALUES (2,1055,0);
/*!40000 ALTER TABLE `featured_oice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_story`
--

DROP TABLE IF EXISTS `featured_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'zh-HK',
  `tier` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `story_id` (`story_id`),
  KEY `ix_featured_story_language` (`language`),
  KEY `ix_featured_story_order` (`order`),
  KEY `ix_featured_story_tier` (`tier`),
  CONSTRAINT `featured_story_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_story`
--

LOCK TABLES `featured_story` WRITE;
/*!40000 ALTER TABLE `featured_story` DISABLE KEYS */;
INSERT INTO `featured_story` VALUES (1,492,0,'zh-HK',0);
/*!40000 ALTER TABLE `featured_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cover_storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `license` smallint(6) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `launched_at` datetime DEFAULT NULL,
  `price` float NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro`
--

DROP TABLE IF EXISTS `macro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagname` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `macro_type` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro`
--

LOCK TABLES `macro` WRITE;
/*!40000 ALTER TABLE `macro` DISABLE KEYS */;
INSERT INTO `macro` VALUES (1,'註解','comment','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(2,'漸出音效','fadeoutse','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(3,'停止背景音樂','stopbgm','2016-04-20 06:48:52','2016-06-23 09:16:34',';------------------停止背景音樂-----------------------\n@macro name=stopbgm\n[if o2_exp=\"mp.time > 0\"]\n@fadeoutbgm time=%time|500\n[else]\n@fadeoutbgm time=1\n[endif]\n@endmacro','system',0),(4,'顯示按鈕','button','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(5,'等待影片完結','wv','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(6,'交換背景音樂','xchgbgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(7,'跳轉','jump','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',0),(8,'播放背景音樂','bgm','2016-04-20 06:48:52','2016-06-23 09:19:05','@macro name=bgm\n[if o2_exp=\"o2.bgm.isPlaying == true\"]\n@xchgbgm storage=%storage loop=%loop|true time=%fadetime|500 overlap=%overlap|500 volume=%volume|80\n[else]\n@playbgm storage=%storage loop=%loop|true\n@bgmopt volume volume=%volume|80\n[endif]\n@endmacro','system',0),(9,'等待移動完結','wm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(10,'重設字形','resetfont','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(11,'漸出並停止背景音樂','fadepausebgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(12,'等待點擊(改行)','l','2016-04-20 06:48:52','2016-08-08 07:07:48',NULL,'system',1),(13,'顯示圖片','image','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(14,'改行','r','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(15,'設定字形','font','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(16,'停止影片','stopvideo','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(17,'等待音效完結','ws','2016-04-20 06:48:52','2016-07-07 08:23:22',NULL,'system',0),(18,'切入背景音樂','fadeinbgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(19,'等待操作的設定','glyph','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(20,'打開影片','openvideo','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(21,'繼續播放背景音樂','resumebgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(22,'影片設定','video','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(23,'切換音樂','fadebgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(24,'設定預設樣式','defstyle','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(25,'繼續播放影片','resumevideo','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(26,'停止','s','2016-04-20 06:48:52','2016-07-05 09:48:02',NULL,'system',1),(27,'追加圖片','pimage','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(28,'移動座標','locate','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(29,'設定文字圖層','position','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(30,'清除圖片','freeimage','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(31,'設定文字顯示速度','delay','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(32,'等待背景音樂完結','wl','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(33,'記錄設定','history','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(34,'播放影片','playvideo','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(35,'返回上層','return','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(36,'切入音效','fadeinse','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(37,'標籤','label','2016-04-20 06:48:52','2016-04-28 04:13:26',NULL,'system',0),(38,'呼叫腳本','call','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(39,'等待動畫完結','wa','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(40,'暫停背景音樂','pausebgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(41,'設定圖層','layopt','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(42,'等待音效切換完成','wf','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(43,'切換','trans','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(44,'等待切換完結','wt','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(45,'漸出背景音樂','fadeoutbgm','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(46,'準備切換','backlay','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(47,'重設文字圖層','er','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(48,'停止移動','stopmove','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(49,'停止音效','stopse','2016-04-20 06:48:52','2016-07-07 08:12:16',NULL,'system',0),(50,'漸出並停止音效','fadese','2016-04-20 06:48:52','2016-06-28 07:15:17',NULL,'system',0),(51,'等待','wait','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',0),(52,'重設樣式','resetstyle','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(53,'背景音樂設定','bgmopt','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(54,'音效設定','seopt','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(55,'等待背景音樂切換完成','wb','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(56,'複製圖層','copylay','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(57,'暫停影片','pausevideo','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(58,'設定樣式','style','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(59,'等待震動停止','wq','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(60,'播放音效','playse','2016-04-20 06:48:52','2016-06-28 07:10:48',NULL,'system',0),(61,'設定預設字形','deffont','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(62,'指定文字圖層','current','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(63,'顯示文字','text','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(64,'移動圖層','move','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(65,'停止切換','stoptrans','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'system',1),(66,'震動','quake','2016-04-20 06:48:52','2016-07-05 02:37:49',NULL,'system',0),(67,'等待點擊(改頁)','p','2016-04-20 06:48:52','2016-08-08 07:07:37',NULL,'system',0),(68,'角色對白','characterdialog','2016-04-20 06:48:52','2016-05-24 07:56:44',NULL,'characterdialog',0),(69,'顯示人物','fg','2016-04-20 06:48:52','2016-04-20 06:48:52',';------------------------------------------------------------------\n;★顯示人物\n;------------------------------------------------------------------\n[macro name=fg]\n[backlay]\n;第一次顯示,指定角色位置\n[if o2_exp=\"mp.pos!=undefined\"]\n[image * storage=%storage|empty layer=%layer|0 page=\"back\" pos=%pos visible=\"true\"]\n[else]\n;不指定時,自動調整,使立繪顯示在原位置/指定位置\n[eval o2_exp=\"mp.layer=\'0\'\" o2_cond=\"mp.layer==\'\'\"]\n[eval o2_exp=\"mp.left=o2.foreLayers.imageLayers[mp.layer].rect.x\" o2_cond=\"mp.left==undefined\"]\n[eval o2_exp=\"mp.top=o2.foreLayers.imageLayers[mp.layer].rect.y\" o2_cond=\"mp.top==undefined\"]\n[image * storage=%storage layer=%layer page=\"back\" left=%left top=%top visible=\"true\"]\n[endif]\n[trans method=%method|crossfade time=%time|500 rule=%rule stay=%stay from=%from]\n[wt canskip=%canskip|true]\n[endmacro]\n','system',1),(70,'普通對話框(含頭像)','dia','2016-04-20 06:48:52','2016-04-20 06:48:52',';------------------------------------------------------------------\n;★普通對話框(含頭像)\n;------------------------------------------------------------------\n[macro name=dia]\n[rclick enabled=\"true\"]\n[history enabled=\"true\"]\n[backlay]\n[freeimage layer=8 page=\"back\"]\n[current layer=\"message0\" page=\"back\"]\n[position page=\"back\" layer=\"message0\" visible=\"true\" frame=\"&f.config_dia.dia.frame\" left=\"&f.config_dia.dia.left\" top=\"&f.config_dia.dia.top\" marginl=\"&f.config_dia.dia.marginl\" marginr=\"&f.config_dia.dia.marginr\" margint=\"&f.config_dia.dia.margint\" marginb=\"&f.config_dia.dia.marginb\"]\n;顯示系統按鈕層\n[showsysbutton]\n[trans method=\"crossfade\" time=200]\n[wt]\n[current layer=\"message0\" page=\"fore\"]\n[endmacro]\n[macro name=showsysbutton]\n[layopt layer=message2 page=%page|back visible=true]\n[endmacro]\n','system',1),(71,'準備選項','selstart','2016-04-20 06:48:52','2016-04-20 06:48:52','[macro name=selstart]\n[hr]\n[backlay]\n;隱藏對話層、消除頭像\n[if o2_exp=\"mp.hidemes\"]\n[rclick enabled=\"false\"]\n[layopt layer=\"message0\" visible=\"false\" page=back]\n[freeimage layer=\"8\" page=back]\n[endif]\n;隱藏按鈕層\n[if o2_exp=\"mp.hidesysbutton\"]\n[rclick enabled=\"false\"]\n[hidesysbutton]\n[endif]\n;顯示選項層\n;[frame layer=\"message1\" page=\"back\"]\n;將選項背景從透明修改為專用圖\n[position layer=\"message1\" page=back visible=true frame=\"select_bgd\"]\n[current layer=\"message1\" page=\"back\"]\n[nowait]\n[endmacro]\n','system',1),(72,'清除背景','clbg','2016-04-20 06:48:52','2016-04-20 06:48:52','\n;------------------------------------------------------------------\n;★消除背景\n;------------------------------------------------------------------\n[macro name=clbg]\n[backlay]\n[freeimage layer=base page=\"back\"]\n;連同全部前景\n[if o2_exp=\"mp.clfg===\'true\'\"]\n[freeimage layer=0 page=\"back\"]\n[freeimage layer=1 page=\"back\"]\n[freeimage layer=2 page=\"back\"]\n[freeimage layer=3 page=\"back\"]\n[freeimage layer=4 page=\"back\"]\n[freeimage layer=5 page=\"back\"]\n[freeimage layer=6 page=\"back\"]\n[freeimage layer=7 page=\"back\"]\n\n;[freeimage layer=event page=\"back\"]\n[freeimage layer=8 page=\"back\"]\n[endif]\n\n;連同對話框\n[if o2_exp=\"mp.hidemes===\'true\'\"]\n[current layer=\"message0\" page=\"back\"]\n[er]\n[current layer=\"message1\" page=\"back\"]\n[er]\n[current layer=\"message2\" page=\"back\"]\n[er]\n[layopt layer=\"message0\" visible=\"false\" page=\"back\"]\n[layopt layer=\"message1\" visible=\"false\" page=\"back\"]\n[hidesysbutton]\n[endif]\n\n[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]\n[wt canskip=%canskip|true]\n[endmacro]\n;隱藏系統按鈕\n[macro name=hidesysbutton]\n    [layopt layer=message2 page=%page|back visible=false]\n[endmacro]\n','system',1),(73,'改頁等待','w','2016-04-20 06:48:52','2016-04-20 06:48:52','\n[macro name=w]\n;可在這裡加入等待語音播放完畢的指令\n;[endvo]\n[p]\n[hr]\n[er]\n[endmacro]\n','system',1),(74,'改行等待','lr','2016-04-20 06:48:52','2016-05-24 07:41:39','\n[macro name=lr]\n[l][r]\n[endmacro]\n','system',1),(75,'清除前景','clfg','2016-04-20 06:48:52','2016-04-20 06:48:52','\n;------------------------------------------------------------------\n;★消除人物\n;------------------------------------------------------------------\n[macro name=clfg]\n[backlay]\n;消除全部\n[if o2_exp=\"mp.layer==\'all\'\"]\n[freeimage layer=0 page=\"back\"]\n[freeimage layer=1 page=\"back\"]\n[freeimage layer=2 page=\"back\"]\n[freeimage layer=3 page=\"back\"]\n[freeimage layer=4 page=\"back\"]\n[freeimage layer=5 page=\"back\"]\n[freeimage layer=6 page=\"back\"]\n[freeimage layer=7 page=\"back\"]\n;[freeimage layer=event page=\"back\"]\n[freeimage layer=8 page=\"back\"]\n[endif]\n;消除單層\n[if o2_exp=\"mp.layer!=\'all\'\"]\n[freeimage layer=%layer|0 page=\"back\"]\n[endif]\n;消除頭像\n[if o2_exp=\"mp.clface==\'true\'\"]\n[freeimage layer=8 page=\"back\"]\n[endif]\n;連同對話框\n[if o2_exp=\"mp.hidemes==\'true\'\"]\n[current layer=\"message0\" page=\"back\"]\n[er]\n[current layer=\"message1\" page=\"back\"]\n[er]\n[current layer=\"message2\" page=\"back\"]\n[er]\n[layopt layer=\"message0\" visible=\"false\" page=\"back\"]\n[layopt layer=\"message1\" visible=\"false\" page=\"back\"]\n[hidesysbutton]\n[endif]\n[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]\n[wt canskip=%canskip|true]\n[endmacro]\n;隱藏系統按鈕\n[macro name=hidesysbutton]\n    [layopt layer=message2 page=%page|back visible=false]\n[endmacro]\n','system',1),(76,'按鈕選項','selbutton','2016-04-20 06:48:52','2016-04-20 06:48:52','[o2_iscript ]\nvar TextButton = function (normal, on, over, x, y) {\n    KAGButton.call(this, normal, x, y);\n    this.rect.width *= 3; // because text button uses separate images\n    this.options.clipWidth = this.rect.width;\n\n    this.normal = normal;\n    this.on = on;\n    this.over = over;\n    this.text = \"\";\n    this.layerFont = {};\n};\n\nTextButton.prototype = Object.create(KAGButton.prototype);\n\nTextButton.prototype.clone=function(){\n    var newButton = new TextButton(this.normal, this.on, this.over, this.rect.x, this.rect.y);\n    newButton.importFrom(this);\n    return newButton;\n}\n\nTextButton.prototype.importFromKAGArgs = function (args) {\n    KAGButton.prototype.importFromKAGArgs.call(this, args);\n    this.text = args.text || \"\";\n};\n\nTextButton.prototype.importFrom=function(other){\n    KAGButton.prototype.importFrom.call(this,other);\n    this.normal = other.normal;\n    this.on = other.on;\n    this.over = other.over;\n    this.text = other.text;\n    this.layerFont = clone(other.layerFont);\n}\n\nTextButton.prototype.drawOnContext = function (context) {\n    switch( this.state ){\n        case Button.STATE_HOVER:\n            this.image = this.over;\n            break;\n\n        case Button.STATE_DOWN:\n            this.image = this.on;\n            break;\n\n        case Button.STATE_NORMAL:\n        default:\n            this.image = this.normal;\n    }\n\n    Button.prototype.drawOnContext.apply(this, arguments);\n\n    var texts = new TextProperties(this.text);\n    $.extend( texts.styles, this.layerFont );\n    texts.styles.visible = true;\n    var textSize = texts.measure(context);\n\n    var x = (this.rect.width - textSize.width)/2;\n    var y = (this.rect.height - textSize.height)/2;\n\n    texts.rect = {\n        x : x + this.rect.x,\n        y : y + this.rect.y,\n        width : textSize.width,\n        height : textSize.height\n    };\n    context.textBaseline = \"top\";\n\n    switch( this.state ){\n        case Button.STATE_HOVER:\n            texts.drawOnContext(context);\n            break;\n\n        case Button.STATE_DOWN:\n            texts.drawOnContext(context);\n            break;\n\n        case Button.STATE_NORMAL:\n        default:\n            texts.drawOnContext(context);\n    }\n};\n\nTag.actions.selbutton = new TagAction({\n    rules:{\n        normal:       {type:\"STRING\", required:true},\n        on:           {type:\"STRING\", required:true},\n        over:         {type:\"STRING\", required:true},\n        storage:      {type:\"STRING\"},\n        target:       {type:\"STRING\"},\n        text:         {type:\"STRING\", required:true}\n    },\n    action:function(args){\n        var _this=this;\n\n        var normal = ResourceLoader.loadImage(args.normal);\n        var on = ResourceLoader.loadImage(args.on);\n        var over = ResourceLoader.loadImage(args.over);\n\n        $.when(normal, on, over)\n        .done(function(normal, on, over){\n\n            setTimeout(function () {\n                var cursor = o2.currentMessageLayer.textCursor;\n\n                var newButton = new TextButton(normal, on, over, cursor.x, cursor.y);\n                newButton.layerFont = clone(o2.currentMessageLayer.font);\n                newButton.importFromKAGArgs(args);\n\n                o2.currentMessageLayer.addButton(newButton);\n\n                if( o2.currentMessageLayerWithBack ){\n                    o2.currentMessageLayer.getCorrespondingLayer().addButton( clone(newButton) );\n                }\n\n                _this.done();\n            });\n        });\n\n        return 1;\n    }\n});\n[o2_endscript]\n','system',1),(77,'等待選擇-選項','selend','2016-04-20 06:48:52','2016-04-20 06:48:52','[macro name=selend]\n[endnowait]\n\n[trans method=%method|crossfade time=%time|300 rule=%rule|01 from=%from stay=%stay]\n[wt canskip=%canskip]\n[s]\n[endmacro]\n','system',1),(78,'顯示背景','bg','2016-04-20 06:48:52','2016-04-27 18:38:44',';------------------------------------------------------------------\n;★顯示背景\n;------------------------------------------------------------------\n[macro name=bg]\n@optionclear\n[backlay]\n;一般效果\n[image * layer=base storage=%storage|black page=back visible=\"true\" left=0 top=0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity]\n;反色效果\n[eval o2_exp=\"mp.convert = %convert;\"]\n[if o2_exp=\"mp.convert == true\"]\n[image * layer=base storage=%storage|black page=back visible=\"true\" left=0 top=0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity rceil=0 gceil=0 bceil=0 rfloor=255 bfloor=255 gfloor=255]\n[eval o2_exp=\"mp.convert = false;\"]\n[endif]\n\n;消除立繪\n[eval o2_exp=\"mp.clfg = %clfg;\"]\n[if o2_exp=\"mp.clfg == true\"]\n[freeimage layer=0 page=\"back\"]\n[freeimage layer=1 page=\"back\"]\n[freeimage layer=2 page=\"back\"]\n[freeimage layer=3 page=\"back\"]\n;set max layer num <= config numofimagelayer\n[eval o2_exp=\"mp.clfg = false;\"]\n[endif]\n\n;消除對話框\n[eval o2_exp=\"mp.hidemes = %hidemes;\"]\n[if o2_exp=\"mp.hidemes == true\"]\n[current layer=\"message0\" page=\"back\"]\n[er]\n[current layer=\"message1\" page=\"back\"]\n[er]\n[current layer=\"message2\" page=\"back\"]\n[er]\n[layopt layer=\"message0\" visible=\"false\" page=\"back\"]\n[layopt layer=\"message1\" visible=\"false\" page=\"back\"]\n[hidesysbutton]\n[eval o2_exp=\"mp.hidemes = false;\"]\n[endif]\n\n[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]\n[wt canskip=%canskip|true]\n[endmacro]\n','system',0),(79,'清除所有文字','cm','2016-04-21 07:42:37','2016-04-21 07:42:37','[cm]','system',1),(80,'選項問題','question','2016-04-22 06:38:47','2016-04-22 07:06:14','[macro name=question]\n@position height=\"360\" marginl=\"30\" visible=\"1\" width=\"1080\" opacity=\"50\" marginb=\"30\" layer=\"message0\" marginr=\"30\" top=\"720\" left=\"0\" page=\"fore\" margint=\"30\"\n@cm\n%text|\"\"[r]\n[endmacro]','system',1),(81,'連結','goto','2016-04-22 07:02:24','2016-04-22 07:02:24','[macro name=goto]\n[link target=%target]%text|\"\"[endlink][r]\n[endmacro]','system',1),(82,'右邊角色退場','fgExitRight','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'custom',0),(83,'左邊角色退場','fgExitLeft','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'custom',0),(84,'中間角色退場','fgExitMiddle','2016-04-20 06:48:52','2016-04-20 06:48:52',NULL,'custom',0),(85,'追加對白','addTalk','2016-04-27 04:11:18','2016-06-10 07:53:06','[macro name=addTalk] \n@er\n@font color=\"0xffffff\" size=\"44\" face=\"黑体\" bold=\"true\"\n%talk\n@autowait\n@l\n[endmacro]','custom',0),(86,'旁白','aside','2016-04-27 04:12:24','2016-06-10 07:52:58','[macro name=aside]\n@asideTalk\n@text text=%text\n@autowait\n@l\n[endmacro]','custom',0),(87,'開始選項','optionstart','2016-04-27 15:22:35','2016-08-11 02:29:18','[macro name=optionstart]\n[eval o2_exp=\"f.numberOfOption=0\"]\n[hr]\n[backlay]\n;隱藏對話層、消除頭像\n[if o2_exp=\"mp.hidemes\"]\n[rclick enabled=\"false\"]\n[layopt layer=\"message0\" visible=\"false\" page=back]\n[freeimage layer=\"8\" page=back]\n[endif]\n;隱藏按鈕層\n[if o2_exp=\"mp.hidesysbutton\"]\n[rclick enabled=\"false\"]\n[hidesysbutton]\n[endif]\n;顯示選項層\n;[frame layer=\"message1\" page=\"back\"]\n;將選項背景從透明修改為專用圖\n[position layer=\"message2\" page=back visible=true frame=\"question_field_large\" top=\"0\" left=\"0\" marginl=\"155\" marginr=\"130\" margint=\"90\" width=\"1080\" height=\"1080\"]\n[current layer=\"message2\" page=\"back\"]\n[nowait]\n@font size=48\n%question\n@resetfont\n[endmacro]','custom',1),(88,'選項答案','optionanswer','2016-04-27 15:24:01','2016-08-11 02:31:05','[o2_iscript]\nvar OptionButton = function (normal, on, over, x, y) {\n    KAGButton.call(this, normal, x, y);\n    this.rect.width *= 3; // because text button uses separate images\n    this.options.clipWidth = this.rect.width;\n\n    this.normal = normal;\n    this.on = on;\n    this.over = over;\n    this.text = \"\";\n    this.layerFont = {};\n};\n\nOptionButton.prototype = Object.create(KAGButton.prototype);\n\nOptionButton.prototype.clone=function(){\n    var newButton = new OptionButton(this.normal, this.on, this.over, this.rect.x, this.rect.y);\n    newButton.importFrom(this);\n    return newButton;\n}\n\nOptionButton.prototype.importFromKAGArgs = function (args) {\n    KAGButton.prototype.importFromKAGArgs.call(this, args);\n    this.text = args.text || \"\";\n};\n\nOptionButton.prototype.importFrom=function(other){\n    KAGButton.prototype.importFrom.call(this,other);\n    this.normal = other.normal;\n    this.on = other.on;\n    this.over = other.over;\n    this.text = other.text;\n    this.layerFont = clone(other.layerFont);\n}\n\nOptionButton.prototype.drawOnContext = function (context) {\n    switch( this.state ){\n        case Button.STATE_HOVER:\n            this.image = this.over;\n            break;\n\n        case Button.STATE_DOWN:\n            this.image = this.on;\n            break;\n\n        case Button.STATE_NORMAL:\n        default:\n            this.image = this.normal;\n    }\n\n    Button.prototype.drawOnContext.apply(this, arguments);\n\n    var marginTop = 36;\n    var marginBottom = marginTop;\n    var marginRight = 40;\n    var marginLeft = marginRight + 80;\n    var lineSpacing = 10;\n    var line = \"\"\n    var texts = new TextProperties(line);\n    $.extend( texts.styles, this.layerFont );\n    texts.styles.visible = true;\n    texts.styles.size = 48;\n    texts.rect = {\n        x : this.rect.x + marginLeft,\n        y : this.rect.y + marginTop,\n        width : 840 - marginRight - marginLeft,\n        height : 120\n    };\n    context.textBaseline = \"top\";\n\n    for (i = 0; i < this.text.length; i++) {\n        // Concat each character and measure the text size\n        line += this.text[i];\n        texts.text = line;\n        var textSize = texts.measure(context);\n\n        // If the text is too long draw the existing text and adjust the y position of the text rect\n        if (textSize.width + 10 > texts.rect.width || i == this.text.length - 1) {\n            switch( this.state ){\n                case Button.STATE_HOVER:\n                    texts.drawOnContext(context);\n                    break;\n\n                case Button.STATE_DOWN:\n                    texts.drawOnContext(context);\n                    break;\n\n                case Button.STATE_NORMAL:\n                default:\n                    texts.drawOnContext(context);\n            }\n            line = \"\"; // Reset\n            texts.rect.y += textSize.height + lineSpacing;\n        }\n    }\n};\n\nTag.actions.optionbutton = new TagAction({\n    rules:{\n        normal:       {type:\"STRING\", required:true},\n        on:           {type:\"STRING\", required:true},\n        over:         {type:\"STRING\", required:true},\n        storage:      {type:\"STRING\"},\n        target:       {type:\"STRING\"},\n        text:         {type:\"STRING\", required:true}\n    },\n    action:function(args){\n        var _this=this;\n\n        var normal = ResourceLoader.loadImage(args.normal);\n        var on = ResourceLoader.loadImage(args.on);\n        var over = ResourceLoader.loadImage(args.over);\n\n        $.when(normal, on, over)\n        .done(function(normal, on, over){\n\n            setTimeout(function () {\n                var cursor = o2.currentMessageLayer.textCursor;\n\n                var newButton = new OptionButton(normal, on, over, cursor.x, cursor.y);\n                newButton.layerFont = clone(o2.currentMessageLayer.font);\n                newButton.importFromKAGArgs(args);\n\n                o2.currentMessageLayer.addButton(newButton);\n\n                if( o2.currentMessageLayerWithBack ){\n                    o2.currentMessageLayer.getCorrespondingLayer().addButton( clone(newButton) );\n                }\n\n                _this.done();\n            });\n        });\n\n        return 1;\n    }\n});\n[o2_endscript]\n\n[macro name=\"optionanswer\"]\n;Based on the current number of options, change the background image and y position of button\n[o2_iscript]\nf.numberOfOption = f.numberOfOption + 1\nf.choiceYPosition = f.numberOfOption * 172\nswitch (f.numberOfOption) {\n    default:\n    case 1:\n        f.choiceBoxImage = \'answer_a_box\'\n        f.choiceBoxImageFocus = \'answer_a_box_focus\'\n        break;\n    case 2:\n        f.choiceBoxImage = \'answer_b_box\'\n        f.choiceBoxImageFocus = \'answer_b_box_focus\'\n        break;\n    case 3:\n        f.choiceBoxImage = \'answer_c_box\'\n        f.choiceBoxImageFocus = \'answer_c_box_focus\'\n        break;\n    case 4:\n        f.choiceBoxImage = \'answer_d_box\'\n        f.choiceBoxImageFocus = \'answer_d_box_focus\'\n        break;\n}\n[o2_endscript]\n;Translate the layer to place button\n@locate x=-37 y=\"&f.choiceYPosition\"\n@optionbutton target=%target on=\"&f.choiceBoxImageFocus\" storage=\"first.ks\" over=\"&f.choiceBoxImageFocus\" normal=\"&f.choiceBoxImage\" text=%text\n[endmacro]','custom',1),(89,'等待選項','optionend','2016-04-27 15:27:52','2016-08-11 02:31:28','[macro name=optionend]\n[endnowait]\n[trans method=%method|crossfade time=%time|300 rule=%rule|01 from=\"left\" stay=\"nostay\" layer=\"message2\"]\n[wt canskip=\"false\"]\n[s]\n[endmacro]','custom',1),(90,'清除選項','optionclear','2016-04-27 15:34:15','2016-04-28 04:06:32','[macro name=\"optionclear\"]\n[current layer=message2 page=fore]\n[layopt layer=message2 page=back visible=false]\n[trans method=crossfade vague=1 time=300][wt]\n[endmacro]','custom',1),(91,'自動播放','autoplay','2016-06-10 11:36:15','2016-06-10 07:47:52',NULL,'custom',1),(92,'閃光效果','flash','2016-07-06 10:09:38','2016-07-06 10:09:38',NULL,'custom',0),(93,'顯示集中線','focusline','2016-07-06 10:10:10','2016-07-06 10:10:10',';--------------------\n;集中線\n;--------------------\n@macro name=focusline\n@backlay\n@image mcolor=%color|0x000000 mopacity=%coloropacity|0 left=0 visible=true layer=0 top=0 storage=\"focusline\" page=back\n@trans method=crossfade time=50\n@wt\n@endmacro','custom',0),(94,'隱藏集中線','clearfocusline','2016-07-06 10:10:32','2016-07-06 10:10:32',';--------------------\n;消除集中線\n;--------------------\n@macro name=clearfocusline\n@backlay\n@freeimage layer=0 page=back\n@trans method=crossfade time=200\n@wt\n@endmacro','custom',0),(95,'消除文字框','clearmessage','2016-07-14 07:33:00','2016-07-14 07:38:20','[macro name=clearmessage]\n@backlay\n@layopt layer=message0 visible=false page=back\n@layopt layer=message1 visible=false page=back\n@layopt layer=message2 visible=false page=back\n[trans method=crossfade time=200][wt]\n[endmacro]','custom',0),(96,'選項 (新)','option','2016-08-05 04:19:20','2016-08-05 04:19:20',NULL,'custom',0),(97,'顯示道具','item','2017-01-04 18:23:00','2017-01-04 18:23:00',';------------------------------------------------------------------\n;★顯示道具\n;------------------------------------------------------------------\n[macro name=item]\n@optionclear\n[backlay]\n;一般效果\n[image * layer=4 storage=%storage|black page=back visible=\"true\" top=%top|0 left=%left|0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity]\n;反色效果\n[eval o2_exp=\"mp.convert = %convert;\"]\n[if o2_exp=\"mp.convert == true\"]\n[image * layer=4 storage=%storage|black page=back visible=\"true\" top=%top|0 left=%left|0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity rceil=0 gceil=0 bceil=0 rfloor=255 bfloor=255 gfloor=255]\n[eval o2_exp=\"mp.convert = false;\"]\n[endif]\n\n;消除立繪\n[eval o2_exp=\"mp.clfg = %clfg;\"]\n[if o2_exp=\"mp.clfg == true\"]\n[freeimage layer=0 page=\"back\"]\n[freeimage layer=1 page=\"back\"]\n[freeimage layer=2 page=\"back\"]\n[freeimage layer=3 page=\"back\"]\n;set max layer num <= config numofimagelayer\n[eval o2_exp=\"mp.clfg = false;\"]\n[endif]\n\n;消除對話框\n[eval o2_exp=\"mp.hidemes = %hidemes;\"]\n[if o2_exp=\"mp.hidemes == true\"]\n[current layer=\"message0\" page=\"back\"]\n[er]\n[current layer=\"message1\" page=\"back\"]\n[er]\n[current layer=\"message2\" page=\"back\"]\n[er]\n[layopt layer=\"message0\" visible=\"false\" page=\"back\"]\n[layopt layer=\"message1\" visible=\"false\" page=\"back\"]\n[hidesysbutton]\n[eval o2_exp=\"mp.hidemes = false;\"]\n[endif]\n\n[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]\n[wt canskip=%canskip|true]\n[wait canskip=true time=%waitingtime|1000]\n[endmacro]','custom',0),(98,'清除道具','clearitem','2017-01-04 18:23:00','2017-01-04 18:23:00',';------------------------------------------------------------------\n;★清除道具\n;------------------------------------------------------------------\n[macro name=clearitem]\n[freeimage layer=4 page=\"fore\"]\n[endmacro]','custom',0),(99,'暫停自動播放','Cancelautomode','2017-02-09 04:06:00','2017-02-09 04:06:00',NULL,'system',1);
/*!40000 ALTER TABLE `macro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oice`
--

DROP TABLE IF EXISTS `oice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_show_ad` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `sharing_option` int(11) NOT NULL DEFAULT '999',
  `fork_of` int(11) DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh-HK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `story_id` (`story_id`),
  KEY `ix_oice_is_deleted` (`is_deleted`),
  KEY `ix_oice_language` (`language`),
  KEY `oice_ordering_idx` (`id`,`order`),
  KEY `oice_publicity_idx` (`sharing_option`,`state`),
  CONSTRAINT `oice_ibfk_2` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oice`
--

LOCK TABLES `oice` WRITE;
/*!40000 ALTER TABLE `oice` DISABLE KEYS */;
INSERT INTO `oice` VALUES (1055,'oice 隆重面世！','2017-01-13 05:19:18','2017-04-19 01:59:48',0,'24b33bd6565d45588bae7a0e1b1124f7',1,0,492,0,NULL,0,2,'zh-HK');
/*!40000 ALTER TABLE `oice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oice_localization`
--

DROP TABLE IF EXISTS `oice_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oice_localization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `oice_id` int(11) NOT NULL,
  `filename` varchar(1024) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT 'zh-HK',
  PRIMARY KEY (`id`),
  KEY `oicelocalization_oice_language_idx` (`oice_id`,`language`),
  CONSTRAINT `oice_localization_ibfk_1` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oice_localization`
--

LOCK TABLES `oice_localization` WRITE;
/*!40000 ALTER TABLE `oice_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oice_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_tier`
--

DROP TABLE IF EXISTS `price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier` smallint(6) NOT NULL DEFAULT '0',
  `price_usd` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_tier`
--

LOCK TABLES `price_tier` WRITE;
/*!40000 ALTER TABLE `price_tier` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_export`
--

DROP TABLE IF EXISTS `project_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `exported_files` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ks_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `ks_id` (`ks_id`),
  CONSTRAINT `project_export_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `story` (`id`),
  CONSTRAINT `project_export_ibfk_4` FOREIGN KEY (`ks_id`) REFERENCES `oice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_export`
--

LOCK TABLES `project_export` WRITE;
/*!40000 ALTER TABLE `project_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_HK',
  `cover_storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fork_of` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `hero_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_story_is_deleted` (`is_deleted`),
  KEY `ix_story_language` (`language`),
  KEY `story_updated_at_idx` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (492,'2017-01-13 04:18:37','2017-09-28 03:12:20','oice 小編有話兒',0,'','zh-HK',NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_library`
--

DROP TABLE IF EXISTS `story_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `story_id_library_id` (`story_id`,`library_id`),
  KEY `library_id` (`library_id`),
  KEY `story_id` (`story_id`),
  CONSTRAINT `story_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`),
  CONSTRAINT `story_library_ibfk_2` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_library`
--

LOCK TABLES `story_library` WRITE;
/*!40000 ALTER TABLE `story_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `story_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_localization`
--

DROP TABLE IF EXISTS `story_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_localization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `story_id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `description` varchar(4096) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT 'zh-HK',
  `cover_storage` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storylocalization_oice_language_idx` (`story_id`,`language`),
  CONSTRAINT `story_localization_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_localization`
--

LOCK TABLES `story_localization` WRITE;
/*!40000 ALTER TABLE `story_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `story_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial_oice`
--

DROP TABLE IF EXISTS `tutorial_oice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial_oice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oice_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oice_id` (`oice_id`),
  CONSTRAINT `tutorial_oice_ibfk_1` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial_oice`
--

LOCK TABLES `tutorial_oice` WRITE;
/*!40000 ALTER TABLE `tutorial_oice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorial_oice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mailchimp_stage` int(11) NOT NULL DEFAULT '1',
  `avatar_storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `is_trial` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '1',
  `tutorial_state` bit(32) NOT NULL DEFAULT b'0',
  `stripe_access_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `android_original_transaction_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ios_original_transaction_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seeking_subscription_message` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ui_language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `customer_id` (`customer_id`),
  UNIQUE KEY `stripe_access_token` (`stripe_access_token`),
  UNIQUE KEY `stripe_account_id` (`stripe_account_id`),
  UNIQUE KEY `stripe_refresh_token` (`stripe_refresh_token`),
  UNIQUE KEY `uq_user_android_original_transaction_id` (`android_original_transaction_id`),
  UNIQUE KEY `uq_user_ios_original_transaction_id` (`ios_original_transaction_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oice-dev','admin','2017-10-17 12:57:35','2016-04-20 07:03:30','2017-10-17 12:57:35',0,NULL,'Development account','oice-dev','zh-HK',NULL,NULL,0,1,0x00000000,NULL,NULL,NULL,0,NULL,NULL,NULL,'','en',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_library`
--

DROP TABLE IF EXISTS `user_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_library_id` (`user_id`,`library_id`),
  KEY `library_id` (`library_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`),
  CONSTRAINT `user_library_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_library`
--

LOCK TABLES `user_library` WRITE;
/*!40000 ALTER TABLE `user_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_like_story`
--

DROP TABLE IF EXISTS `user_like_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_like_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_like_story_unique` (`user_id`,`story_id`),
  KEY `story_id` (`story_id`),
  CONSTRAINT `user_like_story_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`),
  CONSTRAINT `user_like_story_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_like_story`
--

LOCK TABLES `user_like_story` WRITE;
/*!40000 ALTER TABLE `user_like_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_like_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_link`
--

DROP TABLE IF EXISTS `user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_link_type_id` int(11) DEFAULT NULL,
  `label` varchar(1024) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_link_type_id` (`user_link_type_id`),
  KEY `user_link_order_index` (`user_id`,`order`),
  CONSTRAINT `user_link_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_link_ibfk_2` FOREIGN KEY (`user_link_type_id`) REFERENCES `user_link_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_link`
--

LOCK TABLES `user_link` WRITE;
/*!40000 ALTER TABLE `user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_link_type`
--

DROP TABLE IF EXISTS `user_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_link_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(32) NOT NULL,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `link_regex` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_link_type_alias_unique` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_link_type`
--

LOCK TABLES `user_link_type` WRITE;
/*!40000 ALTER TABLE `user_link_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_purchased_library`
--

DROP TABLE IF EXISTS `user_purchased_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_purchased_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_library_id` (`user_id`,`library_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `user_purchased_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`),
  CONSTRAINT `user_purchased_library_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_purchased_library`
--

LOCK TABLES `user_purchased_library` WRITE;
/*!40000 ALTER TABLE `user_purchased_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_purchased_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_read_oice_progress`
--

DROP TABLE IF EXISTS `user_read_oice_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_read_oice_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `oice_id` int(11) NOT NULL,
  `is_finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_read_oice_unique` (`user_id`,`oice_id`),
  KEY `oice_id` (`oice_id`),
  CONSTRAINT `user_read_oice_progress_ibfk_1` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`),
  CONSTRAINT `user_read_oice_progress_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_read_oice_progress`
--

LOCK TABLES `user_read_oice_progress` WRITE;
/*!40000 ALTER TABLE `user_read_oice_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_read_oice_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selected_library`
--

DROP TABLE IF EXISTS `user_selected_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_selected_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_library_id` (`user_id`,`library_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `user_selected_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`),
  CONSTRAINT `user_selected_library_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selected_library`
--

LOCK TABLES `user_selected_library` WRITE;
/*!40000 ALTER TABLE `user_selected_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_selected_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_story`
--

DROP TABLE IF EXISTS `user_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_story_id` (`user_id`,`story_id`),
  KEY `story_id` (`story_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_story_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`),
  CONSTRAINT `user_story_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story`
--

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscription_payout`
--

DROP TABLE IF EXISTS `user_subscription_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscription_payout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subscription_user_id` int(11) NOT NULL,
  `oice_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `platform` varchar(16) NOT NULL,
  `original_transaction_id` varchar(128) DEFAULT NULL,
  `payout_amount` float NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `original_transaction_id` (`original_transaction_id`),
  KEY `oice_id` (`oice_id`),
  KEY `subscription_user_id` (`subscription_user_id`),
  KEY `usersubscriptionpayout_author_idx` (`author_id`,`is_paid`),
  CONSTRAINT `user_subscription_payout_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_subscription_payout_ibfk_2` FOREIGN KEY (`oice_id`) REFERENCES `oice` (`id`),
  CONSTRAINT `user_subscription_payout_ibfk_3` FOREIGN KEY (`subscription_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscription_payout`
--

LOCK TABLES `user_subscription_payout` WRITE;
/*!40000 ALTER TABLE `user_subscription_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subscription_payout` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-17 21:23:24
