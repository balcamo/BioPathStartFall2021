-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: ZachsBeast    Database: biochemDB
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (7,1,37),(6,1,41),(5,1,45);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can view log entry',1,'view_logentry'),(20,'Can view permission',3,'view_permission'),(21,'Can view group',2,'view_group'),(22,'Can view user',4,'view_user'),(23,'Can view content type',5,'view_contenttype'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add user',8,'add_customuser'),(30,'Can change user',8,'change_customuser'),(31,'Can delete user',8,'delete_customuser'),(32,'Can view user',8,'view_customuser'),(33,'Can add module',9,'add_module'),(34,'Can change module',9,'change_module'),(35,'Can delete module',9,'delete_module'),(36,'Can view module',9,'view_module'),(37,'Can add substrates',10,'add_substrates'),(38,'Can change substrates',10,'change_substrates'),(39,'Can delete substrates',10,'delete_substrates'),(40,'Can view substrates',10,'view_substrates'),(41,'Can add products',11,'add_products'),(42,'Can change products',11,'change_products'),(43,'Can delete products',11,'delete_products'),(44,'Can view products',11,'view_products'),(45,'Can add model',12,'add_model'),(46,'Can change model',12,'change_model'),(47,'Can delete model',12,'delete_model'),(48,'Can view model',12,'view_model');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$OOzXmCDF70sm$fzLB40LkZa82t/MGV7owTDmi3dy8/tafbkvSUZcTmYQ=','2019-04-29 22:55:40.647178',1,'sjoyce2','','','sjoyce2@zagmail.gonzaga.edu',1,1,'2018-10-29 01:47:16.232106'),(2,'pbkdf2_sha256$120000$KBFUGxnADcHt$h028desl082bGFpN8ln2wTziqfr6YvChmu+3IA/wYm0=','2019-04-29 22:28:13.621291',0,'user1','','','',0,1,'2018-11-30 04:11:48.000000'),(11,'pbkdf2_sha256$120000$OfhDnwMgoeg5$LB4bFcyQ3bHC7vwaCazy+YF545SJ3Tr4nrnxwY6Cnrw=',NULL,1,'watsonj','Jeffrey','Watson','watsonj@gonzaga.edu',1,1,'2019-03-07 00:29:27.000000'),(19,'pbkdf2_sha256$120000$NoeEvR9YlWIa$49xpP50hWXivYqO5xTR9PspwnUPv4sYfjXtaikb9fn4=','2019-04-11 19:50:24.017850',0,'garettpalm','Palm','','gpalm@zagmail.gonzaga.edu',0,1,'2019-03-25 23:16:56.358129'),(31,'pbkdf2_sha256$120000$Fkul2FMim8ZT$hzrXpQieufhjl8nBfh1WcDXReVrRl9/H3ZFSQvFzXeY=','2019-05-07 16:09:51.450985',0,'klarson2','kayl','lar','klarson7@zagmail.gonzaga.edu',0,1,'2019-04-08 22:07:08.116218'),(32,'pbkdf2_sha256$120000$Ed7LKSBLAwNd$wkHY2pI5RlqZKEZT/gi6YSkPPZ0laiy6TbNcTQwhdTU=','2019-04-08 22:10:22.225702',0,'user6','User','Six','user6@gmail.com',0,1,'2019-04-08 22:10:22.051491'),(33,'pbkdf2_sha256$120000$J0KhJxDIDzeo$NOisrTL72m8YjgMqu0VTdD2W0v108fW7zHL5BFkZOrw=','2019-04-10 15:08:17.842433',0,'user7','User','Seven','user7@gmail.com',0,1,'2019-04-08 22:46:23.755828'),(34,'pbkdf2_sha256$120000$U8mhPaB3TZ6q$raPoCv/oool3+uQ01yeD+lwUxVwJ3Yy5q/8kkQgTwfQ=','2019-04-10 23:20:51.268825',0,'watsonj88','Jeff','Watson','watsonj@gonzaga.edu',0,1,'2019-04-10 23:20:50.897081'),(35,'pbkdf2_sha256$120000$kTo13GfWWEFK$GWJ+Yyf6yEcknLu4L6BeQk/ZgoHjQKEqUsRSDouysqo=','2019-04-11 18:05:51.829470',0,'swastewart','Sam','Stewart','swastewart@gmail.com',0,1,'2019-04-11 18:05:51.637256'),(36,'pbkdf2_sha256$120000$q8VWd2FU5goo$duRu1qJ4TneUOuwNKrasnvryyocHdCfNd1FIjB8p00U=','2019-04-11 18:22:18.399063',0,'leamy.kathleen','Kathleen','Leamy','leamy@gonzaga.edu',0,1,'2019-04-11 18:22:18.218638'),(37,'pbkdf2_sha256$120000$FyNJmvNrwtuc$OjOm5H4ZvCjvyEgkLn8JnLfufwD/Lbw1BL6W0H8Lvvk=','2019-04-15 22:29:17.889264',0,'gpalm','Garett','Palm','gpalm@zagmail.gonzaga.edu',0,1,'2019-04-11 20:01:19.824335'),(38,'pbkdf2_sha256$120000$l5U26FXZuGv2$swCOpUNHAYGV3zpABtSK2aRXMZwar9cMm+Fz5JA70pM=','2019-04-15 23:39:41.237886',0,'garett','Garett','Palm','gthep43@gmail.com',0,1,'2019-04-15 23:39:37.251844'),(39,'pbkdf2_sha256$120000$4MqxyRLRE3AF$OraDQ3f7mHMt/k7k7oSXi3MaDweSYu0PV5ImWawVkp4=','2019-04-30 21:48:19.812326',0,'garettp','Palm','','gpalm@zagmail.gonzaga.edu',0,1,'2019-04-15 23:43:46.800498'),(40,'pbkdf2_sha256$120000$0vdJRCr5X4YY$qJ2cx+Cv+brd+3vsDaskTED1k6dWMHkIFbwNw/sL2FU=','2019-09-23 23:57:54.229127',0,'abrodhead_test','andrew','brodhead','abrodhead352@gmail.com',0,1,'2019-09-16 22:50:17.978994'),(41,'pbkdf2_sha256$120000$Qjl5760mT82Y$274KTw2HvDKriNl3Lo6spd/8DZPXHLns3LgdB4kRKO8=','2019-09-30 23:11:04.643112',0,'abrodhead_test2','Andrew','B','no@no.com',0,1,'2019-09-30 23:11:04.326974'),(42,'pbkdf2_sha256$150000$BxoqPmCAzGgy$XEVhxcfm1TFViy9UXIbdcH/B6QGDKUZfHj3ovP4whjE=','2020-02-19 17:40:48.904996',1,'zmckee_inst','Zach','M','zmckee@zagmail.gonzaga.edu',0,1,'2019-10-07 20:11:30.893921'),(43,'pbkdf2_sha256$120000$77Kdde5igTZu$6Nqd+2epziv9BoXQeJqENvl0Gzsp1ZblhJg0/QvQNIc=','2019-10-07 22:51:00.470699',0,'andrew','andrew','andrew','andrew@andrew.andrew',0,1,'2019-10-07 22:51:00.334928'),(44,'pbkdf2_sha256$120000$RMS6x7fycHqe$gm+MEjmypHA0VXl37cB6wIdezrQcaSpH3sOL01BfrcY=','2019-11-16 00:31:10.688155',0,'bdillan','Bob','Dillan','bobdillan866@gmail.com',0,1,'2019-10-21 21:24:05.196082'),(45,'pbkdf2_sha256$150000$wB9U5bYaknDX$xInFBXlLWBvurZcGMvOISTA4uQhYE0KrYJS2pzBWbd8=','2020-02-17 18:32:24.845382',0,'hughmonguswut','Hugh','Mongus','test2@testing.com',0,1,'2019-11-05 20:37:27.180367'),(46,'pbkdf2_sha256$120000$mRl63uY1xFuZ$DuqUvkZeWzDckm4JaTlrkgypkJgvwOamBtZhpAh9DdA=','2019-11-12 01:14:17.882109',0,'youreabiopath','you\'re','a','biopath@youreabiopath.edu',0,1,'2019-11-12 01:14:17.658282'),(47,'pbkdf2_sha256$120000$nADJkIdowQqf$ZSam/vagX7pI8/v2vEAwderDHhMIcfXhK4KmktNjYj8=','2020-01-27 23:23:07.695252',0,'Andrewb','Andrew','Andrew','a@a.com',0,1,'2019-11-17 20:17:00.926490'),(48,'pbkdf2_sha256$120000$zCtn4frm6fvt$9SUxs8id83YCDP6cacnr+aCIyTa5z0P1Yir+sQUiEBw=','2019-11-21 18:08:09.791274',0,'zachsmells','Luke','Sparjs','hi@g.com',0,1,'2019-11-21 18:08:09.531842'),(49,'pbkdf2_sha256$120000$I2Ys4KxZdJTv$tu2nygmFS3ISRLFnJjkLrjCRHpPZdOgWhq9tUvi0jlM=','2019-11-21 23:27:24.323487',0,'jdistinti','John','Distinti','a@b.com',0,1,'2019-11-21 23:27:24.062604'),(50,'pbkdf2_sha256$120000$Cv6GArhLz2XJ$QMLNI+4EbpR3Lg9olL1ArRVx4ki/WKvajozSEd6gU54=','2019-12-05 00:29:53.320242',0,'demo','demo','demo','demo@d.emo',0,1,'2019-11-25 20:26:28.553859'),(51,'pbkdf2_sha256$120000$RjDGGbq7tuCV$wcZWGmFKRK7OLjt67bPHJgntmd+55lxtOcd57x2YlcY=','2020-02-17 17:11:18.322085',0,'bob','bob','bob','bob@bob.com',0,1,'2020-01-19 20:28:54.224279'),(52,'pbkdf2_sha256$120000$56Ud1GOdkeeL$AgyIt8EiypPtZy25QQ2lDchr1+I3qQZ2A6lBQWkCJSs=','2020-01-21 23:29:33.039733',0,'bob1','','','BOB@bob.com',0,1,'2020-01-21 23:29:32.901709'),(53,'pbkdf2_sha256$120000$rntxxcIH22CW$Ryv0HLVVpWSbLUqHIzD6oxevWBwwMtc0W+6vLH2QL68=','2020-01-22 19:02:14.240648',0,'IamJosh','Josh','Go','secretly@andrew.com',0,1,'2020-01-22 19:02:14.059730'),(54,'pbkdf2_sha256$150000$Yu4cnGbbPt4H$nlcNYbEKgtybbwDtSHQJlh/p45zPmK7X4Nk/DlZQoYs=','2020-01-26 18:44:47.262064',0,'a','b','c','a@b.com',0,1,'2020-01-26 18:44:46.663613'),(55,'pbkdf2_sha256$150000$bMFanjAlV6ZQ$Hv0whOl5eOke+YLlXE7wksOXSRvXrztk2KOTMcomwpY=','2020-02-12 01:09:10.708563',1,'jgo','','','jgo@zagmail.gonzaga.edu',1,1,'2020-01-30 00:41:29.238653'),(56,'pbkdf2_sha256$150000$mh34PkxdFs8b$Q5XVBor4ak5Uvrrz6T2reGgTk3KEg7/QRbGBWr91vR0=','2020-02-12 01:08:00.804300',0,'avg_user','avg','user','avg@user.com',0,1,'2020-02-11 22:48:24.683155'),(57,'pbkdf2_sha256$150000$f4zDjuDAvsHY$ZeourlmmzwXkOTjcNmEUFQwfMV9wwcnscXVjXSKgdF8=','2020-02-17 21:20:40.940684',0,'t','t','t','t@t.com',0,1,'2020-02-17 21:20:18.033096'),(58,'pbkdf2_sha256$150000$p5ReuQFQXVbW$B0cDJ7M/N9kQoL5zB5w/Q3cgjqcGxXHBYvOO4n5FcQk=','2020-04-06 23:32:23.564226',1,'zmckee_admin','','','a@a.com',1,1,'2020-04-05 19:13:49.480421'),(59,'pbkdf2_sha256$150000$2XAhVaDm52Oj$7u9G+rkyNp8byFf1qNFs3Z3CAL9jaQo4ledglQYVqg8=',NULL,1,'public_pathway_user','','','',0,1,'2020-04-05 19:14:27.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-29 02:43:01.635488','2','user1',1,'[{\"added\": {}}]',7,1),(2,'2018-10-29 22:01:28.320934','2','user1',3,'',7,1),(3,'2018-10-29 22:09:53.105936','3','user1',1,'[{\"added\": {}}]',7,1),(4,'2018-11-11 01:04:37.526294','3','user1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,1),(5,'2018-11-12 22:34:47.779335','3','user1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,1),(6,'2018-11-30 04:11:48.468264','2','user1',1,'[{\"added\": {}}]',4,1),(7,'2018-11-30 04:12:00.698519','2','user1',2,'[]',4,1),(8,'2019-01-21 00:56:31.470122','3','user2',3,'',4,1),(9,'2019-01-21 00:58:14.750943','4','user2',3,'',4,1),(10,'2019-03-07 00:29:27.271022','11','watsonj',1,'[{\"added\": {}}]',4,1),(11,'2019-03-07 00:30:56.097789','11','watsonj',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_superuser\"]}}]',4,1),(12,'2019-03-07 00:31:09.867941','11','watsonj',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(13,'2019-04-02 00:16:07.932610','22','brooke_mctoney',3,'',4,1),(14,'2019-04-02 00:16:07.951532','24','macDaddyWithASuperLongUsernameeeeeeeeBitch',3,'',4,1),(15,'2019-04-02 00:16:07.954378','9','test',3,'',4,1),(16,'2019-04-02 00:16:07.957751','10','test1',3,'',4,1),(17,'2019-04-02 00:16:07.962193','8','test22',3,'',4,1),(18,'2019-04-02 00:16:07.964625','7','test25',3,'',4,1),(19,'2019-04-02 00:16:07.966497','18','veryverylongusername',3,'',4,1),(20,'2019-04-02 00:16:07.969082','25','yoWhatsUpGuysMeowFuckBowersHopeHeNeverSeesThis696969696969696969696969696969696420',3,'',4,1),(21,'2020-02-11 22:19:45.606643','1','Admin',1,'[{\"added\": {}}]',2,55),(22,'2020-02-11 22:51:26.866243','1','Admin',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',2,55),(23,'2020-02-11 22:57:20.169905','1','Admin',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',2,55),(24,'2020-02-12 00:35:03.992166','1','Admin',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',2,55),(25,'2020-04-05 19:14:27.245843','59','public_pathway_user',1,'[{\"added\": {}}]',4,58),(26,'2020-04-06 23:32:31.105403','59','public_pathway_user',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',4,58);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'testApp','customuser'),(12,'testApp','model'),(9,'testApp','module'),(11,'testApp','products'),(10,'testApp','substrates'),(7,'testApp','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-05 17:31:52.860064'),(2,'auth','0001_initial','2018-10-05 17:31:54.320302'),(3,'admin','0001_initial','2018-10-05 17:31:54.680481'),(4,'admin','0002_logentry_remove_auto_add','2018-10-05 17:31:54.699955'),(5,'contenttypes','0002_remove_content_type_name','2018-10-05 17:31:54.888251'),(6,'auth','0002_alter_permission_name_max_length','2018-10-05 17:31:54.901448'),(7,'auth','0003_alter_user_email_max_length','2018-10-05 17:31:54.914792'),(8,'auth','0004_alter_user_username_opts','2018-10-05 17:31:54.929871'),(9,'auth','0005_alter_user_last_login_null','2018-10-05 17:31:55.036025'),(10,'auth','0006_require_contenttypes_0002','2018-10-05 17:31:55.046767'),(11,'auth','0007_alter_validators_add_error_messages','2018-10-05 17:31:55.055419'),(12,'auth','0008_alter_user_username_max_length','2018-10-05 17:31:55.099953'),(13,'sessions','0001_initial','2018-10-05 17:31:55.180412'),(14,'admin','0003_logentry_add_action_flag_choices','2018-10-29 02:27:42.057472'),(15,'auth','0009_alter_user_last_name_max_length','2018-10-29 02:27:42.108893'),(16,'testApp','0001_initial','2018-10-29 02:27:42.167456'),(17,'testApp','0002_customuser','2018-11-30 03:31:08.286311'),(18,'testApp','0003_auto_20190129_0056','2019-01-29 01:05:02.384580'),(19,'testApp','0004_auto_20190129_0108','2019-01-29 01:08:37.038729'),(20,'testApp','0005_auto_20190129_0110','2019-01-31 18:56:27.121401'),(21,'testApp','0006_auto_20190129_0111','2019-01-31 18:56:27.155582'),(22,'testApp','0007_remove_module_userid','2019-01-31 18:56:27.160845'),(23,'testApp','0008_delete_module','2019-01-31 18:56:27.165113'),(24,'testApp','0009_module','2019-01-31 18:56:27.168463'),(25,'testApp','0010_auto_20190131_0011','2019-01-31 18:56:27.172010'),(26,'testApp','0011_module','2019-02-03 20:12:36.697210'),(27,'testApp','0012_auto_20190204_2353','2019-02-04 23:54:06.500658'),(28,'testApp','0013_products_substrates','2019-02-04 23:58:40.890859'),(29,'testApp','0014_auto_20190218_2102','2019-02-18 21:07:50.398475'),(30,'testApp','0015_auto_20190218_2229','2019-02-18 22:29:42.955560'),(31,'testApp','0016_auto_20190218_2234','2019-02-18 22:35:03.713281'),(32,'testApp','0017_auto_20190303_2248','2019-03-03 22:48:32.701734'),(33,'testApp','0002_auto_20190316_2341','2019-03-16 23:41:11.109978'),(34,'testApp','0003_auto_20190316_2343','2019-03-16 23:44:41.543292'),(35,'testApp','0004_auto_20190316_2343','2019-03-16 23:44:41.586900'),(36,'testApp','0005_auto_20190316_2344','2019-03-16 23:44:41.609887'),(37,'testApp','0006_auto_20190316_2344','2019-03-16 23:45:03.140603'),(38,'testApp','0017_auto_20190324_1821','2019-03-24 18:24:02.509913'),(39,'testApp','0018_auto_20190324_1825','2019-03-24 18:25:37.100696'),(40,'testApp','0019_auto_20190324_1825','2019-03-24 18:25:59.623733'),(41,'testApp','0020_merge_20190411_1742','2019-04-11 17:42:54.649986'),(42,'auth','0010_alter_group_name_max_length','2019-10-28 23:45:38.543901'),(43,'auth','0011_update_proxy_permissions','2019-10-28 23:45:38.604597');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0htliee3tbu7gz9fal0pakg0wqp87dc5','Y2QyOThjYzdmNDJmYzFmMGMxYzBjNDM3NTAzYmRkZTEwYTNjZjg2OTp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzhhYmRkMjU5Mzk3NzI3ZjlhM2RlNzgyYWFmZTZjM2I0OWZhYzNhNSJ9','2019-05-14 21:48:19.834121'),('0nh16zge3k8hfxeo6z090l1rez0yhbmu','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2018-12-17 01:51:31.533184'),('18f9favgd0dnmackyj3uiklmkyx6xgnp','NmVlYTZkNmY3ZDg0ZDlhODVkNjBmYjI5NTgxY2VhMjdlY2VlNzgzNDp7Il9hdXRoX3VzZXJfaWQiOiI0NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY4NzI4NmU2NWVjZWQ1NGY1NDYxY2Y3MDBhODRmMTUwN2Q1YTJkYyJ9','2019-11-28 18:49:35.902480'),('1ofq7cvix85h42u7b533puerxx87hmps','N2NjODVlOWZjOGUwYjExZDRiZTMxZThiOWRiYTUwNjEzNjg4NzM2ODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOGViZTRkNGFiNWM4MTU5Mzc2ODA0MjBiODVhNTM4YmIwMDc1ZjIxIn0=','2019-02-04 00:59:33.352178'),('1uw3pkbjpdeyhjvg10qt3h9tvk8delcm','ZGMwZDU1MDJiYWYwMDNiOWU5NzM3YzAwMTU4MjgwOTI5NzYyYTdkODp7fQ==','2019-04-04 20:18:32.953554'),('1wt9ezerjbok4122jzyqgp1o1wvjvxbq','ZTk0M2IzZjI3NTgyMzJhMzc2NGE1YzA2OTMzYTllYjg4M2M0NTc0Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTVmMDBhNWY1MmZkODEyMDFlNjE4ZGQ2YzFiM2NlOTM2NjRiYzc0NyJ9','2019-10-21 22:51:00.484283'),('25qejllmx57sxzcimbuhvyivxtn35bre','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-07 22:26:34.849107'),('2el4nvu2aavm9k1y25s9015i7zvqkg5g','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-29 23:37:39.844980'),('2lyg644zroq9awx3wzo7ifp0x3yfuv3t','OGFjOWY0NWY1ZDZhMjUwZjVlNjY2MzUwZGRkNmY3YjMxOTI4NTA1NTp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODUzMTdkMGJiZGVkNjZjNjU2NzEzZDA3ZjFhZTZmNWIyNjMxYjQ4YyJ9','2020-02-03 21:11:53.148845'),('2x75z6q1pxbe4kzfvielnxgd39j05vwk','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-06 17:25:56.979477'),('3fxbhx7hh1pqm3m8aus4qooa7lq3wxlj','MDAwMjQzOWI0MTBlYTZkOGViNWI4YjE0ZWI3MmM3ODYwMTU4ODI5MTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzYwN2I5OGIzMWYxY2Y0NWFmZDE0N2I4ZTFjNjkxOWY0ZDAzZTkzOSJ9','2019-10-21 22:49:54.744477'),('3k5om2po3kec56a3xj26njsa7mrv1wn7','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-07 22:58:15.940459'),('46dei61arx4e7kpb9v5z9wx3sx4p850e','YjAwZDM4NzU3NmUxM2Q2OGY1MTMwZTFkMzU2NGFjMDEyNGE5YjU5Zjp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTI3YzQxNWFjMGZlMzQwN2Y0OTlhZGUwYzRjOWFlNmEwNmJlNjVhMyJ9','2019-12-02 23:22:55.211619'),('47w8tphb0omrd02yc1lsy8msgqpzerqp','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-07 23:09:17.419225'),('4rav54wv35qd5v7b76jeivgremg9z2fj','YWU2ZTk3OTVlMDVmYjJiNjI1YjU2ZGNiNTc3MDdmMzVmZjU0ZmE0NTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQ5YjVlNWZkMzg3NTM1NWRlYzJkMWI3NzRjODFkZmE5YTBhZGI0YiJ9','2019-11-26 01:40:24.528939'),('4si80uy9lqykahrk29wkn1ov0r9lj9hs','Yjk0MmFlZWVmYmFlOGI5YWIyM2RiYWNjYTZjY2RlMWQyMWZiMTU2Mzp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQ3YTUzMDUyOGU2YmE3OGIyMDFmNjY5Yzc2NmNjODBjMzFhYWRjYSJ9','2019-11-26 01:14:17.893404'),('4t1nzcsfs0mnumvxwjb677p06l2maa6g','YWUxMjhhNTZkOTNjMmY0Y2VjMDU2ZTk2ZTVhZDBiYjMxMzZmMTZjNzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjMyMmI1YTQ0YTJkYTFlZmFhMTBjMjAwZTBmZDE5NzJlOTJmNTg5OSJ9','2020-01-31 23:21:28.229965'),('526oyvi74cqydz0cag4yh9rxr4t2i9zo','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-02 19:27:09.598055'),('572k95d4eiqi6c7ut7qd0n5mmm91q8i0','MDAwMjQzOWI0MTBlYTZkOGViNWI4YjE0ZWI3MmM3ODYwMTU4ODI5MTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzYwN2I5OGIzMWYxY2Y0NWFmZDE0N2I4ZTFjNjkxOWY0ZDAzZTkzOSJ9','2019-11-06 02:23:31.792473'),('5bzzb6b8covoij0uqgv8u9zzejv67tud','NTFmYTZjZWFjYTM0MzNmMTdlYmFkNDM0ODViOTNhOGZkYmQwNWYyNTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2QwNGMyZTFkMWZkY2Q4ZWU0OTg4NDI1NGZlOTNlZjhiYjA4OTI1In0=','2019-03-06 23:23:50.134787'),('5h9bbd4hr045kjic452rrp59cczyovhu','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-07 21:37:03.056180'),('62p013m6rowx9qvbjm9jdvjxw9uf2vfq','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-17 22:18:12.285454'),('64834wfwq5wdq0y65nl7ej84u45z7lb6','YWQ5NTU0ZDllYTUyMmQxZmYwYTVmOWE2N2YzMmZiMGJkNzcyY2M0Nzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzAyOWZiNDc0MjkxZWI0OGY2YTJiNjU3ZmQ5MjdkMzY3YmZkYzFmNiJ9','2020-02-07 22:47:11.889691'),('6io1mrfvxnzax9mwvkjzn26buowovjev','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-17 20:55:30.976514'),('7lt79bolxey3cij57ezjk2tahgluef9a','NDM1ZThkMmE2NjkwN2E1MTY5ZTU1YzgyZGUxYzc0Y2M4YWJjNTcxNDp7Il9hdXRoX3VzZXJfaWQiOiIzNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjU3MDEyMDFkOThlZDI4YTM2ZmNmNThmY2MwZjZhMmFiNzc3YmZjYyJ9','2019-04-25 18:22:18.418602'),('832c1d6juljow7zlm5oa4eigfm5izi07','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-05 00:53:19.976162'),('892patu22f1gcgtx3whjvh03jvnyp4x2','ZmU3NGRkMDQxNmEwMGNkZjI2YzYyN2U5MTRmZGViODE0ZDNkZmVkZjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDA4MmM1NGJlNTE2MWJlZDhhNGFmMTM5ZjUwYWI0YzNiYzU1NGY2YyJ9','2019-04-06 20:41:32.204788'),('89fy172q2x1v6053lqdj11m8xzwjjoag','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-26 01:08:39.470921'),('8dve5rnlgnzu53da7ux8wgajy46cmln1','YjAwZDM4NzU3NmUxM2Q2OGY1MTMwZTFkMzU2NGFjMDEyNGE5YjU5Zjp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTI3YzQxNWFjMGZlMzQwN2Y0OTlhZGUwYzRjOWFlNmEwNmJlNjVhMyJ9','2019-12-04 20:09:36.770584'),('8jfzhzvr8w9s2brxalhv6n8oq66a5aa7','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-06 19:45:11.928679'),('9crb73k0wtun9m5lvp6h0ss9ml6bcmdm','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-31 22:20:01.597505'),('9kvyog4nl4sxvc4ryljhosdlvgevs1yh','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-04 22:28:58.520094'),('9oi3l1gduq5zpl015puww55kni02pypb','M2I4NTUwMjIyZDA0NzBhMzg3NGY5ZDVkMTQzODFlZDRmMGU1ZjdiMDp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjllZmUwMmIxOGQwNmM0ZjhmYzc5ZDQxZDA5YTY4YzY5YmVlMmMyOCJ9','2019-12-18 23:29:40.758384'),('9pztx1kjon51sp9330cfev7oadixuod4','OGE5Mzc2NzMyZmU3ODRiOWZjMjY5M2MyYmQwOTZjZjUxNzJmYjdiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzcyNmFmMmM0ODIxNzUzMWM5OTU1MmZhNDkxNGUwNWRmMzgzNDM3In0=','2019-05-08 15:28:32.417218'),('9upmb4sj9t4acbh0c89basq9k1g4jfvh','YjAwZDM4NzU3NmUxM2Q2OGY1MTMwZTFkMzU2NGFjMDEyNGE5YjU5Zjp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTI3YzQxNWFjMGZlMzQwN2Y0OTlhZGUwYzRjOWFlNmEwNmJlNjVhMyJ9','2019-12-04 20:07:44.906669'),('a0lnmzzgil2vvvv413bgdwcqld42ymhh','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2018-12-19 18:13:14.522774'),('a6theig2ttq7cxjz8bxnxapfrdp1x7vl','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-17 23:34:12.639056'),('abqm4kyh4qeal08q5xh1qe4x6zdvy2h9','MWYxNDQ0YTVjOTJhZjM2OTcwMDgwMzY2MmI1MTc5OGRiYzI0MWI2NTp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTQyOGQ3NzVlNzI4Mjc1NWRmZDA4OTIzOWM1MTVkNGM4MGY1YTBhYyJ9','2020-02-18 03:46:57.848385'),('amm9t2stpxfy5utzkki35ztj6i9tjvcz','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2018-12-17 20:17:41.314618'),('b28g1po0hqi88b24epia3xxi72wwm0e5','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-30 21:37:22.546094'),('c8wrp7brso0eh9ejxywk23bl3dzr70j4','YmQ5MDY4OGUyMGMxZTc5ODQ2YTEzZmQzMjUwNzJhYjI2ZTkwODNjMTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDVhOTI5Y2Q5YmIzZDkxMzMwZThjNmNkNmFlZmU3ZDJlNjBkZjA2NyJ9','2019-05-21 16:09:51.471259'),('db5qp0dnno6py70x8ozlrd1ikzf5ahuu','MzVjNjUwNjk2YjAyN2I4YjlhMGRlNDUwYmVhZTM5ZWRlN2QyYjMzOTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDM5OTY1YTQ0YTgyMDIxOGUxMGEyZTU1YmQwMDExYWNjOGNkOWNkNyJ9','2019-04-10 15:33:17.399909'),('dfg0md6arh2h7c9tlqij7n0ddb0x7mgp','M2RjYzFlN2ViMjQyMzIwOTIxMzc4ZDMxYmIxYjQ2Y2M0MmFjYzE5OTp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZjYjlkMzRlMTIzMDdkMDdjNTJlNmNhOGEzMmVjMzA0OWYzYTAwZCJ9','2019-04-25 20:41:29.567766'),('dyg3x4jp7i3vm1j8e42de69c6gmcxr1m','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-06 02:38:17.467109'),('e7qm8rj5c3pqrhoaii2uv0fune5r4qyi','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-30 00:30:26.864319'),('ehw2xxmvjbbgbpp0x423439saawrjpuv','NDFjZmEwNzZlOTI2MmVjYWQ2YjFhOWQ2ZDZiOTZkOGY2YzI3OTZjYzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjYwYjhiZDY2ZTAxZmU5ODRmNzBkZmIxZTM4ZThkMzE1NDA4NjEzOSJ9','2020-02-28 17:23:55.278275'),('ei4gdit74wy16ndy1xt055pvsdtd8u1u','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-11 23:59:28.721074'),('ek1mplwvp1kre2dowsufejyph44johrw','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-30 00:31:10.697891'),('evosz8x9b0cxsx06dqceyar9u53dsje0','NmVlYTZkNmY3ZDg0ZDlhODVkNjBmYjI5NTgxY2VhMjdlY2VlNzgzNDp7Il9hdXRoX3VzZXJfaWQiOiI0NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY4NzI4NmU2NWVjZWQ1NGY1NDYxY2Y3MDBhODRmMTUwN2Q1YTJkYyJ9','2020-02-12 23:50:12.690685'),('evyfel7pe13ck6jixpbkjasv9w9x44it','NDFjZmEwNzZlOTI2MmVjYWQ2YjFhOWQ2ZDZiOTZkOGY2YzI3OTZjYzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjYwYjhiZDY2ZTAxZmU5ODRmNzBkZmIxZTM4ZThkMzE1NDA4NjEzOSJ9','2020-03-02 21:26:28.560492'),('ez2zg9h65rv7q412c6ejp8m960owrypo','ZjAxZmFkMjZkMjhmODI2OGZiNTEyYmU5YzZkOGRhZjRkOTNkMGQ0ZDp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODlmZWVlZDFmZmZkNzQ4YjkyMzFjZmQwZjUwYjkxN2MxZGQxZDEwOSJ9','2020-02-19 22:14:26.899912'),('f2x5cbdhnag0l5q1xeikf35cmzfaro8q','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-16 17:54:49.089120'),('hcup5gd5f795b9dtabqx3q4zpzt4b04f','OGFjOWY0NWY1ZDZhMjUwZjVlNjY2MzUwZGRkNmY3YjMxOTI4NTA1NTp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODUzMTdkMGJiZGVkNjZjNjU2NzEzZDA3ZjFhZTZmNWIyNjMxYjQ4YyJ9','2020-02-02 20:40:51.193258'),('hs6cbehxmz7xqr4x3g7m0pt6nknq9fox','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-26 00:39:28.933593'),('imwvsotk949jrc70ctw7jn152r3aifn7','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-17 23:29:28.149859'),('itlp74ulgk061d0dd3rjax75478f2yys','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-17 23:33:17.851961'),('j07gy3kjq2vx9usew97anmr3swj8zq04','NDFjZmEwNzZlOTI2MmVjYWQ2YjFhOWQ2ZDZiOTZkOGY2YzI3OTZjYzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjYwYjhiZDY2ZTAxZmU5ODRmNzBkZmIxZTM4ZThkMzE1NDA4NjEzOSJ9','2020-03-02 21:30:28.142546'),('jn9agvbyu2ky0qwfi280h80eixv13f67','MDAwMjQzOWI0MTBlYTZkOGViNWI4YjE0ZWI3MmM3ODYwMTU4ODI5MTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzYwN2I5OGIzMWYxY2Y0NWFmZDE0N2I4ZTFjNjkxOWY0ZDAzZTkzOSJ9','2019-10-29 00:01:57.527825'),('k8xmti0ggp2pipnl4owwdo4t70w72p9q','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-30 23:30:19.303023'),('kaaa46cuvt2sch2upm8n9iknqml6r676','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-23 18:50:14.603620'),('kdaphu71p6wpddordmt4osaa0do3m7d7','OGE0ODg3ZmEzNTk2OWJhMGU5YmQ1MTM4ZTQwNjgwZTM2YTcwYzdmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMDJmZjEzZTJhN2EwMTQ0MGI2ZjZmNTcwNjkwMzdjYzMzYWYxYTk4In0=','2018-12-24 22:18:00.033056'),('l4ilyd33gkp8gmpw4ay8537hi077ogn8','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-05-13 22:28:13.646254'),('ltcmjdon243wpwj5bgd5agenxas8veo8','ZDFkMjc4YTM1ZmRjYjcxZDg5MWY2OWNkMTdlMjQ1NDc2Yjk5YzViYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0MDZlMTBjNjgxZmY1ZGJhMDBmNDUwM2QwZDdiYmVlYjU4MWJjOTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-11-12 01:47:45.649157'),('m3hgesiifa4y8lo7911srjkc4m6zfuj0','OGE0ODg3ZmEzNTk2OWJhMGU5YmQ1MTM4ZTQwNjgwZTM2YTcwYzdmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMDJmZjEzZTJhN2EwMTQ0MGI2ZjZmNTcwNjkwMzdjYzMzYWYxYTk4In0=','2018-11-26 22:34:37.275481'),('m8kw1bkm4xzlizolo6l8dscbpielcd67','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-17 22:23:55.272334'),('n7txtlaxartb2dxilvsfztljpswudok8','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-17 22:18:41.301996'),('o699ha8v3vq0q5ev4tfgzfleqkhiehjh','ZGMwZDU1MDJiYWYwMDNiOWU5NzM3YzAwMTU4MjgwOTI5NzYyYTdkODp7fQ==','2019-04-04 20:25:18.404629'),('oon19lyfeovv5mmldao0x08xnf2rfw3n','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-25 00:41:58.267545'),('oqer3zuen2ksm7sejld6wico2osmohat','YzliMjAyMzkwNjU5Zjc1NDhlNmE5YjY0MTllNTY4NDI5MWQ3MTE2ZTp7Il9hdXRoX3VzZXJfaWQiOiIzNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTg2M2I2MGVkMzgzMDYwZmYyZWM4MGI2MWM4NjU2OGZjMzI4ZTk0MSJ9','2019-04-25 18:05:51.842488'),('ou98ly2eaiooeb3ps8uy2u2wobv85lhc','OGE5Mzc2NzMyZmU3ODRiOWZjMjY5M2MyYmQwOTZjZjUxNzJmYjdiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzcyNmFmMmM0ODIxNzUzMWM5OTU1MmZhNDkxNGUwNWRmMzgzNDM3In0=','2019-05-13 22:55:40.653927'),('owukeju9hx3oi26yr7il357v40s7m8vs','NmVlYTZkNmY3ZDg0ZDlhODVkNjBmYjI5NTgxY2VhMjdlY2VlNzgzNDp7Il9hdXRoX3VzZXJfaWQiOiI0NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY4NzI4NmU2NWVjZWQ1NGY1NDYxY2Y3MDBhODRmMTUwN2Q1YTJkYyJ9','2019-11-19 20:37:27.847163'),('p1wcxivshymq4a1ybacai2tgqlm8ruvl','NDkyNjZkZjU1OWJlZDI0MzFmMDNlY2RmZjkyNTBhNTIwZjIwM2EyYjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTQ1NTYyOTkyZmJlYTExYmYyNjA5NDkyMWI3ZmZjMTJiMWQ4Mjk3MiJ9','2019-10-03 22:00:41.024444'),('p8ror7i29pgre8uhh6zoah3hea4yz3l0','ZjA0MzY2Y2IwYmFiOGE1ZWI4ZWZiODQ4MDkwZDA3NjYzNGRmMDNmMzp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTUwYTE1Njg5NjA4Mjc5OTQyNmMyNjk4MTNhMGU1ZTI0ZmNkOTU1OSJ9','2019-12-01 20:17:01.145494'),('pdb5zahdh6zmdaijt04eq7om7ls154dj','MmVlZjg0Mzc3NGFkYzE4NmZkYmIwMmNlZTkwNTlkMjJhNjM5NjA0NDp7Il9hdXRoX3VzZXJfaWQiOiI0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODU2NTI0ZDc5NjA5NmM0YmY2YzE3ZmZiZmY0ZGQ1YTk3OTQ4ZDI5MCJ9','2019-12-05 23:27:24.386855'),('pggud9f7sion3cp7z7yamhyrknc9qr1s','NWJmYjAyZGE1MjAxMTYzOTRiZDBmZjY2ZDMyZDkyM2M5NzQ5YTJhMDp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNmYzRjMDBlZWViMmM2NDQ3MTA3OWEzYTZlZGE5ZmI1YTA0YzhlZSJ9','2019-12-01 20:06:48.885633'),('pgwe0a63ta5qiedm7xwr7f90795btnxa','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-02-17 22:25:47.270120'),('pslg6mib6cmju33i9x1cohnwi74la6k2','ZjA0MzY2Y2IwYmFiOGE1ZWI4ZWZiODQ4MDkwZDA3NjYzNGRmMDNmMzp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTUwYTE1Njg5NjA4Mjc5OTQyNmMyNjk4MTNhMGU1ZTI0ZmNkOTU1OSJ9','2020-02-10 23:23:07.700095'),('q52l8ogb46728e5l9yjmjhy88urzsrtg','NDFjZmEwNzZlOTI2MmVjYWQ2YjFhOWQ2ZDZiOTZkOGY2YzI3OTZjYzp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjYwYjhiZDY2ZTAxZmU5ODRmNzBkZmIxZTM4ZThkMzE1NDA4NjEzOSJ9','2020-03-04 17:40:48.917429'),('q8jwoal4w7b7xmrl3njppjdppanyouju','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-26 23:47:12.830701'),('qjxlbwenjb50j2c0fpp09zcmg6j3lkbt','ZmU3NGRkMDQxNmEwMGNkZjI2YzYyN2U5MTRmZGViODE0ZDNkZmVkZjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDA4MmM1NGJlNTE2MWJlZDhhNGFmMTM5ZjUwYWI0YzNiYzU1NGY2YyJ9','2019-04-20 22:46:55.453676'),('qkzeukeslhpih2nvjougooz723a58vhy','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-18 23:12:53.393387'),('qw5e4vpvjf2sc95xua56pyie1x9h0b5x','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-23 18:32:34.207904'),('r1w7rca7hutaqp5tq70ne2spfyhgt3u3','M2I4NTUwMjIyZDA0NzBhMzg3NGY5ZDVkMTQzODFlZDRmMGU1ZjdiMDp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjllZmUwMmIxOGQwNmM0ZjhmYzc5ZDQxZDA5YTY4YzY5YmVlMmMyOCJ9','2019-12-19 00:29:53.322379'),('rroyzoy7q3huih3090jkjkakwagc620e','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-05-08 15:13:25.042296'),('s5tn0gbms6vnn41kzdm6ojvl98qqep81','YmQ5MDY4OGUyMGMxZTc5ODQ2YTEzZmQzMjUwNzJhYjI2ZTkwODNjMTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDVhOTI5Y2Q5YmIzZDkxMzMwZThjNmNkNmFlZmU3ZDJlNjBkZjA2NyJ9','2019-05-01 23:14:09.899246'),('syw1i4h407rna1n2fe3lr93e8tdlriu7','YmQ5MDY4OGUyMGMxZTc5ODQ2YTEzZmQzMjUwNzJhYjI2ZTkwODNjMTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDVhOTI5Y2Q5YmIzZDkxMzMwZThjNmNkNmFlZmU3ZDJlNjBkZjA2NyJ9','2019-04-30 20:53:35.870938'),('t3y6l0ve3xpdfmij83oylvfwraq3fxfw','MmM2YjgxMjljYzIxYWIyOTRlZGFlN2UzZTk1YzA3NDllNTI1MjgxNTp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzBiYWQyYmVhMjNlNDgyNTFlMjA1ZTIzZGU1OTFmMWNiY2RiZGFmZiJ9','2020-02-26 01:09:10.723461'),('t8v5ct9umo1mozlz8rjrnj4vlpae3gjs','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-13 23:51:28.222600'),('ti2nzqffxm3csce9f2dxdtygce2pwbiv','NDNlODM2Y2M3ZDhmNWY4N2UxNTRjNjVjYTlkMjYyYzJlZjc3ZGVhZTp7Il9hdXRoX3VzZXJfaWQiOiI1OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDgzZjVhMTZmMzY5YWFkMjQxMjFjMGI4YjI1OTE0YjIyZjY4MDJmZCJ9','2020-04-20 23:32:23.567482'),('tl03mdt5sxyudo8lv41smf57b69b80h5','MTMwNTFjMWU0MDIxYmMyNTVlMzI0ZmY2ZjA5NzY2ZWUzYmMwN2RhZjp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGI1NGFiMDUyMzIyZTgxNTIxZjJjZDEwYTI1ZTczZjg0NjZkYWNiNCJ9','2019-04-10 22:37:39.993147'),('twcyuut38gymkml6ldn7kp5shpcr6eia','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2018-12-17 01:41:29.224716'),('tx1rvkdvlyc684njrg1bp547was6udmi','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-21 00:16:43.474398'),('tzs0a2ou0jbb1g9hatdq815qvavowkxt','ZjQ3MTk0YThjYWQ1YTJiODM3MTc0YTkxYzk2ZjNjMDcwZDVhODc2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MTUzMTA4NWQ2MjRlYTQ4MzgyODhiYjAzOTAyZjdiZjFhYjA2YzVkIn0=','2019-04-07 22:31:42.996008'),('vm5tzx2c8cctnpaxjvj7t9y8to9o8sjc','NjQzMzY0MjJiZWMxY2UwMjhlYzRiOTFmYjE1OGQ0OWZlMWEzNDkzYTp7Il9hdXRoX3VzZXJfaWQiOiI0OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjhlYzY2ZDY5NGI0NTU5ZjI1MzIxYzk0YWFhOWVmZDk4Njk3NGE3ZiJ9','2019-12-05 18:08:09.882105'),('w4va7be7oqpjh6t1h3wiwhlknsacxtq3','MDAwMjQzOWI0MTBlYTZkOGViNWI4YjE0ZWI3MmM3ODYwMTU4ODI5MTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzYwN2I5OGIzMWYxY2Y0NWFmZDE0N2I4ZTFjNjkxOWY0ZDAzZTkzOSJ9','2019-10-21 20:12:30.689937'),('wblwz8p50pe836me5ad46dsqwpzcx0j1','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-26 01:37:03.844098'),('x2q2n36niyoi6u6itwljk0uwv89n47c9','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-18 19:38:55.679688'),('x6dpxgozxe29qrhx39cspoouulxbtq0j','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2018-12-18 21:27:49.251565'),('xiimkzo5qn9f1d8ybuvsbe93hghvnz2c','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-20 21:33:01.711265'),('y19648a68t9lemn4xh4oblocpohkexu0','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-02-13 00:37:40.359304'),('ygn5eaifxzrc4hc20nhj0yi3raihdgsb','Njc0MDIzMDZlMmQ0OTE5MzViM2NhN2QxOGIxMTIyMDgxNjQ0YTc2Zjp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI1YzlkNDViNmNlMWI0NGEzMWE3YWVkYzMxMTQyNWFjZmViYjk0OSJ9','2019-11-26 01:15:21.998581'),('ygudgi5fv8mupqfkgshd3g3uw19rc7oq','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-01 23:45:06.849370'),('z4bvdr0sl74yz68v0vmj3vygjqo21izc','NDNlODM2Y2M3ZDhmNWY4N2UxNTRjNjVjYTlkMjYyYzJlZjc3ZGVhZTp7Il9hdXRoX3VzZXJfaWQiOiI1OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDgzZjVhMTZmMzY5YWFkMjQxMjFjMGI4YjI1OTE0YjIyZjY4MDJmZCJ9','2020-04-19 19:13:56.798453'),('z4bzf5sbl1g2nwdxvuksize2rtyuk8sz','MDAwMjQzOWI0MTBlYTZkOGViNWI4YjE0ZWI3MmM3ODYwMTU4ODI5MTp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzYwN2I5OGIzMWYxY2Y0NWFmZDE0N2I4ZTFjNjkxOWY0ZDAzZTkzOSJ9','2019-10-21 20:17:16.812347'),('z5l3c9hy3y9bqaq9yb8sysp3wikufsvj','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-03-18 01:45:05.473027'),('z847bxp4wjyt5aab1ljoiwoaxew6b8jc','MWUyMzE2ZWJjZTYzNTZjM2I4Y2Y3NzcyNDc0Mjk0YzI1MzAwMDFkODp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y2MzBlMzk5YWZmYzJiYjEzYjNjYjBjOTY3NmQwNTZiZGI1M2UyOCJ9','2020-03-02 17:11:18.328493'),('zqt8okc2rnb02wz6ixvc6u5o4t8jipks','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-01 23:45:59.086608'),('zsv6gdz8bd1y45y8z78sgn3lrw8i47sn','YmQ5MDY4OGUyMGMxZTc5ODQ2YTEzZmQzMjUwNzJhYjI2ZTkwODNjMTp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDVhOTI5Y2Q5YmIzZDkxMzMwZThjNmNkNmFlZmU3ZDJlNjBkZjA2NyJ9','2019-05-08 15:22:25.347087'),('zvuhpxuxdgkc7r0dyrq4skfik2vemzkb','NWM0ZjdmM2RiMDBmZDY0MTEwNjQ5NzdkNjBlZWI0OWM4NTQzNDkzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzEyMWJjOGViZGE0ZTIwZWNhMDI5NjUzZGYxYjA1YWI3NGRmYmJjIn0=','2019-04-03 23:09:13.580309');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelName` varchar(50) DEFAULT NULL,
  `userID_id` decimal(10,0) DEFAULT NULL,
  `public` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'glycolysis',2,1),(2,'glycolysis',16,0),(3,'glycolysis',17,0),(4,'glycolysis',18,0);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_test`
--

DROP TABLE IF EXISTS `model_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_test` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `modelName` varchar(255) NOT NULL,
  `userID_id` int NOT NULL,
  `public` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_test`
