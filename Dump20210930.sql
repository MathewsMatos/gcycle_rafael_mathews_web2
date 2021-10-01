CREATE DATABASE  IF NOT EXISTS `gcycle_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gcycle_db`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gcycle_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'Cuiaba','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(2,'Varzea Grande','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(3,'Sao Paulo','SP','2021-09-27 22:12:22','2021-09-27 22:12:22'),(4,'Rio de Janeiro','RJ','2021-09-27 22:12:22','2021-09-27 22:12:22'),(5,'Belo Horizonte','MG','2021-09-27 22:12:22','2021-09-27 22:12:22'),(6,'Brasilia','DF','2021-09-27 22:12:22','2021-09-27 22:12:22'),(7,'Campo Grande','MS','2021-09-27 22:12:22','2021-09-27 22:12:22'),(8,'Sinop','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(9,'Sorriso','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(10,'Tangara da Serra','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(11,'Caceres','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(12,'Rondonopolis','MT','2021-09-27 22:12:22','2021-09-27 22:12:22'),(13,'Campo Verde','MT','2021-09-27 22:12:22','2021-09-27 22:12:22');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupoms`
--

DROP TABLE IF EXISTS `cupoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `custo` int DEFAULT NULL,
  `isResgatado` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `dtval` datetime DEFAULT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `updatedAt` datetime NOT NULL,
  `ProdutoId` int DEFAULT NULL,
  `UsuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProdutoId` (`ProdutoId`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `cupoms_ibfk_1` FOREIGN KEY (`ProdutoId`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cupoms_ibfk_2` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupoms`
--

LOCK TABLES `cupoms` WRITE;
/*!40000 ALTER TABLE `cupoms` DISABLE KEYS */;
INSERT INTO `cupoms` VALUES (1,'YBFMI',7500,0,'2021-10-01 01:48:03','2021-10-06 01:48:03',1,'2021-10-01 01:48:03',1,1),(2,'XQJEE',7500,0,'2021-10-01 01:48:10','2021-10-06 01:48:10',1,'2021-10-01 01:48:10',2,1),(3,'PLRPK',4000,0,'2021-10-01 01:48:19','2021-10-06 01:48:19',1,'2021-10-01 01:48:19',6,1),(4,'CDTIG',2500,0,'2021-10-01 01:48:24','2021-10-06 01:48:24',1,'2021-10-01 01:48:24',7,1),(5,'VPUYR',3000,0,'2021-10-01 02:19:28','2021-10-06 02:19:28',1,'2021-10-01 02:19:28',6,1),(6,'SOKSY',1500,0,'2021-10-01 02:19:36','2021-10-06 02:19:36',1,'2021-10-01 02:19:36',2,1),(7,'TBCMD',20000,0,'2021-10-01 02:19:47','2021-10-06 02:19:47',1,'2021-10-01 02:19:47',9,1);
/*!40000 ALTER TABLE `cupoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacaos`
--

DROP TABLE IF EXISTS `estacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacaos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CidadeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CidadeId` (`CidadeId`),
  CONSTRAINT `estacaos_ibfk_1` FOREIGN KEY (`CidadeId`) REFERENCES `cidades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacaos`
--

LOCK TABLES `estacaos` WRITE;
/*!40000 ALTER TABLE `estacaos` DISABLE KEYS */;
INSERT INTO `estacaos` VALUES (1,'Pantanal Shopping','Av. Rubens de Mendonça, 3300, Jd. Aclimação','2021-09-27 22:17:57','2021-09-27 22:17:57',1),(2,'Shopping Estação','Av. Miguel Sutil, 3900, Santa Rosa','2021-09-27 22:17:57','2021-09-27 22:17:57',1),(3,'Vg Shopping','Av. Arthur Bernardes, 43, Jd. Aeroporto','2021-09-27 22:17:57','2021-09-27 22:22:06',2),(4,'Leroy Merlin Asa Sul','SMAS, s/n, Guará I Trecho 1','2021-09-27 22:17:57','2021-09-27 22:17:57',6),(5,'Leroy Merlin Asa Norte','SOFN - Área Especial','2021-09-27 22:17:57','2021-09-27 22:17:57',6),(6,'Coop Industrial','Av. Industrial, 2001 - Campestre, Santo André – SP','2021-09-27 22:17:57','2021-09-27 22:17:57',3),(7,'Makro Vila Maria','Av. Morvan dias de Figueiredo, 3231 - São Paulo – SP','2021-09-27 22:17:57','2021-09-27 22:17:57',3);
/*!40000 ALTER TABLE `estacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueprods`
--

DROP TABLE IF EXISTS `estoqueprods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueprods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qtdProd` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EstacaoId` int DEFAULT NULL,
  `ProdutoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EstacaoId` (`EstacaoId`),
  KEY `ProdutoId` (`ProdutoId`),
  CONSTRAINT `estoqueprods_ibfk_1` FOREIGN KEY (`EstacaoId`) REFERENCES `estacaos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estoqueprods_ibfk_2` FOREIGN KEY (`ProdutoId`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueprods`
--

LOCK TABLES `estoqueprods` WRITE;
/*!40000 ALTER TABLE `estoqueprods` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoqueprods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoquerecs`
--

DROP TABLE IF EXISTS `estoquerecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoquerecs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qtdRec` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RecicladoId` int DEFAULT NULL,
  `EstacaoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RecicladoId` (`RecicladoId`),
  KEY `EstacaoId` (`EstacaoId`),
  CONSTRAINT `estoquerecs_ibfk_1` FOREIGN KEY (`RecicladoId`) REFERENCES `reciclados` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `estoquerecs_ibfk_2` FOREIGN KEY (`EstacaoId`) REFERENCES `estacaos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoquerecs`
--

LOCK TABLES `estoquerecs` WRITE;
/*!40000 ALTER TABLE `estoquerecs` DISABLE KEYS */;
INSERT INTO `estoquerecs` VALUES (1,NULL,'2021-09-29 11:11:56','2021-09-29 11:14:51',6,2),(2,NULL,'2021-09-29 11:16:21','2021-09-29 11:16:21',7,2),(3,NULL,'2021-09-29 11:16:27','2021-09-29 11:16:27',5,2),(4,NULL,'2021-09-29 11:16:41','2021-09-29 11:16:41',5,3),(5,NULL,'2021-09-29 11:16:46','2021-09-29 11:16:46',6,3),(6,NULL,'2021-09-29 11:16:50','2021-09-29 11:16:50',6,1);
/*!40000 ALTER TABLE `estoquerecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `fone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EstacaoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EstacaoId` (`EstacaoId`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`EstacaoId`) REFERENCES `estacaos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Drake Josh','drakejosh@teste.com','0e3406540c6a08ea3cb9f73688cd36a586752765d6d4812cf4899a85426f8b57',NULL,NULL,'2021-09-29 14:12:31','2021-09-29 14:12:31',1);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `pontuacao` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'1 (um) Amaciante Cheirinho 500ml',7500,'Resgate esse item na loja Gcycle!','2021-09-27 22:00:58','2021-09-27 22:00:58','cheirinho.jpg'),(2,'Hospital do Cancer de Mato Grosso',5000,'Doe seus pontos para o Hospital do Cancer de Mato Grosso!','2021-09-27 22:00:58','2021-09-27 22:00:58','hcmt.jpg'),(3,'Desconto de R$20 em compras na Rede Compre Mais',20000,'Economize mostrando seu cupom no Compre Mais!','2021-09-27 22:00:58','2021-09-27 22:00:58','smais.jpg'),(4,'APAE Cuiabá - MT',5000,'Doe seus pontos para a APAE de Cuiabá!','2021-09-27 22:00:58','2021-09-27 22:00:58','/img/apae.png'),(5,'1 (um) Limpador de Cozinha Mr. Limpeza 400ml Sachê',18500,'Resgate esse item na loja Gcycle!','2021-09-27 22:00:58','2021-09-27 22:00:58','musculo.jpg'),(6,'15% de Desconto no site www.casadacerveja.com',10000,'Desconto na compra de uma Glacial no site!','2021-09-27 22:00:58','2021-09-27 22:00:58','ccerveja.jpg'),(7,'1 (um) Desodorizador Pato Gel Adesivo (2 discos)',24000,'Resgate esse item na loja Gcycle!','2021-09-27 22:00:58','2021-09-27 22:00:58','pato.jpg'),(8,'1 (um) Condicionador Tresemme Recon e Força 200ml ',8200,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(9,'1 (um) Shampoo Tresemme Recon e Força 400ml ',10200,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(10,'1 (um) Shampoo Clear Masc Sports 400ml ',16800,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(11,'1 (um) Refil Sabonete Líquido Lux Rosas Fran 200ml ',5300,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(12,'1 (um) Omo Lava Roupas para diluir 500ml ',23100,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(13,'1 (um) CIF Limpador Cremoso Branco 250ml ',6400,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(14,'1 (um) Desinfetante OMO Lavanda 500ml ',5000,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(15,'1 (um) Detergente em Pó OMO Lavagem Perfeita 800G ',11000,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(16,'1 (um) Glade Gel Citrus 70g ',2000,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL),(17,'25% de desconto no Item: 1 (um) Limpador Cloro Gel Lysoform 500ml na COOP ',3200,'Resgate esse item na Estação Gcycle! Verifique a disponibilidade no local. ','2021-09-30 10:14:01','2021-09-30 10:14:01',NULL);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciclados`
--

DROP TABLE IF EXISTS `reciclados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reciclados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `ponto` int DEFAULT NULL,
  `unidade` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciclados`
--

LOCK TABLES `reciclados` WRITE;
/*!40000 ALTER TABLE `reciclados` DISABLE KEYS */;
INSERT INTO `reciclados` VALUES (1,'Papel Branco','Celulose',300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(2,'Papelão','Celulose',250,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(3,'Papel cartão','Celulose',250,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(4,'Papel misto','Celulose',50,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(5,'Vidro','Vidro',40,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(6,'Garrafas de Heineken 600ml','Vidro',500,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(7,'PET cristal e azul','Plastico',1300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(8,'PET verde','Plastico',1300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(9,'PET Colorido','Plastico',800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(10,'PET óleo de cozinha','Plastico',650,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(11,'PET branco (leite)','Plastico',400,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(12,'PET bandeja','Plastico',50,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(13,'PEAD branco e natural','Plastico',1100,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(14,'PEAD colorido','Plastico',600,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(15,'PS','Plastico',800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(16,'ABS','Plastico',800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(17,'PEBD branco e natural','Plastico',800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(18,'PEBD colorido','Plastico',800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(19,'BOPP (saco salgadinho)','Plastico',600,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(20,'PP colorido','Plastico',500,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(21,'PP cristal','Plastico',500,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(22,'Plástico filme (sacolas plásticos)','Plastico',400,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(23,'PE','Plastico',300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(24,'Cobre','Metal',7800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(25,'Lata de alumínio','Metal',3800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(26,'Alumínio (outros)','Metal',2800,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(27,'Aerosol alumínio','Metal',2300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(28,'Aerosol aço','Metal',300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(29,'Ferrosos','Metal',300,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(30,'Eletrônicos e eletrodomésticos','Outros',1000,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(31,'Embalagens longa vida','Outros',1000,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(32,'Óleo de cozinha','Outros',250,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(33,'Pilhas e baterias','Outros',0,'kg','2021-09-27 22:07:17','2021-09-27 22:07:17'),(34,'OMO','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(35,'Ariel','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(36,'Downy','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(37,'Raid','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(38,'Mr Musculo','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(39,'Exposis','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(40,'OFF!','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(41,'Baygon','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(42,'Glade','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(43,'Ziploc','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(44,'Lysoform','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(45,'Grand Prix','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(46,'Carnu','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(47,'Roma Coco','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(48,'Garrafas Heineken 600ml','Outros',500,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(49,'Garrafas Smirnoff 998ml e 600ml','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(50,'Lata e balde maiores de 10L','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(51,'Lata e balde até 10L','Outros',3000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(52,'Lata e balde até 1L','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17'),(53,'Aerosol SBP','Outros',1000,'un','2021-09-27 22:07:17','2021-09-27 22:07:17');
/*!40000 ALTER TABLE `reciclados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciclagems`
--

DROP TABLE IF EXISTS `reciclagems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reciclagems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qtdReciclado` int DEFAULT NULL,
  `qtdPonto` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `RecicladoId` int DEFAULT NULL,
  `FuncionarioId` int DEFAULT NULL,
  `UsuarioId` int DEFAULT NULL,
  `EstoqueRecId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RecicladoId` (`RecicladoId`),
  KEY `FuncionarioId` (`FuncionarioId`),
  KEY `UsuarioId` (`UsuarioId`),
  KEY `EstoqueRecId` (`EstoqueRecId`),
  CONSTRAINT `reciclagems_ibfk_1` FOREIGN KEY (`RecicladoId`) REFERENCES `reciclados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reciclagems_ibfk_2` FOREIGN KEY (`FuncionarioId`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reciclagems_ibfk_3` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reciclagems_ibfk_4` FOREIGN KEY (`EstoqueRecId`) REFERENCES `estoquerecs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciclagems`
--

LOCK TABLES `reciclagems` WRITE;
/*!40000 ALTER TABLE `reciclagems` DISABLE KEYS */;
INSERT INTO `reciclagems` VALUES (1,1,240,'2021-09-30 20:18:16','2021-09-30 20:18:16',3,1,1,1),(2,1,480,'2021-09-30 20:19:55','2021-09-30 20:19:55',5,1,1,1),(3,1,720,'2021-09-30 20:20:22','2021-09-30 20:20:22',6,1,1,1),(4,1,960,'2021-09-30 20:22:52','2021-09-30 20:22:52',6,1,1,1),(5,1,1200,'2021-09-30 20:24:07','2021-09-30 20:24:07',6,1,1,1),(6,1,1440,'2021-09-30 20:28:21','2021-09-30 20:28:21',6,1,1,1),(7,1,1680,'2021-09-30 20:28:39','2021-09-30 20:28:39',5,1,1,1),(8,1,1920,'2021-09-30 20:29:47','2021-09-30 20:29:47',5,1,1,1),(9,1,2160,'2021-10-01 00:37:19','2021-10-01 00:37:19',5,1,1,1),(10,5,2400,'2021-10-01 00:51:34','2021-10-01 00:51:34',3,1,1,1),(11,20,2640,'2021-10-01 01:03:03','2021-10-01 01:03:03',3,1,1,1),(12,1,2880,'2021-10-01 01:06:43','2021-10-01 01:06:43',3,1,1,1),(13,2,3120,'2021-10-01 01:14:35','2021-10-01 01:14:35',3,1,1,1),(14,2,3360,'2021-10-01 01:17:24','2021-10-01 01:17:24',3,1,1,1),(15,3,3600,'2021-10-01 01:18:00','2021-10-01 01:18:00',3,1,1,1),(16,1,3840,'2021-10-01 01:19:25','2021-10-01 01:19:25',3,1,1,1),(17,4,4080,'2021-10-01 01:20:53','2021-10-01 01:20:53',3,1,1,1),(18,10,4320,'2021-10-01 01:22:52','2021-10-01 01:22:52',3,1,1,1);
/*!40000 ALTER TABLE `reciclagems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `pontuacao` int DEFAULT '500',
  `endereco` varchar(255) DEFAULT NULL,
  `fone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CidadeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CidadeId` (`CidadeId`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`CidadeId`) REFERENCES `cidades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Zé Ninguem','teste@teste.com','7ae6f8e251dfe17a2c8bc028b1d378952558bb658a55a9f85daca27cc2ed2d33',75000,NULL,NULL,'2021-09-28 02:30:02','2021-09-28 02:30:02',1),(2,'Maria Joao','teste2@teste.com','7ae6f8e251dfe17a2c8bc028b1d378952558bb658a55a9f85daca27cc2ed2d33',75000,NULL,NULL,'2021-09-28 02:30:19','2021-09-28 02:30:19',2),(3,'Hebert Ritchers','teste3@teste.com','7ae6f8e251dfe17a2c8bc028b1d378952558bb658a55a9f85daca27cc2ed2d33',75000,NULL,NULL,'2021-09-28 02:30:39','2021-09-28 02:30:39',3),(4,'Salsicha Scooby','teste4@teste.com','7ae6f8e251dfe17a2c8bc028b1d378952558bb658a55a9f85daca27cc2ed2d33',75000,NULL,NULL,'2021-09-28 02:30:59','2021-09-28 02:30:59',4);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gcycle_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 22:28:04
