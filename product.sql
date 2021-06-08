CREATE DATABASE  IF NOT EXISTS `products` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `products`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: products
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account` varchar(50) NOT NULL,
  `idProduct` int NOT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account`) REFERENCES `users` (`name`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21,'2021-06-05 11:02:53','duong',4,1),(22,'2021-06-05 11:02:55','duong',7,1),(23,'2021-06-05 11:02:57','duong',8,1),(24,'2021-06-05 11:03:15','duong',4,1),(28,'2021-06-06 17:03:51','khanh',17,1),(39,'2021-06-08 03:08:26','phong',7,1),(40,'2021-06-08 03:08:29','phong',8,1),(41,'2021-06-08 03:08:32','phong',13,1),(42,'2021-06-08 03:08:34','phong',13,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `idPay` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `datePay` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nameProduct` varchar(50) DEFAULT NULL,
  `typeProduct` varchar(50) DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `countProduct` int DEFAULT NULL,
  PRIMARY KEY (`idPay`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'phong','2021-06-07 07:46:17','Number1','Chai 330ml',5000,1),(2,'phong','2021-06-07 07:53:36','Bia Heineken','Lon 330ml',15000,1),(7,'khanh','2021-06-07 09:20:43','7 Up','Chai 1,5l',9000,1),(11,'tin','2021-06-08 04:11:44','Cocacola','Lon 330ml',7000,1),(12,'tin','2021-06-08 04:11:48','Redbull','Lon 250ml',7000,1);
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'Cocacola','Chai 1,5l',10000,200,'nuoc-ngot-coca-cola-giam-duong-chai-15-lit.jpg'),(7,'Cocacola','Chai 390ml',5000,100,'nuoc-ngot-coca-cola-390ml.jpg'),(8,'Pepsi','Lon 330ml',6000,120,'pepsi-cola-330ml.jpg'),(9,'Redbull','Lon 250ml',7000,200,'nuoc-tang-luc-redbull-lon-250ml.jpg'),(10,'Number1','Chai 330ml',5000,150,'nuoc-tang-luc-number1-330ml.jpg'),(12,'7 Up','Chai 1,5l',9000,150,'nuoc-ngot-7up-15l.jpg'),(13,'Bia Heineken','Lon 330ml',15000,1000,'bia-heineken-330ml.jpg'),(14,'Bia Heineken Silver','Lon 330ml',17000,500,'bia-heineken-silver-330ml.jpg'),(15,'Bia Heineken Sleek','Lon 330ml',17000,500,'bia-heineken-sleek-330ml.jpg'),(16,'Bia Huda','Lon 330ml',15000,1000,'bia-huda-330ml.jpg'),(17,'Bia Huda Ice','Lon 330ml',15000,1000,'bia-huda-ice-blast-330ml.jpg'),(18,'Bia Larue Special','Lon 330ml',15000,500,'bia-larue-special-330ml.jpg'),(19,'Bia Saigon','Lon 330ml',15000,500,'bia-sai-gon-lager-330ml.jpg'),(20,'Bia Tiger','Lon 330ml',15000,500,'bia-tiger-330ml.jpg'),(21,'Bia Tiger Crystal','Lon 330ml',15000,600,'bia-tiger-crystal-330ml.jpg'),(22,'Cocacola','Lon 330ml',7000,300,'nuoc-ngot-coca-cola-330ml.jpg'),(23,'Cocacola Coffe','Lon 330ml',8000,300,'nuoc-ngot-coca-cola-ca-phe-330ml.jpg'),(24,'Cocacola Plus','Lon 320ml',7000,200,'nuoc-ngot-coca-cola-plus-320ml.jpg'),(25,'Cocacola Zero','Lon 320ml',8000,300,'nuoc-ngot-coca-cola-zero-320ml.jpg'),(26,'Cocacola Zero','Chai 390ml',10000,200,'nuoc-ngot-co-ga-coca-cola-zero-chai-390ml.jpg'),(27,'Mirinda Cam','Lon 330ml',10000,100,'mirinda-cam-330ml.jpg'),(28,'Mirinda Cam','Chai 1,5l',16000,50,'mirinda-cam-15l.jpg'),(29,'Mirinda Cam','Chai 390ml',8000,200,'mirinda-cam-390ml.jpg'),(30,'Mirinda Xaxi','Chai 1,5l',15000,50,'mirinda-xaxi-15l.jpg'),(31,'Mirinda Xaxi','Chai 390ml',9000,150,'mirinda-xaxi-390ml.jpg'),(32,'Strongbow Honey','Chai 330ml',18000,200,'strongbow-ciders-honey-330ml.jpg'),(33,'Strongbow Dark Fruit','Lon 330ml',20000,100,'strongbow-dark-fruit-330ml.jpg'),(34,'Strongbow Honey','Lon 330ml',20000,100,'strongbow-vi-mat-ong-330ml.jpg'),(35,'Strongbow Apple','Lon 330ml',20000,150,'strongbow-vi-tao-330ml.jpg'),(36,'Redbull','Chai 150ml',15000,100,'nuoc-tang-luc-redbull-150ml.jpg'),(37,'Strongbow Dark Fruit','Chai 330ml',18000,150,'strongbow-dau-den-chai-330ml.jpg'),(38,'Strongbow Apple','Chai 330ml',18000,100,'strongbow-tao-chai-330ml.jpg'),(39,'Bia Heineken','Hop 24 Lon 300ml',230000,30,'thung-24-lon-bia-heineken-330ml.jpg'),(40,'Bia Heineken Silver','Hop 24 Lon 300ml',240000,40,'thung-24-lon-bia-heineken-silver-330ml.jpg'),(41,'Bia Heineken Sleek','Hop 24 Lon 300ml',230000,100,'thung-24-lon-bia-heineken-sleek-330ml.jpg'),(42,'Bia Huda','Hop 24 Lon 300ml',220000,100,'thung-24-lon-bia-huda-330ml.jpg'),(43,'Bia Huda Ice','Hop 24 Lon 300ml',230000,150,'thung-24-lon-bia-huda-ice-blast-330ml.jpg'),(44,'Bia Larue Special','Hop 24 Lon 300ml',225000,40,'thung-24-lon-bia-larue-special-330ml.jpg'),(45,'Bia Saigon','Hop 24 Lon 300ml',218000,100,'thung-24-lon-bia-sai-gon-special-330ml.jpg'),(46,'Bia Tiger','Hop 24 Lon 300ml',220000,100,'thung-24-lon-bia-tiger-330ml.jpg'),(47,'Bia Tiger Crystal','Hop 24 Lon 300ml',230000,50,'thung-24-lon-bia-tiger-crystal-330ml.jpg'),(48,'Strongbow Dark Fruit','Hop 24 Lon 300ml',430000,20,'thung-24-lon-strongbow-dau-den-330ml.jpg'),(49,'Strongbow Honey','Hop 24 Lon 300ml',430000,40,'thung-24-lon-strongbow-mat-ong-330ml.jpg'),(50,'Strongbow Apple','Hop 24 Lon 300ml',430000,50,'thung-24-lon-strongbow-tao-330ml.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin',NULL,NULL,NULL),('duong','123456','Hoang Duong','Quang Binh','0987654321'),('khanh','111111','Phuoc Khanh','Hue','0987654321'),('phong','123123','Dang Phong','Quang Binh','0987654321');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:23:49