--

LOCK TABLES `model_test` WRITE;
/*!40000 ALTER TABLE `model_test` DISABLE KEYS */;
INSERT INTO `model_test` VALUES (1,'glycolysis',2,1),(6,'glycolysis',19,0),(14,'glycolysis',27,0),(18,'glycolysis',31,0),(19,'glycolysis',32,0),(20,'glycolysis',33,0),(21,'glycolysis',34,0),(22,'glycolysis',35,0),(23,'glycolysis',36,0),(24,'glycolysis',37,0),(26,'glycolysis',38,0),(28,'glycolysis',39,0),(31,'glycolysis',1,0),(100,'gluconeogenesis',100,1),(101,'glycolysis',50,0),(102,'gluconeogenesis',1,0),(103,'gluconeogenesis',2,0),(104,'gluconeogenesis',31,0),(105,'gluconeogenesis',39,0);
/*!40000 ALTER TABLE `model_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_test`
--

DROP TABLE IF EXISTS `table_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_test` (
  `userID` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_test`
--

LOCK TABLES `table_test` WRITE;
/*!40000 ALTER TABLE `table_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testApp_customuser`
--

DROP TABLE IF EXISTS `testApp_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testApp_customuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testApp_customuser`
--

LOCK TABLES `testApp_customuser` WRITE;
/*!40000 ALTER TABLE `testApp_customuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `testApp_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testApp_model`
--

DROP TABLE IF EXISTS `testApp_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testApp_model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelName` varchar(200) NOT NULL,
  `userID_id` int NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testApp_model`
--

LOCK TABLES `testApp_model` WRITE;
/*!40000 ALTER TABLE `testApp_model` DISABLE KEYS */;
INSERT INTO `testApp_model` VALUES (1,'glycolysis',2,1),(6,'glycolysis',19,0),(14,'glycolysis',27,0),(18,'glycolysis',31,0),(19,'glycolysis',32,0),(20,'glycolysis',33,0),(21,'glycolysis',34,0),(22,'glycolysis',35,0),(23,'glycolysis',36,0),(24,'glycolysis',37,0),(26,'glycolysis',38,0),(28,'glycolysis',39,0),(31,'glycolysis',1,0),(100,'gluconeogenesis',100,1),(101,'glycolysis',50,0),(102,'gluconeogenesis',1,0),(103,'gluconeogenesis',2,0),(104,'gluconeogenesis',31,0),(105,'gluconeogenesis',39,0),(106,'glycolysis',40,0),(107,'gluconeogenesis',40,0),(108,'glycolysis',41,0),(109,'gluconeogenesis',41,0),(110,'glycolysis',42,0),(111,'gluconeogenesis',42,0),(112,'glycolysis',43,0),(113,'gluconeogenesis',43,0),(114,'glycolysis',44,0),(115,'gluconeogenesis',44,0),(118,'glycolysis',46,0),(119,'gluconeogenesis',46,0),(120,'glycolysis',47,0),(121,'gluconeogenesis',47,0),(122,'glycolysis',48,0),(123,'gluconeogenesis',48,0),(124,'glycolysis',49,0),(125,'gluconeogenesis',49,0),(126,'glycolysis',50,0),(127,'gluconeogenesis',50,0),(128,'glycolysis',51,0),(129,'gluconeogenesis',51,0),(130,'glycolysis',52,0),(131,'gluconeogenesis',52,0),(132,'glycolysis',53,0),(133,'gluconeogenesis',53,0),(134,'glycolysis',54,0),(135,'gluconeogenesis',54,0),(136,'glycolysis',55,0),(137,'gluconeogenesis',55,0),(138,'glycolysis',45,0),(139,'gluconeogenesis',45,0),(206,'glycolysis',56,0),(207,'gluconeogenesis',56,0),(219,'glycolysis',57,0),(220,'gluconeogenesis',57,0);
/*!40000 ALTER TABLE `testApp_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testApp_module`
--

DROP TABLE IF EXISTS `testApp_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testApp_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelID_id` int NOT NULL,
  `enzyme` varchar(200) NOT NULL,
  `reversible` varchar(200) NOT NULL,
  `enzymeAbbr` varchar(8) NOT NULL,
  `xCoor` int NOT NULL,
  `yCoor` int NOT NULL,
  `enzWeight` int NOT NULL,
  `deltaG` double NOT NULL,
  `deltaGNaughtPrime` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testApp_module_modelID_id_b8b4ab98` (`modelID_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10034 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testApp_module`
--

LOCK TABLES `testApp_module` WRITE;
/*!40000 ALTER TABLE `testApp_module` DISABLE KEYS */;
INSERT INTO `testApp_module` VALUES (1,1,'Hexokinase','irreversible','HK',0,1,1,-34,-16.7),(2,1,'Phosphoglucose_isomerase','reversible','PGI',0,2,1,-2.9,1.67),(3,1,'Phosphofructokinase','irreversible','PFK',0,3,1,-19,-14.2),(4,1,'Aldolase','reversible','ALDO',0,4,1,-0.23,23.9),(5,1,'Triosephosphate_isomerase','reversible','TPI',-1,5,1,2.4,7.56),(6,1,'Glyceraldehyde_phosphate_dehydrogenase','reversible','GAPDH',1,5,1,-1.29,6.3),(7,1,'Phosphoglycerate_kinase','reversible','PGK',1,6,1,0.09,-18.9),(8,1,'Phosphoglycerate_mutase','reversible','PGM',1,7,1,0.83,4.4),(9,1,'Enolase','reversible','ENO',1,8,1,1.1,1.8),(10,1,'Pyruvate_kinase','irreversible','PK',1,9,1,-23,-31.7),(141,19,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(142,19,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(143,19,'Phosphofructokinase','Irreversible','PFK',0,3,1,-19,-14.2),(144,19,'Aldolase','Reversible','ALDO',0,4,1,-0.23,23.9),(145,19,'Triosephosphate_isomerase','Reversible','TPI',-1,5,1,2.4,7.56),(146,19,'Glyceraldehyde_phosphate_dehydrogenase','Reversible','GAPDH',1,5,1,-1.29,6.3),(147,19,'Phosphoglycerate_kinase','Reversible','PGK',1,6,1,0.09,-18.9),(148,19,'Phosphoglycerate_mutase','Reversible','PGM',1,7,1,0.83,4.4),(149,19,'Enolase','Reversible','ENO',1,8,1,1.1,1.8),(150,19,'Pyruvate_kinase','Irreversible','PK',1,9,1,-23,-31.7),(243,20,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(244,20,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(245,20,'Phosphofructokinase','Irreversible','PFK',0,3,1,-19,-14.2),(246,20,'Aldolase','Reversible','ALDO',0,4,1,-0.23,23.9),(247,20,'Triosephosphate_isomerase','Reversible','TPI',-1,5,1,2.4,7.56),(248,20,'Glyceraldehyde_phosphate_dehydrogenase','Reversible','GAPDH',1,5,1,-1.29,6.3),(249,21,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(250,21,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(251,21,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(266,100,'Pyruvate_kinase','irreversible','PK',0,1,1,-23,-31.7),(267,100,'Enolase','reversible','ENO',0,2,1,1.1,1.8),(268,100,'Phosphoglycerate_mutase','reversible','PGM',0,3,1,0.83,4.4),(269,100,'Phosphoglycerate_kinase','reversible','PGK',0,4,1,0.09,-18.9),(270,100,'Glyceraldehyde_phosphate_dehydrogenase','reversible','GAPDH',-1,5,1,-1.29,6.3),(295,18,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(296,18,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(309,106,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(310,108,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(311,109,'Pyruvate_kinase','Irreversible','PK',0,1,1,-23,-31.7),(312,111,'Pyruvate_kinase','Irreversible','PK',0,1,1,-23,-31.7),(315,116,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(316,116,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(321,128,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(322,128,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(323,128,'Phosphofructokinase','Irreversible','PFK',0,3,1,-19,-14.2),(324,128,'Aldolase','Reversible','ALDO',0,4,1,-0.23,23.9),(325,130,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(326,130,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(327,132,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(328,132,'Phosphoglucose_isomerase','Reversible','PGI',0,2,1,-2.9,1.67),(329,132,'Phosphofructokinase','Irreversible','PFK',0,3,1,-19,-14.2),(330,132,'Aldolase','Reversible','ALDO',0,4,1,-0.23,23.9),(331,132,'Triosephosphate_isomerase','Reversible','TPI',-1,5,1,2.4,7.56),(332,132,'Glyceraldehyde_phosphate_dehydrogenase','Reversible','GAPDH',1,5,1,-1.29,6.3),(333,132,'Phosphoglycerate_kinase','Reversible','PGK',1,6,1,0.09,-18.9),(334,132,'Phosphoglycerate_mutase','Reversible','PGM',1,7,1,0.83,4.4),(335,132,'Enolase','Reversible','ENO',1,8,1,1.1,1.8),(336,132,'Pyruvate_kinase','Irreversible','PK',1,9,1,-23,-31.7),(339,116,'Phosphofructokinase','Irreversible','PFK',0,3,1,-19,-14.2),(340,136,'Hexokinase','Irreversible','HK',0,1,1,-34,-16.7),(341,137,'Pyruvate_kinase','Irreversible','PK',0,1,1,-23,-31.7),(342,137,'Pyruvate_kinase','Irreversible','PK',0,1,1,-23,-31.7),(10016,202,'Glyceraldehyde_phosphate_dehydrogenase','Irreversible','GAPDH',0,1,1,1,1),(10017,202,'Phosphoglycerate_kinase','Irreversible','PGK',0,2,1,1,1),(10018,202,'Glyceraldehyde_phosphate_dehydrogenase','Irreversible','GAPDH',0,3,1,1,1),(10019,203,'Enolase','Irreversible','ENO',0,1,1,1,1),(10020,203,'Phosphoglycerate_kinase','Reversible','PGK',0,2,1,1,1),(10021,203,'Hexokinase','Irreversible','HK',0,3,1,1,1),(10024,209,'fjhgjh','Reversible','fgj',0,1,1,1,1),(10025,209,'fjhgjh','Irreversible','fgj',0,2,1,1,1),(10026,213,'Aldolase','Irreversible','ALDO',0,1,1,1,1),(10027,215,'Aldolase','Irreversible','ALDO',0,1,1,1,1),(10028,215,'Aldolase','Irreversible','ALDO',0,1,1,1,1),(10029,226,'Phosphoglycerate_kinase','Irreversible','PGK',0,1,1,1,1),(10030,226,'Hexokinase','Irreversible','HK',0,2,1,1,1),(10031,227,'Aldolase','Irreversible','ALDO',0,1,1,1,1),(10032,228,'Aldolase','Irreversible','ALDO',0,1,1,1,1),(10033,229,'Aldolase','Irreversible','ALDO',0,1,1,1,1);
/*!40000 ALTER TABLE `testApp_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testApp_products`
--

DROP TABLE IF EXISTS `testApp_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testApp_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` varchar(200) NOT NULL,
  `moduleID_id` int NOT NULL,
  `abbr` varchar(8) NOT NULL,
  `modelID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testApp_products_moduleID_id_486e1e41_fk_testApp_module_id` (`moduleID_id`),
  CONSTRAINT `testApp_products_moduleID_id_486e1e41_fk_testApp_module_id` FOREIGN KEY (`moduleID_id`) REFERENCES `testApp_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100025 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testApp_products`
--

LOCK TABLES `testApp_products` WRITE;
/*!40000 ALTER TABLE `testApp_products` DISABLE KEYS */;
INSERT INTO `testApp_products` VALUES (1,'Glucose-6-Phosphate',1,'G6P',1),(2,'ADP',1,'ADP',1),(3,'Fructose-6-Phosphate',2,'F6P',1),(4,'Fructose-1,6-bisphosphate',3,'F16BP',1),(5,'ADP',3,'ADP',1),(6,'Dihydroxyacetone_Phosphate',4,'DHAP',1),(7,'Glyceraldehyde-3-Phosphate',4,'GADP',1),(8,'Glyceraldehyde-3-Phosphate',5,'GADP',1),(9,'1,3-bisphoglycerate',6,'13PG',1),(10,'3_phosphoglycerate',7,'3PG',1),(11,'2_phosphoglycerate',8,'2PG',1),(12,'Phosphoenolpyruvate',9,'PEP',1),(13,'Pyruvate',10,'Pyruvate',1),(130,'Glucose-6-Phosphate',141,'G6P',19),(131,'ADP',141,'ADP',19),(132,'Fructose-6-Phosphate',142,'F6P',19),(133,'ADP',143,'ADP',19),(134,'Fructose-1,6-bisphosphate',143,'F16BP',19),(135,'Dihydroxyacetone_Phosphate',144,'DHAP',19),(136,'Glyceraldehyde-3-Phosphate',144,'GADP',19),(137,'Glyceraldehyde-3-Phosphate',145,'GADP',19),(138,'1,3-bisphoglycerate',146,'13PG',19),(139,'3_phosphoglycerate',147,'3PG',19),(140,'2_phosphoglycerate',148,'2PG',19),(141,'Phosphoenolpyruvate',149,'PEP',19),(142,'Pyruvate',150,'Pyruvate',19),(291,'Glucose-6-Phosphate',243,'G6P',20),(292,'ADP',243,'ADP',20),(293,'Fructose-6-Phosphate',244,'F6P',20),(294,'ADP',245,'ADP',20),(295,'Fructose-1,6-bisphosphate',245,'F16BP',20),(296,'Dihydroxyacetone_Phosphate',246,'DHAP',20),(297,'Glyceraldehyde-3-Phosphate',246,'GADP',20),(298,'Glyceraldehyde-3-Phosphate',247,'GADP',20),(299,'1,3-bisphoglycerate',248,'13PG',20),(300,'Glucose-6-Phosphate',249,'G6P',21),(301,'ADP',249,'ADP',21),(302,'Fructose-6-Phosphate',250,'F6P',21),(303,'Fructose-6-Phosphate',251,'F6P',21),(365,'Glucose-6-Phosphate',295,'G6P',18),(366,'ADP',295,'ADP',18),(367,'Fructose-6-Phosphate',296,'F6P',18),(388,'ADP',309,'ADP',106),(389,'Glucose-6-Phosphate',309,'G6P',106),(390,'ADP',310,'ADP',108),(391,'Glucose-6-Phosphate',310,'G6P',108),(395,'ADP',315,'ADP',116),(396,'Glucose-6-Phosphate',315,'G6P',116),(397,'Fructose-6-Phosphate',316,'F6P',116),(405,'ADP',321,'ADP',128),(406,'Glucose-6-Phosphate',321,'G6P',128),(407,'Fructose-6-Phosphate',322,'F6P',128),(408,'ADP',323,'ADP',128),(409,'Fructose-1,6-bisphosphate',323,'F16BP',128),(410,'Dihydroxyacetone_Phosphate',324,'DHAP',128),(411,'Glyceraldehyde-3-Phosphate',324,'GADP',128),(412,'ADP',325,'ADP',130),(413,'Glucose-6-Phosphate',325,'G6P',130),(414,'Fructose-6-Phosphate',326,'F6P',130),(415,'Glucose-6-Phosphate',327,'G6P',132),(416,'ADP',327,'ADP',132),(417,'Fructose-6-Phosphate',328,'F6P',132),(418,'Fructose-1,6-bisphosphate',329,'F16BP',132),(419,'ADP',329,'ADP',132),(420,'Dihydroxyacetone_Phosphate',330,'DHAP',132),(421,'Glyceraldehyde-3-Phosphate',330,'GADP',132),(422,'Glyceraldehyde-3-Phosphate',331,'GADP',132),(423,'1,3-bisphoglycerate',332,'13PG',132),(424,'3_phosphoglycerate',333,'3PG',132),(425,'2_phosphoglycerate',334,'2PG',132),(426,'Phosphoenolpyruvate',335,'PEP',132),(427,'Pyruvate',336,'Pyruvate',132),(431,'ADP',339,'ADP',116),(432,'Fructose-1,6-bisphosphate',339,'F16BP',116),(4201,'ADP',340,'ADP',136),(4202,'Glucose-6-Phosphate',340,'G6P',136),(100010,'Glyceraldehyde-3-Phosphate',10016,'GADP',202),(100011,'1,3-bisphoglycerate',10017,'13PG',202),(100012,'Pyruvate',10018,'Pyruvate',202);
/*!40000 ALTER TABLE `testApp_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testApp_substrates`
--

DROP TABLE IF EXISTS `testApp_substrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testApp_substrates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `substrate` varchar(200) NOT NULL,
  `moduleID_id` int NOT NULL,
  `abbr` varchar(8) NOT NULL,
  `modelID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testApp_substrates_moduleID_id_41af9ff5_fk_testApp_module_id` (`moduleID_id`),
  CONSTRAINT `testApp_substrates_moduleID_id_41af9ff5_fk_testApp_module_id` FOREIGN KEY (`moduleID_id`) REFERENCES `testApp_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100045 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testApp_substrates`
--

LOCK TABLES `testApp_substrates` WRITE;
/*!40000 ALTER TABLE `testApp_substrates` DISABLE KEYS */;
INSERT INTO `testApp_substrates` VALUES (1,'Glucose',1,'G',1),(2,'ATP',1,'ATP',1),(3,'Glucose-6-Phosphate',2,'G6P',1),(4,'Fructose-6-Phosphate',3,'F6P',1),(5,'ATP',3,'ATP',1),(6,'Fructose-1,6-bisphosphate',4,'F16BP',1),(7,'Dihydroxyacetone_Phosphate',5,'DHAP',1),(8,'Glyceraldehyde-3-Phosphate',6,'GADP',1),(9,'1,3-bisphoglycerate',7,'13PG',1),(10,'3_phosphoglycerate',8,'3PG',1),(11,'2_phosphoglycerate',9,'2PG',1),(12,'Phosphoenolpyruvate',10,'PEP',1),(144,'Glucose',141,'G',19),(145,'ATP',141,'ATP',19),(146,'Glucose-6-Phosphate',142,'G6P',19),(147,'ATP',143,'ATP',19),(148,'Fructose-6-Phosphate',143,'F6P',19),(149,'Fructose-1,6-bisphosphate',144,'F16BP',19),(150,'Dihydroxyacetone_Phosphate',145,'DHAP',19),(151,'Glyceraldehyde-3-Phosphate',146,'GADP',19),(152,'1,3-bisphoglycerate',147,'13PG',19),(153,'3_phosphoglycerate',148,'3PG',19),(154,'2_phosphoglycerate',149,'2PG',19),(155,'Phosphoenolpyruvate',150,'PEP',19),(296,'Glucose',243,'G',20),(297,'ATP',243,'ATP',20),(298,'Glucose-6-Phosphate',244,'G6P',20),(299,'ATP',245,'ATP',20),(300,'Fructose-6-Phosphate',245,'F6P',20),(301,'Fructose-1,6-bisphosphate',246,'F16BP',20),(302,'Dihydroxyacetone_Phosphate',247,'DHAP',20),(303,'Glyceraldehyde-3-Phosphate',248,'GADP',20),(304,'Glucose',249,'G',21),(305,'ATP',249,'ATP',21),(306,'Glucose-6-Phosphate',250,'G6P',21),(307,'Glucose-6-Phosphate',251,'G6P',21),(367,'ATP',295,'ATP',18),(368,'Glucose',295,'G',18),(369,'Glucose-6-Phosphate',296,'G6P',18),(388,'ATP',309,'ATP',106),(389,'Glucose',309,'G',106),(390,'ATP',310,'ATP',108),(391,'Glucose',310,'G',108),(395,'ATP',315,'ATP',116),(396,'Glucose',315,'G',116),(397,'Glucose-6-Phosphate',316,'G6P',116),(405,'Glucose',321,'G',128),(406,'ATP',321,'ATP',128),(407,'Glucose-6-Phosphate',322,'G6P',128),(408,'ATP',323,'ATP',128),(409,'Fructose-6-Phosphate',323,'F6P',128),(410,'Fructose-1,6-bisphosphate',324,'F16BP',128),(411,'ATP',325,'ATP',130),(412,'Glucose',325,'G',130),(413,'Glucose-6-Phosphate',326,'G6P',130),(414,'ATP',327,'ATP',132),(415,'Glucose',327,'G',132),(416,'Glucose-6-Phosphate',328,'G6P',132),(417,'ATP',329,'ATP',132),(418,'Fructose-6-Phosphate',329,'F6P',132),(419,'Fructose-1,6-bisphosphate',330,'F16BP',132),(420,'Dihydroxyacetone_Phosphate',331,'DHAP',132),(421,'Glyceraldehyde-3-Phosphate',332,'GADP',132),(422,'1,3-bisphoglycerate',333,'13PG',132),(423,'3_phosphoglycerate',334,'3PG',132),(424,'2_phosphoglycerate',335,'2PG',132),(425,'Phosphoenolpyruvate',336,'PEP',132),(428,'Fructose-6-Phosphate',339,'F6P',116),(429,'ATP',339,'ATP',116),(4202,'Glucose',340,'G',136),(4203,'ATP',340,'ATP',136),(100026,'Dihydroxyacetone_Phosphate',10016,'DHAP',202),(100027,'A test substrate',10016,'ATS',202),(100028,'Glyceraldehyde-3-Phosphate',10017,'GADP',202),(100029,'1,3-bisphoglycerate',10018,'13PG',202);
/*!40000 ALTER TABLE `testApp_substrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testmodel`
--

DROP TABLE IF EXISTS `testmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelName` varchar(255) NOT NULL,
  `userID_id` int NOT NULL,
  `publuc` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testmodel`
--

LOCK TABLES `testmodel` WRITE;
/*!40000 ALTER TABLE `testmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `testmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 16:32:50
