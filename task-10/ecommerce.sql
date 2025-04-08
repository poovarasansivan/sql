/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ecommerce`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` varchar(150) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categories` */

insert  into `categories`(`category_id`,`category_name`) values 
('CAT001','Electronics'),
('CAT002','Books'),
('CAT003','Fashion'),
('CAT004','Home & Kitchen'),
('CAT005','Sports & Outdoors');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `inventory_id` varchar(150) NOT NULL,
  `product_id` varchar(150) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`inventory_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inventory` */

insert  into `inventory`(`inventory_id`,`product_id`,`stock_quantity`,`last_update`) values 
('INV001','PROD001',49,'2025-04-08 09:27:09'),
('INV002','PROD002',100,'2025-04-08 09:27:09'),
('INV003','PROD003',200,'2025-04-08 09:27:09'),
('INV004','PROD004',75,'2025-04-08 09:27:09'),
('INV005','PROD005',150,'2025-04-08 09:27:09');

/*Table structure for table `ordered_items` */

DROP TABLE IF EXISTS `ordered_items`;

CREATE TABLE `ordered_items` (
  `ordered_item_id` varchar(150) NOT NULL,
  `order_id` varchar(150) DEFAULT NULL,
  `product_id` varchar(150) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price_per_item` int(11) DEFAULT NULL,
  PRIMARY KEY (`ordered_item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ordered_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ordered_items` */

insert  into `ordered_items`(`ordered_item_id`,`order_id`,`product_id`,`quantity`,`price_per_item`) values 
('ITEM001','ORD005','PROD001',1,19999),
('ITEM002','ORD005','PROD005',2,899),
('ITEM003','ORD006','PROD003',3,499),
('ITEM004','ORD006','PROD002',1,799),
('ITEM005','ORD007','PROD004',1,1299),
('ITEM006','ORD007','PROD005',1,899),
('ITEM007','ORD008','PROD001',2,19999),
('ITEM008','ORD008','PROD003',1,499),
('ITEM009','ORD009','PROD002',2,799),
('ITEM010','ORD010','PROD004',1,1299),
('ITEM011','ORD011','PROD001',1,19999);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` varchar(150) NOT NULL,
  `user_id` varchar(150) DEFAULT NULL,
  `ordered_date` datetime DEFAULT curdate(),
  `total_amount` int(11) DEFAULT NULL,
  `shipping_address_id` varchar(150) DEFAULT NULL,
  `order_status` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `idx_orders_user_id` (`user_id`),
  KEY `idx_order_date` (`ordered_date`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `users_addresses` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`user_id`,`ordered_date`,`total_amount`,`shipping_address_id`,`order_status`) values 
('ORD005','USR003','2025-04-08 09:13:08',1500,'ADDR003','Cancelled'),
('ORD006','USR003','2025-04-08 09:13:08',750,'ADDR003','Shipped'),
('ORD007','USR004','2025-04-08 09:13:08',2099,'ADDR004','Delivered'),
('ORD008','USR004','2025-04-08 09:13:08',3200,'ADDR004','Processing'),
('ORD009','USR005','2025-04-08 09:13:08',899,'ADDR005','Delivered'),
('ORD010','USR005','2025-04-08 09:13:08',1299,'ADDR005','Shipped'),
('ORD011','USR003','2025-04-08 10:46:59',2500,'ADDR003','Shipped');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` varchar(200) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category_id` varchar(150) DEFAULT NULL,
  `brand` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_id`),
  KEY `idx_product_price` (`price`),
  KEY `idx_category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_name`,`product_description`,`price`,`category_id`,`brand`,`created_at`) values 
('PROD001','Smartphone XYZ','A powerful smartphone with 8GB RAM and 128GB storage.',19999,'CAT001','TechBrand','2025-04-08 09:07:36'),
('PROD002','Modern Java Programming','Comprehensive guide to Java for beginners and professionals.',799,'CAT002','CodeBooks','2025-04-08 09:07:36'),
('PROD003','Men\'s Casual T-Shirt','100% cotton, slim fit t-shirt perfect for everyday wear.',499,'CAT003','StyleHub','2025-04-08 09:07:36'),
('PROD004','Non-Stick Frying Pan','Durable non-stick pan with ergonomic handle and even heat distribution.',1299,'CAT004','HomeEssentials','2025-04-08 09:07:36'),
('PROD005','Yoga Mat - Eco Friendly','High-density, non-slip yoga mat for fitness and stretching.',899,'CAT005','FitLife','2025-04-08 09:07:36');

/*Table structure for table `shipments` */

DROP TABLE IF EXISTS `shipments`;

