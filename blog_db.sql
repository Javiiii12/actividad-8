-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (2,'Post Author','postauthor@example.com','author.jpg'),(4,'Gabriel García Márquez','gabriel.garcia@literatura.com','gabriel.jpg'),(5,'Isabel Allende','isabel.allende@escritores.com','isabel.jpg'),(6,'Mario Vargas Llosa','mario.vargas@novelas.com','mario.jpg'),(7,'Julio Cortázar','julio.cortazar@cronopios.com','julio.jpg'),(8,'Jorge Luis Borges','jorge.borges@laberintos.com','jorge.jpg');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `category` varchar(100) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'Cien años de soledad','La historia de la familia Buendía en el pueblo ficticio de Macondo.','2025-12-01 00:22:40','Realismo Mágico',4),(3,'El amor en los tiempos del cólera','Una historia de amor que perdura a través de décadas.','2025-12-01 00:22:40','Romance',4),(4,'La casa de los espíritus','La saga de la familia Trueba a través de cuatro generaciones.','2025-12-01 00:22:40','Realismo Mágico',5),(5,'Paula','Un relato autobiográfico conmovedor escrito durante la enfermedad de su hija.','2025-12-01 00:22:40','Biografía',5),(6,'La ciudad y los perros','Una novela que explora la brutalidad en un colegio militar en Lima.','2025-12-01 00:22:40','Novela',6),(7,'La fiesta del Chivo','Una novela sobre la dictadura de Rafael Trujillo en República Dominicana.','2025-12-01 00:22:40','Novela Histórica',6),(8,'Rayuela','Una contranovela que juega con la estructura y el lenguaje.','2025-12-01 00:22:40','Experimental',7),(9,'Bestiario','Una colección de cuentos donde lo fantástico irrumpe en lo cotidiano.','2025-12-01 00:22:40','Cuentos',7),(10,'Ficciones','Una colección de cuentos que exploran laberintos, espejos y el infinito.','2025-12-01 00:22:40','Fantasía',8),(11,'El Aleph','Cuentos que abordan temas filosóficos y metafísicos.','2025-12-01 00:22:40','Filosofía',8),(12,'Cien años de soledad','La historia de la familia Buendía en el pueblo ficticio de Macondo.','2025-12-01 00:26:19','Realismo Mágico',4),(13,'El amor en los tiempos del cólera','Una historia de amor que perdura a través de décadas.','2025-12-01 00:26:19','Romance',4),(14,'La casa de los espíritus','La saga de la familia Trueba a través de cuatro generaciones.','2025-12-01 00:26:19','Realismo Mágico',5),(15,'Paula','Un relato autobiográfico conmovedor escrito durante la enfermedad de su hija.','2025-12-01 00:26:19','Biografía',5),(16,'La ciudad y los perros','Una novela que explora la brutalidad en un colegio militar en Lima.','2025-12-01 00:26:19','Novela',6),(17,'La fiesta del Chivo','Una novela sobre la dictadura de Rafael Trujillo en República Dominicana.','2025-12-01 00:26:19','Novela Histórica',6),(18,'Rayuela','Una contranovela que juega con la estructura y el lenguaje.','2025-12-01 00:26:19','Experimental',7),(19,'Bestiario','Una colección de cuentos donde lo fantástico irrumpe en lo cotidiano.','2025-12-01 00:26:19','Cuentos',7),(20,'Ficciones','Una colección de cuentos que exploran laberintos, espejos y el infinito.','2025-12-01 00:26:19','Fantasía',8),(21,'El Aleph','Cuentos que abordan temas filosóficos y metafísicos.','2025-12-01 00:26:19','Filosofía',8);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 18:42:28
