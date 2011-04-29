-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema book
--

CREATE DATABASE IF NOT EXISTS book;
USE book;

--
-- Definition of table `book`.`auth_group`
--

DROP TABLE IF EXISTS `book`.`auth_group`;
CREATE TABLE  `book`.`auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
LOCK TABLES `auth_group` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_group_permissions`
--

DROP TABLE IF EXISTS `book`.`auth_group_permissions`;
CREATE TABLE  `book`.`auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
LOCK TABLES `auth_group_permissions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_message`
--

DROP TABLE IF EXISTS `book`.`auth_message`;
CREATE TABLE  `book`.`auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_650f49a6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_message`
--

/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
LOCK TABLES `auth_message` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_permission`
--

DROP TABLE IF EXISTS `book`.`auth_permission`;
CREATE TABLE  `book`.`auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
LOCK TABLES `auth_permission` WRITE;
INSERT INTO `book`.`auth_permission` VALUES  (1,'Can add permission',1,'add_permission'),
 (2,'Can change permission',1,'change_permission'),
 (3,'Can delete permission',1,'delete_permission'),
 (4,'Can add group',2,'add_group'),
 (5,'Can change group',2,'change_group'),
 (6,'Can delete group',2,'delete_group'),
 (7,'Can add user',3,'add_user'),
 (8,'Can change user',3,'change_user'),
 (9,'Can delete user',3,'delete_user'),
 (10,'Can add message',4,'add_message'),
 (11,'Can change message',4,'change_message'),
 (12,'Can delete message',4,'delete_message'),
 (13,'Can add content type',5,'add_contenttype'),
 (14,'Can change content type',5,'change_contenttype'),
 (15,'Can delete content type',5,'delete_contenttype'),
 (16,'Can add session',6,'add_session'),
 (17,'Can change session',6,'change_session'),
 (18,'Can delete session',6,'delete_session'),
 (19,'Can add site',7,'add_site'),
 (20,'Can change site',7,'change_site'),
 (21,'Can delete site',7,'delete_site'),
 (22,'Can add log entry',8,'add_logentry'),
 (23,'Can change log entry',8,'change_logentry'),
 (24,'Can delete log entry',8,'delete_logentry'),
 (25,'Can add profile',9,'add_profile'),
 (26,'Can change profile',9,'change_profile'),
 (27,'Can delete profile',9,'delete_profile'),
 (28,'Can view profile',9,'view_profile'),
 (29,'Can add contact',10,'add_contact'),
 (30,'Can change contact',10,'change_contact'),
 (31,'Can delete contact',10,'delete_contact'),
 (32,'Can add contact history',11,'add_contacthistory'),
 (33,'Can change contact history',11,'change_contacthistory'),
 (34,'Can delete contact history',11,'delete_contacthistory'),
 (35,'Can add event',12,'add_event'),
 (36,'Can change event',12,'change_event'),
 (37,'Can delete event',12,'delete_event'),
 (38,'Can add facebook session',13,'add_facebooksession'),
 (39,'Can change facebook session',13,'change_facebooksession'),
 (40,'Can delete facebook session',13,'delete_facebooksession'),
 (41,'Can add migration history',14,'add_migrationhistory'),
 (42,'Can change migration history',14,'change_migrationhistory'),
 (43,'Can delete migration history',14,'delete_migrationhistory'),
 (44,'Can add user object permission',15,'add_userobjectpermission'),
 (45,'Can change user object permission',15,'change_userobjectpermission'),
 (46,'Can delete user object permission',15,'delete_userobjectpermission'),
 (47,'Can add group object permission',16,'add_groupobjectpermission'),
 (48,'Can change group object permission',16,'change_groupobjectpermission'),
 (49,'Can delete group object permission',16,'delete_groupobjectpermission'),
 (50,'Can add userena registration',17,'add_userenasignup'),
 (51,'Can change userena registration',17,'change_userenasignup'),
 (52,'Can delete userena registration',17,'delete_userenasignup'),
 (53,'Can add contact',18,'add_messagecontact'),
 (54,'Can change contact',18,'change_messagecontact'),
 (55,'Can delete contact',18,'delete_messagecontact'),
 (56,'Can add recipient',19,'add_messagerecipient'),
 (57,'Can change recipient',19,'change_messagerecipient'),
 (58,'Can delete recipient',19,'delete_messagerecipient'),
 (59,'Can add message',20,'add_message'),
 (60,'Can change message',20,'change_message'),
 (61,'Can delete message',20,'delete_message'),
 (62,'Can add source',21,'add_source'),
 (63,'Can change source',21,'change_source'),
 (64,'Can delete source',21,'delete_source'),
 (65,'Can add thumbnail',22,'add_thumbnail'),
 (66,'Can change thumbnail',22,'change_thumbnail'),
 (67,'Can delete thumbnail',22,'delete_thumbnail');
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_user`
--

