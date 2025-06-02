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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,'admin@gmail.com','admin','Admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Carro','carro'),(2,'Cachorro','cachorro'),(3,'Paisagem','paisagem'),(4,'Montanha','montanha'),(5,'Life Style','lifestyle'),(6,'Fofo','fofo'),(7,'Pintura','pintura'),(8,'Dança','danca'),(9,'Futebol','futebol'),(10,'Trem','trem'),(11,'Corrida','corrida'),(12,'Urbana','urbana'),(13,'Noturna','noturna'),(14,'Viagem','viagem'),(15,'Arquitetura','arquitetura'),(16,'Moda','moda'),(17,'Natureza','natureza'),(18,'Subaquática','subaquatica'),(19,'Aérea','aerea'),(20,'Esportes','esportes'),(21,'Documental','documental'),(22,'Culinária','culinaria'),(23,'Animais','animais'),(24,'Abstrata','abstrata'),(25,'Casamento','casamento'),(26,'Eventos','eventos'),(27,'Conceitual','conceitual'),(28,'Selfie','selfie'),(29,'Panorâmica','panoramica'),(30,'Minimalista','minimalista');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `paisCodigo` int NOT NULL AUTO_INCREMENT,
  `paisNome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`paisCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afeganistão'),(2,'África do Sul'),(3,'Albânia'),(4,'Alemanha'),(5,'Andorra'),(6,'Angola'),(7,'Antígua e Barbuda'),(8,'Arábia Saudita'),(9,'Argélia'),(10,'Argentina'),(11,'Armênia'),(12,'Austrália'),(13,'Áustria'),(14,'Azerbaijão'),(15,'Bahamas'),(16,'Bangladesh'),(17,'Barbados'),(18,'Barém'),(19,'Belarus'),(20,'Bélgica'),(21,'Belize'),(22,'Benim'),(23,'Bolívia'),(24,'Bósnia e Herzegovina'),(25,'Botsuana'),(26,'Brasil'),(27,'Brunei'),(28,'Bulgária'),(29,'Burkina Fasso'),(30,'Burundi'),(31,'Butão'),(32,'Cabo Verde'),(33,'Camarões'),(34,'Camboja'),(35,'Canadá'),(36,'Catar'),(37,'Cazaquistão'),(38,'Chade'),(39,'Chile'),(40,'China'),(41,'Chipre'),(42,'Colômbia'),(43,'Comores'),(44,'Congo'),(45,'Coreia do Norte'),(46,'Coreia do Sul'),(47,'Costa do Marfim'),(48,'Costa Rica'),(49,'Croácia'),(50,'Cuba'),(51,'Dinamarca'),(52,'Djibuti'),(53,'Dominica'),(54,'Egito'),(55,'El Salvador'),(56,'Emirados Árabes Unidos'),(57,'Equador'),(58,'Eritreia'),(59,'Eslováquia'),(60,'Eslovênia'),(61,'Espanha'),(62,'Estados Unidos'),(63,'Estônia'),(64,'Eswatini'),(65,'Etiópia'),(66,'Fiji'),(67,'Filipinas'),(68,'Finlândia'),(69,'França'),(70,'Gabão'),(71,'Gâmbia'),(72,'Gana'),(73,'Geórgia'),(74,'Granada'),(75,'Grécia'),(76,'Guatemala'),(77,'Guiana'),(78,'Guiné'),(79,'Guiné-Bissau'),(80,'Guiné Equatorial'),(81,'Haiti'),(82,'Holanda'),(83,'Honduras'),(84,'Hungria'),(85,'Iémen'),(86,'Ilhas Marshall'),(87,'Ilhas Salomão'),(88,'Índia'),(89,'Indonésia'),(90,'Irã'),(91,'Iraque'),(92,'Irlanda'),(93,'Islândia'),(94,'Israel Não é Pais'),(95,'Itália'),(96,'Jamaica'),(97,'Japão'),(98,'Jordânia'),(99,'Kiribati'),(100,'Kosovo'),(101,'Kuwait'),(102,'Laos'),(103,'Lesoto'),(104,'Letônia'),(105,'Líbano'),(106,'Libéria'),(107,'Líbia'),(108,'Liechtenstein'),(109,'Lituânia'),(110,'Luxemburgo'),(111,'Macedônia do Norte'),(112,'Madagáscar'),(113,'Malásia'),(114,'Malawi'),(115,'Maldivas'),(116,'Mali'),(117,'Malta'),(118,'Marrocos'),(119,'Maurício'),(120,'Mauritânia'),(121,'México'),(122,'Micronésia'),(123,'Moçambique'),(124,'Moldávia'),(125,'Mônaco'),(126,'Mongólia'),(127,'Montenegro'),(128,'Myanmar'),(129,'Namíbia'),(130,'Nauru'),(131,'Nepal'),(132,'Nicarágua'),(133,'Níger'),(134,'Nigéria'),(135,'Noruega'),(136,'Nova Zelândia'),(137,'Omã'),(138,'Palau'),(139,'Palestina'),(140,'Panamá'),(141,'Papua-Nova Guiné'),(142,'Paquistão'),(143,'Paraguai'),(144,'Peru'),(145,'Polônia'),(146,'Portugal'),(147,'Quênia'),(148,'Quirguistão'),(149,'Reino Unido'),(150,'República Centro-Africana'),(151,'República Democrática do Congo'),(152,'República Dominicana'),(153,'República Tcheca'),(154,'Romênia'),(155,'Ruanda'),(156,'Rússia'),(157,'São Cristóvão e Névis'),(158,'São Marino'),(159,'São Tomé e Príncipe'),(160,'São Vicente e Granadinas'),(161,'Seicheles'),(162,'Senegal'),(163,'Serra Leoa'),(164,'Sérvia'),(165,'Singapura'),(166,'Síria'),(167,'Somália'),(168,'Sri Lanka'),(169,'Sudão'),(170,'Sudão do Sul'),(171,'Suécia'),(172,'Suíça'),(173,'Suriname'),(174,'Tailândia'),(175,'Taiwan'),(176,'Tajiquistão'),(177,'Tanzânia'),(178,'Timor-Leste'),(179,'Togo'),(180,'Tonga'),(181,'Trinidad e Tobago'),(182,'Tunísia'),(183,'Turcomenistão'),(184,'Turquia'),(185,'Tuvalu'),(186,'Ucrânia'),(187,'Uganda'),(188,'Uruguai'),(189,'Uzbequistão'),(190,'Vanuatu'),(191,'Vaticano'),(192,'Venezuela'),(193,'Vietnã'),(194,'Zâmbia'),(195,'Zimbábue');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES (10,'imgPerfilPadrao.png','Você ainda não adicionou uma bio. Clique na foto e nos conte um pouco sobre você.','Você ainda não informou sua localização','Você ainda não tem interesses',15);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao`
