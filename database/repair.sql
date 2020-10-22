# Host: localhost  (Version 8.0.17)
# Date: 2020-10-22 13:26:10
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "erepair_category"
#

DROP TABLE IF EXISTS `erepair_category`;
CREATE TABLE `erepair_category` (
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT '0',
  `topic` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  KEY `type` (`type`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "erepair_category"
#

/*!40000 ALTER TABLE `erepair_category` DISABLE KEYS */;
INSERT INTO `erepair_category` VALUES ('repairstatus',1,'แจ้งซ่อม','#660000',1),('repairstatus',2,'กำลังดำเนินการ','#120eeb',1),('repairstatus',3,'รออะไหล่','#d940ff',1),('repairstatus',4,'ซ่อมสำเร็จ','#06d628',1),('repairstatus',5,'ซ่อมไม่สำเร็จ','#FF0000',1),('repairstatus',6,'ยกเลิกการซ่อม','#FF6F00',1),('repairstatus',7,'ส่งมอบเรียบร้อย','#000000',1),('model_id',2,'Asus','',1),('type_id',3,'โปรเจ็คเตอร์','',1),('type_id',2,'เครื่องพิมพ์','',1),('model_id',3,'Cannon','',1),('category_id',1,'เครื่องใช้ไฟฟ้า','',1),('category_id',2,'วัสดุสำนักงาน','',1),('model_id',1,'Apple','',1),('type_id',1,'เครื่องคอมพิวเตอร์','',1),('model_id',4,'ACER','',1),('type_id',4,'จอมอนิเตอร์','',1),('unit',1,'ชิ้น',NULL,1),('unit',2,'อัน',NULL,1),('unit',3,'กล่อง',NULL,1),('unit',4,'เครื่อง',NULL,1),('unit',5,'แพ็ค',NULL,1);
/*!40000 ALTER TABLE `erepair_category` ENABLE KEYS */;

#
# Structure for table "erepair_inventory"
#

DROP TABLE IF EXISTS `erepair_inventory`;
CREATE TABLE `erepair_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_no` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `stock` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_no` (`product_no`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "erepair_inventory"
#

/*!40000 ALTER TABLE `erepair_inventory` DISABLE KEYS */;
INSERT INTO `erepair_inventory` VALUES (1,'จอมอนิเตอร์ ACER S220HQLEBD','1108-365D','2018-08-28 19:49:33',0,0,1,1,1,NULL,1),(2,'ASUS A550JX','0000-0001','2018-08-28 19:49:33',0,0,1,1,1,NULL,1),(3,'Crucial 4GB DDR3L&amp;1600 SODIMM','IF111/036/1','2018-08-28 19:49:33',0,0,1,1,1,NULL,3);
/*!40000 ALTER TABLE `erepair_inventory` ENABLE KEYS */;

#
# Structure for table "erepair_language"
#

DROP TABLE IF EXISTS `erepair_language`;
CREATE TABLE `erepair_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "erepair_language"
#


#
# Structure for table "erepair_repair"
#

DROP TABLE IF EXISTS `erepair_repair`;
CREATE TABLE `erepair_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `appraiser` decimal(10,2) NOT NULL DEFAULT '0.00',
  `repair_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "erepair_repair"
#


#
# Structure for table "erepair_repair_status"
#

DROP TABLE IF EXISTS `erepair_repair_status`;
CREATE TABLE `erepair_repair_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `member_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `repair_id` (`repair_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "erepair_repair_status"
#


#
# Structure for table "erepair_user"
#

DROP TABLE IF EXISTS `erepair_user`;
CREATE TABLE `erepair_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `permission` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `lastvisited` int(11) DEFAULT '0',
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `social` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `id_card` (`id_card`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "erepair_user"
#

/*!40000 ALTER TABLE `erepair_user` DISABLE KEYS */;
INSERT INTO `erepair_user` VALUES (1,'admin@localhost','5f8eb60a8cd53','6547013cdaab0d90cd8ec8cf804ad957a84f0d55',NULL,1,'','แอดมิน',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'2020-10-20 10:03:54',1,0);
/*!40000 ALTER TABLE `erepair_user` ENABLE KEYS */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `lv` char(1) NOT NULL DEFAULT '1' COMMENT '1=user,0=admin',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '1=ใช้งาน,0=แบน',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','7c222fb2927d828af22f592134e8932480637c0d','admin','admin','0','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