DROP TABLE IF EXISTS `book`.`auth_user`;
CREATE TABLE  `book`.`auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
LOCK TABLES `auth_user` WRITE;
INSERT INTO `book`.`auth_user` VALUES  (1,'root','','','blamat88@hotmail.com','sha1$d9c73$1147d95b0fe74dd6dffbd0ae7c68f23dfe2f9ebd',1,1,1,'2011-04-22 16:26:16','2011-04-21 14:49:13'),
 (9,'nestor','','','nturizo@hotmail.es','sha1$af99d$5ddd0120a781dd457f4d5dfa22b885747ab21ae9',0,0,0,'2011-04-29 12:55:37','2011-04-29 12:55:37'),
 (-1,'AnonymousUser','','','','',0,1,0,'2011-04-21 14:54:41','2011-04-21 14:54:41'),
 (10,'daniel10','','','tramusoft@hotmail.com','sha1$d206f$8bc94c3b9b00dbc52da33ff2ed2993bf10616a68',0,0,0,'2011-04-29 12:56:54','2011-04-29 12:56:54'),
 (4,'prueba','Hernan Dario','Blanco Matos','prueba@hotmail.com','sha1$05572$b7cb74a290c6a37bd194465ff08d818aad4755dc',0,1,0,'2011-04-23 02:37:56','2011-04-21 15:02:57'),
 (11,'blamat','','','blamat88@gmail.com','sha1$1b713$89430a81b07c5222ada3f81e18df947e1e80790b',0,0,0,'2011-04-29 13:56:00','2011-04-29 13:56:00'),
 (12,'dariojose','','','hdblanco.m@gmail.com','sha1$79dc6$90b0fa377c1d4c38ce8b811040843ba7fd0f69ba',0,0,0,'2011-04-29 14:03:51','2011-04-29 14:03:51'),
 (7,'manuel','Manuel','Blanco Castro','mananuel.c@hotmail.com','sha1$e2caf$693542ad19d525451801b52b70f40b2ca10376ae',0,1,0,'2011-04-23 02:48:12','2011-04-21 18:27:16'),
 (13,'hmatos','','','mangonoreplay@gmail.com','sha1$76c89$e945bfcd910c688cbd1780d437ec4e070233e230',0,1,0,'2011-04-29 15:28:32','2011-04-29 15:27:46'),
 (14,'615460604','Hernán','Blanco Matos','hdblanco.m@gmail.com','sha1$964ee$ba94f669202406215bd2bf3da7158f9e93b3fa3c',0,1,0,'2011-04-29 15:32:40','2011-04-29 15:30:34');
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_user_groups`
--

DROP TABLE IF EXISTS `book`.`auth_user_groups`;
CREATE TABLE  `book`.`auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
LOCK TABLES `auth_user_groups` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


--
-- Definition of table `book`.`auth_user_user_permissions`
--

DROP TABLE IF EXISTS `book`.`auth_user_user_permissions`;
CREATE TABLE  `book`.`auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


--
-- Definition of table `book`.`contacts_contact`
--

