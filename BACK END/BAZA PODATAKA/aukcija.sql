-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.20 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for aukcija
CREATE DATABASE IF NOT EXISTS `aukcija` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aukcija`;

-- Dumping structure for table aukcija.administrator
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`administrator_id`) USING BTREE,
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.administrator: ~6 rows (approximately)
DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`, `created_at`) VALUES
	(1, 'zekapeka', 'zekapeka1', '2020-06-07 03:35:28'),
	(2, 'natasica', 'F6ED0E76BDF2E6E2D8A3709C69E230921A57E1C20643D5953DB19DA98F9AC4DD4833A4BCA16349290A4130051E59AD2ACB216C48CF8B09C37C7D8766EE2165F7', '2020-06-07 03:35:52'),
	(3, 'pperic', 'AC4617DA53E646CCE8B7A184C64201378ECC84190BD39E368BF775E277BF4F20D0B67322A4854F8E26C8B49F35D777834AE2B82F8E2852B7677B488872BC4647', '2020-06-19 19:08:23'),
	(5, 'mmiric', '75DA78675599EA9939F6B58914D5DFD74C0848524DD480CFBA00C01202E95E26E2956E12E3180C7FF517AEE584A754FA51B8453E9444285707421D65916AC988', '2020-06-19 20:04:16'),
	(7, 'admin', 'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC', '2020-06-29 21:43:47'),
	(8, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF', '2020-07-01 02:53:14');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

-- Dumping structure for table aukcija.auction
CREATE TABLE IF NOT EXISTS `auction` (
  `auction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `auction_name` varchar(128) NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` datetime NOT NULL,
  PRIMARY KEY (`auction_id`),
  KEY `fk_auction_product_id` (`product_id`),
  KEY `fk_auction_user_id` (`user_id`),
  CONSTRAINT `fk_auction_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_auction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.auction: ~0 rows (approximately)
DELETE FROM `auction`;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` (`auction_id`, `auction_name`, `user_id`, `product_id`, `status`, `created_at`, `duration`) VALUES
	(6, 'Prodajem gitaru', 1, 1, 'active', '2020-06-26 22:33:33', '2020-07-03 23:33:36');
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;

-- Dumping structure for table aukcija.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(128) NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_cat_name` (`cat_name`) USING BTREE,
  UNIQUE KEY `uq_category_image_path` (`image_path`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.category: ~8 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `cat_name`, `image_path`) VALUES
	(1, 'Računari i oprema', 'slike/pc.jpg'),
	(2, 'Mobilni telefoni', 'slike/mob.jpg'),
	(3, 'Knjige', 'slike/book.jpg'),
	(4, 'Za decu i bebe', 'slike/kids.jpg'),
	(5, 'Aksesoari', 'slike/aks.jpg'),
	(6, 'Obuća', 'slike/obuca.jpg'),
	(7, 'Za kućne ljubimce', 'slike/pets.jpg'),
	(8, 'Mašine i alati', 'slike/tools.jpg'),
	(9, 'Sportska oprema', 'slike/sport.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table aukcija.image
CREATE TABLE IF NOT EXISTS `image` (
  `image_id` int unsigned NOT NULL AUTO_INCREMENT,
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `uq_image_image_path` (`image_path`),
  KEY `fk_image_product_id` (`product_id`),
  CONSTRAINT `fk_image_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.image: ~4 rows (approximately)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`image_id`, `image_path`, `product_id`) VALUES
	(1, 'images/lala/gitarica.jpg', 1),
	(2, 'images/lala/git.jpg', 1),
	(4, '202071-8140855672-tast.jpg', 2),
	(5, '202072-7330785814-tast2.jpg', 2),
	(6, '202072-4825671527-tast2.jpg', 2);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

-- Dumping structure for table aukcija.product
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(128) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_category_id` (`category_id`),
  KEY `fk_product_user_id` (`user_id`),
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_product_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.product: ~2 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`, `product_name`, `description`, `category_id`, `user_id`, `created_at`) VALUES
	(1, 'Fender gitara', 'Skoro kao nova, nije ni koriscena cestito.', 5, 1, '2020-06-08 09:17:12'),
	(2, 'Tastatura', 'gejming tastatura, koriscena oko 2 meseca', 1, 2, '2020-06-08 09:18:01'),
	(3, 'Bicikl', 'Skoro pa nov bajs, ide kao besan', 9, 1, '2020-06-27 13:03:58');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table aukcija.product_price
CREATE TABLE IF NOT EXISTS `product_price` (
  `product_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_price_id`) USING BTREE,
  KEY `fk_product_price_product_id` (`product_id`),
  CONSTRAINT `fk_product_price_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.product_price: ~2 rows (approximately)
DELETE FROM `product_price`;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` (`product_price_id`, `product_id`, `price`, `created_at`) VALUES
	(1, 2, 1000.00, '2020-06-08 09:19:12'),
	(2, 1, 14000.00, '2020-06-08 09:19:28'),
	(3, 1, 16000.00, '2020-06-26 20:55:37');
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;

-- Dumping structure for table aukcija.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `surname` varchar(50) NOT NULL DEFAULT '0',
  `number` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table aukcija.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `username`, `password_hash`, `name`, `surname`, `number`, `address`, `created_at`) VALUES
	(1, 'zeka1', '123456', 'Mirko', 'Milosevic', '9128391', 'Mirka Mirkovica 13', '2020-06-08 09:13:09'),
	(2, 'lala', '5234324', 'Lala', 'Lalic', '2413441', 'Lale Lalica 12', '2020-06-08 09:13:32');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
