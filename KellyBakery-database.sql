-- DATABASE FOR BAKERY's INVOICES
DROP DATABASE IF EXIsTS `kelly_invoices`;
CREATE DATABASE `kelly_invoices`;
USE `kelly_invoices`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

	-- CREATE TABLE FOR PAYMENT METHOD
	CREATE TABLE `payment_methods` (
		`payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
		`payment_method_name` varchar(50) NOT NULL,
		PRIMARY KEY (`payment_method_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	-- INSERT PROTOTYPE: < INSERT INTO `payment_methods` VALUES (payment_method_id,payment_method_name); >
	INSERT INTO `payment_methods` VALUES (1,'Credit');
	INSERT INTO `payment_methods` VALUES (2,'Debit');
	INSERT INTO `payment_methods` VALUES (3,'Cash');
	INSERT INTO `payment_methods` VALUES (4,'Bitcoin');

	-- CREATE TABLE FOR CUSTOMERS
	CREATE TABLE `customers` (
		`customer_id` int(11) NOT NULL,
		`customer_first_name` varchar(50) NOT NULL,
		`customer_last_name` varchar(50) NOT NULL,
		`customer_email` varchar(50) NOT NULL,
		`customer_phone` varchar(50) DEFAULT NULL,
		PRIMARY KEY (`customer_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	-- INSERT PROTOTYPE: < INSERT INTO `customers` VALUES (customer_id,customer_first_name,customer_last_name,customer_email,customer_phone); >
	INSERT INTO `customers` VALUES (1, 'Anthony', 'Zhang' , 'azhang@gmail.com', '909-123-4567');
	INSERT INTO `customers` VALUES (2, 'Bradley', 'Pitt' , 'BradPitt@yahoo.com', '657- 086-3675');
	INSERT INTO `customers` VALUES (3, 'Viyoka', 'Lim' , 'vlim@gmail.com', '626-132-8641');
	INSERT INTO `customers` VALUES (4, 'Austin', 'Niu' , 'aNiu@hotmail.com', '213-876-9542');
	INSERT INTO `customers` VALUES (5, 'Scarlett', 'Johanssen' , 'scarjo@gmail.com', '909-765-1527');
	INSERT INTO `customers` VALUES (6, 'Donald', 'Trump' , 'DTprez2024@gmail.com', '765-123-0000');
	INSERT INTO `customers` VALUES (7, 'Joey', 'Biden' , 'jbiden2024@OfficeOfThePresident.gov', '909-162-1237');
	INSERT INTO `customers` VALUES (8, 'Jeremy', 'Contreras' , 'jcontreras@gmail.com', '456-122-9999');
	INSERT INTO `customers` VALUES (9, 'Brandon', 'Mao' , 'bmao@gmail.com', '909-132-2341');
	
	-- CREATE TABLE FOR ORDERS
	CREATE TABLE `orders` (
		`order_id` int(11) NOT NULL,
		`order_num` varchar(50) NOT NULL,
		`customer_id` int(11) NOT NULL,
		`order_total` decimal(9,2) NOT NULL DEFAULT '0.00',
		`order_date` date NOT NULL,
		`pickup_date` date DEFAULT NULL,
		PRIMARY KEY (`order_id`),
		KEY `FK_customer_id` (`customer_id`),
		CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	-- INSERT PROTOTYPE: < INSERT INTO `orders` VALUES (order_id,order_num,customer_id,order_total,order_date,pickup_date); >
	INSERT INTO `orderss` VALUES (1,'100-001',1,987.00,'2022-01-01','2022-01-07');
	INSERT INTO `orders` VALUES (2,'100-002',2,91.00,'2022-01-02','2022-01-03');
	INSERT INTO `orders` VALUES (3,'100-003',2,16.36,'2022-01-02','2022-01-03');
	INSERT INTO `orders` VALUES (4,'100-003',3,156.36,'2022-01-04','2022-01-05');

	--CREATE TABLE FOR PAYMENTS
	CREATE TABLE `payments` (
		`payment_id` int(11) NOT NULL AUTO_INCREMENT,
		`customer_id` int(11) NOT NULL,
		`order_id` int(11) NOT NULL,
		`payment_date` date NOT NULL,
		`payment_total`decimal(9, 2) NOT NULL,
		`payment_method` tinyint(4) NOT NULL,
		PRIMARY KEY (`payment_id`),
		KEY `fk_customer_id_idx` (`customer_id`),
		KEY `fk_order_id_idx` (`order_id`),
		KEY `fk_payment_method_idx` (`payment_method`),
		CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
		CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
		CONSTRAINT `fk_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	-- INSERT PROTOTYPE: < INSERT INTO `payments` VALUES (payment_id,customer_id,order_id,payment_date,payment_total,payment_method); >
	INSERT INTO `payments` VALUES (1,1,1,'2022-01-01',987.00,3);
	INSERT INTO `payments` VALUES (2,2,2,'2022-01-02',91.0,1);
	INSERT INTO `payments` VALUES (3,2,3,'2022-01-02',16.36,2);
	INSERT INTO `payments` VALUES (4,3,4,'2022-01-04',156.36,1);

-- DATABASE FOR BAKERY's PRODUCTS
DROP DATABASE IF EXISTS `kelly_products`;
CREATE DATABASE `kelly_products`;
USE `kelly_products`;



--DATABASE FOR BAKERY's MANAGEMENT
DROP DATABASE IF EXISTS `kelly_management`;
CREATE DATABASE `kelly_management`;
USE `kelly_management`;

