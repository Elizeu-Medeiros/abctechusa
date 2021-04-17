/*
SQLyog Enterprise v13.0.1 (64 bit)
MySQL - 5.5.49-0+deb8u1 : Database - Database_Programmer_Test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Database_Programmer_Test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Database_Programmer_Test`;

/*Table structure for table `Account_Type_Table` */

DROP TABLE IF EXISTS `Account_Type_Table`;

CREATE TABLE `Account_Type_Table` (
  `account_type_id` int(15) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `Account_Type_Table` */

insert  into `Account_Type_Table`(`account_type_id`,`type_name`) values 
(1,'Reseller'),
(2,'Distributor');

/*Table structure for table `Accounts` */

DROP TABLE IF EXISTS `Accounts`;

CREATE TABLE `Accounts` (
  `account_id` int(15) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(150) DEFAULT NULL,
  `account_type_id` int(15) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `industry_id` int(15) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `Account_Type_FK` (`account_type_id`),
  KEY `Industry_FK` (`industry_id`),
  CONSTRAINT `Account_Type_FK` FOREIGN KEY (`account_type_id`) REFERENCES `Account_Type_Table` (`account_type_id`),
  CONSTRAINT `Industry_FK` FOREIGN KEY (`industry_id`) REFERENCES `Industry_Type_Table` (`industry_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `Accounts` */

insert  into `Accounts`(`account_id`,`account_name`,`account_type_id`,`state`,`industry_id`) values 
(1,'Vasco',1,'FL',1),
(2,'Flamengo',1,'FL',1),
(3,'Santos',2,'FL',2),
(4,'Conrinthians',2,'FL',2),
(5,'Fluminense',1,'CA',2),
(6,'Botfogo',2,'CA',4),
(7,'Palmeiras',2,'CA',5),
(8,'Gremio',1,'FL',3),
(9,'Internacional',1,'CA',5),
(10,'Chape',2,'CA',4);

/*Table structure for table `Industry_Type_Table` */

DROP TABLE IF EXISTS `Industry_Type_Table`;

CREATE TABLE `Industry_Type_Table` (
  `industry_type_id` int(15) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`industry_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `Industry_Type_Table` */

insert  into `Industry_Type_Table`(`industry_type_id`,`industry_name`) values 
(1,'Manufacturer'),
(2,'Bank'),
(3,'Education'),
(4,'Service'),
(5,'Retail');

/*Table structure for table `Payment_Status` */

DROP TABLE IF EXISTS `Payment_Status`;

CREATE TABLE `Payment_Status` (
  `payment_status_id` int(15) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `Payment_Status` */

insert  into `Payment_Status`(`payment_status_id`,`status_name`) values 
(1,'Pending'),
(2,'Paid');

/*Table structure for table `Sales_Order` */

DROP TABLE IF EXISTS `Sales_Order`;

CREATE TABLE `Sales_Order` (
  `sales_order_id` int(15) NOT NULL AUTO_INCREMENT,
  `account_id` int(15) DEFAULT NULL,
  `total_sales` decimal(10,2) DEFAULT NULL,
  `status_id` int(15) DEFAULT NULL,
  PRIMARY KEY (`sales_order_id`),
  KEY `accountFK` (`account_id`),
  KEY `statusFK` (`status_id`),
  CONSTRAINT `accountFK` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`account_id`),
  CONSTRAINT `statusFK` FOREIGN KEY (`status_id`) REFERENCES `Sales_Order_Status_Table` (`sales_order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `Sales_Order` */

insert  into `Sales_Order`(`sales_order_id`,`account_id`,`total_sales`,`status_id`) values 
(1,1,10000.00,2),
(2,2,4300.00,1),
(3,3,23.00,3),
(4,4,540.00,2),
(5,5,2345.00,1),
(6,6,12212.00,3),
(7,7,8976.00,3),
(8,10,223344.00,2),
(9,8,8878.00,2),
(10,9,2238.00,3),
(11,1,11223.00,3),
(12,2,3443.00,2),
(13,3,1123.00,1),
(14,4,94849.00,1),
(15,5,99878.00,3),
(16,6,1.23,2),
(17,7,123.00,2),
(18,8,9876.00,3),
(19,9,99999.00,2),
(20,10,1827.00,3);

/*Table structure for table `Sales_Order_Payment` */

DROP TABLE IF EXISTS `Sales_Order_Payment`;

CREATE TABLE `Sales_Order_Payment` (
  `sales_order_payment_id` int(15) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(15) DEFAULT NULL,
  `payment_status` int(15) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sales_order_payment_id`),
  KEY `SO_FK` (`sales_order_id`),
  KEY `status_FK` (`payment_status`),
  CONSTRAINT `SO_FK` FOREIGN KEY (`sales_order_id`) REFERENCES `Sales_Order` (`sales_order_id`),
  CONSTRAINT `status_FK` FOREIGN KEY (`payment_status`) REFERENCES `Payment_Status` (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `Sales_Order_Payment` */

insert  into `Sales_Order_Payment`(`sales_order_payment_id`,`sales_order_id`,`payment_status`,`payment_amount`) values 
(1,1,2,10000.00),
(2,2,2,1234.00),
(3,3,1,23.00),
(4,4,2,500.00),
(5,4,2,40.00),
(6,5,2,2300.00),
(7,5,1,45.00),
(8,6,1,12212.00),
(9,7,2,8976.00),
(10,8,2,223344.00),
(11,9,1,8878.00),
(12,10,2,2238.00),
(13,11,2,11223.00),
(14,12,1,3443.00),
(15,13,2,1123.00),
(16,14,2,94000.00),
(17,14,1,849.00),
(18,15,2,99878.00),
(19,16,1,1.23),
(20,17,2,123.00),
(21,18,2,9876.00),
(22,19,1,99999.00),
(23,20,2,1827.00);

/*Table structure for table `Sales_Order_Status_Table` */

DROP TABLE IF EXISTS `Sales_Order_Status_Table`;

CREATE TABLE `Sales_Order_Status_Table` (
  `sales_order_status_id` int(15) NOT NULL AUTO_INCREMENT,
  `sales_order_status_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`sales_order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `Sales_Order_Status_Table` */

insert  into `Sales_Order_Status_Table`(`sales_order_status_id`,`sales_order_status_name`) values 
(1,'Pending'),
(2,'Submitted'),
(3,'Complete');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
