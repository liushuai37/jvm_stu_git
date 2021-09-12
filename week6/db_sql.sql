/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - imme
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`imme` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `imme`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`customer_id`,`address`) values (2,1,'吉林省梅河口市杰宇校区2号楼3单元302'),(8,16,'山西省太原市小店区山西财经大学坞城校区7号楼'),(11,18,'山西省太原市小店区山西财经大学坞城校区一号楼'),(12,1,'山西省太原市小店区山西财经大学坞城校区一号楼'),(13,25,'吉林省梅河口市杰宇校区2号楼3单元302'),(14,26,'吉林省梅河口市翰林校区2号楼'),(15,27,'山西省太原市小店区习武园三号楼');

/*Table structure for table `admin_greade` */

DROP TABLE IF EXISTS `admin_greade`;

CREATE TABLE `admin_greade` (
  `greade` int(11) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`greade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_greade` */

insert  into `admin_greade`(`greade`,`state`) values (1,'管理员');

/*Table structure for table `admintable` */

DROP TABLE IF EXISTS `admintable`;

CREATE TABLE `admintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(12) NOT NULL,
  `password` varchar(15) NOT NULL,
  `greade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `greade` (`greade`),
  CONSTRAINT `admintable_ibfk_1` FOREIGN KEY (`greade`) REFERENCES `admin_greade` (`greade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admintable` */

insert  into `admintable`(`id`,`adminName`,`password`,`greade`) values (1,'tom','asd123',1);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`cusname`,`password`,`name`,`email`,`telephone`,`birthday`,`sex`,`state`,`code`) values (1,'liu','123','shuai','bbb@store.com',NULL,'1997-12-12','女',1,NULL),(16,'wular','zxc123','慧颖','ccc@store.com','18734186252','1996-12-27','女',1,NULL),(17,'zhang','abcd1234','张康宁','bbb@store.com','1233431123','1997-08-09','男',1,NULL),(18,'pigshuai','qwe123','liushuai','bbb@store.com','18744445555','1997-03-07','男',1,NULL),(21,'tomm','123','shuai','87649@qq.com','15503698480','1997-12-20','女',1,NULL),(22,'cacaca','asd123','shuaiLiu','bbb@store.com','15503698486','1997-10-05','男',1,NULL),(23,'bobjim','asd123','liu','bbb@store.com','15503686789','1997-01-23','男',1,NULL),(24,'kakaf','asd123','liu','bbb@store.com','18745671234','1997-03-25','男',1,NULL),(25,'liushuailiu','asd123','shuai','bbb@store.com','15503698480','1997-12-02','男',1,NULL),(26,'babiqiu','qwe123','bob','bbb@store.com','15551234567','1995-11-14','男',1,NULL),(27,'lili','asd123','jim','bbb@store.com','13603698480','1996-12-27','女',1,NULL);

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(20) DEFAULT NULL,
  `foodType_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `mprice` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `food` */

insert  into `food`(`id`,`foodName`,`foodType_id`,`price`,`mprice`,`remark`,`img`) values (6,'橙子',2,11.5,11.5,'赣南脐橙,赣南地处江南丘陵南部，地势挺拔，气候适宜，</br>有充足的阳光照射成长，远离城市工业污染，</br>种植的橙子的口感更清甜，水分更足。','/upload/img02.jpg'),(7,'啤梨',2,14.5,12,'啤梨又称秋洋梨、香蕉梨、阳梨、葫芦梨，其口感柔软多汁香甜，</br>具有香气，风味甚佳。</br>本产品产至比利时，外表光滑，有光泽，果芯小，可食用率高，</br>果肉细嫩、软糯，口感极佳！','/upload/img04.jpg'),(8,'紫萝卜',4,5,4.5,'山东紫萝卜','/upload/img01.jpg'),(9,'玉米',4,4.1,3.8,'来自云南的水果玉米，水果玉米是可以生吃的甜玉米，</br>薄薄的表皮一咬就破，生吃熟吃都十分甜脆，</br>像水果一样，因此被称为水果玉米。','/upload/img03.jpg'),(10,'巨峰葡萄',2,12.5,10,'山西紫葡萄','/upload/img05.jpg'),(11,'大蒜',4,4.3,3.5,'山东大蒜','/upload/img07.jpg'),(12,'李子',2,16,13.5,'进口李子','/upload/img06.jpg'),(13,'西红柿',4,6,4.7,'山东西红柿','/upload/img10.jpg'),(14,'大葱',4,3.8,3.2,'山东大葱','/upload/img12.jpg'),(15,'苹果',2,15,13.5,'来自山西运城的苹果，酸甜爽口，富含丰富的维生素，</br>矿物质和氨基酸。手工精挑细选，保证每一个果都饱满晶莹。','/upload/img14.jpg'),(16,'辣椒',4,6,4.8,'云南小辣椒','/upload/img13.jpg'),(17,'香菇',4,5,4.2,'山东香菇','/upload/img15.jpg'),(18,'白萝卜',4,3,2.3,'山东白萝卜','/upload/img11.jpg'),(19,'西瓜',2,15,13.2,'产至越南的黑美人西瓜','/upload/xgbt.jpg'),(20,'娃娃菜',4,8,6.6,'云南红土娃娃菜，口感甜脆，新鲜营养','/upload/wawacai.jpg'),(21,'三门青蟹',5,190,170,'三门青蟹，味道鲜美，蟹膏量足','/upload/qingxie.jpg');

/*Table structure for table `foodcount` */

DROP TABLE IF EXISTS `foodcount`;

CREATE TABLE `foodcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `countNum` int(11) NOT NULL,
  `saleCount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `foodcount_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `foodcount` */

insert  into `foodcount`(`id`,`food_id`,`countNum`,`saleCount`) values (1,6,2000,7),(2,7,1999,3),(4,8,2000,2),(5,9,2000,2),(6,10,2000,1),(7,11,2000,1),(8,12,1998,3),(9,13,2000,1),(10,14,2000,1),(11,15,2000,1),(12,16,1999,2),(13,17,2000,1),(14,18,2000,1),(15,20,1000,0),(16,21,1000,0);

/*Table structure for table `fooddetailimage` */

DROP TABLE IF EXISTS `fooddetailimage`;

CREATE TABLE `fooddetailimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `image` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `fooddetailimage_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `fooddetailimage` */

insert  into `fooddetailimage`(`id`,`food_id`,`image`) values (13,6,'/upload/chengzi0.jpg'),(14,6,'/upload/chengzi2.jpg'),(15,6,'/upload/chengzi3.jpg'),(16,6,'/upload/chengzi4.jpg'),(17,6,'/upload/chengzi5.jpg'),(18,7,'/upload/pl1.jpg'),(19,7,'/upload/pl2.jpg'),(20,7,'/upload/pl3.jpg'),(21,7,'/upload/pl4.jpg'),(22,7,'/upload/pl5.jpg'),(23,9,'/upload/ym1.jpg'),(24,9,'/upload/ym2.jpg'),(25,9,'/upload/ym3.jpg'),(26,9,'/upload/ym4.jpg'),(27,9,'/upload/ym5.jpg'),(28,15,'/upload/pg1.jpg'),(29,15,'/upload/pg2.jpg'),(30,15,'/upload/pg30.jpg'),(31,15,'/upload/pg3.jpg'),(32,15,'/upload/pg4.jpg'),(33,19,'/upload/xg1.jpg'),(34,19,'/upload/xg2.jpg'),(35,19,'/upload/xg3.jpg'),(36,19,'/upload/xg4.jpg'),(37,19,'/upload/xg5.jpg'),(38,20,'/upload/wa1.jpg'),(39,20,'/upload/wa2.jpg'),(40,20,'/upload/wa3.jpg'),(41,20,'/upload/wa4.jpg'),(42,20,'/upload/wa5.jpg'),(43,21,'/upload/qx1.jpg'),(44,21,'/upload/qx2.jpg'),(45,21,'/upload/qx3.jpg'),(46,21,'/upload/qx4.jpg'),(47,21,'/upload/qx5.jpg');

/*Table structure for table `foodtype` */

DROP TABLE IF EXISTS `foodtype`;

CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `foodtype` */

insert  into `foodtype`(`id`,`typeName`) values (2,'水果'),(4,'蔬菜'),(5,'海鲜'),(6,'新品种');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `foodCount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id` (`orders_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id`,`orders_id`,`food_id`,`foodCount`) values (34,38,9,2),(35,38,10,2),(36,38,16,1),(37,39,8,5),(38,39,7,2),(39,39,9,1),(40,39,10,1),(41,40,10,1),(42,40,14,1),(43,40,7,1),(44,40,18,2),(45,41,9,1),(46,42,10,1),(47,43,9,2),(48,43,8,1),(49,44,6,4),(50,45,7,3),(51,45,8,1),(52,45,15,1),(53,45,11,1),(54,45,13,1),(55,48,10,1),(56,49,10,1),(57,49,8,1),(58,49,7,1),(59,49,17,1),(60,50,10,2),(61,50,9,1),(62,50,16,1),(63,50,13,1),(64,50,18,2),(65,51,10,2),(66,51,9,1),(67,51,16,1),(68,51,13,1),(69,51,18,2),(70,52,14,2),(71,52,16,2),(72,52,7,2),(73,54,6,2),(74,55,6,2),(75,55,9,1),(76,55,8,1),(77,55,7,1),(78,55,18,1),(79,55,16,1),(80,55,17,1),(81,55,15,1),(82,55,14,1),(83,55,13,1),(84,55,12,1),(85,55,10,1),(86,55,11,1),(87,57,6,3),(88,57,7,1),(89,57,8,1),(90,57,9,1),(91,58,7,1),(92,58,12,2),(93,58,16,1),(94,59,14,2),(95,59,6,2),(96,59,20,3),(97,60,21,2),(98,60,6,2),(99,60,19,2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `totalPrice` double NOT NULL,
  `orderState` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`customer_id`,`orderDate`,`totalPrice`,`orderState`) values (38,18,'2019-04-06',55,1),(39,1,'2019-04-06',160,1),(40,1,'2019-04-06',77,1),(41,1,'2019-04-13',8,1),(42,1,'2019-04-15',12,1),(43,1,'2019-04-15',34,1),(44,1,'2019-04-15',72,1),(45,1,'2019-04-24',127,1),(46,1,'2019-04-25',43,1),(47,1,'2019-04-25',43,1),(48,1,'2019-04-26',12,1),(49,16,'2019-04-26',71,0),(50,1,'2019-04-26',89,1),(51,1,'2019-04-26',89,1),(52,1,'2019-04-29',92,1),(53,1,'2019-04-29',92,0),(54,1,'2019-04-29',36,1),(55,1,'2019-04-29',186,1),(56,1,'2019-05-08',39,0),(57,1,'2019-05-27',100,1),(58,25,'2019-05-28',43.8,1),(59,26,'2019-06-08',49.199999999999996,1),(60,27,'2019-06-08',389.4,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