CREATE TABLE `shipments` (
  `shipment_id` varchar(150) NOT NULL,
  `order_id` varchar(150) DEFAULT NULL,
  `carrier` varchar(150) DEFAULT NULL,
  `tracking_number` varchar(150) DEFAULT NULL,
  `shipped_date` datetime DEFAULT curdate(),
  `delivery_date` datetime DEFAULT curdate(),
  `delivery_status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `shipments` */

insert  into `shipments`(`shipment_id`,`order_id`,`carrier`,`tracking_number`,`shipped_date`,`delivery_date`,`delivery_status`) values 
('SHIP001','ORD005','BlueDart','BD123456789','2025-04-03 09:24:02','2025-04-06 09:24:02','Delivered'),
('SHIP002','ORD006','DTDC','DT987654321','2025-04-05 09:24:02','2025-04-08 09:24:02','Delivered'),
('SHIP003','ORD007','Delhivery','DL456789123','2025-04-06 09:24:02',NULL,'In Transit'),
('SHIP004','ORD008','Ecom Express','EC112233445','2025-04-07 09:24:02',NULL,'Shipped'),
('SHIP005','ORD009','XpressBees','XP998877665','2025-04-04 09:24:02','2025-04-07 09:24:02','Delivered'),
('SHIP006','ORD010','XpressBees','XP998877165','2025-04-04 09:24:02','2025-04-07 09:24:02','Delivered');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  KEY `idx_users_email` (`email`),
  KEY `idx_users_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_name`,`phone_no`,`email`,`role`,`created_at`) values 
('USR001','Alice Johnson','9876543210','alice@gmail.com','Admin','2025-04-08 08:54:11'),
('USR002','Bob Smith','9123456780','bob@gmail.com','Vendor','2025-04-08 08:54:11'),
('USR003','Charlie Davis','9988776655','charlie@gmail.com','User','2025-04-08 08:54:11'),
('USR004','Diana Prince','9090909090','diana@gmail.com','User','2025-04-08 08:54:11'),
('USR005','Ethan Hunt','9001122334','ethan@gmail.com','User','2025-04-08 08:54:11');

/*Table structure for table `users_addresses` */

DROP TABLE IF EXISTS `users_addresses`;

CREATE TABLE `users_addresses` (
  `address_id` varchar(100) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `address_line1` text DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users_addresses` */

insert  into `users_addresses`(`address_id`,`user_id`,`address_line1`,`city`,`state`,`pin_code`,`country`) values 
('ADDR002','USR002','45, Park Avenue, Downtown','Mumbai','Maharashtra',400001,'India'),
('ADDR003','USR003','789, Sector 21, HUDA Colony','Gurgaon','Haryana',122001,'India'),
('ADDR004','USR004','12A, Lake View Street','Kochi','Kerala',682001,'India'),
('ADDR005','USR005','301, Hilltop Residency, Banjara Hills','Hyderabad','Telangana',500034,'India');

/* Trigger structure for table `ordered_items` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_inventory_after_order` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_inventory_after_order` AFTER INSERT ON `ordered_items` FOR EACH ROW 
BEGIN
  UPDATE inventory
  SET stock_quantity = stock_quantity - NEW.quantity
  WHERE product_id = NEW.product_id;
END */$$


DELIMITER ;

/* Function  structure for function  `calculate_discount` */

/*!50003 DROP FUNCTION IF EXISTS `calculate_discount` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_discount`(product_price decimal(10,2)) RETURNS decimal(10,2)
begin
declare discount decimal(10,2);
if product_price>15000 then
	set discount = product_price*0.10;
else 
    SET discount = product_price * 0.05;
end if;
return discount;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetTotalOrders` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetTotalOrders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalOrders`(in start_date Date, in end_date date)
begin 
select count(order_id) as total_orders from orders where ordered_date between start_date and end_date;
end */$$
DELIMITER ;

/*Table structure for table `order_summary` */

DROP TABLE IF EXISTS `order_summary`;

/*!50001 DROP VIEW IF EXISTS `order_summary` */;
/*!50001 DROP TABLE IF EXISTS `order_summary` */;

/*!50001 CREATE TABLE  `order_summary`(
 `order_id` varchar(150) ,
 `user_id` varchar(150) ,
 `customer_name` varchar(100) ,
 `ordered_date` datetime ,
 `total_items` decimal(32,0) 
)*/;

/*View structure for view order_summary */

/*!50001 DROP TABLE IF EXISTS `order_summary` */;
/*!50001 DROP VIEW IF EXISTS `order_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_summary` AS select `o`.`order_id` AS `order_id`,`o`.`user_id` AS `user_id`,`u`.`user_name` AS `customer_name`,`o`.`ordered_date` AS `ordered_date`,sum(`oi`.`quantity`) AS `total_items` from ((`orders` `o` join `users` `u` on(`o`.`user_id` = `u`.`user_id`)) join `ordered_items` `oi` on(`o`.`order_id` = `oi`.`order_id`)) group by `o`.`order_id`,`o`.`user_id`,`u`.`user_name`,`o`.`ordered_date` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
