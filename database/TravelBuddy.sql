-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: TravelBuddy
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
INSERT INTO `admins` VALUES (1,'admin@gmail.com','admin','admin');
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
-- Table structure for table `curtidas`
--

DROP TABLE IF EXISTS `curtidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtidas` (
  `curCodigo` int NOT NULL AUTO_INCREMENT,
  `usuCodigo` int NOT NULL,
  `pubCodigo` int NOT NULL,
  PRIMARY KEY (`curCodigo`),
  KEY `usuCodigo` (`usuCodigo`),
  KEY `pubCodigo` (`pubCodigo`),
  CONSTRAINT `curtidas_ibfk_1` FOREIGN KEY (`usuCodigo`) REFERENCES `usuarios` (`usuCodigo`),
  CONSTRAINT `curtidas_ibfk_2` FOREIGN KEY (`pubCodigo`) REFERENCES `publicacao` (`pubCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtidas`
--

LOCK TABLES `curtidas` WRITE;
/*!40000 ALTER TABLE `curtidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtidas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES (1,'imgPerfilPadrao.png','Você ainda não adicionou uma bio. Clique na foto e nos conte um pouco sobre você.','Você ainda não informou sua localização','Você ainda não tem interesses',1),(2,'imgPerfilPadrao.png','Você ainda não adicionou uma bio. Clique na foto e nos conte um pouco sobre você.','Você ainda não informou sua localização','Você ainda não tem interesses',2);
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
  `pubTitulo` varchar(40) NOT NULL,
  `pubDescricao` varchar(400) NOT NULL,
  `pubData` date NOT NULL,
  `pubFoto` varchar(100) NOT NULL,
  `usuCodigo` int DEFAULT NULL,
  `paisCodigo` int DEFAULT NULL,
  PRIMARY KEY (`pubCodigo`),
  KEY `paisCodigo` (`paisCodigo`),
  KEY `publicacao_ibfk_1` (`usuCodigo`),
  CONSTRAINT `publicacao_ibfk_1` FOREIGN KEY (`usuCodigo`) REFERENCES `usuarios` (`usuCodigo`) ON DELETE CASCADE,
  CONSTRAINT `publicacao_ibfk_2` FOREIGN KEY (`paisCodigo`) REFERENCES `pais` (`paisCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao`
--

LOCK TABLES `publicacao` WRITE;
/*!40000 ALTER TABLE `publicacao` DISABLE KEYS */;
INSERT INTO `publicacao` VALUES (1,'Silêncio em Movimento','A luz suave do fim da tarde invade o vagão quase silencioso, onde passageiros seguem em tranquilidade, imersos em seus próprios pensamentos. O homem de máscara e casaco marrom parece carregar histórias enquanto observa a paisagem. Um instante de calma e rotina no coração de uma viagem cotidiana.','2025-06-04','publicacao_2_1.jpg',2,46),(2,'Barco da Serenidade','Um pequeno barco repousa nas águas calmas, quase imóvel, como se flutuasse no tempo. À frente, vilas tradicionais e montanhas suaves completam o cenário de paz. É um momento de contemplação, onde tudo parece desacelerar, convidando o silêncio a permanecer um pouco mais.','2025-06-04','publicacao_2_2.jpg',2,97),(3,'Guardião do Deserto','Sob o calor dourado do sol, uma pequena raposa observa em silêncio, camuflada entre as pedras do deserto. Seu olhar atento revela instinto e curiosidade, como se vigiasse um reino de areia e sombra. Um instante raro de beleza selvagem em perfeita harmonia com a paisagem.','2025-06-04','publicacao_2_3.jpg',2,1),(4,'Um Clássico na Esquina','Um carro amarelo antigo brilha sob o sol das ruas estreitas de uma vila europeia, como se tivesse parado ali para lembrar que o tempo pode ser gentil. Entre bicicletas e fachadas com janelas verdes, a cena exala charme e nostalgia — um retrato vivo da beleza que mora nos detalhes cotidianos.','2025-06-04','publicacao_2_4.jpg',2,95),(5,'Reflexos do Entardecer','As ondas quebram suavemente enquanto o céu pinta o mar com tons dourados e rosados. O entardecer reflete nas águas calmas da areia molhada, criando uma paisagem de pura poesia. Um instante de paz que convida à contemplação e ao silêncio interior.','2025-06-04','publicacao_2_5.jpg',2,32),(6,'Majestade Lunar','A lua cheia paira serena sobre as montanhas imponentes, enquanto os últimos raios de sol beijam os cumes com um brilho dourado. Uma cena de tranquilidade e grandeza, onde o tempo parece parar e a beleza da natureza se revela em sua forma mais pura e inspiradora. Um momento de paz profunda.','2025-06-04','publicacao_2_6.jpg',2,131),(7,'Toque de Luz e Sombra','Em um instante de quietude, a luz brinca com as sombras sobre a pele e o tecido delicado. A pose suave e os pés descalços evocam uma sensação de liberdade e conexão com o natural. Um momento de introspecção, onde a beleza reside na simplicidade e na vulnerabilidade sutilmente revelada.','2025-06-04','publicacao_2_7.jpg',2,69),(8,'Jovem Explorador da Savana','Entre a folhagem, um pequeno leãozinho revela seu olhar curioso e atento. A inocência selvagem emoldurada pela natureza, um vislumbre da realeza que cresce. Cada detalhe, desde as orelhas alertas até a pata hesitante, conta a história de uma aventura que apenas começou. Pura ternura e instinto.','2025-06-04','publicacao_2_8.jpg',2,2),(9,'Ondas de Serenidade','Linhas brancas e fluidas se sobrepõem em uma dança suave, criando uma textura que acalma e hipnotiza. Como dunas esculpidas pelo vento ou ondas gentis do mar, a imagem transmite uma sensação de movimento contínuo e harmonia. Um momento de paz visual, onde a simplicidade das formas convida à contemplação.','2025-06-04','publicacao_2_9.jpg',2,26),(10,'Pixelização Ensolarada','Um mosaico vibrante de pixels em tons quentes de laranja, amarelo e toques de púrpura. A imagem pulsa com uma energia digital, como um glitch artístico ou um reflexo solar fragmentado. Uma textura que desperta a curiosidade e evoca a sensação de calor e movimento abstrato.','2025-06-04','publicacao_2_10.jpg',2,54),(11,'Imersão Cristalina','Sob a superfície da água, a luz do sol dança e cria reflexos cintilantes. Bolhas de ar escapam, capturando um instante de pura imersão e frescor. O mundo se transforma, visto através do véu azul da piscina, evocando uma sensação de leveza, jogo e liberdade aquática. Um mergulho revigorante.','2025-06-04','publicacao_2_11.jpg',2,12),(12,'Contemplação à Beira-Mar','Em preto e branco, uma figura solitária encara a vastidão do oceano. O olhar perdido no horizonte e a brisa suave que parece agitar seus cabelos transmitem um sentimento de profunda introspecção. Um momento de pausa, onde os pensamentos fluem com as ondas e a alma encontra a serenidade do mar.','2025-06-04','publicacao_2_12.jpg',2,4),(13,'O Guardião do Rio','No seu barco de bambu, o pescador desliza sobre as águas calmas enquanto o dia se despede. Com seu chapéu tradicional e a lanterna acesa, ele não é apenas um trabalhador, mas um símbolo vivo de uma cultura ancestral. Seu olhar sereno e as mãos firmes revelam uma vida de cumplicidade com o rio e seus fiéis cormorões.','2025-06-04','publicacao_2_13.jpg',2,40),(14,'Lanternas Vermelhas','A chuva cai sobre uma rua movimentada em Shanghai, mas a vida segue seu curso vibrante sob um mar de guarda-chuvas. As lanternas vermelhas tradicionais oferecem um brilho acolhedor, refletindo-se no asfalto molhado e guiando os passos apressados. Um instante que captura a energia e a beleza atmosférica da cidade.','2025-06-04','publicacao_2_14.jpg',2,40),(15,'Guardião Ancestral da Cidade','Sob o céu límpido, o imponente leão de bronze monta guarda, um símbolo de poder e proteção na entrada da Cidade Proibida. Sua expressão severa e os detalhes esculpidos contam histórias de dinastias passadas, emanando uma aura de majestade e força silenciosa. Um encontro com a história viva e a arte imperial.','2025-06-04','publicacao_2_15.jpg',2,40),(16,'Tiananmen: História em Movimento','O imponente Portão da Paz Celestial (Tiananmen) ergue-se como um marco histórico, enquanto a vida moderna de Pequim flui à sua frente. Bandeiras vermelhas tremulam sob um céu encoberto, emoldurando o retrato icônico. Um instante que captura a grandiosidade do passado encontrando o ritmo do presente.','2025-06-04','publicacao_2_16.jpg',2,40),(17,'Cúpula Celestial em Mosaicos','Elevando o olhar, somos transportados para um universo de detalhes sagrados e cores vibrantes. Mosaicos intrincados cobrem a abóbada, narrando histórias sob o brilho de lustres majestosos. Uma obra que inspira admiração e reverência, refletindo a fé e a arte em sua mais sublime expressão.','2025-06-04','publicacao_2_17.jpg',2,156),(18,'Sonho Colorido de Moscou','A Catedral de São Basílio ergue-se como uma visão de conto de fadas, suas cúpulas icônicas pintando o céu de Moscou com cores vibrantes e formas lúdicas. Um instante de pura admiração diante desta joia arquitetônica, que parece dançar sob a luz do sol, convidando a um mergulho na rica história russa.','2025-06-04','publicacao_2_18.jpg',2,156),(19,'Encontro Selvagem de Elemento','A vastidão da Península de Kamchatka se revela em uma paisagem de força e beleza bruta. O mar agitado encontra a costa de areia escura, enquanto ao longe, vulcões imponentes cobertos de neve se erguem sob um céu claro. Um instante que evoca a grandiosidade da natureza indomada e a sensação de estar num lugar remoto e poderoso.','2025-06-04','publicacao_2_19.jpg',2,156),(20,'Eco de uma Era Sob Céu Cinzento','A estrela vermelha destaca-se na fachada austera de um edifício que parece ecoar tempos passados. Sob um céu pálido e melancólico, os relógios no topo marcam a passagem do tempo sobre uma arquitetura robusta. Um instante que evoca a memória, a história e a atmosfera de uma era que deixou sua marca indelével.','2025-06-04','publicacao_2_20.jpg',2,156),(21,'Silhueta Fibrosa em Luz Vermelha','Uma forma humanoide, tecida em fios densos e texturizados, é atravessada por feixes de luz vermelha incandescente. A imagem evoca uma sensação de energia contida ou de conexões internas expostas. Um instante que mescla o orgânico com o digital, o palpável com o etéreo, despertando a curiosidade e a reflexão.','2025-06-04','publicacao_2_21.jpg',2,3),(22,'Horizonte de Névoa e Montanhas Azuis','Camadas de montanhas se perdem no horizonte, envoltas em uma névoa suave que lhes confere tons de azul etéreo. O céu vasto e límpido, com um discreto rastro de avião, amplia a sensação de imensidão e tranquilidade. Um instante de paz profunda, contemplando a serena majestade da natureza.','2025-06-04','publicacao_2_22.jpg',2,35),(23,'Miragem Branca em Arenito Vermelho','No coração de um cânion de arenito vermelho, uma figura de branco esvoaçante parece dançar sobre a areia cor de terracota. A imensidão das rochas e a delicadeza humana criam um contraste poético. Um instante de admiração e aventura, explorando a beleza monumental e as cores vibrantes do deserto.','2025-06-04','publicacao_2_23.jpg',2,121),(24,'Sinfonia de Luzes Verdes no Céu Polar','A Aurora Boreal dança em tons esverdeados sobre uma paisagem nevada, seu reflexo cintilando nas águas calmas. Uma figura solitária observa, minúscula diante da vastidão e da magia do espetáculo celeste. Um instante de pura admiração, onde o céu noturno se transforma em uma tela de pura fantasia e beleza.','2025-06-04','publicacao_2_24.jpg',2,68),(25,'Velocidade Florida em Suzuka','A potência de um Fórmula 1 da Mercedes rasga o asfalto do circuito de Suzuka, enquanto delicadas flores de cerejeira emolduram a cena. Um contraste sublime entre a alta tecnologia e a beleza efémera da natureza, capturando a essência única do Grande Prêmio do Japão. Pura emoção e poesia visual em movimento.','2025-06-04','publicacao_2_25.png',2,97),(26,'Gratidão em União: Hamilton e a Multidão','Lewis Hamilton, envolto na bandeira britânica, ergue-se para saudar o mar de fãs. Um gesto de reconhecimento e profunda conexão, celebrando uma jornada de altos e baixos, sempre com o apoio da torcida. Um instante que simboliza a força dessa união, no limiar entre o fim de um capítulo e o início de outro.','2025-06-04','publicacao_2_26.jpg',2,149),(27,'Mar Vermelho de Paixão','Lewis Hamilton, vestido de vermelho Ferrari, é abraçado pela energia contagiante dos tifosi. Mãos erguidas, bonés e bandeiras criam uma onda de fervor e apoio. Um instante que captura a comunhão explosiva entre o piloto e a lendária torcida italiana, vibrando com a promessa de um novo capítulo vitorioso.','2025-06-04','publicacao_2_27.jpg',2,95),(28,'Flecha Escarlate em Território Ferrari','O carro da Ferrari corta a pista, um borrão vermelho de pura potência, enquanto o emblemático escudo do Cavallino Rampante vigia ao fundo, cercado por uma multidão de fãs apaixonados. A atmosfera vibra com a busca pela glória em casa, um instante que captura a alma e a velocidade da Scuderia. SONHE O IMPOSSÍVEL.','2025-06-04','publicacao_2_28.jpg',2,95);
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
INSERT INTO `publicacaocategorias` VALUES (4,1),(25,1),(26,1),(27,1),(28,1),(2,3),(5,3),(6,3),(13,3),(14,3),(19,3),(22,3),(24,3),(25,3),(27,3),(2,4),(3,4),(6,4),(19,4),(22,4),(23,4),(24,4),(7,5),(11,5),(13,5),(25,5),(26,5),(27,5),(28,5),(7,6),(24,7),(1,10),(4,11),(26,11),(28,11),(4,12),(14,12),(15,12),(18,12),(20,12),(21,13),(1,14),(5,14),(11,14),(12,14),(18,14),(14,15),(15,15),(16,15),(17,15),(18,15),(20,15),(7,16),(2,17),(3,17),(8,17),(12,17),(13,17),(22,17),(5,18),(11,18),(1,21),(16,21),(3,23),(8,23),(15,23),(9,24),(10,24),(21,24),(23,25),(9,27),(10,27),(16,27),(17,27),(21,27),(23,27),(6,29),(8,29),(17,29),(19,29),(20,29),(9,30),(10,30),(12,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario@gmail.com','usuario','Usuario','imgPerfilPadrão.png'),(2,'vitor@gmail.com','vitor','Vitor','imgPerfilPadrão.png');
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

-- Dump completed on 2025-06-27  0:25:03
