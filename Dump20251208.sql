CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20251207063543_CreateIdentitySchema','9.0.0');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('0621cafb-5bf4-41c3-8953-5c0de2305e2c','carloshernandezsena@gmail.com','CARLOSHERNANDEZSENA@GMAIL.COM','carloshernandezsena@gmail.com','CARLOSHERNANDEZSENA@GMAIL.COM',0,'AQAAAAIAAYagAAAAELp2GwUBQNCtUerKP9erhe/i5vOFqNRNOJjpmGlKXl5aeJqTffNWQk0pF3QsrEkI7w==','XPPQI4MH3J2T4GOFPZRTFJ2IVGTBIIIL','aea2821b-70bf-450c-9c17-c4243b4a3dd6',NULL,0,0,NULL,1,0),('206525ff-8c5f-4e9d-8e74-3cd89f4fa47f','carloshernandezsena10@gmail.com','CARLOSHERNANDEZSENA10@GMAIL.COM','carloshernandezsena10@gmail.com','CARLOSHERNANDEZSENA10@GMAIL.COM',0,'AQAAAAIAAYagAAAAEE6f98abgx2OxOA2b6g6JCiyaRAbXwH6OazWa9OvTVlWwpEb7TbOD5sfc2CF0eDYpg==','62Z54Y55424ZQNF4VK4FEC4ESIHYWINU','74b3df2b-fe9a-4656-a291-c4cac7f4c81d',NULL,0,0,NULL,1,0),('a297d565-bddf-42f8-b2f2-8a083506df73','senatareasetc@gmail.com','SENATAREASETC@GMAIL.COM','senatareasetc@gmail.com','SENATAREASETC@GMAIL.COM',0,'AQAAAAIAAYagAAAAEBSB/rGHPfrvnbjqqlNxU1wpno16cfAYy6edQmlt2p32WaG2JaRgx0vOBYAM48cPYg==','OEOGFZSECUUIRTYH5KNXW4C6QOT5GI6K','b6b4ee10-b475-43c4-a9c8-9c8bf64a03fa',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_deportivo`
--

