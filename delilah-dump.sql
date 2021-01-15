CREATE DATABASE delilahresto;
USE delilahresto;

-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: delilahresto
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `order__products`
--

DROP TABLE IF EXISTS `order__products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order__products` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `fk_order__products_order_idx` (`order_id`),
  KEY `fk_order__products_products1_idx` (`product_id`),
  CONSTRAINT `fk_order__products_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order__products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_products`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order__products`
--

LOCK TABLES `order__products` WRITE;
/*!40000 ALTER TABLE `order__products` DISABLE KEYS */;
INSERT INTO `order__products` VALUES (1,1),(2,1),(3,2),(4,3),(5,3),(1,1),(1,3),(14,1),(14,2),(14,4);
/*!40000 ALTER TABLE `order__products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_option` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_order_users1_idx` (`user_id`),
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'cash','nueva',4,'2020-11-22 21:22:14'),(2,'cash','nuevo',4,'2020-11-22 21:22:14'),(3,'cash','nuevo',4,'2020-11-22 21:22:14'),(4,'cash','preparando',2,'2020-11-22 21:22:14'),(5,'card','cancelado',1,'2020-11-22 21:22:14'),(6,'cash','created',1,'2021-01-07 23:00:27'),(7,'cash','created',1,'2021-01-07 23:02:32'),(8,'cash','created',1,'2021-01-07 23:17:50'),(9,'cash','created',1,'2021-01-07 23:22:32'),(10,'cash','created',1,'2021-01-07 23:25:17'),(11,'cash','created',1,'2021-01-08 00:16:59'),(12,'cash','created',1,'2021-01-08 00:18:05'),(13,'cash','created',1,'2021-01-08 00:20:09'),(14,'cash','created',1,'2021-01-08 00:24:19'),(15,'cash','created',1,'2021-01-08 00:49:50');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_products` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_products`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bagel JyQ',607,'https://i.imgur.com/6DIye2w.jpeg'),(2,'Hamburguesa Clasica',350,'https://i.imgur.com/L5IhOun.png'),(3,'Hamburguesa Veggie',310,'https://i.imgur.com/gy2PZFv.jpg'),(4,'Ravioles',250,'https://i.imgur.com/t0WIww9.jpeg'),(6,'Canapes',250,'https://i.imgur.com/yyH1DZ2.jpeg'),(7,'Fideos Pesto',250,'https://i.imgur.com/EGwCV3S.jpg'),(8,'Pizza veggie',600,'https://i.imgur.com/cnsPHzA.jpeg'),(9,'Pizza Asiatica',690,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(45) NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Noelia','loecita@hotmail.com','blabla 123','123456',1),(2,'San','San@hotmail.com','blabla 1234','123456',0),(3,'Ben','Ben@hotmail.com','blabla 12345','123456',1),(4,'John','John@hotmail.com','blabla 123567','123456',0),(5,'Jules','Jules@hotmail.com','blabla 1236686','123456',0),(6,'Nuevo user','loecita2@hotmail.com','test address 1234','1234456',0),(7,'Robert Ricard','robert@hotmail.com','test address 1234','1234456',0),(8,'Richard Jupiter','richard@hotmail.com','test address 1234','1234456',0),(9,'Nuevo user','boomboom@hotmail.com','test address 1234','1234456',0);
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

-- Dump completed on 2021-01-14 21:02:31
