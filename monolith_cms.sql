-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: monolith_cms
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `cms_appearance_history`
--

DROP TABLE IF EXISTS `cms_appearance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_appearance_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7EFEB7DA76ED395` (`user_id`),
  KEY `IDX_C7EFEB7DD1B862B8` (`hash`),
  KEY `IDX_C7EFEB7DB548B0F` (`path`),
  KEY `IDX_C7EFEB7D3C0BE965` (`filename`),
  CONSTRAINT `FK_C7EFEB7DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_appearance_history`
--

LOCK TABLES `cms_appearance_history` WRITE;
/*!40000 ALTER TABLE `cms_appearance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_appearance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_domains`
--

DROP TABLE IF EXISTS `cms_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `parent_pid` int(10) unsigned DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `updated_at` datetime DEFAULT NULL,
  `paid_till_date` date DEFAULT NULL,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `is_redirect` tinyint(1) NOT NULL,
  `language_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D297B08C5E237E06` (`name`),
  KEY `IDX_D297B08C6EF3A788` (`parent_pid`),
  KEY `IDX_D297B08CA76ED395` (`user_id`),
  KEY `IDX_D297B08C82F1BAF4` (`language_id`),
  CONSTRAINT `FK_D297B08C6EF3A788` FOREIGN KEY (`parent_pid`) REFERENCES `cms_domains` (`id`),
  CONSTRAINT `FK_D297B08C82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `cms_languages` (`id`),
  CONSTRAINT `FK_D297B08CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_domains`
--

LOCK TABLES `cms_domains` WRITE;
/*!40000 ALTER TABLE `cms_domains` DISABLE KEYS */;
INSERT INTO `cms_domains` VALUES (1,'monolith-cms.com','2017-11-28 04:54:04',NULL,1,NULL,'2018-09-16',1,1,NULL,0,2),(2,'monolithcms.com','2017-11-28 05:14:14',1,1,NULL,'2018-07-13',1,1,NULL,1,NULL),(3,'www.monolith-cms.com','2017-11-28 05:15:34',1,1,NULL,NULL,0,1,NULL,1,NULL),(4,'www.monolithcms.com','2017-11-28 05:15:45',1,0,NULL,NULL,3,1,NULL,1,NULL),(5,'monolith-cms.ru','2017-11-28 05:58:08',NULL,1,NULL,NULL,2,1,NULL,0,1),(6,'www.monolith-cms.ru','2017-11-28 06:12:18',5,1,NULL,NULL,0,1,NULL,0,NULL),(7,'monolith-cms','2018-05-27 18:04:23',1,1,NULL,NULL,100,1,'local dev',0,1),(8,'monolithcms.msdemo.ru','2018-05-27 23:44:51',1,1,NULL,NULL,100,1,'public dev',0,2),(9,'monolithcms2.msdemo.ru','2018-05-30 22:20:47',NULL,1,NULL,NULL,0,1,NULL,0,NULL),(10,'monolith-cms2','2018-05-30 22:21:22',9,1,NULL,NULL,0,1,NULL,0,1);
/*!40000 ALTER TABLE `cms_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_folders`
--

DROP TABLE IF EXISTS `cms_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_pid` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uri_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_file` tinyint(1) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `redirect_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router_node_id` int(11) DEFAULT NULL,
  `lockout_nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `template_inheritable` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_self` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `permissions_cache` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A0DBDC1EA640A07B79628CD` (`folder_pid`,`uri_part`),
  KEY `IDX_A0DBDC1EA640A07B` (`folder_pid`),
  KEY `IDX_A0DBDC1EA76ED395` (`user_id`),
  KEY `IDX_A0DBDC1E1B5771DD` (`is_active`),
  KEY `IDX_A0DBDC1E4AF38FD1` (`deleted_at`),
  KEY `IDX_A0DBDC1E462CE4F5` (`position`),
  CONSTRAINT `FK_A0DBDC1EA640A07B` FOREIGN KEY (`folder_pid`) REFERENCES `cms_folders` (`id`),
  CONSTRAINT `FK_A0DBDC1EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_folders`
--

LOCK TABLES `cms_folders` WRITE;
/*!40000 ALTER TABLE `cms_folders` DISABLE KEYS */;
INSERT INTO `cms_folders` VALUES (1,NULL,1,'Главная',NULL,0,'a:0:{}',NULL,NULL,'N;','inner','default',1,'2017-11-29 21:54:39',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(2,1,1,'Документация','docs',0,'a:0:{}',NULL,NULL,'N;','','',1,'2017-11-29 21:54:45',NULL,NULL,2,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";}}'),(3,1,1,'Скачать','download',0,'a:0:{}',NULL,NULL,'N;','','',1,'2017-11-29 22:14:47',NULL,'Файлы для скачивания',1,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";}}'),(4,1,1,'Фотогалерея','gallery',0,'a:0:{}',NULL,8,'N;','','',1,'2017-12-01 21:33:59',NULL,NULL,3,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(5,1,1,'Контакты','contacts',1,'a:0:{}',NULL,NULL,'N;','','',1,'2017-12-01 22:07:25',NULL,NULL,100,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";}}'),(6,2,1,'Установка','install',0,'a:0:{}',NULL,NULL,'N;','','',1,'2017-12-01 22:19:16',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";}}'),(7,2,1,'Темы оформления','themes',0,'a:0:{}',NULL,NULL,'N;','','',1,'2017-12-01 22:39:14',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"auth\";}}'),(8,1,1,'Каталог','catalog',0,'a:0:{}',NULL,10,'N;','','',1,'2017-12-20 02:48:51',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(9,1,1,'Новости','news',0,'a:0:{}',NULL,11,'N;','','',1,'2017-12-20 05:17:42',NULL,NULL,5,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(11,NULL,1,'Главная 2','11',0,'a:0:{}',NULL,NULL,'N;','','',1,'2018-05-31 06:05:02',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(12,11,1,'test','test',0,'a:0:{}',NULL,NULL,'N;','','',1,'2018-05-31 23:28:38',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(13,11,1,'test 2222','test-2',0,'a:0:{}',NULL,NULL,'N;','','',1,'2018-05-31 23:29:23',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}');
/*!40000 ALTER TABLE `cms_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_languages`
--

DROP TABLE IF EXISTS `cms_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `position` smallint(6) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_63B733145E237E06` (`name`),
  UNIQUE KEY `UNIQ_63B7331477153098` (`code`),
  KEY `IDX_63B7331446C53D4C` (`is_enabled`),
  KEY `IDX_63B73314462CE4F5` (`position`),
  KEY `IDX_63B73314A76ED395` (`user_id`),
  CONSTRAINT `FK_63B73314A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_languages`
--

LOCK TABLES `cms_languages` WRITE;
/*!40000 ALTER TABLE `cms_languages` DISABLE KEYS */;
INSERT INTO `cms_languages` VALUES (1,'Русский','2017-11-28 03:41:03',1,1,NULL,'ru',1),(2,'Английский','2017-11-28 03:43:06',1,2,NULL,'en',1);
/*!40000 ALTER TABLE `cms_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules`
--

DROP TABLE IF EXISTS `cms_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `developer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bundle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_705B4CC65E237E0665FB8B9A` (`name`,`developer`),
  UNIQUE KEY `UNIQ_705B4CC6A57B32FD` (`bundle`),
  KEY `IDX_705B4CC61B5771DD` (`is_active`),
  KEY `IDX_705B4CC6A76ED395` (`user_id`),
  CONSTRAINT `FK_705B4CC6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules`
--

LOCK TABLES `cms_modules` WRITE;
/*!40000 ALTER TABLE `cms_modules` DISABLE KEYS */;
INSERT INTO `cms_modules` VALUES (1,'monolith','breadcrumbs','Monolith\\Module\\Breadcrumbs\\BreadcrumbsModuleBundle',1,'2017-11-30 00:51:14',NULL),(2,'monolith','tester','Monolith\\Module\\Texter\\TexterModuleBundle',1,'2017-11-30 01:41:57',NULL),(3,'monolith','menu','Monolith\\Module\\Menu\\MenuModuleBundle',1,'2017-11-30 02:08:51',NULL);
/*!40000 ALTER TABLE `cms_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_nodes`
--

DROP TABLE IF EXISTS `cms_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `controls_in_toolbar` smallint(6) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` smallint(6) NOT NULL,
  `is_cached` tinyint(1) NOT NULL,
  `is_use_eip` tinyint(1) NOT NULL DEFAULT '1',
  `code_before` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_after` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `permissions_cache` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_334E9ED0162CB942` (`folder_id`),
  KEY `IDX_334E9ED0A76ED395` (`user_id`),
  KEY `IDX_334E9ED01B5771DD` (`is_active`),
  KEY `IDX_334E9ED04AF38FD1` (`deleted_at`),
  KEY `IDX_334E9ED0462CE4F5` (`position`),
  KEY `IDX_334E9ED098260155` (`region_id`),
  KEY `IDX_334E9ED0C242628` (`module`),
  CONSTRAINT `FK_334E9ED0162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`),
  CONSTRAINT `FK_334E9ED098260155` FOREIGN KEY (`region_id`) REFERENCES `cms_regions` (`id`),
  CONSTRAINT `FK_334E9ED0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_nodes`
--

LOCK TABLES `cms_nodes` WRITE;
/*!40000 ALTER TABLE `cms_nodes` DISABLE KEYS */;
INSERT INTO `cms_nodes` VALUES (1,3,1,1,0,'TexterModuleBundle','Texter:index','a:2:{s:12:\"text_item_id\";i:1;s:6:\"editor\";b:1;}',NULL,0,0,1,'','',1,'2017-12-01 21:20:59',NULL,'Файлы для скачивания',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(2,5,1,1,0,'TexterModuleBundle','Texter:index','a:2:{s:12:\"text_item_id\";i:3;s:6:\"editor\";b:1;}',NULL,0,0,1,'','',1,'2017-12-01 22:20:04',NULL,'Контакты',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(3,1,2,1,0,'BreadcrumbsModuleBundle','Breadcrumbs:index','a:3:{s:9:\"delimiter\";s:1:\"/\";s:17:\"hide_if_only_home\";b:1;s:9:\"css_class\";N;}',NULL,0,0,1,'','',1,'2017-12-01 22:21:05',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(4,1,3,1,0,'TexterModuleBundle','Texter:index','a:2:{s:12:\"text_item_id\";i:4;s:6:\"editor\";b:0;}',NULL,0,0,1,'','',0,'2017-12-02 01:51:49',NULL,'Футер',7,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(5,1,4,1,0,'MenuModuleBundle','Menu:index','a:5:{s:5:\"depth\";N;s:9:\"css_class\";s:9:\"main_menu\";s:13:\"current_class\";N;s:20:\"selected_inheritance\";b:0;s:7:\"menu_id\";i:1;}',NULL,0,0,1,'','',1,'2017-12-01 23:05:25',NULL,'Главное меню',7,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(6,1,1,1,0,'TexterModuleBundle','Texter:index','a:2:{s:12:\"text_item_id\";i:5;s:6:\"editor\";b:1;}',NULL,0,0,1,'','',1,'2017-12-01 23:37:37',NULL,'Текст на главной',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(7,3,1,1,0,'SliderModuleBundle','Slider:index','a:1:{s:9:\"slider_id\";i:1;}',NULL,0,0,1,'','',1,'2017-12-11 04:22:34',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(8,4,1,1,0,'GalleryModuleBundle','Gallery:index','a:1:{s:10:\"gallery_id\";i:1;}',NULL,0,0,1,'','',1,'2017-12-13 09:15:36',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(9,5,1,1,0,'WebFormModuleBundle','WebForm:index','a:1:{s:10:\"webform_id\";i:1;}',NULL,0,0,1,'','',1,'2017-12-13 15:40:03',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(10,8,1,1,1,'UnicatModuleBundle','Unicat:index','a:4:{s:16:\"configuration_id\";i:1;s:19:\"use_item_id_as_slug\";b:0;s:6:\"params\";N;s:13:\"items_type_id\";N;}',NULL,0,0,1,'','',1,'2017-12-20 03:48:07',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(11,9,1,1,0,'UnicatModuleBundle','Unicat:index','a:5:{s:16:\"configuration_id\";i:2;s:12:\"item_type_id\";i:3;s:19:\"use_item_id_as_slug\";b:0;s:6:\"params\";N;s:13:\"items_type_id\";i:3;}',NULL,0,0,1,'','',1,'2017-12-20 05:17:52',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(12,1,1,1,0,'WebFormModuleBundle','WebForm:index','a:1:{s:10:\"webform_id\";i:2;}',NULL,0,0,1,'','',1,'2017-12-23 02:40:06',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(13,11,12,1,0,'BreadcrumbsModuleBundle','Breadcrumbs:index','a:3:{s:9:\"delimiter\";s:1:\"/\";s:17:\"hide_if_only_home\";b:0;s:9:\"css_class\";N;}',NULL,0,0,0,'','',1,'2018-06-01 01:27:43',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(14,11,14,1,0,'MenuModuleBundle','Menu:index','a:5:{s:5:\"depth\";N;s:9:\"css_class\";N;s:13:\"current_class\";N;s:20:\"selected_inheritance\";b:1;s:7:\"menu_id\";i:2;}',NULL,0,0,1,'','',1,'2018-06-01 01:33:51',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}'),(15,11,11,1,0,'TexterModuleBundle','Texter:index','a:2:{s:12:\"text_item_id\";i:6;s:6:\"editor\";b:1;}',NULL,0,0,1,'','',1,'2018-06-01 01:37:07',NULL,NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}');
/*!40000 ALTER TABLE `cms_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions`
--

DROP TABLE IF EXISTS `cms_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bundle` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `default_value` tinyint(1) NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B00C7BBBA57B32FD47CC8C92` (`bundle`,`action`),
  KEY `IDX_B00C7BBB462CE4F5` (`position`),
  KEY `IDX_B00C7BBBF4510C3A` (`default_value`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions`
--

LOCK TABLES `cms_permissions` WRITE;
/*!40000 ALTER TABLE `cms_permissions` DISABLE KEYS */;
INSERT INTO `cms_permissions` VALUES (1,'cms','admin.panel.access',0,'2017-12-06 20:41:16',0,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),(7,'cms','admin.modules',11,'2017-12-06 23:38:31',0,'a:0:{}'),(8,'textermodule','edit.self.items',0,'2017-12-06 23:45:34',1,'a:0:{}'),(9,'textermodule','edit.foreign.items',1,'2017-12-06 23:45:34',1,'a:0:{}'),(14,'cms','admin.system',1,'2017-12-07 02:19:42',0,'a:1:{i:0;s:17:\"ROLE_ADMIN_SYSTEM\";}'),(15,'cms','admin.system.site',4,'2017-12-07 02:19:42',1,'a:1:{i:0;s:15:\"ROLE_ADMIN_SITE\";}'),(16,'cms','admin.system.structure',7,'2017-12-07 02:19:42',1,'a:0:{}'),(17,'cms','admin.system.theme',8,'2017-12-07 02:19:42',1,'a:0:{}'),(18,'cms','admin.system.language',3,'2017-12-11 02:38:57',1,'a:1:{i:0;s:19:\"ROLE_ADMIN_LANGUAGE\";}'),(19,'cms','admin.system.user',9,'2017-12-11 02:53:43',1,'a:1:{i:0;s:15:\"ROLE_ADMIN_USER\";}'),(20,'cms','admin.system.user_groups',10,'2017-12-11 02:53:43',1,'a:1:{i:0;s:22:\"ROLE_ADMIN_USER_GROUPS\";}'),(21,'cms','admin.system.config',2,'2017-12-11 03:08:53',1,'a:1:{i:0;s:17:\"ROLE_ADMIN_CONFIG\";}'),(22,'cms','admin.system.module',6,'2017-12-11 03:08:54',1,'a:1:{i:0;s:17:\"ROLE_ADMIN_MODULE\";}'),(23,'cms','filemanager',12,'2017-12-11 03:19:02',1,'a:1:{i:0;s:16:\"ROLE_FILEMANAGER\";}'),(24,'cms','admin.system.development',5,'2018-05-27 17:02:28',0,'a:1:{i:0;s:15:\"ROLE_ADMIN_SITE\";}');
/*!40000 ALTER TABLE `cms_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_folders_read`
--

DROP TABLE IF EXISTS `cms_permissions_folders_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_folders_read` (
  `folder_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`folder_id`,`usergroup_id`),
  KEY `IDX_136DA6CA162CB942` (`folder_id`),
  KEY `IDX_136DA6CAD2112630` (`usergroup_id`),
  CONSTRAINT `FK_136DA6CA162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_136DA6CAD2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_folders_read`
--

LOCK TABLES `cms_permissions_folders_read` WRITE;
/*!40000 ALTER TABLE `cms_permissions_folders_read` DISABLE KEYS */;
INSERT INTO `cms_permissions_folders_read` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3);
/*!40000 ALTER TABLE `cms_permissions_folders_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_folders_write`
--

DROP TABLE IF EXISTS `cms_permissions_folders_write`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_folders_write` (
  `folder_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`folder_id`,`usergroup_id`),
  KEY `IDX_D5879FED162CB942` (`folder_id`),
  KEY `IDX_D5879FEDD2112630` (`usergroup_id`),
  CONSTRAINT `FK_D5879FED162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D5879FEDD2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_folders_write`
--

LOCK TABLES `cms_permissions_folders_write` WRITE;
/*!40000 ALTER TABLE `cms_permissions_folders_write` DISABLE KEYS */;
INSERT INTO `cms_permissions_folders_write` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,1),(5,2),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2),(9,1),(9,2),(11,1),(11,2),(12,1),(12,2),(13,1),(13,2);
/*!40000 ALTER TABLE `cms_permissions_folders_write` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_groups_relations`
--

DROP TABLE IF EXISTS `cms_permissions_groups_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_groups_relations` (
  `permission_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`usergroup_id`,`permission_id`),
  KEY `IDX_7563F910FED90CCA` (`permission_id`),
  KEY `IDX_7563F910D2112630` (`usergroup_id`),
  CONSTRAINT `FK_7563F910D2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7563F910FED90CCA` FOREIGN KEY (`permission_id`) REFERENCES `cms_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_groups_relations`
--

LOCK TABLES `cms_permissions_groups_relations` WRITE;
/*!40000 ALTER TABLE `cms_permissions_groups_relations` DISABLE KEYS */;
INSERT INTO `cms_permissions_groups_relations` VALUES (1,1),(7,1),(8,1),(9,1),(14,1),(16,1),(17,1),(19,1),(20,1),(23,1);
/*!40000 ALTER TABLE `cms_permissions_groups_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_nodes_read`
--

DROP TABLE IF EXISTS `cms_permissions_nodes_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_nodes_read` (
  `node_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`node_id`,`usergroup_id`),
  KEY `IDX_8D3D34AE460D9FD7` (`node_id`),
  KEY `IDX_8D3D34AED2112630` (`usergroup_id`),
  CONSTRAINT `FK_8D3D34AE460D9FD7` FOREIGN KEY (`node_id`) REFERENCES `cms_nodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D3D34AED2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_nodes_read`
--

LOCK TABLES `cms_permissions_nodes_read` WRITE;
/*!40000 ALTER TABLE `cms_permissions_nodes_read` DISABLE KEYS */;
INSERT INTO `cms_permissions_nodes_read` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3),(15,1),(15,2),(15,3);
/*!40000 ALTER TABLE `cms_permissions_nodes_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_nodes_write`
--

DROP TABLE IF EXISTS `cms_permissions_nodes_write`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_nodes_write` (
  `node_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`node_id`,`usergroup_id`),
  KEY `IDX_9FC66A3E460D9FD7` (`node_id`),
  KEY `IDX_9FC66A3ED2112630` (`usergroup_id`),
  CONSTRAINT `FK_9FC66A3E460D9FD7` FOREIGN KEY (`node_id`) REFERENCES `cms_nodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9FC66A3ED2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_nodes_write`
--

LOCK TABLES `cms_permissions_nodes_write` WRITE;
/*!40000 ALTER TABLE `cms_permissions_nodes_write` DISABLE KEYS */;
INSERT INTO `cms_permissions_nodes_write` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1);
/*!40000 ALTER TABLE `cms_permissions_nodes_write` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_regions_read`
--

DROP TABLE IF EXISTS `cms_permissions_regions_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_regions_read` (
  `region_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`region_id`,`usergroup_id`),
  KEY `IDX_C6CDDE1F98260155` (`region_id`),
  KEY `IDX_C6CDDE1FD2112630` (`usergroup_id`),
  CONSTRAINT `FK_C6CDDE1F98260155` FOREIGN KEY (`region_id`) REFERENCES `cms_regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C6CDDE1FD2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_regions_read`
--

LOCK TABLES `cms_permissions_regions_read` WRITE;
/*!40000 ALTER TABLE `cms_permissions_regions_read` DISABLE KEYS */;
INSERT INTO `cms_permissions_regions_read` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,3),(4,1),(4,2),(4,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3);
/*!40000 ALTER TABLE `cms_permissions_regions_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions_regions_write`
--

DROP TABLE IF EXISTS `cms_permissions_regions_write`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_permissions_regions_write` (
  `region_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`region_id`,`usergroup_id`),
  KEY `IDX_23EB19CE98260155` (`region_id`),
  KEY `IDX_23EB19CED2112630` (`usergroup_id`),
  CONSTRAINT `FK_23EB19CE98260155` FOREIGN KEY (`region_id`) REFERENCES `cms_regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_23EB19CED2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions_regions_write`
--

LOCK TABLES `cms_permissions_regions_write` WRITE;
/*!40000 ALTER TABLE `cms_permissions_regions_write` DISABLE KEYS */;
INSERT INTO `cms_permissions_regions_write` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(4,1),(4,2),(4,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3);
/*!40000 ALTER TABLE `cms_permissions_regions_write` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_regions`
--

DROP TABLE IF EXISTS `cms_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `permissions_cache` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_name_in_site` (`name`,`site_id`),
  KEY `IDX_FC8B76E2A76ED395` (`user_id`),
  KEY `IDX_FC8B76E2462CE4F5` (`position`),
  KEY `IDX_FC8B76E2F6BD1646` (`site_id`),
  CONSTRAINT `FK_FC8B76E2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_FC8B76E2F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `cms_sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_regions`
--

LOCK TABLES `cms_regions` WRITE;
/*!40000 ALTER TABLE `cms_regions` DISABLE KEYS */;
INSERT INTO `cms_regions` VALUES (1,1,NULL,'content','2017-11-29 22:36:36','Content workspace',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(2,1,1,'breadcrumbs','2017-11-29 22:50:29','Хлебные крошки',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(3,1,1,'footer','2017-12-01 22:20:44','Футер',0,'a:2:{s:4:\"read\";a:2:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(4,1,1,'main_menu','2017-12-01 23:01:05','Главное меню',0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(11,2,NULL,'content','2018-05-31 22:38:01','Content workspace',0,'a:0:{}'),(12,2,1,'breadcrumbs','2018-05-31 22:47:18',NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}'),(13,2,1,'footer','2018-06-01 01:23:43',NULL,0,'a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}}'),(14,2,1,'main_menu','2018-06-01 01:23:51',NULL,0,'a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}');
/*!40000 ALTER TABLE `cms_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_regions_inherit`
--

DROP TABLE IF EXISTS `cms_regions_inherit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_regions_inherit` (
  `region_id` int(10) unsigned NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`region_id`,`folder_id`),
  KEY `IDX_6392251D98260155` (`region_id`),
  KEY `IDX_6392251D162CB942` (`folder_id`),
  CONSTRAINT `FK_6392251D162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6392251D98260155` FOREIGN KEY (`region_id`) REFERENCES `cms_regions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_regions_inherit`
--

LOCK TABLES `cms_regions_inherit` WRITE;
/*!40000 ALTER TABLE `cms_regions_inherit` DISABLE KEYS */;
INSERT INTO `cms_regions_inherit` VALUES (2,1),(3,1),(4,1),(12,11),(13,11),(14,11);
/*!40000 ALTER TABLE `cms_regions_inherit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sites`
--

DROP TABLE IF EXISTS `cms_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `position` smallint(6) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  `web_root` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `root_folder_id` int(10) unsigned DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9273314F5E237E06` (`name`),
  UNIQUE KEY `UNIQ_9273314F115F0EE5` (`domain_id`),
  UNIQUE KEY `UNIQ_9273314F5F3EA365` (`root_folder_id`),
  KEY `IDX_9273314FA76ED395` (`user_id`),
  KEY `IDX_9273314F82F1BAF4` (`language_id`),
  CONSTRAINT `FK_9273314F115F0EE5` FOREIGN KEY (`domain_id`) REFERENCES `cms_domains` (`id`),
  CONSTRAINT `FK_9273314F5F3EA365` FOREIGN KEY (`root_folder_id`) REFERENCES `cms_folders` (`id`),
  CONSTRAINT `FK_9273314F82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `cms_languages` (`id`),
  CONSTRAINT `FK_9273314FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sites`
--

LOCK TABLES `cms_sites` WRITE;
/*!40000 ALTER TABLE `cms_sites` DISABLE KEYS */;
INSERT INTO `cms_sites` VALUES (1,'Песочница','2017-11-28 06:12:02',1,0,NULL,1,1,'web/',2,1,'default'),(2,'Песочница 2','2018-05-30 22:20:25',1,0,NULL,1,9,NULL,1,11,'default');
/*!40000 ALTER TABLE `cms_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_syslog`
--

DROP TABLE IF EXISTS `cms_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_syslog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bundle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `new_value` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F3B4FDAFA76ED395` (`user_id`),
  KEY `IDX_F3B4FDAF8B8E8428` (`created_at`),
  KEY `IDX_F3B4FDAFA57B32FD` (`bundle`),
  KEY `IDX_F3B4FDAFE284468` (`entity`),
  CONSTRAINT `FK_F3B4FDAFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_syslog`
--

LOCK TABLES `cms_syslog` WRITE;
/*!40000 ALTER TABLE `cms_syslog` DISABLE KEYS */;
INSERT INTO `cms_syslog` VALUES (1,1,'update','CMS',8,'Folder',NULL,'a:1:{s:5:\"title\";s:14:\"Каталог\";}','a:1:{s:5:\"title\";s:16:\"Каталог 2\";}','2018-05-30 02:26:25','31.173.240.66'),(2,1,'update','CMS',1,'Folder',NULL,'a:1:{s:5:\"title\";s:14:\"Главная\";}','a:1:{s:5:\"title\";s:16:\"Главная 2\";}','2018-05-31 02:23:59','127.0.0.1'),(3,1,'create','CMS',10,'Folder',NULL,'a:0:{}','a:13:{s:5:\"title\";s:16:\"Главная 2\";s:8:\"uri_part\";s:0:\"\";s:13:\"parent_folder\";N;s:4:\"user\";i:1;s:7:\"is_file\";b:0;s:4:\"meta\";a:0:{}s:11:\"redirect_to\";N;s:20:\"template_inheritable\";s:0:\"\";s:13:\"template_self\";s:0:\"\";s:9:\"is_active\";b:1;s:11:\"description\";N;s:8:\"position\";i:0;s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-05-31 06:00:09','127.0.0.1'),(4,1,'update','CMS',10,'Folder',NULL,'a:1:{s:8:\"uri_part\";s:0:\"\";}','a:1:{s:8:\"uri_part\";s:2:\"10\";}','2018-05-31 06:00:09','127.0.0.1'),(5,1,'create','CMS',11,'Folder',NULL,'a:0:{}','a:13:{s:5:\"title\";s:16:\"Главная 2\";s:8:\"uri_part\";s:0:\"\";s:13:\"parent_folder\";N;s:4:\"user\";i:1;s:7:\"is_file\";b:0;s:4:\"meta\";a:0:{}s:11:\"redirect_to\";N;s:20:\"template_inheritable\";s:0:\"\";s:13:\"template_self\";s:0:\"\";s:9:\"is_active\";b:1;s:11:\"description\";N;s:8:\"position\";i:0;s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-05-31 06:05:02','127.0.0.1'),(6,1,'update','CMS',11,'Folder',NULL,'a:1:{s:8:\"uri_part\";s:0:\"\";}','a:1:{s:8:\"uri_part\";s:2:\"11\";}','2018-05-31 06:05:02','127.0.0.1'),(7,1,'create','CMS',0,'Folder',NULL,'a:0:{}','a:13:{s:5:\"title\";s:4:\"test\";s:8:\"uri_part\";s:0:\"\";s:13:\"parent_folder\";i:11;s:4:\"user\";i:1;s:7:\"is_file\";b:0;s:4:\"meta\";a:0:{}s:11:\"redirect_to\";N;s:20:\"template_inheritable\";s:0:\"\";s:13:\"template_self\";s:0:\"\";s:9:\"is_active\";b:1;s:11:\"description\";N;s:8:\"position\";i:0;s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-05-31 23:27:50','127.0.0.1'),(8,1,'create','CMS',12,'Folder',NULL,'a:0:{}','a:13:{s:5:\"title\";s:4:\"test\";s:8:\"uri_part\";s:0:\"\";s:13:\"parent_folder\";i:11;s:4:\"user\";i:1;s:7:\"is_file\";b:0;s:4:\"meta\";a:0:{}s:11:\"redirect_to\";N;s:20:\"template_inheritable\";s:0:\"\";s:13:\"template_self\";s:0:\"\";s:9:\"is_active\";b:1;s:11:\"description\";N;s:8:\"position\";i:0;s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-05-31 23:28:38','127.0.0.1'),(9,1,'update','CMS',12,'Folder',NULL,'a:1:{s:8:\"uri_part\";s:0:\"\";}','a:1:{s:8:\"uri_part\";s:2:\"12\";}','2018-05-31 23:28:38','127.0.0.1'),(10,1,'update','CMS',12,'Folder',NULL,'a:2:{s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}s:8:\"uri_part\";s:2:\"12\";}','a:2:{s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}s:8:\"uri_part\";s:4:\"test\";}','2018-05-31 23:29:04','127.0.0.1'),(11,1,'create','CMS',13,'Folder',NULL,'a:0:{}','a:13:{s:5:\"title\";s:9:\"test 2222\";s:8:\"uri_part\";s:6:\"test-2\";s:13:\"parent_folder\";i:11;s:4:\"user\";i:1;s:7:\"is_file\";b:0;s:4:\"meta\";a:0:{}s:11:\"redirect_to\";N;s:20:\"template_inheritable\";s:0:\"\";s:13:\"template_self\";s:0:\"\";s:9:\"is_active\";b:1;s:11:\"description\";N;s:8:\"position\";i:0;s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:2:{i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-05-31 23:29:23','127.0.0.1'),(12,1,'update','CMS',12,'Region',NULL,'a:2:{s:4:\"name\";s:4:\"test\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}}}','a:2:{s:4:\"name\";s:11:\"breadcrumbs\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}}}','2018-06-01 01:23:35','127.0.0.1'),(13,1,'update','CMS',13,'Node',NULL,'a:2:{s:10:\"controller\";s:0:\"\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','a:2:{s:10:\"controller\";s:17:\"Breadcrumbs:index\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','2018-06-01 01:27:43','127.0.0.1'),(14,1,'update','CMS',13,'Node',NULL,'a:1:{s:6:\"params\";a:0:{}}','a:1:{s:6:\"params\";a:3:{s:9:\"delimiter\";s:1:\"/\";s:17:\"hide_if_only_home\";b:0;s:9:\"css_class\";N;}}','2018-06-01 01:27:59','127.0.0.1'),(15,1,'update','CMS',14,'Node',NULL,'a:2:{s:10:\"controller\";s:0:\"\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','a:2:{s:10:\"controller\";s:10:\"Menu:index\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','2018-06-01 01:33:51','127.0.0.1'),(16,1,'update','CMS',14,'Node',NULL,'a:1:{s:6:\"params\";a:0:{}}','a:1:{s:6:\"params\";a:5:{s:5:\"depth\";N;s:9:\"css_class\";N;s:13:\"current_class\";N;s:20:\"selected_inheritance\";b:1;s:7:\"menu_id\";i:2;}}','2018-06-01 01:36:52','127.0.0.1'),(17,1,'update','CMS',15,'Node',NULL,'a:2:{s:10:\"controller\";s:0:\"\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:1;s:5:\"admin\";i:2;s:4:\"user\";i:3;s:6:\"guests\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','a:2:{s:10:\"controller\";s:12:\"Texter:index\";s:17:\"permissions_cache\";a:2:{s:4:\"read\";a:3:{i:3;s:6:\"guests\";i:1;s:5:\"admin\";i:2;s:4:\"user\";}s:5:\"write\";a:1:{i:1;s:5:\"admin\";}}}','2018-06-01 01:37:08','127.0.0.1');
/*!40000 ALTER TABLE `cms_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_albums_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F70E6EB7B52E685C` (`media_collection_id`),
  KEY `IDX_F70E6EB7A76ED395` (`user_id`),
  CONSTRAINT `FK_F70E6EB7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_F70E6EB7B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,1,1,1,'2017-12-02 03:50:35','Тестовая галерея');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cover_image_id` int(11) DEFAULT NULL,
  `last_image_id` int(11) DEFAULT NULL,
  `photos_count` int(11) NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5661ABED4E7AF8F` (`gallery_id`),
  KEY `IDX_5661ABEDA76ED395` (`user_id`),
  CONSTRAINT `FK_5661ABED4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`),
  CONSTRAINT `FK_5661ABEDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_albums`
--

LOCK TABLES `gallery_albums` WRITE;
/*!40000 ALTER TABLE `gallery_albums` DISABLE KEYS */;
INSERT INTO `gallery_albums` VALUES (1,1,1,1,1,1,1,'2017-12-02 03:54:41','as fasdf asdf asdf asd sdf',1,'Первый','2017-12-02 08:15:21'),(2,1,1,NULL,NULL,0,1,'2017-12-02 03:55:01',NULL,2,'Второй','2017-12-02 07:59:47');
/*!40000 ALTER TABLE `gallery_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_photos`
--

DROP TABLE IF EXISTS `gallery_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_AAF50C7B1137ABCF` (`album_id`),
  KEY `IDX_AAF50C7BA76ED395` (`user_id`),
  CONSTRAINT `FK_AAF50C7B1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`),
  CONSTRAINT `FK_AAF50C7BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_photos`
--

LOCK TABLES `gallery_photos` WRITE;
/*!40000 ALTER TABLE `gallery_photos` DISABLE KEYS */;
INSERT INTO `gallery_photos` VALUES (1,1,1,1,'2017-12-02 07:58:25','123',NULL);
/*!40000 ALTER TABLE `gallery_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_categories`
--

DROP TABLE IF EXISTS `media_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30D688FC727ACA70` (`parent_id`),
  KEY `IDX_30D688FC989D9B62` (`slug`),
  CONSTRAINT `FK_30D688FC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `media_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_categories`
--

LOCK TABLES `media_categories` WRITE;
/*!40000 ALTER TABLE `media_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_collections`
--

DROP TABLE IF EXISTS `media_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `default_storage_id` int(10) unsigned NOT NULL,
  `default_filter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_relative_path_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename_pattern` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_244DA17D14E68FF3` (`default_storage_id`),
  CONSTRAINT `FK_244DA17D14E68FF3` FOREIGN KEY (`default_storage_id`) REFERENCES `media_storages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_collections`
--

LOCK TABLES `media_collections` WRITE;
/*!40000 ALTER TABLE `media_collections` DISABLE KEYS */;
INSERT INTO `media_collections` VALUES (1,1,NULL,'N;','/gallery','/{year}/{month}/{day}','{hour}_{minutes}_{rand(10)}','2017-12-02 03:44:16','Фотогалерея'),(2,1,NULL,'N;','/catalog','/{year}/{month}/{day}','{hour}_{minutes}_{rand(10)}','2017-12-20 02:10:42','Каталог');
/*!40000 ALTER TABLE `media_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_preuploaded` tinyint(1) NOT NULL,
  `relative_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `original_size` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_192C84E8514956FD` (`collection_id`),
  KEY `IDX_192C84E812469DE2` (`category_id`),
  KEY `IDX_192C84E85CC5DB90` (`storage_id`),
  KEY `IDX_192C84E8A76ED395` (`user_id`),
  KEY `IDX_192C84E8F7C0246A` (`size`),
  KEY `IDX_192C84E88CDE5729` (`type`),
  CONSTRAINT `FK_192C84E812469DE2` FOREIGN KEY (`category_id`) REFERENCES `media_categories` (`id`),
  CONSTRAINT `FK_192C84E8514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`),
  CONSTRAINT `FK_192C84E85CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  CONSTRAINT `FK_192C84E8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,1,NULL,1,NULL,1,'/2017/12/02','07_58_ea3134076a.jpg','bscap0001_big.jpg','image','image/jpeg',144532,144557,'2017-12-02 07:58:25',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files_transformed`
--

DROP TABLE IF EXISTS `media_files_transformed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files_transformed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1084B87D7FC45F1D93CB796C` (`filter`,`file_id`),
  KEY `IDX_1084B87D93CB796C` (`file_id`),
  KEY `IDX_1084B87D514956FD` (`collection_id`),
  KEY `IDX_1084B87D5CC5DB90` (`storage_id`),
  CONSTRAINT `FK_1084B87D514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`),
  CONSTRAINT `FK_1084B87D5CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  CONSTRAINT `FK_1084B87D93CB796C` FOREIGN KEY (`file_id`) REFERENCES `media_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files_transformed`
--

LOCK TABLES `media_files_transformed` WRITE;
/*!40000 ALTER TABLE `media_files_transformed` DISABLE KEYS */;
INSERT INTO `media_files_transformed` VALUES (1,1,1,1,'200x200',15743,'2017-12-02 07:58:34');
/*!40000 ALTER TABLE `media_files_transformed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_storages`
--

DROP TABLE IF EXISTS `media_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_storages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_storages`
--

LOCK TABLES `media_storages` WRITE;
/*!40000 ALTER TABLE `media_storages` DISABLE KEYS */;
INSERT INTO `media_storages` VALUES (1,'SmartCore\\Bundle\\MediaBundle\\Provider\\LocalProvider','/_media','N;','2017-12-02 03:44:03','Локальное хранилище');
/*!40000 ALTER TABLE `media_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70B2CA2A5550C4ED` (`pid`),
  KEY `IDX_70B2CA2ACCD7E912` (`menu_id`),
  KEY `IDX_70B2CA2A162CB942` (`folder_id`),
  KEY `IDX_70B2CA2AA76ED395` (`user_id`),
  CONSTRAINT `FK_70B2CA2A162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`),
  CONSTRAINT `FK_70B2CA2A5550C4ED` FOREIGN KEY (`pid`) REFERENCES `menu_items` (`id`),
  CONSTRAINT `FK_70B2CA2AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_70B2CA2ACCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,NULL,1,1,1,NULL,0,'N;','2017-12-01 23:34:42',NULL,1,NULL,0,NULL),(2,NULL,1,3,1,NULL,0,'N;','2017-12-01 23:35:15',NULL,1,NULL,0,NULL),(3,NULL,1,2,1,NULL,0,'N;','2017-12-01 23:35:25',NULL,1,NULL,0,NULL),(4,3,1,6,1,NULL,0,'N;','2017-12-01 23:35:31',NULL,1,NULL,0,NULL),(5,3,1,7,1,NULL,0,'N;','2017-12-01 23:35:36',NULL,1,NULL,0,NULL),(6,NULL,1,4,1,NULL,0,'N;','2017-12-01 23:35:43',NULL,1,NULL,0,NULL),(7,NULL,1,5,1,NULL,0,'N;','2017-12-01 23:35:48',NULL,1,NULL,0,NULL),(8,NULL,1,NULL,1,'/admin/',0,'a:1:{s:4:\"test\";N;}','2017-12-03 09:39:30','2017-12-13 08:51:26',0,NULL,100,'Админка'),(9,NULL,1,8,1,NULL,0,'a:1:{s:4:\"test\";N;}','2017-12-20 04:12:03',NULL,1,NULL,0,NULL),(10,NULL,1,9,1,NULL,0,'a:1:{s:4:\"test\";N;}','2017-12-20 05:18:26',NULL,1,NULL,0,NULL),(11,NULL,2,11,1,NULL,0,'N;','2018-06-01 01:22:57',NULL,1,NULL,0,NULL),(12,11,2,12,1,NULL,0,'N;','2018-06-01 01:23:09',NULL,1,NULL,0,NULL),(13,11,2,13,1,NULL,0,'N;','2018-06-01 01:23:13',NULL,1,NULL,0,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `site_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_in_site` (`name`,`site_id`),
  KEY `IDX_727508CFA76ED395` (`user_id`),
  KEY `IDX_727508CFF6BD1646` (`site_id`),
  CONSTRAINT `FK_727508CFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_727508CFF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `cms_sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'Главное меню','test:\r\n    type: choice\r\n    choices:\r\n        123: 123\r\n        qwe: qwe','2017-12-01 23:23:33',NULL,0,1),(2,1,'Главное меню 222',NULL,'2018-06-01 01:22:22',NULL,0,2);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bundle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `is_serialized` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E545A0C5A57B32FD5E237E06` (`bundle`,`name`),
  KEY `IDX_E545A0C564C19C1` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'cms','default','instance_uid','',0,'2017-11-25 00:50:18','2017-12-02 11:17:12',1),(2,'cms','default','appearance_editor','ace',0,'2017-11-30 10:34:48',NULL,0),(3,'cms','default','appearance_editor_theme','idle_fingers',0,'2017-11-30 10:34:48',NULL,0),(4,'cms','default','timezone','Asia/Novosibirsk',0,'2017-12-02 02:23:57','2017-12-02 03:57:10',0),(5,'cms','default','html_title_delimiter','&ndash;',0,'2017-12-02 02:54:51','2017-12-03 10:16:20',0),(6,'cms','default','site_full_name','Monolith CMS',0,'2017-12-02 02:54:51',NULL,0),(7,'cms','default','site_short_name','Monolith CMS',0,'2017-12-02 02:54:51',NULL,0),(8,'cms','default','default_theme','default',0,'2017-12-03 08:52:42','2017-12-03 09:49:59',0),(9,'cms','default','enable_node_cache','1',0,'2017-12-08 03:09:01',NULL,0),(10,'cms','default','is_collapse_system_menu','0',0,'2017-12-10 04:33:30','2018-06-01 01:30:01',0);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_history`
--

DROP TABLE IF EXISTS `settings_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_personal` tinyint(1) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_99BED87BEE35BD72` (`setting_id`),
  KEY `IDX_99BED87BA76ED395` (`user_id`),
  KEY `IDX_99BED87B64231B80` (`is_personal`),
  CONSTRAINT `FK_99BED87BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_99BED87BEE35BD72` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_history`
--

LOCK TABLES `settings_history` WRITE;
/*!40000 ALTER TABLE `settings_history` DISABLE KEYS */;
INSERT INTO `settings_history` VALUES (1,4,1,0,'Asia/Novosibirsk','2017-12-02 03:57:10'),(2,8,1,0,'demo','2017-12-03 09:46:00'),(3,8,1,0,'default','2017-12-03 09:49:59'),(4,5,1,0,'/','2017-12-03 10:16:13'),(5,5,1,0,'&ndash;','2017-12-03 10:16:20'),(6,10,1,0,'1','2017-12-10 04:35:13'),(7,10,1,0,'0','2017-12-10 04:35:42'),(8,10,1,0,'1','2017-12-10 04:36:36'),(9,10,1,0,'0','2017-12-10 04:37:03'),(10,10,1,0,'1','2017-12-10 23:38:42'),(11,10,1,0,'0','2017-12-10 23:38:57'),(12,10,1,0,'1','2017-12-10 23:45:48'),(13,10,1,0,'0','2017-12-10 23:45:53'),(14,10,1,0,'1','2018-06-01 01:29:43'),(15,10,1,0,'0','2018-06-01 01:30:01');
/*!40000 ALTER TABLE `settings_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_personal`
--

DROP TABLE IF EXISTS `settings_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_personal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D7ED5980EE35BD72A76ED395` (`setting_id`,`user_id`),
  KEY `IDX_D7ED5980EE35BD72` (`setting_id`),
  KEY `IDX_D7ED5980A76ED395` (`user_id`),
  CONSTRAINT `FK_D7ED5980A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_D7ED5980EE35BD72` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_personal`
--

LOCK TABLES `settings_personal` WRITE;
/*!40000 ALTER TABLE `settings_personal` DISABLE KEYS */;
INSERT INTO `settings_personal` VALUES (1,9,1,'0','2017-12-10 00:50:45',NULL);
/*!40000 ALTER TABLE `settings_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap_urls`
--

DROP TABLE IF EXISTS `sitemap_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visited` tinyint(1) NOT NULL,
  `loc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `lastmod` datetime DEFAULT NULL,
  `changefreq` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_365093828852ACDC` (`loc`),
  KEY `IDX_365093829A62B8C7` (`title_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap_urls`
--

LOCK TABLES `sitemap_urls` WRITE;
/*!40000 ALTER TABLE `sitemap_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pause_time` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,1000,400,'INSET','custom',5000,'Test 1','uploads/slider_test1/');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8C02091D7DF1668` (`file_name`),
  KEY `IDX_B8C020912CCC9638` (`slider_id`),
  KEY `IDX_B8C02091462CE4F5` (`position`),
  KEY `IDX_B8C02091A76ED395` (`user_id`),
  KEY `IDX_B8C02091162CB942` (`folder_id`),
  CONSTRAINT `FK_B8C02091162CB942` FOREIGN KEY (`folder_id`) REFERENCES `cms_folders` (`id`),
  CONSTRAINT `FK_B8C020912CCC9638` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`),
  CONSTRAINT `FK_B8C02091A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (7,1,1,'41238c3f58255ac84693bc383680567e.jpeg','bscap0001_big.jpg','a:0:{}',1,'2017-12-13 15:29:48',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texter_history`
--

DROP TABLE IF EXISTS `texter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texter_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `editor` smallint(6) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_82529097126F525E` (`item_id`),
  KEY `IDX_82529097A76ED395` (`user_id`),
  KEY `IDX_825290974AF38FD1` (`deleted_at`),
  CONSTRAINT `FK_82529097126F525E` FOREIGN KEY (`item_id`) REFERENCES `texter_items` (`id`),
  CONSTRAINT `FK_82529097A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texter_history`
--

LOCK TABLES `texter_history` WRITE;
/*!40000 ALTER TABLE `texter_history` DISABLE KEYS */;
INSERT INTO `texter_history` VALUES (1,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-01 23:58:04',NULL),(2,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-01 23:59:03',NULL),(3,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-02 00:10:37',NULL),(4,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-02 00:10:55',NULL),(5,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-13 08:51:44','Hello World'),(6,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-18 03:49:12','Hello World 2'),(7,NULL,1,'ru',1,'a:0:{}',NULL,'2017-12-18 05:49:18','Hello World 2'),(8,NULL,1,'ru',1,'a:0:{}',NULL,'2018-05-06 22:37:31','Hello World 3'),(9,NULL,1,'ru',1,'a:0:{}',NULL,'2018-05-06 23:32:07','Hello World 3'),(10,NULL,1,'ru',1,'a:0:{}',NULL,'2018-05-06 23:32:15','Hello World 4'),(11,NULL,1,'ru',1,'a:0:{}',NULL,'2018-06-01 01:44:34',NULL),(12,NULL,1,'ru',1,'a:0:{}',NULL,'2018-06-01 01:44:43','sadfa sdf sf'),(13,NULL,1,'ru',1,'a:0:{}',NULL,'2018-10-29 23:49:45','Скачивание'),(14,NULL,1,'ru',1,'a:0:{}',NULL,'2018-10-29 23:50:42','Скачивание 2');
/*!40000 ALTER TABLE `texter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texter_items`
--

DROP TABLE IF EXISTS `texter_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texter_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` smallint(6) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_CD3DA84A76ED395` (`user_id`),
  KEY `IDX_CD3DA848B8E8428` (`created_at`),
  CONSTRAINT `FK_CD3DA84A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texter_items`
--

LOCK TABLES `texter_items` WRITE;
/*!40000 ALTER TABLE `texter_items` DISABLE KEYS */;
INSERT INTO `texter_items` VALUES (1,1,'ru',1,'a:0:{}','2017-12-01 21:17:52',NULL,NULL),(2,1,'ru',1,'a:0:{}','2017-12-01 21:21:00',NULL,'Скачивание 3'),(3,1,'ru',1,'a:0:{}','2017-12-01 22:20:04',NULL,'Контакты'),(4,1,'ru',0,'a:0:{}','2017-12-02 01:51:49',NULL,'Футер'),(5,1,'ru',1,'a:0:{}','2017-12-01 23:37:37',NULL,'Hello World 5'),(6,1,'ru',1,'a:0:{}','2018-06-01 01:37:07',NULL,'sadfa sdf sf 22');
/*!40000 ALTER TABLE `texter_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__attributes`
--

DROP TABLE IF EXISTS `unicat__attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `items_type_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `open_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '<p>',
  `close_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '</p>',
  `is_dedicated_table` tinyint(1) NOT NULL DEFAULT '0',
  `is_link` tinyint(1) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_title` tinyint(1) NOT NULL DEFAULT '1',
  `is_primary` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_admin` tinyint(1) NOT NULL,
  `show_in_list` tinyint(1) NOT NULL,
  `show_in_view` tinyint(1) NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `params_yaml` longtext COLLATE utf8_unicode_ci,
  `is_items_type_many2many` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_form_title` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_form_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D3165B6D5E237E0673F32DD8` (`name`,`configuration_id`),
  KEY `IDX_D3165B6D73F32DD8` (`configuration_id`),
  KEY `IDX_D3165B6DB9CCD492` (`items_type_id`),
  KEY `IDX_D3165B6DA76ED395` (`user_id`),
  KEY `IDX_D3165B6D46C53D4C` (`is_enabled`),
  KEY `IDX_D3165B6DFB9FF2E7` (`show_in_admin`),
  KEY `IDX_D3165B6D921EA9F` (`show_in_list`),
  KEY `IDX_D3165B6DB314B909` (`show_in_view`),
  KEY `IDX_D3165B6D462CE4F5` (`position`),
  CONSTRAINT `FK_D3165B6D73F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`),
  CONSTRAINT `FK_D3165B6DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_D3165B6DB9CCD492` FOREIGN KEY (`items_type_id`) REFERENCES `unicat__items_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__attributes`
--

LOCK TABLES `unicat__attributes` WRITE;
/*!40000 ALTER TABLE `unicat__attributes` DISABLE KEYS */;
INSERT INTO `unicat__attributes` VALUES (1,1,NULL,1,'title','text','<p>','</p>',0,1,1,1,0,1,1,1,'a:0:{}',NULL,0,1,'2017-12-20 02:42:15',NULL,0,'Название',NULL,NULL),(2,1,NULL,1,'description','textarea','<p>','</p>',0,0,0,1,0,0,0,1,'a:1:{s:4:\"form\";a:1:{s:4:\"attr\";a:2:{s:5:\"class\";s:7:\"wysiwyg\";s:10:\"data-theme\";s:8:\"advanced\";}}}','form:\r\n    attr:\r\n        class: \'wysiwyg\'\r\n        data-theme: \'advanced\'',0,1,'2017-12-20 02:43:30',NULL,10,'Описание',NULL,NULL),(3,2,NULL,1,'title','text','<p>','</p>',1,1,1,1,1,1,1,1,'a:0:{}',NULL,0,1,'2017-12-20 05:14:49',NULL,0,'Заголовок',NULL,NULL),(4,1,NULL,1,'file','file','<p>','</p>',0,0,0,1,1,1,1,1,'a:0:{}',NULL,0,1,'2017-12-22 17:58:28',NULL,1,'Файл',NULL,NULL),(5,1,NULL,1,'gallery','gallery','<p>','</p>',0,0,0,1,1,0,1,1,'a:0:{}',NULL,0,1,'2017-12-22 18:05:24',NULL,2,'Фотогалерея',NULL,NULL),(6,1,NULL,1,'file2','file','<p>','</p>',0,0,0,1,1,1,1,1,'a:0:{}',NULL,0,1,'2017-12-22 18:40:34',NULL,1,'Файл 2',NULL,NULL);
/*!40000 ALTER TABLE `unicat__attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__attributes_groups`
--

DROP TABLE IF EXISTS `unicat__attributes_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__attributes_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E377FB75E237E0673F32DD8` (`name`,`configuration_id`),
  KEY `IDX_5E377FB773F32DD8` (`configuration_id`),
  KEY `IDX_5E377FB7462CE4F5` (`position`),
  CONSTRAINT `FK_5E377FB773F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__attributes_groups`
--

LOCK TABLES `unicat__attributes_groups` WRITE;
/*!40000 ALTER TABLE `unicat__attributes_groups` DISABLE KEYS */;
INSERT INTO `unicat__attributes_groups` VALUES (1,1,'2017-12-20 02:21:12','common',0,'Основные свойства'),(2,2,'2017-12-20 05:14:18','common',0,'Основные свойства');
/*!40000 ALTER TABLE `unicat__attributes_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__attributes_groups_relations`
--

DROP TABLE IF EXISTS `unicat__attributes_groups_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__attributes_groups_relations` (
  `attribute_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`group_id`),
  KEY `IDX_E6224AAFB6E62EFA` (`attribute_id`),
  KEY `IDX_E6224AAFFE54D947` (`group_id`),
  CONSTRAINT `FK_E6224AAFB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `unicat__attributes` (`id`),
  CONSTRAINT `FK_E6224AAFFE54D947` FOREIGN KEY (`group_id`) REFERENCES `unicat__attributes_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__attributes_groups_relations`
--

LOCK TABLES `unicat__attributes_groups_relations` WRITE;
/*!40000 ALTER TABLE `unicat__attributes_groups_relations` DISABLE KEYS */;
INSERT INTO `unicat__attributes_groups_relations` VALUES (1,1),(2,1),(3,2),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `unicat__attributes_groups_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__configurations`
--

DROP TABLE IF EXISTS `unicat__configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned DEFAULT NULL,
  `default_taxonomy_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entities_namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_inheritance` tinyint(1) NOT NULL DEFAULT '1',
  `items_per_page` smallint(5) unsigned NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F622D4625E237E06` (`name`),
  UNIQUE KEY `UNIQ_F622D4622B36786B` (`title`),
  KEY `IDX_F622D462B52E685C` (`media_collection_id`),
  KEY `IDX_F622D46241A4F540` (`default_taxonomy_id`),
  KEY `IDX_F622D462A76ED395` (`user_id`),
  CONSTRAINT `FK_F622D46241A4F540` FOREIGN KEY (`default_taxonomy_id`) REFERENCES `unicat__taxonomies` (`id`),
  CONSTRAINT `FK_F622D462A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_F622D462B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__configurations`
--

LOCK TABLES `unicat__configurations` WRITE;
/*!40000 ALTER TABLE `unicat__configurations` DISABLE KEYS */;
INSERT INTO `unicat__configurations` VALUES (1,2,1,1,'SandboxSiteBundle\\Entity\\Unicat\\Catalog\\',0,10,'2017-12-20 01:52:11','catalog','Каталог','bicycle'),(2,NULL,NULL,1,'SandboxSiteBundle\\Entity\\Unicat\\News\\',1,10,'2017-12-20 05:12:06','news','Новости','newspaper-o');
/*!40000 ALTER TABLE `unicat__configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__items_types`
--

DROP TABLE IF EXISTS `unicat__items_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__items_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content_min_width` int(11) DEFAULT NULL,
  `order_by_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_by_direction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_string_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3E08A29773F32DD8` (`configuration_id`),
  KEY `IDX_3E08A297A76ED395` (`user_id`),
  KEY `IDX_3E08A2975E237E06` (`name`),
  CONSTRAINT `FK_3E08A29773F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`),
  CONSTRAINT `FK_3E08A297A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__items_types`
--

LOCK TABLES `unicat__items_types` WRITE;
/*!40000 ALTER TABLE `unicat__items_types` DISABLE KEYS */;
INSERT INTO `unicat__items_types` VALUES (1,1,1,NULL,NULL,NULL,NULL,'2017-12-20 02:15:33','wares',0,'Товары'),(2,1,1,NULL,NULL,NULL,NULL,'2017-12-20 05:10:23','services',0,'Услуги'),(3,2,1,NULL,NULL,NULL,NULL,'2017-12-20 05:16:18','news',0,'Новости');
/*!40000 ALTER TABLE `unicat__items_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__items_types_attributes_groups_relations`
--

DROP TABLE IF EXISTS `unicat__items_types_attributes_groups_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__items_types_attributes_groups_relations` (
  `attribute_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`group_id`),
  KEY `IDX_927D1F27B6E62EFA` (`attribute_id`),
  KEY `IDX_927D1F27FE54D947` (`group_id`),
  CONSTRAINT `FK_927D1F27B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `unicat__items_types` (`id`),
  CONSTRAINT `FK_927D1F27FE54D947` FOREIGN KEY (`group_id`) REFERENCES `unicat__attributes_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__items_types_attributes_groups_relations`
--

LOCK TABLES `unicat__items_types_attributes_groups_relations` WRITE;
/*!40000 ALTER TABLE `unicat__items_types_attributes_groups_relations` DISABLE KEYS */;
INSERT INTO `unicat__items_types_attributes_groups_relations` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `unicat__items_types_attributes_groups_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__items_types_taxonomies_relations`
--

DROP TABLE IF EXISTS `unicat__items_types_taxonomies_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__items_types_taxonomies_relations` (
  `attribute_id` int(10) unsigned NOT NULL,
  `taxonomy_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`taxonomy_id`),
  KEY `IDX_FC6EEED5B6E62EFA` (`attribute_id`),
  KEY `IDX_FC6EEED59557E6F6` (`taxonomy_id`),
  CONSTRAINT `FK_FC6EEED59557E6F6` FOREIGN KEY (`taxonomy_id`) REFERENCES `unicat__taxonomies` (`id`),
  CONSTRAINT `FK_FC6EEED5B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `unicat__items_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__items_types_taxonomies_relations`
--

LOCK TABLES `unicat__items_types_taxonomies_relations` WRITE;
/*!40000 ALTER TABLE `unicat__items_types_taxonomies_relations` DISABLE KEYS */;
INSERT INTO `unicat__items_types_taxonomies_relations` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `unicat__items_types_taxonomies_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat__taxonomies`
--

DROP TABLE IF EXISTS `unicat__taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat__taxonomies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title_form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_multiple_entries` tinyint(1) NOT NULL,
  `is_show_in_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) DEFAULT NULL,
  `is_default_inheritance` tinyint(1) NOT NULL DEFAULT '0',
  `is_tree` tinyint(1) NOT NULL DEFAULT '1',
  `properties` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1A645E473F32DD8` (`configuration_id`),
  KEY `IDX_C1A645E4A76ED395` (`user_id`),
  KEY `IDX_C1A645E45E237E06` (`name`),
  CONSTRAINT `FK_C1A645E473F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`),
  CONSTRAINT `FK_C1A645E4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat__taxonomies`
--

LOCK TABLES `unicat__taxonomies` WRITE;
/*!40000 ALTER TABLE `unicat__taxonomies` DISABLE KEYS */;
INSERT INTO `unicat__taxonomies` VALUES (1,1,NULL,'Категория',0,1,1,0,1,NULL,'2017-12-20 02:44:30','category',0,'Категории'),(2,2,NULL,'Тэги',1,1,0,1,0,NULL,'2017-12-20 05:13:59','tags',0,'Тэги');
/*!40000 ALTER TABLE `unicat__taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_catalog_items`
--

DROP TABLE IF EXISTS `unicat_catalog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_catalog_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden_extra` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `attributes` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` smallint(6) DEFAULT '0',
  `first_parent_attributes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_163452F3989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_163452F3D17F50A6` (`uuid`),
  KEY `IDX_163452F3C54C8C93` (`type_id`),
  KEY `IDX_163452F3A76ED395` (`user_id`),
  KEY `IDX_163452F3462CE4F5` (`position`),
  CONSTRAINT `FK_163452F3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_163452F3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `unicat__items_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_catalog_items`
--

LOCK TABLES `unicat_catalog_items` WRITE;
/*!40000 ALTER TABLE `unicat_catalog_items` DISABLE KEYS */;
INSERT INTO `unicat_catalog_items` VALUES (1,1,1,'test',NULL,'','a:2:{s:11:\"description\";N;s:8:\"keywords\";N;}','a:6:{s:4:\"name\";s:27:\"Тестовый товар\";s:11:\"description\";s:48:\"Описание тестового товара\";s:5:\"title\";s:27:\"Тестовый товар\";s:7:\"gallery\";a:2:{s:11:\"galleryName\";s:0:\"\";s:6:\"images\";a:0:{}}s:4:\"file\";s:17:\"/path/to/file.txt\";s:5:\"file2\";s:18:\"/path/to/file2.txt\";}',1,'2017-12-20 02:47:12','2017-12-22 18:42:25',0,NULL);
/*!40000 ALTER TABLE `unicat_catalog_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_catalog_items_taxons_relations`
--

DROP TABLE IF EXISTS `unicat_catalog_items_taxons_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_catalog_items_taxons_relations` (
  `item_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`taxon_id`),
  KEY `IDX_437400EB126F525E` (`item_id`),
  KEY `IDX_437400EBDE13F470` (`taxon_id`),
  CONSTRAINT `FK_437400EB126F525E` FOREIGN KEY (`item_id`) REFERENCES `unicat_catalog_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_437400EBDE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `unicat_catalog_taxons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_catalog_items_taxons_relations`
--

LOCK TABLES `unicat_catalog_items_taxons_relations` WRITE;
/*!40000 ALTER TABLE `unicat_catalog_items_taxons_relations` DISABLE KEYS */;
INSERT INTO `unicat_catalog_items_taxons_relations` VALUES (1,1),(1,3);
/*!40000 ALTER TABLE `unicat_catalog_items_taxons_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_catalog_items_taxons_single_relations`
--

DROP TABLE IF EXISTS `unicat_catalog_items_taxons_single_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_catalog_items_taxons_single_relations` (
  `item_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`taxon_id`),
  KEY `IDX_9FC85324126F525E` (`item_id`),
  KEY `IDX_9FC85324DE13F470` (`taxon_id`),
  CONSTRAINT `FK_9FC85324126F525E` FOREIGN KEY (`item_id`) REFERENCES `unicat_catalog_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9FC85324DE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `unicat_catalog_taxons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_catalog_items_taxons_single_relations`
--

LOCK TABLES `unicat_catalog_items_taxons_single_relations` WRITE;
/*!40000 ALTER TABLE `unicat_catalog_items_taxons_single_relations` DISABLE KEYS */;
INSERT INTO `unicat_catalog_items_taxons_single_relations` VALUES (1,3);
/*!40000 ALTER TABLE `unicat_catalog_items_taxons_single_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_catalog_taxons`
--

DROP TABLE IF EXISTS `unicat_catalog_taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_catalog_taxons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `taxonomy_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_inheritance` tinyint(1) NOT NULL DEFAULT '1',
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_parent_taxonomy` (`slug`,`parent_id`,`taxonomy_id`),
  UNIQUE KEY `title_parent_taxonomy` (`title`,`parent_id`,`taxonomy_id`),
  KEY `IDX_767F6678727ACA70` (`parent_id`),
  KEY `IDX_767F66789557E6F6` (`taxonomy_id`),
  KEY `IDX_767F6678A76ED395` (`user_id`),
  KEY `IDX_767F667846C53D4C` (`is_enabled`),
  KEY `IDX_767F6678462CE4F5` (`position`),
  CONSTRAINT `FK_767F6678727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `unicat_catalog_taxons` (`id`),
  CONSTRAINT `FK_767F66789557E6F6` FOREIGN KEY (`taxonomy_id`) REFERENCES `unicat__taxonomies` (`id`),
  CONSTRAINT `FK_767F6678A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_catalog_taxons`
--

LOCK TABLES `unicat_catalog_taxons` WRITE;
/*!40000 ALTER TABLE `unicat_catalog_taxons` DISABLE KEYS */;
INSERT INTO `unicat_catalog_taxons` VALUES (1,NULL,1,1,'1111','1111',1,'a:0:{}','N;',1,'2017-12-20 04:10:39',0),(2,NULL,1,1,'2222','2222',1,'a:0:{}','N;',1,'2017-12-20 04:10:48',0),(3,1,1,1,'3333','3333',1,'a:0:{}','N;',1,'2017-12-20 04:10:55',0);
/*!40000 ALTER TABLE `unicat_catalog_taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_news_items`
--

DROP TABLE IF EXISTS `unicat_news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_news_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden_extra` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `attributes` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` smallint(6) DEFAULT '0',
  `first_parent_attributes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E382C6C7989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_E382C6C7D17F50A6` (`uuid`),
  KEY `IDX_E382C6C7C54C8C93` (`type_id`),
  KEY `IDX_E382C6C7A76ED395` (`user_id`),
  KEY `IDX_E382C6C7462CE4F5` (`position`),
  CONSTRAINT `FK_E382C6C7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_E382C6C7C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `unicat__items_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_news_items`
--

LOCK TABLES `unicat_news_items` WRITE;
/*!40000 ALTER TABLE `unicat_news_items` DISABLE KEYS */;
INSERT INTO `unicat_news_items` VALUES (1,3,1,'first',NULL,'','a:2:{s:11:\"description\";N;s:8:\"keywords\";N;}','a:1:{s:5:\"title\";s:27:\"Первая новость\";}',1,'2017-12-20 05:16:43','2017-12-20 05:23:21',0,NULL);
/*!40000 ALTER TABLE `unicat_news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_news_items_taxons_relations`
--

DROP TABLE IF EXISTS `unicat_news_items_taxons_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_news_items_taxons_relations` (
  `item_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`taxon_id`),
  KEY `IDX_2A00A41C126F525E` (`item_id`),
  KEY `IDX_2A00A41CDE13F470` (`taxon_id`),
  CONSTRAINT `FK_2A00A41C126F525E` FOREIGN KEY (`item_id`) REFERENCES `unicat_news_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2A00A41CDE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `unicat_news_taxons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_news_items_taxons_relations`
--

LOCK TABLES `unicat_news_items_taxons_relations` WRITE;
/*!40000 ALTER TABLE `unicat_news_items_taxons_relations` DISABLE KEYS */;
INSERT INTO `unicat_news_items_taxons_relations` VALUES (1,1);
/*!40000 ALTER TABLE `unicat_news_items_taxons_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_news_items_taxons_single_relations`
--

DROP TABLE IF EXISTS `unicat_news_items_taxons_single_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_news_items_taxons_single_relations` (
  `item_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`taxon_id`),
  KEY `IDX_F6E0FA0D126F525E` (`item_id`),
  KEY `IDX_F6E0FA0DDE13F470` (`taxon_id`),
  CONSTRAINT `FK_F6E0FA0D126F525E` FOREIGN KEY (`item_id`) REFERENCES `unicat_news_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F6E0FA0DDE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `unicat_news_taxons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_news_items_taxons_single_relations`
--

LOCK TABLES `unicat_news_items_taxons_single_relations` WRITE;
/*!40000 ALTER TABLE `unicat_news_items_taxons_single_relations` DISABLE KEYS */;
INSERT INTO `unicat_news_items_taxons_single_relations` VALUES (1,1);
/*!40000 ALTER TABLE `unicat_news_items_taxons_single_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_news_taxons`
--

DROP TABLE IF EXISTS `unicat_news_taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_news_taxons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `taxonomy_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_inheritance` tinyint(1) NOT NULL DEFAULT '1',
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_parent_taxonomy` (`slug`,`parent_id`,`taxonomy_id`),
  UNIQUE KEY `title_parent_taxonomy` (`title`,`parent_id`,`taxonomy_id`),
  KEY `IDX_573E2459727ACA70` (`parent_id`),
  KEY `IDX_573E24599557E6F6` (`taxonomy_id`),
  KEY `IDX_573E2459A76ED395` (`user_id`),
  KEY `IDX_573E245946C53D4C` (`is_enabled`),
  KEY `IDX_573E2459462CE4F5` (`position`),
  CONSTRAINT `FK_573E2459727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `unicat_news_taxons` (`id`),
  CONSTRAINT `FK_573E24599557E6F6` FOREIGN KEY (`taxonomy_id`) REFERENCES `unicat__taxonomies` (`id`),
  CONSTRAINT `FK_573E2459A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_news_taxons`
--

LOCK TABLES `unicat_news_taxons` WRITE;
/*!40000 ALTER TABLE `unicat_news_taxons` DISABLE KEYS */;
INSERT INTO `unicat_news_taxons` VALUES (1,NULL,2,1,'Russia','Россия',1,'a:0:{}','N;',1,'2017-12-20 05:23:04',0),(2,NULL,2,1,'usa','США',1,'a:0:{}','N;',1,'2017-12-20 05:23:13',0);
/*!40000 ALTER TABLE `unicat_news_taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unicat_news_values__title`
--

DROP TABLE IF EXISTS `unicat_news_values__title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unicat_news_values__title` (
  `item_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_F62C24321D775834` (`value`),
  CONSTRAINT `FK_F62C2432126F525E` FOREIGN KEY (`item_id`) REFERENCES `unicat_news_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unicat_news_values__title`
--

LOCK TABLES `unicat_news_values__title` WRITE;
/*!40000 ALTER TABLE `unicat_news_values__title` DISABLE KEYS */;
INSERT INTO `unicat_news_values__title` VALUES (1,'Первая новость');
/*!40000 ALTER TABLE `unicat_news_values__title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `patronymic` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`),
  KEY `IDX_1483A5E983A00E68` (`firstname`),
  KEY `IDX_1483A5E93124B5B6` (`lastname`),
  KEY `IDX_1483A5E9E42A05AB` (`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','root','root@monolith-cms.com','root@monolith-cms.com',1,NULL,'$2y$15$2tG9lT.uzZ3CdX9mzNZ3y.6r0ral1UERLfIyRCoIo3ADN47q1vGO2','2018-11-13 08:47:08',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',NULL,NULL,'2017-11-25 18:35:43',NULL,NULL),(2,'test','test','test@mail.ru','test@mail.ru',1,NULL,'$2y$15$TaEfX1i66WzrYCS.dIlroumDkmDdMEFksQ7US/IjOMqZP/Yy.5NLS','2018-05-31 21:43:17',NULL,NULL,'a:0:{}',NULL,NULL,'2017-12-07 00:49:15',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `position` smallint(6) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default_folders_granted_read` tinyint(1) NOT NULL,
  `is_default_folders_granted_write` tinyint(1) NOT NULL,
  `is_default_nodes_granted_read` tinyint(1) NOT NULL,
  `is_default_nodes_granted_write` tinyint(1) NOT NULL,
  `is_default_regions_granted_read` tinyint(1) NOT NULL,
  `is_default_regions_granted_write` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FF8AB7E05E237E06` (`name`),
  KEY `IDX_FF8AB7E0462CE4F5` (`position`),
  KEY `IDX_FF8AB7E02B36786B` (`title`),
  KEY `IDX_FF8AB7E0FF781009` (`is_default_folders_granted_read`),
  KEY `IDX_FF8AB7E0D7061951` (`is_default_folders_granted_write`),
  KEY `IDX_FF8AB7E03EB0FA8C` (`is_default_nodes_granted_read`),
  KEY `IDX_FF8AB7E04A15A614` (`is_default_nodes_granted_write`),
  KEY `IDX_FF8AB7E0360B17FA` (`is_default_regions_granted_read`),
  KEY `IDX_FF8AB7E0F37BC9F0` (`is_default_regions_granted_write`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,'admin','a:5:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:17:\"ROLE_ADMIN_SYSTEM\";i:2;s:15:\"ROLE_ADMIN_USER\";i:3;s:22:\"ROLE_ADMIN_USER_GROUPS\";i:4;s:16:\"ROLE_FILEMANAGER\";}',1,'2017-12-04 18:03:12','Администраторы',1,1,1,1,1,1),(2,'user','a:0:{}',2,'2017-12-06 23:01:11','Авторизованные пользователи',1,1,1,0,1,1),(3,'guests','a:0:{}',0,'2017-12-07 01:13:57','Гости',1,0,1,0,1,1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups_relations`
--

DROP TABLE IF EXISTS `users_groups_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups_relations` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_12DA6D62A76ED395` (`user_id`),
  KEY `IDX_12DA6D62FE54D947` (`group_id`),
  CONSTRAINT `FK_12DA6D62A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_12DA6D62FE54D947` FOREIGN KEY (`group_id`) REFERENCES `users_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups_relations`
--

LOCK TABLES `users_groups_relations` WRITE;
/*!40000 ALTER TABLE `users_groups_relations` DISABLE KEYS */;
INSERT INTO `users_groups_relations` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `users_groups_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webforms`
--

DROP TABLE IF EXISTS `webforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_ajax` tinyint(1) NOT NULL DEFAULT '0',
  `is_use_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `send_button_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_notice_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_text` longtext COLLATE utf8_unicode_ci,
  `last_message_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_server` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_641866195E237E06` (`name`),
  KEY `IDX_64186619A76ED395` (`user_id`),
  CONSTRAINT `FK_64186619A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webforms`
--

LOCK TABLES `webforms` WRITE;
/*!40000 ALTER TABLE `webforms` DISABLE KEYS */;
INSERT INTO `webforms` VALUES (1,1,0,0,NULL,NULL,NULL,NULL,'2017-12-21 12:06:42','2017-12-11 04:42:27','feedback','Обратная связь',NULL,NULL,NULL,NULL),(2,1,1,0,NULL,NULL,NULL,NULL,'2017-12-23 02:40:37','2017-12-23 02:38:26','callback','Заказ звонка',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `webforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webforms_fields`
--

DROP TABLE IF EXISTS `webforms_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webforms_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_form_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `params_yaml` longtext COLLATE utf8_unicode_ci,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_antispam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_4FE98D46B75935E3` (`web_form_id`),
  KEY `IDX_4FE98D46A76ED395` (`user_id`),
  CONSTRAINT `FK_4FE98D46A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_4FE98D46B75935E3` FOREIGN KEY (`web_form_id`) REFERENCES `webforms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webforms_fields`
--

LOCK TABLES `webforms_fields` WRITE;
/*!40000 ALTER TABLE `webforms_fields` DISABLE KEYS */;
INSERT INTO `webforms_fields` VALUES (1,1,1,1,'name','a:0:{}',NULL,'text',1,'2017-12-11 05:34:52',0,'Имя',0),(2,1,1,1,'phone','a:0:{}',NULL,'tel',1,'2017-12-21 11:20:22',0,'Телефон',0),(3,2,1,1,'name','a:0:{}',NULL,'text',1,'2017-12-23 02:39:22',0,'Имя',0),(4,2,1,1,'phone','a:0:{}',NULL,'text',1,'2017-12-23 02:39:35',0,'Телефон',0),(5,1,1,0,'comment','a:0:{}',NULL,'textarea',1,'2018-04-08 02:15:13',0,'Комментарий',1);
/*!40000 ALTER TABLE `webforms_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webforms_messages`
--

DROP TABLE IF EXISTS `webforms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webforms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_form_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `comment` longtext COLLATE utf8_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_24719905B75935E3` (`web_form_id`),
  KEY `IDX_24719905A76ED395` (`user_id`),
  CONSTRAINT `FK_24719905A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_24719905B75935E3` FOREIGN KEY (`web_form_id`) REFERENCES `webforms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webforms_messages`
--

LOCK TABLES `webforms_messages` WRITE;
/*!40000 ALTER TABLE `webforms_messages` DISABLE KEYS */;
INSERT INTO `webforms_messages` VALUES (1,1,1,'a:1:{s:4:\"name\";s:4:\"test\";}',NULL,1,'2017-12-13 17:11:47','127.0.0.1'),(2,1,1,'a:1:{s:4:\"name\";s:3:\"456\";}',NULL,3,'2017-12-21 11:19:47','127.0.0.1'),(3,1,1,'a:2:{s:4:\"name\";s:2:\"df\";s:5:\"phone\";C:26:\"libphonenumber\\PhoneNumber\":76:{a:8:{i:0;i:7;i:1;s:10:\"9231306196\";i:2;N;i:3;N;i:4;i:1;i:5;N;i:6;i:4;i:7;N;}}}',NULL,5,'2017-12-21 11:52:25','127.0.0.1'),(4,1,1,'a:2:{s:4:\"name\";s:3:\"123\";s:5:\"phone\";s:9:\"123123123\";}',NULL,3,'2017-12-21 12:06:42','127.0.0.1'),(5,2,1,'a:2:{s:4:\"name\";s:3:\"123\";s:5:\"phone\";s:11:\"123 123 123\";}',NULL,1,'2017-12-23 02:40:33','127.0.0.1'),(6,2,1,'a:2:{s:4:\"name\";s:3:\"123\";s:5:\"phone\";s:11:\"123 123 123\";}',NULL,3,'2017-12-23 02:40:37','127.0.0.1');
/*!40000 ALTER TABLE `webforms_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yandex_metrika_counters`
--

DROP TABLE IF EXISTS `yandex_metrika_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yandex_metrika_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `counter_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7141FA06FCEEF2E3` (`counter_id`),
  KEY `IDX_7141FA0641DEE7B9` (`token_id`),
  KEY `IDX_7141FA06462CE4F5` (`position`),
  KEY `IDX_7141FA06A76ED395` (`user_id`),
  CONSTRAINT `FK_7141FA0641DEE7B9` FOREIGN KEY (`token_id`) REFERENCES `yandex_tokens` (`id`),
  CONSTRAINT `FK_7141FA06A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yandex_metrika_counters`
--

LOCK TABLES `yandex_metrika_counters` WRITE;
/*!40000 ALTER TABLE `yandex_metrika_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `yandex_metrika_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yandex_tokens`
--

DROP TABLE IF EXISTS `yandex_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yandex_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FC086E005F37A13B` (`token`),
  KEY `IDX_FC086E00462CE4F5` (`position`),
  KEY `IDX_FC086E00A76ED395` (`user_id`),
  CONSTRAINT `FK_FC086E00A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yandex_tokens`
--

LOCK TABLES `yandex_tokens` WRITE;
/*!40000 ALTER TABLE `yandex_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `yandex_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13  9:38:51
