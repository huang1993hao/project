-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: babaifang
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add baner',7,'add_baner'),(20,'Can change baner',7,'change_baner'),(21,'Can delete baner',7,'delete_baner'),(22,'Can add drb',8,'add_drb'),(23,'Can change drb',8,'change_drb'),(24,'Can delete drb',8,'delete_drb'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add mrb',10,'add_mrb'),(29,'Can change mrb',10,'change_mrb'),(30,'Can delete mrb',10,'delete_mrb'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add cart',12,'add_cart'),(35,'Can change cart',12,'change_cart'),(36,'Can delete cart',12,'delete_cart'),(37,'Can add order',13,'add_order'),(38,'Can change order',13,'change_order'),(39,'Can delete order',13,'delete_order'),(40,'Can add order goods',14,'add_ordergoods'),(41,'Can change order goods',14,'change_ordergoods'),(42,'Can delete order goods',14,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_baner`
--

DROP TABLE IF EXISTS `babaifang_baner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_baner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `backcolor` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_baner`
--

LOCK TABLES `babaifang_baner` WRITE;
/*!40000 ALTER TABLE `babaifang_baner` DISABLE KEYS */;
INSERT INTO `babaifang_baner` VALUES (1,'img/carousel-1.jpg','中秋国庆','#111143','1'),(2,'img/carousel-2.jpg','嘉伦光彩','#d51216','2'),(3,'img/carousel-3.jpg','禾沐康','#1dcbff','3'),(4,'img/carousel-4.jpg','草姬','#f8a56f','4'),(5,'img/carousel-5.jpg','乐陶陶','#2d2c56','5');
/*!40000 ALTER TABLE `babaifang_baner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_cart`
--

DROP TABLE IF EXISTS `babaifang_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `babaifang_cart_goods_id_6b796487_fk_babaifang_goods_id` (`goods_id`),
  KEY `babaifang_cart_user_id_d712182d_fk_babaifang_user_id` (`user_id`),
  CONSTRAINT `babaifang_cart_goods_id_6b796487_fk_babaifang_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `babaifang_goods` (`id`),
  CONSTRAINT `babaifang_cart_user_id_d712182d_fk_babaifang_user_id` FOREIGN KEY (`user_id`) REFERENCES `babaifang_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_cart`
--

LOCK TABLES `babaifang_cart` WRITE;
/*!40000 ALTER TABLE `babaifang_cart` DISABLE KEYS */;
INSERT INTO `babaifang_cart` VALUES (5,3,1,1,2),(6,2,1,2,3);
/*!40000 ALTER TABLE `babaifang_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_drb`
--

DROP TABLE IF EXISTS `babaifang_drb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_drb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mane` varchar(100) NOT NULL,
  `tits` varchar(100) NOT NULL,
  `price1` varchar(20) NOT NULL,
  `price2` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_drb`
--

LOCK TABLES `babaifang_drb` WRITE;
/*!40000 ALTER TABLE `babaifang_drb` DISABLE KEYS */;
INSERT INTO `babaifang_drb` VALUES (1,'东阿阿胶 千年珍袋泡西洋参','2盒送礼带 领卷减140','￥538','/679','img/20160902114506_175.jpg','18'),(2,'枣夹核桃人','补血养颜 健脾养胃','￥45.9','/98','img/20160905141509_457.jpg','19'),(3,'草姬苏灭酸','拍下减20 ！1小时降尿酸','￥289','/358','img/20160906091826_374.jpg','20'),(4,'汇仁肾宝片 126 片','券后价245元包邮','￥322','/322','img/20160616182123_762.jpg','21'),(5,'云南三七粉','活血化瘀，消肿止痛','￥90','/180','img/20160818170115_552.jpg','22');
/*!40000 ALTER TABLE `babaifang_drb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_goods`
--

DROP TABLE IF EXISTS `babaifang_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `bprice` varchar(30) NOT NULL,
  `mprice` varchar(30) NOT NULL,
  `trackid` varchar(50) NOT NULL,
  `num` varchar(30) NOT NULL,
  `size` varchar(100) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `img3` varchar(100) NOT NULL,
  `img4` varchar(100) NOT NULL,
  `img5` varchar(100) NOT NULL,
  `kuaj` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_goods`
--

LOCK TABLES `babaifang_goods` WRITE;
/*!40000 ALTER TABLE `babaifang_goods` DISABLE KEYS */;
INSERT INTO `babaifang_goods` VALUES (1,'九龙.香港草姬','壮阳补肾,持久延时','294','370','1253048','99','90粒/盒','img/20160906091633_854.jpg','img/20160720143940_956.jpg','img/20160720143944_578.jpg','img/20160720143950_106.jpg','img/20160720143955_506.jpg',1),(2,'枸橼酸西地那非片','治疗勃起功能障碍','210','380','1253047','80','50片/盒','img/20160808154653_931.jpg','img/20160808154653_931.jpg','img/20160808154653_931.jpg','img/20160808154653_931.jpg','img/20160808154653_931.jpg',0),(3,'陈李济 舒筋健腰丸','舒筋健腰 送风湿膏8贴','708','799','1253046','70','100粒/盒','img/20160728152149_248.jpg','img/20160728152149_248.jpg','img/20160728152149_248.jpg','img/20160728152149_248.jpg','img/20160728152149_248.jpg',0),(4,'恩替卡韦分散片','慢性乙型肝炎 肝病','148','179','1253045','98','7片/盒','img/20160808155521_217.jpg','img/20160808155521_217.jpg','img/20160808155521_217.jpg','img/20160808155521_217.jpg','img/20160808155521_217.jpg',0),(5,'解郁安神片','解郁安 化瘀解毒','76','82.5','1253044','76','30片/盒','img/20160825135620_630.gif','img/20160825135620_630.gif','img/20160825135620_630.gif','img/20160825135620_630.gif','img/20160825135620_630.gif',0);
/*!40000 ALTER TABLE `babaifang_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_mrb`
--

DROP TABLE IF EXISTS `babaifang_mrb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_mrb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_mrb`
--

LOCK TABLES `babaifang_mrb` WRITE;
/*!40000 ALTER TABLE `babaifang_mrb` DISABLE KEYS */;
INSERT INTO `babaifang_mrb` VALUES (1,'img/20160223103312_73.jpg','6'),(2,'img/20160223103432_82.jpg','7'),(3,'img/20160223103506_462.jpg','8'),(4,'img/20160203155906_809.jpg','9'),(5,'img/20160223103600_652.jpg','10'),(6,'img/20160223103630_801.jpg','11'),(7,'img/20160223103659_438.jpg','12'),(8,'img/20160223103730_224.jpg','13'),(9,'img/20160223103810_439.jpg','14'),(10,'img/20160223103845_279.jpg','15'),(11,'img/20160223103923_915.jpg','16'),(12,'img/20160223103953_137.jpg','17');
/*!40000 ALTER TABLE `babaifang_mrb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_order`
--

DROP TABLE IF EXISTS `babaifang_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `babaifang_order_user_id_93728282_fk_babaifang_user_id` (`user_id`),
  CONSTRAINT `babaifang_order_user_id_93728282_fk_babaifang_user_id` FOREIGN KEY (`user_id`) REFERENCES `babaifang_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_order`
--

LOCK TABLES `babaifang_order` WRITE;
/*!40000 ALTER TABLE `babaifang_order` DISABLE KEYS */;
INSERT INTO `babaifang_order` VALUES (1,'2018-11-10 04:55:02.824419',1,'154182570281456',1),(2,'2018-11-10 05:00:38.191129',1,'154182603834569',1),(3,'2018-11-10 06:38:18.380671',1,'154183189895514',1),(4,'2018-11-10 07:02:47.780628',1,'154183336742061',1),(5,'2018-11-10 07:27:26.413821',1,'154183484621147',1),(6,'2018-11-10 07:39:04.568561',1,'154183554471193',1),(7,'2018-11-10 07:46:16.417425',1,'154183597676881',1),(8,'2018-11-10 07:49:26.838727',1,'154183616640765',1),(9,'2018-11-10 08:13:30.654127',1,'154183761013865',1);
/*!40000 ALTER TABLE `babaifang_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_ordergoods`
--

DROP TABLE IF EXISTS `babaifang_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `babaifang_ordergoods_goods_id_36e62ebd_fk_babaifang_goods_id` (`goods_id`),
  KEY `babaifang_ordergoods_order_id_08f32331_fk_babaifang_order_id` (`order_id`),
  CONSTRAINT `babaifang_ordergoods_goods_id_36e62ebd_fk_babaifang_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `babaifang_goods` (`id`),
  CONSTRAINT `babaifang_ordergoods_order_id_08f32331_fk_babaifang_order_id` FOREIGN KEY (`order_id`) REFERENCES `babaifang_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_ordergoods`
--

LOCK TABLES `babaifang_ordergoods` WRITE;
/*!40000 ALTER TABLE `babaifang_ordergoods` DISABLE KEYS */;
INSERT INTO `babaifang_ordergoods` VALUES (1,2,1,1),(2,1,5,2),(3,2,3,8),(4,2,1,9),(5,2,3,9);
/*!40000 ALTER TABLE `babaifang_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `babaifang_user`
--

DROP TABLE IF EXISTS `babaifang_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `babaifang_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(80) NOT NULL,
  `password` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  `headimg` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `babaifang_user`
--

LOCK TABLES `babaifang_user` WRITE;
/*!40000 ALTER TABLE `babaifang_user` DISABLE KEYS */;
INSERT INTO `babaifang_user` VALUES (1,'13628228711','080748be4e6f9d076b525ec23a31c65b9752e41f0252c77285f36524d16ed9fb9a93f23d1d1245be4efe02d8d14dfebb7103a3058262e282954d5dfa35c942ce','3c033b22-1400-5f89-8b72-573a162076a8','img/atom.png'),(2,'13628228712','080748be4e6f9d076b525ec23a31c65b9752e41f0252c77285f36524d16ed9fb9a93f23d1d1245be4efe02d8d14dfebb7103a3058262e282954d5dfa35c942ce','d1cd608e-76e5-571e-aae0-ef282dff307a','img/atom.png'),(3,'13628228713','080748be4e6f9d076b525ec23a31c65b9752e41f0252c77285f36524d16ed9fb9a93f23d1d1245be4efe02d8d14dfebb7103a3058262e282954d5dfa35c942ce','82f947e6-fd8c-55cd-be10-b8b836de5f0e','img/atom.png');
/*!40000 ALTER TABLE `babaifang_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'babaifang','baner'),(12,'babaifang','cart'),(8,'babaifang','drb'),(9,'babaifang','goods'),(10,'babaifang','mrb'),(13,'babaifang','order'),(14,'babaifang','ordergoods'),(11,'babaifang','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-07 14:01:29.110200'),(2,'auth','0001_initial','2018-11-07 14:01:30.601013'),(3,'admin','0001_initial','2018-11-07 14:01:30.825010'),(4,'admin','0002_logentry_remove_auto_add','2018-11-07 14:01:30.866566'),(5,'contenttypes','0002_remove_content_type_name','2018-11-07 14:01:31.023361'),(6,'auth','0002_alter_permission_name_max_length','2018-11-07 14:01:31.093390'),(7,'auth','0003_alter_user_email_max_length','2018-11-07 14:01:31.189190'),(8,'auth','0004_alter_user_username_opts','2018-11-07 14:01:31.220678'),(9,'auth','0005_alter_user_last_login_null','2018-11-07 14:01:31.296911'),(10,'auth','0006_require_contenttypes_0002','2018-11-07 14:01:31.302150'),(11,'auth','0007_alter_validators_add_error_messages','2018-11-07 14:01:31.335559'),(12,'auth','0008_alter_user_username_max_length','2018-11-07 14:01:31.415582'),(13,'babaifang','0001_initial','2018-11-07 14:01:31.587150'),(14,'sessions','0001_initial','2018-11-07 14:01:31.644238'),(15,'babaifang','0002_cart','2018-11-07 15:22:10.249368'),(16,'babaifang','0003_order_ordergoods','2018-11-10 03:56:41.967069');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 18:06:49