DROP TABLE IF EXISTS `book`.`contacts_contact`;
CREATE TABLE  `book`.`contacts_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mobil` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_1ae5b556` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`contacts_contact`
--

/*!40000 ALTER TABLE `contacts_contact` DISABLE KEYS */;
LOCK TABLES `contacts_contact` WRITE;
INSERT INTO `book`.`contacts_contact` VALUES  (6,0,'Hernan Dario','blamat88@gmail.com','23929329','3003985997'),
 (7,1,'osdfsdf','juan@hotmail.com','23929329','1919191919'),
 (8,1,'cddsflos','juan@hotmail.com','23929329','1919191919'),
 (26,8,'miguelon','blamat88@hotmail.com','342323','2323232');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contacts_contact` ENABLE KEYS */;


--
-- Definition of table `book`.`contacts_contacthistory`
--

DROP TABLE IF EXISTS `book`.`contacts_contacthistory`;
CREATE TABLE  `book`.`contacts_contacthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `history` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `edited` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id_refs_id_4c12f384` (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`contacts_contacthistory`
--

/*!40000 ALTER TABLE `contacts_contacthistory` DISABLE KEYS */;
LOCK TABLES `contacts_contacthistory` WRITE;
INSERT INTO `book`.`contacts_contacthistory` VALUES  (13,6,'call','2011-04-22 19:55:08','2011-04-22 19:55:08'),
 (27,26,'call','2011-04-23 01:42:40','2011-04-23 01:42:40'),
 (26,26,'no_call','2011-04-23 01:42:37','2011-04-23 01:42:37');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contacts_contacthistory` ENABLE KEYS */;


--
-- Definition of table `book`.`django_admin_log`
--

DROP TABLE IF EXISTS `book`.`django_admin_log`;
CREATE TABLE  `book`.`django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_id_refs_id_288599e6` (`content_type_id`),
  KEY `user_id_refs_id_c8665aa` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
LOCK TABLES `django_admin_log` WRITE;
INSERT INTO `book`.`django_admin_log` VALUES  (1,'2011-04-21 17:17:25',1,12,'1',' call to pedro ',2,'Changed to_do.'),
 (2,'2011-04-21 17:46:20',1,12,'1',' send email to Breiner ',2,'Changed to_do.'),
 (3,'2011-04-21 19:27:10',1,12,'2',' send email to Breiner ',1,''),
 (4,'2011-04-21 19:27:30',1,12,'3',' call to daniel ',1,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


--
-- Definition of table `book`.`django_content_type`
--

DROP TABLE IF EXISTS `book`.`django_content_type`;
CREATE TABLE  `book`.`django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `book`.`django_content_type` VALUES  (1,'permission','auth','permission'),
 (2,'group','auth','group'),
 (3,'user','auth','user'),
 (4,'message','auth','message'),
 (5,'content type','contenttypes','contenttype'),
 (6,'session','sessions','session'),
 (7,'site','sites','site'),
 (8,'log entry','admin','logentry'),
 (9,'profile','profiles','profile'),
 (10,'contact','contacts','contact'),
 (11,'contact history','contacts','contacthistory'),
 (12,'event','todo','event'),
 (13,'facebook session','facebook','facebooksession'),
 (14,'migration history','south','migrationhistory'),
 (15,'user object permission','guardian','userobjectpermission'),
 (16,'group object permission','guardian','groupobjectpermission'),
 (17,'userena registration','userena','userenasignup'),
 (18,'contact','umessages','messagecontact'),
 (19,'recipient','umessages','messagerecipient'),
 (20,'message','umessages','message'),
 (21,'source','easy_thumbnails','source'),
 (22,'thumbnail','easy_thumbnails','thumbnail');
UNLOCK TABLES;
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


--
-- Definition of table `book`.`django_session`
--

DROP TABLE IF EXISTS `book`.`django_session`;
CREATE TABLE  `book`.`django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
LOCK TABLES `django_session` WRITE;
INSERT INTO `book`.`django_session` VALUES  ('a6ff6afa97ff4415caec9d4ee91096c9','ZGVkNDc0OGQ4ZDRmNjZhZGNiNmVhYjFiZGJlN2Q4ODZiYTI0NjE2ODqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEEdS4=\n','2011-05-05 19:33:45'),
 ('ec13cb2a7424d32b3888d34b15bcbc23','ZGVkNDc0OGQ4ZDRmNjZhZGNiNmVhYjFiZGJlN2Q4ODZiYTI0NjE2ODqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEEdS4=\n','2011-05-05 19:36:02'),
 ('a784766d5a0e957c8a7179ecadb5fcc8','ZGVkNDc0OGQ4ZDRmNjZhZGNiNmVhYjFiZGJlN2Q4ODZiYTI0NjE2ODqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEEdS4=\n','2011-05-06 11:15:42'),
 ('40b147551d52aae53edec623129b5a85','ZWQ1NmJjMzM0NWQxMzIxNTczYzg4OGJhMWYxYzRhZGFjZGRkNzhiOTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVCnRlc3Rjb29raWVxA1UGd29ya2VkcQRVEl9hdXRoX3VzZXJfYmFja2VuZHEF\nVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJlbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBlUNX2F1dGhf\ndXNlcl9pZHEHigEEdS4=\n','2011-05-06 02:38:51'),
 ('01ba9a82e29ea5ee694f14546e38f990','ZGVkNDc0OGQ4ZDRmNjZhZGNiNmVhYjFiZGJlN2Q4ODZiYTI0NjE2ODqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEEdS4=\n','2011-05-06 18:47:47'),
 ('0ef86b488442e5fd9f9b936563bbd15e','ZGVkNDc0OGQ4ZDRmNjZhZGNiNmVhYjFiZGJlN2Q4ODZiYTI0NjE2ODqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEEdS4=\n','2011-05-06 19:50:20'),
 ('93b0598312300fb7be28cc7b79084fee','OGEyNDRhODFjZjgwMGQxYTM4YjMzZjhlOGEyYWJkNmMwN2Q4NDQ4MDqAAn1xAS4=\n','2011-05-07 03:20:54'),
 ('36c38ebe9036e882eff0d3e795f79efa','OGEyNDRhODFjZjgwMGQxYTM4YjMzZjhlOGEyYWJkNmMwN2Q4NDQ4MDqAAn1xAS4=\n','2011-05-07 03:20:54'),
 ('678f61844d4ddd0d39680cdf59218bd8','ZmVkYTYyMjhkYzY0NmFhMjEzMTQyNGVmNjI0NzUxNWU5OTUxMDEwYjqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS11c2VyZW5hLmJhY2tlbmRzLlVzZXJl\nbmFBdXRoZW50aWNhdGlvbkJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEHdS4=\n','2011-05-07 02:48:12'),
 ('2fba27893733aed6486e20da6475f63d','OGEyNDRhODFjZjgwMGQxYTM4YjMzZjhlOGEyYWJkNmMwN2Q4NDQ4MDqAAn1xAS4=\n','2011-05-13 15:33:47');
UNLOCK TABLES;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


--
-- Definition of table `book`.`django_site`
--

DROP TABLE IF EXISTS `book`.`django_site`;
CREATE TABLE  `book`.`django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`django_site`
--

/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
LOCK TABLES `django_site` WRITE;
INSERT INTO `book`.`django_site` VALUES  (1,'localhost:8000','mango project');
UNLOCK TABLES;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;


--
-- Definition of table `book`.`easy_thumbnails_source`
--

DROP TABLE IF EXISTS `book`.`easy_thumbnails_source`;
CREATE TABLE  `book`.`easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '2009-11-22 21:16:23',
  `storage_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easy_thumbnails_source_name` (`name`),
  KEY `easy_thumbnails_source_storage_hash` (`storage_hash`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`easy_thumbnails_source`
--

/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
LOCK TABLES `easy_thumbnails_source` WRITE;
INSERT INTO `book`.`easy_thumbnails_source` VALUES  (1,'mugshots/3702320132.png','2011-04-21 15:04:51','f9bde26a1556cd667f742bd34ec7c55e'),
 (2,'mugshots/c4c6e50dbe.jpg','2011-04-21 19:00:39','f9bde26a1556cd667f742bd34ec7c55e'),
 (3,'mugshots/52d236f04a.jpg','2011-04-22 01:22:17','f9bde26a1556cd667f742bd34ec7c55e'),
 (4,'mugshots/c27a9abfc3.jpg','2011-04-22 02:39:08','f9bde26a1556cd667f742bd34ec7c55e'),
 (5,'mugshots/a5370b06f2.jpg','2011-04-22 10:14:27','f9bde26a1556cd667f742bd34ec7c55e'),
 (6,'mugshots/5ae6f70143.png','2011-04-22 10:15:10','f9bde26a1556cd667f742bd34ec7c55e'),
 (7,'mugshots/67a1101388.jpg','2011-04-22 15:15:57','f9bde26a1556cd667f742bd34ec7c55e'),
 (8,'mugshots/5ce0c7c08d.django','2011-04-22 16:41:58','f9bde26a1556cd667f742bd34ec7c55e'),
 (9,'mugshots/7b22bbd9ae.django','2011-04-23 00:45:10','f9bde26a1556cd667f742bd34ec7c55e');
UNLOCK TABLES;
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;


--
-- Definition of table `book`.`easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `book`.`easy_thumbnails_thumbnail`;
CREATE TABLE  `book`.`easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '2009-11-22 21:16:23',
  `source_id` int(11) NOT NULL,
  `storage_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easy_thumbnails_thumbnail_7607617b` (`source_id`),
  KEY `easy_thumbnails_thumbnail_name` (`name`),
  KEY `easy_thumbnails_thumbnail_storage_hash` (`storage_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`easy_thumbnails_thumbnail`
--

/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;


--
-- Definition of table `book`.`facebook_facebooksession`
--

DROP TABLE IF EXISTS `book`.`facebook_facebooksession`;
CREATE TABLE  `book`.`facebook_facebooksession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(103) NOT NULL,
  `expires` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token` (`access_token`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `user_id` (`user_id`,`uid`),
  UNIQUE KEY `access_token_2` (`access_token`,`expires`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`facebook_facebooksession`
--

/*!40000 ALTER TABLE `facebook_facebooksession` DISABLE KEYS */;
LOCK TABLES `facebook_facebooksession` WRITE;
INSERT INTO `book`.`facebook_facebooksession` VALUES  (2,'153309531399400|2.IZd3r1VZ4jNdn4vYpLeyCQ__.3600.1304103600.1-615460604|Cmh8x6P1tl-t3liu_csbuHdmuQo',4839,NULL,NULL),
 (3,'153309531399400|2.Uq1CnShAgGmbJT01y4XrZQ__.3600.1304114400.1-615460604|VbbEOZpXgE5N00G73JQdgWL5k6Q',5368,14,615460604);
UNLOCK TABLES;
/*!40000 ALTER TABLE `facebook_facebooksession` ENABLE KEYS */;


--
-- Definition of table `book`.`guardian_groupobjectpermission`
--

DROP TABLE IF EXISTS `book`.`guardian_groupobjectpermission`;
CREATE TABLE  `book`.`guardian_groupobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `object_pk` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectpermission_object_pk_122874e9_uniq` (`object_pk`,`group_id`,`content_type_id`,`permission_id`),
  KEY `guardian_groupobjectpermission_1e014c8f` (`permission_id`),
  KEY `guardian_groupobjectpermission_1bb8f392` (`content_type_id`),
  KEY `guardian_groupobjectpermission_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`guardian_groupobjectpermission`
--

/*!40000 ALTER TABLE `guardian_groupobjectpermission` DISABLE KEYS */;
LOCK TABLES `guardian_groupobjectpermission` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` ENABLE KEYS */;


--
-- Definition of table `book`.`guardian_userobjectpermission`
--

DROP TABLE IF EXISTS `book`.`guardian_userobjectpermission`;
CREATE TABLE  `book`.`guardian_userobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `object_pk` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermission_object_pk_2084f8ff_uniq` (`object_pk`,`user_id`,`content_type_id`,`permission_id`),
  KEY `guardian_userobjectpermission_1e014c8f` (`permission_id`),
  KEY `guardian_userobjectpermission_1bb8f392` (`content_type_id`),
  KEY `guardian_userobjectpermission_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`guardian_userobjectpermission`
--

/*!40000 ALTER TABLE `guardian_userobjectpermission` DISABLE KEYS */;
LOCK TABLES `guardian_userobjectpermission` WRITE;
INSERT INTO `book`.`guardian_userobjectpermission` VALUES  (1,28,9,3,'1'),
 (2,26,9,3,'1'),
 (3,8,3,3,'3'),
 (4,9,3,3,'3'),
 (5,28,9,4,'2'),
 (6,26,9,4,'2'),
 (7,8,3,4,'4'),
 (8,9,3,4,'4'),
 (9,28,9,5,'3'),
 (10,26,9,5,'3'),
 (11,8,3,5,'5'),
 (12,9,3,5,'5'),
 (13,28,9,6,'4'),
 (14,26,9,6,'4'),
 (15,8,3,6,'6'),
 (16,9,3,6,'6'),
 (17,28,9,7,'5'),
 (18,26,9,7,'5'),
 (19,8,3,7,'7'),
 (20,9,3,7,'7'),
 (21,28,9,8,'6'),
 (22,26,9,8,'6'),
 (23,8,3,8,'8'),
 (24,9,3,8,'8'),
 (25,28,9,9,'7'),
 (26,26,9,9,'7'),
 (27,8,3,9,'9'),
 (28,9,3,9,'9'),
 (29,28,9,10,'8'),
 (30,26,9,10,'8'),
 (31,8,3,10,'10'),
 (32,9,3,10,'10'),
 (33,28,9,11,'9'),
 (34,26,9,11,'9'),
 (35,8,3,11,'11'),
 (36,9,3,11,'11'),
 (37,28,9,12,'10'),
 (38,26,9,12,'10'),
 (39,8,3,12,'12'),
 (40,9,3,12,'12'),
 (41,28,9,13,'11'),
 (42,26,9,13,'11'),
 (43,8,3,13,'13'),
 (44,9,3,13,'13'),
 (45,28,9,14,'12'),
 (46,26,9,14,'12'),
 (47,8,3,14,'14'),
 (48,9,3,14,'14');
UNLOCK TABLES;
/*!40000 ALTER TABLE `guardian_userobjectpermission` ENABLE KEYS */;


--
-- Definition of table `book`.`profiles_profile`
--

DROP TABLE IF EXISTS `book`.`profiles_profile`;
CREATE TABLE  `book`.`profiles_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mugshot` varchar(100) NOT NULL,
  `privacy` varchar(15) NOT NULL,
  `language` varchar(4) NOT NULL,
  `gender` smallint(5) unsigned DEFAULT NULL,
  `facebook_url` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  `location` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `about_me` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`profiles_profile`
--

/*!40000 ALTER TABLE `profiles_profile` DISABLE KEYS */;
LOCK TABLES `profiles_profile` WRITE;
INSERT INTO `book`.`profiles_profile` VALUES  (1,3,'','registered','en',NULL,'','','',NULL,''),
 (2,4,'mugshots/5ce0c7c08d.django','open','en',1,'','','',NULL,'todo bn todo bn'),
 (3,5,'','registered','en',NULL,'','','',NULL,''),
 (4,6,'','registered','en',NULL,'','','',NULL,''),
 (5,7,'mugshots/7b22bbd9ae.django','registered','en',1,'','','Barranquilla','1988-12-14','ok ok ok'),
 (7,9,'','registered','en',NULL,'','','',NULL,''),
 (8,10,'','registered','en',NULL,'','','',NULL,''),
 (9,11,'','registered','en',NULL,'','','',NULL,''),
 (10,12,'','registered','en',NULL,'','','',NULL,''),
 (11,13,'','registered','en',NULL,'','','',NULL,''),
 (12,14,'','registered','en',NULL,'http://www.facebook.com/blancomatos','','',NULL,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `profiles_profile` ENABLE KEYS */;


--
-- Definition of table `book`.`south_migrationhistory`
--

DROP TABLE IF EXISTS `book`.`south_migrationhistory`;
CREATE TABLE  `book`.`south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`south_migrationhistory`
--

/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
LOCK TABLES `south_migrationhistory` WRITE;
INSERT INTO `book`.`south_migrationhistory` VALUES  (1,'guardian','0001_initial','2011-04-21 19:54:40'),
 (2,'guardian','0002_auto__add_field_groupobjectpermission_object_pk__add_field_userobjectp','2011-04-21 19:54:40'),
 (3,'guardian','0003_update_objectpermission_object_pk','2011-04-21 19:54:40'),
 (4,'guardian','0004_auto__del_field_groupobjectpermission_object_id__del_unique_groupobjec','2011-04-21 19:54:41'),
 (5,'guardian','0005_auto__chg_field_groupobjectpermission_object_pk__chg_field_userobjectp','2011-04-21 19:54:41'),
 (6,'userena','0001_initial','2011-04-21 19:54:51'),
 (7,'umessages','0001_initial','2011-04-21 19:55:31'),
 (8,'easy_thumbnails','0001_initial','2011-04-21 19:56:24'),
 (9,'easy_thumbnails','0002_filename_indexes','2011-04-21 19:56:25'),
 (10,'easy_thumbnails','0003_auto__add_storagenew','2011-04-21 19:56:25'),
 (11,'easy_thumbnails','0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new','2011-04-21 19:56:25'),
 (12,'easy_thumbnails','0005_storage_fks_null','2011-04-21 19:56:26'),
 (13,'easy_thumbnails','0006_copy_storage','2011-04-21 19:56:26'),
 (14,'easy_thumbnails','0007_storagenew_fks_not_null','2011-04-21 19:56:26'),
 (15,'easy_thumbnails','0008_auto__del_field_source_storage__del_field_thumbnail_storage','2011-04-21 19:56:26'),
 (16,'easy_thumbnails','0009_auto__del_storage','2011-04-21 19:56:26'),
 (17,'easy_thumbnails','0010_rename_storage','2011-04-21 19:56:27'),
 (18,'easy_thumbnails','0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash','2011-04-21 19:56:27'),
 (19,'easy_thumbnails','0012_build_storage_hashes','2011-04-21 19:56:27'),
 (20,'easy_thumbnails','0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora','2011-04-21 19:56:28');
UNLOCK TABLES;
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;


--
-- Definition of table `book`.`todo_event`
--

DROP TABLE IF EXISTS `book`.`todo_event`;
CREATE TABLE  `book`.`todo_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `to_do` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `todo_event_170b8823` (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`todo_event`
--

/*!40000 ALTER TABLE `todo_event` DISABLE KEYS */;
LOCK TABLES `todo_event` WRITE;
INSERT INTO `book`.`todo_event` VALUES  (5,0,'call','2011-04-22',0),
 (3,0,'call','2011-04-21',1),
 (4,0,'send email','2011-04-23',0),
 (6,0,'send email','2011-04-20',0),
 (7,0,'send email','2011-04-20',1),
 (8,6,'call','2011-12-12',1),
 (9,0,'call','2011-12-12',1),
 (10,0,'send email','2011-04-12',0),
 (11,0,'call','2011-04-05',0),
 (12,0,'call','2011-04-05',0),
 (13,0,'send email','2011-04-28',0),
 (14,0,'call','2011-04-21',0),
 (15,0,'send email','2011-04-14',0),
 (16,0,'call','2011-04-21',0),
 (17,0,'send email','2011-04-19',0),
 (18,0,'send email','2011-04-20',0),
 (19,26,'call','2011-04-29',0),
 (20,0,'call','2011-04-26',0),
 (21,0,'call','2011-04-21',1),
 (22,0,'send email','2011-04-13',0),
 (23,0,'send email','2011-04-29',0),
 (24,0,'call','2011-04-05',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `todo_event` ENABLE KEYS */;


--
-- Definition of table `book`.`umessages_message`
--

DROP TABLE IF EXISTS `book`.`umessages_message`;
CREATE TABLE  `book`.`umessages_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sent_at` datetime NOT NULL,
  `sender_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umessages_message_6fe0a617` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`umessages_message`
--

/*!40000 ALTER TABLE `umessages_message` DISABLE KEYS */;
LOCK TABLES `umessages_message` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `umessages_message` ENABLE KEYS */;


--
-- Definition of table `book`.`umessages_messagecontact`
--

DROP TABLE IF EXISTS `book`.`umessages_messagecontact`;
CREATE TABLE  `book`.`umessages_messagecontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `latest_message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `umessages_messagecontact_from_user_id_5cd42e84_uniq` (`from_user_id`,`to_user_id`),
  KEY `umessages_messagecontact_74b00be1` (`from_user_id`),
  KEY `umessages_messagecontact_315477a4` (`to_user_id`),
  KEY `umessages_messagecontact_42393cff` (`latest_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`umessages_messagecontact`
--

/*!40000 ALTER TABLE `umessages_messagecontact` DISABLE KEYS */;
LOCK TABLES `umessages_messagecontact` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `umessages_messagecontact` ENABLE KEYS */;


--
-- Definition of table `book`.`umessages_messagerecipient`
--

DROP TABLE IF EXISTS `book`.`umessages_messagerecipient`;
CREATE TABLE  `book`.`umessages_messagerecipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umessages_messagerecipient_403f60f` (`user_id`),
  KEY `umessages_messagerecipient_38373776` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`umessages_messagerecipient`
--

/*!40000 ALTER TABLE `umessages_messagerecipient` DISABLE KEYS */;
LOCK TABLES `umessages_messagerecipient` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `umessages_messagerecipient` ENABLE KEYS */;


--
-- Definition of table `book`.`userena_userenasignup`
--

DROP TABLE IF EXISTS `book`.`userena_userenasignup`;
CREATE TABLE  `book`.`userena_userenasignup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `activation_key` varchar(40) NOT NULL,
  `activation_notification_send` tinyint(1) NOT NULL DEFAULT '0',
  `email_unconfirmed` varchar(75) NOT NULL,
  `email_confirmation_key` varchar(40) NOT NULL,
  `email_confirmation_key_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`.`userena_userenasignup`
--

/*!40000 ALTER TABLE `userena_userenasignup` DISABLE KEYS */;
LOCK TABLES `userena_userenasignup` WRITE;
INSERT INTO `book`.`userena_userenasignup` VALUES  (1,3,NULL,'bafdefbf71f3d455de6356e6befa42bf06a0b2c1',0,'','',NULL),
 (2,4,NULL,'ALREADY_ACTIVATED',0,'','',NULL),
 (3,5,NULL,'5bb4f88ba78e24a76f5628c864dec1a9f6e1f6cc',0,'','',NULL),
 (4,6,NULL,'eca53e7a32ae7eba0a11dfb252d6c6ffb1bbd059',0,'','',NULL),
 (5,7,NULL,'ALREADY_ACTIVATED',0,'','',NULL),
 (6,9,NULL,'7010fa9dd1e735bee5f5cf44b594b4ef712f897f',0,'','',NULL),
 (7,10,NULL,'41bfd2b21cfb89b668101ed8f9b22712cb679448',0,'','',NULL),
 (8,11,NULL,'d4d21714018226cec7a15be3c8cee127357393b4',0,'','',NULL),
 (9,12,NULL,'c1c8f469dcbdf0f9827864365e8b12e84af680d3',0,'','',NULL),
 (10,13,NULL,'ALREADY_ACTIVATED',0,'','',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `userena_userenasignup` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
