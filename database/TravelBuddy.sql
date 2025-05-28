-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: travelbuddy
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admCodigo` int NOT NULL AUTO_INCREMENT,
  `admEmail` varchar(50) DEFAULT NULL,
  `admSenha` varchar(50) DEFAULT NULL,
  `admNome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'vitor@gmail.com','123','Vitor Keller');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `catCodigo` int NOT NULL AUTO_INCREMENT,
  `catNome` char(40) DEFAULT NULL,
  `catNomeNormal` char(40) DEFAULT '.',
  PRIMARY KEY (`catCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Natureza','natureza'),(6,'Pessoas','pessoas'),(7,'Cachorros','cachorros'),(8,'Café','cafe'),(9,'Pássaros','passaros'),(10,'Carros','carros'),(12,'Lucas é muito viado','lucasemuitoviado');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfis` (
  `perCodigo` int NOT NULL AUTO_INCREMENT,
  `perFoto` varchar(50) DEFAULT 'imgPerfilPadrao.png',
  `perDescricao` varchar(200) DEFAULT 'Você ainda não adicionou uma biografia. Clique na foto e conte-nos um pouco sobre você.',
  `perLocalizacao` varchar(40) DEFAULT 'Você ainda não informou sua localização.',
  `perInteresses` varchar(40) DEFAULT 'Você ainda não tem interesses.',
  `usuCodigo` int DEFAULT NULL,
  PRIMARY KEY (`perCodigo`),
  KEY `fk_perfis_usuario` (`usuCodigo`),
  CONSTRAINT `fk_perfis_usuario` FOREIGN KEY (`usuCodigo`) REFERENCES `usuarios` (`usuCodigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES (2,'imgPerfilPadrao.png','Vamos todos cantar de coração A cruz de malta é o meu pendão Tu tens um nome do heróico Português Vasco da Gama, a tua fama assim se fez Tua imensa torcida é bem feliz Norte-Sul, norte-sul deste Brasi','Araquari- SC','Brasil, China',1),(4,'imgPerfilPadrao.png','Estou brincando meu amigo, você apenas chupa muita rola.','Joinville','A bunda da tua mãe',9),(6,'imgPerfilPadrao.png','Você ainda não adicionou uma bio. Clique na foto e nos conte um pouco sobre você.','Você ainda não informou sua localização','Você ainda não tem interesses',11),(7,'imgPerfilPadrao.png','sou uma bixona','Joinville - SC, Brasil','Piru',12);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuCodigo` int NOT NULL AUTO_INCREMENT,
  `usuEmail` varchar(50) DEFAULT NULL,
  `usuSenha` varchar(50) NOT NULL,
  `usuNome` varchar(50) DEFAULT NULL,
  `usuFoto` varchar(50) DEFAULT 'imgPerfilPadrão.png',
  PRIMARY KEY (`usuCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'vitor@gmail.com','123','Vitor Arthur Keller','perfil_1_1748363452529.jpg'),(9,'teste@gmail.com','123','Vai se foder','perfil_9_1748020853093.jpg'),(11,'vitor2@gmail.com','123','Vitor','imgPerfilPadrão.png'),(12,'lucas@gmail.com','123','Lucas','imgPerfilPadrão.png');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `criar_perfil_apos_usuario` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO perfis (
        perFoto, 
        perDescricao, 
        perLocalizacao, 
        perInteresses, 
        usuCodigo
    ) VALUES (
        'imgPerfilPadrao.png', 
        'Voc� ainda n�o adicionou uma bio. Clique na foto e nos conte um pouco sobre voc�.',
        'Voc� ainda n�o informou sua localiza��o',
        'Voc� ainda n�o tem interesses',
        NEW.usuCodigo
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27 23:51:28
