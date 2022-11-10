-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: natha
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cartoes`
--

DROP TABLE IF EXISTS `cartoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartoes` (
  `Numero_do_Cartao` int NOT NULL AUTO_INCREMENT,
  `Validade` date NOT NULL,
  `Finalidade` blob NOT NULL,
  `Vencimento_da_Fatura` date NOT NULL,
  `Aprovacao` blob NOT NULL,
  `CVV` varchar(4) NOT NULL,
  `ContaNumero` int NOT NULL,
  PRIMARY KEY (`Numero_do_Cartao`),
  KEY `FK_ContaNumero_idx` (`ContaNumero`),
  CONSTRAINT `FK_ContaNumero` FOREIGN KEY (`ContaNumero`) REFERENCES `conta` (`Numero_da_Conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoes`
--

LOCK TABLES `cartoes` WRITE;
/*!40000 ALTER TABLE `cartoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CPF` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Celular` varchar(13) NOT NULL,
  `Endereco` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `Numero_da_Conta` int NOT NULL AUTO_INCREMENT,
  `Agencia` varchar(10) NOT NULL,
  `Saldo` double NOT NULL,
  `Usuario` int NOT NULL,
  PRIMARY KEY (`Numero_da_Conta`),
  KEY `FK_usuario_idx` (`Usuario`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `ID Contato` int NOT NULL,
  `Titular_CPF` int NOT NULL,
  `Favorito_CPF` int NOT NULL,
  PRIMARY KEY (`ID Contato`),
  KEY `FK_titular_idx` (`Titular_CPF`),
  KEY `FK_favorito_idx` (`Favorito_CPF`),
  CONSTRAINT `FK_favorito` FOREIGN KEY (`Favorito_CPF`) REFERENCES `cliente` (`CPF`),
  CONSTRAINT `FK_titular` FOREIGN KEY (`Titular_CPF`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `ID emprestimo` int NOT NULL,
  `Aprovacao` bit(1) NOT NULL,
  `Valor` double NOT NULL,
  `Data` date NOT NULL,
  `Taxa de juros` double NOT NULL,
  `Parcelas pagas` int NOT NULL,
  `Valor com juros` double NOT NULL,
  `Data do primeiro vencimento` date NOT NULL,
  `Quantidade de parcelas` int NOT NULL,
  `Lista de funcionarios` varchar(45) NOT NULL,
  `Justificativa` varchar(45) NOT NULL,
  `CPF` int NOT NULL,
  PRIMARY KEY (`ID emprestimo`),
  KEY `FK_ClenteCPF_idx` (`CPF`),
  CONSTRAINT `FK_ClenteCPF` FOREIGN KEY (`CPF`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrato`
--

DROP TABLE IF EXISTS `extrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extrato` (
  `ID extrato` int NOT NULL,
  `Tempo` time NOT NULL,
  `Operacao` blob NOT NULL,
  `Valor` double NOT NULL,
  `Descritivo` varchar(45) NOT NULL,
  `Numero_da_Conta` int NOT NULL,
  PRIMARY KEY (`ID extrato`),
  KEY `FK_Numero_conta_idx` (`Numero_da_Conta`),
  CONSTRAINT `FK_Numero_conta` FOREIGN KEY (`Numero_da_Conta`) REFERENCES `conta` (`Numero_da_Conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrato`
--

LOCK TABLES `extrato` WRITE;
/*!40000 ALTER TABLE `extrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `extrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura` (
  `ID Fatura` int NOT NULL,
  `Valor` double NOT NULL,
  `data do pagamento` date NOT NULL,
  `data de validade` date NOT NULL,
  `Numero_Cartao` int NOT NULL,
  PRIMARY KEY (`ID Fatura`),
  KEY `FK_Numero_Cartao_idx` (`Numero_Cartao`),
  CONSTRAINT `FK_Numero_Cartao` FOREIGN KEY (`Numero_Cartao`) REFERENCES `cartoes` (`Numero_do_Cartao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_emprestimo`
--

DROP TABLE IF EXISTS `pagamento_emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento_emprestimo` (
  `IdAprovacao` int NOT NULL,
  `Vencimento` date NOT NULL,
  `Pagamento` date NOT NULL,
  `Valor Parcela` double NOT NULL,
  `ID_emprestimo` int NOT NULL,
  PRIMARY KEY (`IdAprovacao`),
  KEY `FK_ID_Emprestimo_idx` (`ID_emprestimo`),
  CONSTRAINT `FK_ID_Emprestimo` FOREIGN KEY (`ID_emprestimo`) REFERENCES `emprestimo` (`ID emprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_emprestimo`
--

LOCK TABLES `pagamento_emprestimo` WRITE;
/*!40000 ALTER TABLE `pagamento_emprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento_emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `ID Usuario` int NOT NULL,
  `Valor` double NOT NULL,
  `Data` date NOT NULL,
  `Remetente` int NOT NULL,
  `Destinatario` int NOT NULL,
  PRIMARY KEY (`ID Usuario`),
  KEY `FK_remetente_idx` (`Remetente`),
  KEY `FK_destinatario_idx` (`Destinatario`),
  CONSTRAINT `FK_destinatario` FOREIGN KEY (`Destinatario`) REFERENCES `conta` (`Numero_da_Conta`),
  CONSTRAINT `FK_remetente` FOREIGN KEY (`Remetente`) REFERENCES `conta` (`Numero_da_Conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `Senha` varchar(10) NOT NULL,
  `CPF` int NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `CPF_idx` (`CPF`),
  CONSTRAINT `FK_CPF` FOREIGN KEY (`CPF`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10  9:44:08