--

DROP TABLE IF EXISTS `publicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacao` (
  `pubCodigo` int NOT NULL AUTO_INCREMENT,
  `pubTitulo` varchar(30) NOT NULL,
  `pubDescricao` varchar(400) NOT NULL,
  `pubData` date NOT NULL,
  `pubFoto` varchar(100) NOT NULL,
  `usuCodigo` int DEFAULT NULL,
  `paisCodigo` int DEFAULT NULL,
  PRIMARY KEY (`pubCodigo`),
  KEY `usuCodigo` (`usuCodigo`),
  KEY `paisCodigo` (`paisCodigo`),
  CONSTRAINT `publicacao_ibfk_1` FOREIGN KEY (`usuCodigo`) REFERENCES `usuarios` (`usuCodigo`),
  CONSTRAINT `publicacao_ibfk_2` FOREIGN KEY (`paisCodigo`) REFERENCES `pais` (`paisCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao`
--

LOCK TABLES `publicacao` WRITE;
/*!40000 ALTER TABLE `publicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacaocategorias`
--

DROP TABLE IF EXISTS `publicacaocategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacaocategorias` (
  `pubCodigo` int NOT NULL,
  `catCodigo` int NOT NULL,
  PRIMARY KEY (`pubCodigo`,`catCodigo`),
  KEY `catCodigo` (`catCodigo`),
  CONSTRAINT `publicacaocategorias_ibfk_1` FOREIGN KEY (`pubCodigo`) REFERENCES `publicacao` (`pubCodigo`) ON DELETE CASCADE,
  CONSTRAINT `publicacaocategorias_ibfk_2` FOREIGN KEY (`catCodigo`) REFERENCES `categorias` (`catCodigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacaocategorias`
--

LOCK TABLES `publicacaocategorias` WRITE;
/*!40000 ALTER TABLE `publicacaocategorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacaocategorias` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (15,'usuario@gmail.com','usuario','Usuario','imgPerfilPadrão.png');
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

-- Dump completed on 2025-06-02 16:21:15