DROP TABLE IF EXISTS `centro_deportivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_deportivo` (
  `rut` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `apertura` time DEFAULT NULL,
  `cierre` time DEFAULT NULL,
  `capacidad` int NOT NULL,
  `estado` enum('activo','inactivo','mantenimiento') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_deportivo`
--

LOCK TABLES `centro_deportivo` WRITE;
/*!40000 ALTER TABLE `centro_deportivo` DISABLE KEYS */;
INSERT INTO `centro_deportivo` VALUES (1,'Deportivo Central','Avenida Principal 123','3156789102','contacto@deportivocentral.com','06:00:00','22:00:00',150,'activo'),(2,'Fitness Zone','Calle 45 #67-89','3123456789','info@fitnesszone.com','05:30:00','21:30:00',200,'activo'),(3,'Piscinas Bogotá','Carrera 20 #15-35','3109876543','reservas@piscinasbogota.com','08:00:00','20:00:00',120,'mantenimiento'),(4,'Club Deportivo Andes','Transversal 10 #50-70','3198765432','contacto@clubandes.com','06:30:00','22:30:00',250,'activo'),(5,'Arena Fit','Diagonal 85 #18-90','3134567890','info@arenafit.com','07:00:00','21:00:00',300,'activo'),(6,'Centro Acuático Sur','Calle 30 #15-20','3145678901','contacto@acuaticosur.com','09:00:00','19:00:00',100,'inactivo'),(7,'Gimnasio Elite','Carrera 7 #50-99','3112345678','info@gimnasioelite.com','06:00:00','23:00:00',180,'activo'),(8,'Polideportivo Norte','Avenida 68 #80-120','3129876543','info@polinorte.com','05:00:00','22:00:00',400,'mantenimiento'),(9,'Deportes Familia','Carrera 100 #25-40','3101234567','contacto@deportesfamilia.com','07:30:00','20:30:00',150,'activo'),(10,'Zona Activas','Calle 10 #20-30','3163456789','info@zonaactiva.com','06:30:00','22:30:00',220,'activo');
/*!40000 ALTER TABLE `centro_deportivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `fhinscripcion` date NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `estado` enum('proceso','realizado','postulante') DEFAULT 'postulante',
  `rut` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `rut` (`rut`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `centro_deportivo` (`rut`),
  CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (2,'2025-03-05','3123456789','maria.gomez@hotmail.com','proceso',2,2),(3,'2025-03-10','3109876543','uis.rodriguez@gmail.com','postulante',3,3),(4,'2025-03-12','3198765432','ana.martinez@gmail.com','realizado',4,4),(5,'2025-03-15','3134567890','carlos.ramirez@gmail.com','proceso',5,5),(6,'2025-03-18','3145678901','laura.torres@hotmail.com','postulante',6,6),(7,'2025-03-20','3112345678','fernando.silva@hotmail.com','realizado',7,7),(8,'2025-03-22','3129876543','diana.lopez@gmail.com','proceso',8,8),(9,'2025-03-25','3101234567','jorge.castillo@gmail.com.com','postulante',10,10),(10,'2025-03-28','3163456789','paula.moreno@hotmail.com','realizado',10,6);
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accion` enum('SELECT','CREATE','INSERT','UPDATE','DELETE') DEFAULT NULL,
  `tabla` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'USER',NULL),(2,'ADMIN',NULL);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_rol` int DEFAULT NULL,
  `id_permiso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol_permiso` (`id_rol`),
  KEY `fk_permiso_rol` (`id_permiso`),
  CONSTRAINT `fk_permiso_rol` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_permiso` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `documento` int NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `estado` enum('activo','inactivo','libre') NOT NULL DEFAULT 'libre',
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,12345678,'kevin ariza','Carrera 10 #15-20','3156789102','juan.perez@gmail.com','activo','$2a$10$IzvtRncWRXm0AAtNhsdovuOR1TcAMMl/EwBvbVOZsvn447DT0Z5M6'),(2,87654321,'Ma','Calle 45 #23-68','3123456789','maria.gomez@hotmail.com','activo','car123'),(3,23456789,'Luis ','Avenida 68 #80-45','3109876543','uis.rodriguez@gmail.com','libre','luis123'),(4,98765432,'Ana Martínez','Transversal 10 #50-70','3198765432','ana.martinez@gmail.com','activo',''),(5,34567890,'Carlos Ramírez','Diagonal 85 #18-90','3134567890','carlos.ramirez@gmail.com','activo',''),(6,65432109,'Laura Torres','Calle 30 #15-20','3145678901','laura.torres@hotmail.com','activo',''),(7,45678901,'Fernando Silva','Carrera 7 #50-99','3112345678','fernando.silva@hotmail.com','activo','$2a$10$LeY5HwARgPe6OveeiHDo/eLw/5Qa56n0b.vTsbtpSsEJjGzMfQ29G'),(8,54321098,'Diana López','Avenida Principal 123','3129876543','diana.lopez@gmail.com','libre',''),(9,56789012,'Jorge Castillo','Carrera 100 #25-40','3101234567','jorge.castillo@gmail.com.com','activo',''),(10,9876543,'Paula Moreno','Calle 10 #20-30','3163456789','paula.moreno@hotmail.com','inactivo',''),(24,1021392980,'Administrador','Av Siempre Viva 742','3009998877','admin@demo.com','activo','$2a$10$OfvWqeJhm85r99oUJiXdxO/uXi9EkFTLO4SFoBF6P4O/phvlcCnym'),(25,1234567890,'jordan','241244','141523','jor@gmail.com','activo','$2a$10$JvF4Owwi3OfwipFimsC9uefRU2CpE7nuOR9umVm1Syy5S6iwvimaO'),(27,1234587691,'serafin','calle 159','30446234','sera@gmail.com','activo','$2a$10$/0ZL1kp4ZPwSfv/tT8J0rOhh1GUF/lRQE7vVeHiwQu5qur6utYJ5u'),(28,73834974,'ferd','ferdireccion','3045778','ferd@gmail.com','activo','$2a$10$XoTf913h2jV8EtfQXBji9eisaZKxzsXyrKVLOTud2oQkzd6wNSrWS'),(29,73834974,'ferd','ferdireccion','3045778','ferdo@gmail.com','activo','$2a$10$9hl7z/e/Ajb4rrmUcrtUHO2tYN663u1Rovbgn8155ym85igXhMojG'),(31,1021293980,'mia','8484884','848485','mia@gmail.com','activo','$2a$10$jt.Qn3ykyA./sX9JaBjtVOUiPwe8E8VmFMlmVsCcfko4iwZy0fWC6'),(34,1040323456,'Usuario Demo','Calle 123','3001112233','user@demo.com','activo','$2a$10$6lffCdSTwWwt529C7a//CuVjuy0AEu9ijEv8jXhFgFi7RPCmAWFXW'),(35,8786,'pep','12423','543546','mar@gmail.com','activo','$2a$10$VwMOsY.ih1o2lGf/lOvEiuVPpNPiPJDmQxzscPy/3k/adgbKfkkfq'),(37,2110293908,'felipe','sprinfil','3406496516','felipito@gmail.com','activo','$2a$10$LzQSL4SguVejX5kOi93oMeJnltUNhJMsXT9L.WTAwpSRZkqH.07jy'),(38,1021392980,'Carlos Felipe ',' calle 156 #92-64','3406496516','carlos2004hernadez@gmail.com','activo','$2a$10$L7VGRySkZYe1ei3KPrvqBOgFS11qKy89xqN.R3uslxJyFlu1mXuRK'),(39,1097491017,'luis',' calle 156 #92-64','783727432','lusi@gmail.com','activo','$2a$10$0NgaFX2vHAoXqimW1H9X9.K.qo5SWd0weCM/KSUXSCiqbObdziZIa'),(40,1024085423,'Sebastian','calle 127 #89a-27','3136824120','bast@gmail.com','activo','$2a$10$dm9kMcOn02S0YlrFbnH/XOcL5eIDtMZdlrAaiD2DEnQgM4olkIJx2'),(41,1020324970,'pipe','calle 159','3404896756','patriciacc2074@gmail.com','activo','$2a$10$YRMZJpYdNCTS.fIwPG52mebYPRvDFUj2o3i7G8BUh8XfnBF274vfC'),(42,1020335682,'perpio','calle 159','3404844334','per@gmail.com','activo','$2a$10$6TlaS0gSCBrWTcpA31Pu4.M3oZNP3M.CMkp.e.CofprNHivlz6woW'),(43,18273948,'angel','calle 159 a45 ','32198470','angelito123@gmail.com','activo','$2a$10$iy0AIHcqtrfGmbt6JM2jTepBZ9U8uoXBSj7vkduWS7YRa7goz/HOu'),(44,1021293980,'Carlos','calle 156 #92-64','3044695661','eva.siondeimpuesticos@gmail.com','activo','$2a$10$0cTv8onsIrubz5k0Gn5rZePojDybFFrV.mi3ZLPPUFTvIoNjb9T8.'),(45,1234587691,'Sebastian','calle 159','3136824120','senatareasetc@gmail.com','activo','$2a$10$9Aq4Ziuc4tsLwuEkIlutxuZ0Cbsnud3XKVuUf/lym21gL5e/deJI.'),(46,23645756,'Sebastian','calle 159','3136824120','acerito1822@gmail.com','activo','$2a$10$GQb3M.8qiFXdXIp1o//O..FE3N5dw3GkZpawayYurxwjMeLx4ziNW'),(47,754764,'Sebastian','calle 159','3136824120','juegospcxdgames@gmail.com','activo','$2a$10$iI9Q4iADeqX3mde09VDEgup8PobibTWwh8yUHSsByxdqzgyUox.YW'),(48,12343432,'car','calle 123','34454534','sdgdfsgs@gmail.com','libre','car123'),(49,1234556757,'piastri','calle 159','3030300030','piastri1234@gmail.com','activo','$2a$10$Ns69uFmiwyGjAf4t8y2sEO84coxMx3mqLjil3ZUrf8NyG07epB8S.'),(50,1019016306,'kevin ariza sandoval','cra82 # 80-44','3133910040','kordhtx2305@gmail.com','activo','$2a$10$.Rnsb63xgXm9mQvIuwxOcOgNV70bjbn0jxoTPERqoqRhFbjX08.rC'),(51,1019016306,'miguel ','cra82 # 80-44','3133910040','mixagg6@gmail.com','activo','$2a$10$ZJZkaHQmhsg32sfKSrzlVeLcsqZl2Ra0u1kkvEEiyJGK3Ezdvesnq');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_rol` (`id_usuario`),
  KEY `fk_rol_usuario` (`id_rol`),
  CONSTRAINT `fk_rol_usuario` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (8,24,2),(9,25,1),(13,34,1),(14,35,1),(16,37,1),(17,38,1),(18,39,1),(19,40,1),(20,41,1),(21,42,1),(22,7,1),(23,43,1),(24,1,1),(25,44,1),(26,45,1),(27,46,1),(28,47,1),(29,49,1),(30,50,1),(31,51,1);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `valoracion` decimal(5,1) DEFAULT NULL,
  `fhvaloracion` date NOT NULL,
  `cometario` text,
  `rut` int NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `rut` (`rut`),
  CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `centro_deportivo` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,5.0,'2025-03-01','Excelente servicio, muy recomendado.',1,1),(3,3.0,'2025-03-06','Instalaciones regulares, mantenimiento necesario.',3,3),(4,5.0,'2025-03-09','Muy buena atención y espacios cómodos.',4,4),(5,4.0,'2025-03-12','Buen lugar, pero algo costoso.',5,5),(6,2.0,'2025-03-15','No cumplió mis expectativas, estaba inactivo.',6,6),(7,2.0,'2025-03-18','Excelente gimnasio, todo impecable.',10,10),(8,3.0,'2025-03-21','Aceptable, pero debería mejorar horarios.',8,8),(9,4.0,'2025-03-24','Buen servicio familiar y atención al cliente.',9,9),(10,5.0,'2025-03-28','Un lugar excelente para entrenar.',10,10);
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-08 18:17:12
