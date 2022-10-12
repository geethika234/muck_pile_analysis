-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: iocllive
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `mst_bench`
--

DROP TABLE IF EXISTS `mst_bench`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_bench` (
  `MstbenchId` smallint(6) NOT NULL AUTO_INCREMENT,
  `BenchId` varchar(50) NOT NULL,
  `Benchname` varchar(100) NOT NULL,
  `Benchtype` varchar(50) DEFAULT NULL,
  `MstPlantId` smallint(6) NOT NULL,
  `MstCustId` smallint(6) NOT NULL,
  `MstCoalfieldId` smallint(6) NOT NULL,
  `MstMineId` smallint(6) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstbenchId`),
  UNIQUE KEY `BenchId_UNIQUE` (`BenchId`),
  KEY `bench_PlantId_idx` (`MstPlantId`),
  KEY `bench_CustId_idx` (`MstCustId`),
  KEY `bench_CoalfieldId_idx` (`MstCoalfieldId`),
  KEY `bench_MineId_idx` (`MstMineId`),
  CONSTRAINT `bench_CoalfieldId` FOREIGN KEY (`MstCoalfieldId`) REFERENCES `mst_coalfield` (`MstcoalfieldId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bench_CustId` FOREIGN KEY (`MstCustId`) REFERENCES `mst_customer` (`MstCustId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bench_MineId` FOREIGN KEY (`MstMineId`) REFERENCES `mst_mines` (`MstMineId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bench_PlantId` FOREIGN KEY (`MstPlantId`) REFERENCES `mst_plant` (`MstPlantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_coalfield`
--

DROP TABLE IF EXISTS `mst_coalfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_coalfield` (
  `MstcoalfieldId` smallint(6) NOT NULL AUTO_INCREMENT,
  `CoalfieldId` varchar(50) NOT NULL,
  `Coalfieldname` varchar(100) NOT NULL,
  `MstPlantId` smallint(6) NOT NULL,
  `MstCustId` smallint(6) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstcoalfieldId`),
  UNIQUE KEY `CoalfieldId_UNIQUE` (`CoalfieldId`),
  KEY `PlantID_idx` (`MstPlantId`),
  KEY `CustID_idx` (`MstCustId`),
  CONSTRAINT `CustID` FOREIGN KEY (`MstCustId`) REFERENCES `mst_customer` (`MstCustId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PlantID` FOREIGN KEY (`MstPlantId`) REFERENCES `mst_plant` (`MstPlantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_customer`
--

DROP TABLE IF EXISTS `mst_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_customer` (
  `MstCustId` smallint(6) NOT NULL AUTO_INCREMENT,
  `CustomerId` varchar(50) NOT NULL,
  `Customername` varchar(100) NOT NULL,
  `MstPlantId` smallint(6) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstCustId`),
  UNIQUE KEY `CustomerId_UNIQUE` (`CustomerId`),
  KEY `MstPlantId_idx` (`MstPlantId`),
  CONSTRAINT `MstPlantId` FOREIGN KEY (`MstPlantId`) REFERENCES `mst_plant` (`MstPlantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_menu`
--

DROP TABLE IF EXISTS `mst_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_menu` (
  `MstMenuId` smallint(6) NOT NULL AUTO_INCREMENT,
  `Menuname` varchar(50) NOT NULL,
  `Menupath` varchar(500) NOT NULL,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` bigint(20) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstMenuId`),
  UNIQUE KEY `Menuname_UNIQUE` (`Menuname`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_mines`
--

DROP TABLE IF EXISTS `mst_mines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_mines` (
  `MstMineId` smallint(6) NOT NULL AUTO_INCREMENT,
  `MineId` varchar(50) NOT NULL,
  `MineName` varchar(100) NOT NULL,
  `MstPlantId` smallint(6) NOT NULL,
  `MstCustId` smallint(6) NOT NULL,
  `MstCoalfieldId` smallint(6) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` bigint(20) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` bigint(20) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` bigint(20) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstMineId`),
  UNIQUE KEY `MineId_UNIQUE` (`MineId`),
  KEY `PlantId_idx` (`MstPlantId`),
  KEY `CustId_idx` (`MstCustId`),
  KEY `CoalfieldId_idx` (`MstCoalfieldId`),
  KEY `MstPlantId_idx` (`MstPlantId`),
  CONSTRAINT `mineCoalfieldID` FOREIGN KEY (`MstCoalfieldId`) REFERENCES `mst_coalfield` (`MstcoalfieldId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mineCustid` FOREIGN KEY (`MstCustId`) REFERENCES `mst_customer` (`MstCustId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `minePlantID` FOREIGN KEY (`MstPlantId`) REFERENCES `mst_plant` (`MstPlantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_plant`
--

DROP TABLE IF EXISTS `mst_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_plant` (
  `MstPlantId` smallint(6) NOT NULL AUTO_INCREMENT,
  `PlantId` varchar(50) NOT NULL,
  `PlantName` varchar(100) NOT NULL,
  `PlantAddress` varchar(500) NOT NULL,
  `PlantState` varchar(50) DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstPlantId`),
  UNIQUE KEY `PlantId_UNIQUE` (`PlantId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_role`
--

DROP TABLE IF EXISTS `mst_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_role` (
  `MstRoleId` smallint(6) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(50) NOT NULL,
  `Rolename` varchar(100) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstRoleId`),
  UNIQUE KEY `RoleId_UNIQUE` (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_rolevscapability`
--

DROP TABLE IF EXISTS `mst_rolevscapability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_rolevscapability` (
  `MstrolecapId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `MstRoleId` smallint(6) NOT NULL,
  `MstMenuId` smallint(6) NOT NULL,
  `Viewpermission` smallint(6) DEFAULT NULL,
  `Addpermission` smallint(6) DEFAULT NULL,
  `Modifiedpermission` smallint(6) DEFAULT NULL,
  `Deletepermission` smallint(6) DEFAULT NULL,
  `Blockpermission` smallint(6) DEFAULT NULL,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  `SearchField` text,
  PRIMARY KEY (`MstrolecapId`),
  KEY `RoleVsCapability_RoleId_idx` (`MstRoleId`),
  KEY `RoleVsCapability_MenuId_idx` (`MstMenuId`),
  CONSTRAINT `RoleVsCapability_MenuId` FOREIGN KEY (`MstMenuId`) REFERENCES `mst_menu` (`MstMenuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RoleVsCapability_RoleId` FOREIGN KEY (`MstRoleId`) REFERENCES `mst_role` (`MstRoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_user`
--

DROP TABLE IF EXISTS `mst_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_user` (
  `MstuserId` smallint(6) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Firstname` varchar(100) NOT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile` bigint(255) DEFAULT NULL,
  `Phone` bigint(255) DEFAULT NULL,
  `Profileimg` varchar(500) DEFAULT NULL,
  `Currentpassword` varchar(1000) NOT NULL,
  `Oldpassword` varchar(1000) DEFAULT NULL,
  `Passwordstatus` varchar(10) DEFAULT 'No',
  `MstRoleId` smallint(6) NOT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`MstuserId`),
  UNIQUE KEY `UserId_UNIQUE` (`UserId`),
  KEY `User_RoleId_idx` (`MstRoleId`),
  CONSTRAINT `User_RoleId` FOREIGN KEY (`MstRoleId`) REFERENCES `mst_role` (`MstRoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_user_vs_mine_mapiing`
--

DROP TABLE IF EXISTS `mst_user_vs_mine_mapiing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_user_vs_mine_mapiing` (
  `Mst_OPID` int(11) NOT NULL AUTO_INCREMENT,
  `MstuserId` smallint(6) NOT NULL,
  `MineID` smallint(6) NOT NULL,
  `MstRoleId` smallint(6) NOT NULL,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Mst_OPID`),
  KEY `MineIDS_idx` (`MineID`),
  KEY `mstRoleIDS_idx` (`MstRoleId`),
  KEY `mstuserids_idx` (`MstuserId`),
  CONSTRAINT `MineIDS` FOREIGN KEY (`MineID`) REFERENCES `mst_mines` (`MstMineId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mstRoleIDS` FOREIGN KEY (`MstRoleId`) REFERENCES `mst_role` (`MstRoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mstuserids` FOREIGN KEY (`MstuserId`) REFERENCES `mst_user` (`MstuserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_cornerphotos`
--

DROP TABLE IF EXISTS `trn_cornerphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_cornerphotos` (
  `TrncornerphotosId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnSiteId` int(11) NOT NULL,
  `CRTLName` varchar(500) DEFAULT NULL,
  `CRTLPath` varchar(500) DEFAULT NULL,
  `CRTLGPSLatitude` varchar(50) DEFAULT NULL,
  `CRTLGPSLongitude` varchar(50) DEFAULT NULL,
  `CRTLGPSAltitude` varchar(50) DEFAULT NULL,
  `CRTRName` varchar(500) NOT NULL,
  `CRTRPath` varchar(500) NOT NULL,
  `CRTRGPSLatitude` varchar(50) DEFAULT NULL,
  `CRTRGPSLongitude` varchar(50) DEFAULT NULL,
  `CRTRGPSAltitude` varchar(50) DEFAULT NULL,
  `CRBLName` varchar(500) DEFAULT NULL,
  `CRBLPath` varchar(500) DEFAULT NULL,
  `CRBLGPSLatitude` varchar(50) DEFAULT NULL,
  `CRBLGPSLongitude` varchar(50) DEFAULT NULL,
  `CRBLGPSAltitude` varchar(50) DEFAULT NULL,
  `CRBRName` varchar(500) DEFAULT NULL,
  `CRBRPath` varchar(500) DEFAULT NULL,
  `CRBRGPSLatitude` varchar(50) DEFAULT NULL,
  `CRBRGPSLongitude` varchar(50) DEFAULT NULL,
  `CRBRGPSAltitude` varchar(50) DEFAULT NULL,
  `SearchField` text,
  `Createby` smallint(6) NOT NULL,
  `Createdate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrncornerphotosId`),
  KEY `Cornerphotos_SiteId_idx` (`TrnSiteId`),
  CONSTRAINT `Cornerphotos_SiteId` FOREIGN KEY (`TrnSiteId`) REFERENCES `trn_preblast` (`TrnSiteId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_countouring`
--

DROP TABLE IF EXISTS `trn_countouring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_countouring` (
  `TrnContorId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnSiteId` int(11) NOT NULL,
  `Filename_before_Contouring` varchar(500) NOT NULL,
  `Filepath_before_Contouring` varchar(500) NOT NULL,
  `Filename_after_Contouring` varchar(500) DEFAULT NULL,
  `Filepath_after_Contouring` varchar(500) DEFAULT NULL,
  `Contouringtype` varchar(500) DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnContorId`),
  KEY `Countouring_SiteId_idx` (`TrnSiteId`),
  CONSTRAINT `Countouring_SiteId` FOREIGN KEY (`TrnSiteId`) REFERENCES `trn_preblast` (`TrnSiteId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_forgotpassword`
--

DROP TABLE IF EXISTS `trn_forgotpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_forgotpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_loadingsheet`
--

DROP TABLE IF EXISTS `trn_loadingsheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_loadingsheet` (
  `TrnloadsheetId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnSiteId` int(11) NOT NULL,
  `HoleNo` smallint(6) NOT NULL,
  `BottomCharge` float DEFAULT NULL,
  `TopCharge` float DEFAULT NULL,
  `Deck` float DEFAULT NULL,
  `Booster` float DEFAULT NULL,
  `WaterColumn` float DEFAULT NULL,
  `FinalStemmingHeight` float DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnloadsheetId`),
  KEY `LoadingSheet_SiteId_idx` (`TrnSiteId`),
  CONSTRAINT `LoadingSheet_SiteId` FOREIGN KEY (`TrnSiteId`) REFERENCES `trn_preblast` (`TrnSiteId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_logfile`
--

DROP TABLE IF EXISTS `trn_logfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_logfile` (
  `TrnlogId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnmenuId` smallint(6) NOT NULL,
  `Trnaction` varchar(500) NOT NULL,
  `TrnuserId` smallint(6) NOT NULL,
  `Trndatetime` datetime NOT NULL,
  `Trndescription` text,
  `Trncreateddate` datetime NOT NULL,
  PRIMARY KEY (`TrnlogId`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_pilephotos`
--

DROP TABLE IF EXISTS `trn_pilephotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_pilephotos` (
  `TrnpilesphotosId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnSiteId` smallint(6) NOT NULL,
  `Pileno` smallint(6) NOT NULL,
  `Filename_O` varchar(500) NOT NULL,
  `Filepath_O` varchar(500) NOT NULL,
  `Filename_F` varchar(500) DEFAULT NULL,
  `Filepath_F` varchar(500) DEFAULT NULL,
  `Filename_HG` varchar(500) DEFAULT NULL,
  `Filepath_HG` varchar(500) DEFAULT NULL,
  `Filename_CHG` varchar(500) DEFAULT NULL,
  `Filepath_CHG` varchar(500) DEFAULT NULL,
  `txtFilePath_HG` varchar(500) DEFAULT NULL,
  `txtFilePath_CHG` varchar(500) DEFAULT NULL,
  `txtFilename_HG` varchar(500) DEFAULT NULL,
  `txtFilename_CHG` varchar(500) DEFAULT NULL,
  `GPSLatitude` varchar(50) DEFAULT NULL,
  `GPSLongitude` varchar(50) DEFAULT NULL,
  `GPSAltitude` varchar(50) DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnpilesphotosId`),
  KEY `PilePhotos_SiteId_idx` (`TrnSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_postblast`
--

DROP TABLE IF EXISTS `trn_postblast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_postblast` (
  `TrnpostblastId` int(11) NOT NULL AUTO_INCREMENT,
  `TrnSiteId` int(11) NOT NULL,
  `Fragmentation` varchar(50) DEFAULT NULL,
  `Throw` varchar(50) DEFAULT NULL,
  `FlyRock` varchar(50) DEFAULT NULL,
  `BlockVolume` smallint(6) DEFAULT NULL,
  `PF` float DEFAULT NULL,
  `VibrationLevel` float DEFAULT NULL,
  `BlastResult` varchar(50) DEFAULT NULL,
  `NoofPiles` smallint(6) DEFAULT NULL,
  `VibrationReport` varchar(500) DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnpostblastId`),
  KEY `TrnSiteId_idx` (`TrnSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_preblast`
--

DROP TABLE IF EXISTS `trn_preblast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_preblast` (
  `TrnSiteId` int(11) NOT NULL AUTO_INCREMENT,
  `MstbenchId` varchar(50) NOT NULL,
  `SiteId` varchar(50) NOT NULL,
  `Sitename` varchar(50) NOT NULL,
  `BlastHoleDiameter` smallint(6) DEFAULT NULL,
  `DrillingPattern` varchar(50) DEFAULT NULL,
  `NoofHoles` smallint(6) DEFAULT NULL,
  `ExcavatorType` varchar(50) DEFAULT NULL,
  `ExcavatorCapacity` float DEFAULT NULL,
  `RockType` varchar(50) DEFAULT NULL,
  `StrataCondition` varchar(50) DEFAULT NULL,
  `BenchHeight` smallint(6) DEFAULT NULL,
  `AverageHoledepth` float DEFAULT NULL,
  `Spacing` float DEFAULT NULL,
  `Burden` float DEFAULT NULL,
  `TotalChargePerround` smallint(6) DEFAULT NULL,
  `MaximumChargePerHole` smallint(6) DEFAULT NULL,
  `FiringSequence` varchar(50) DEFAULT NULL,
  `VolumeoftheBlast` smallint(6) DEFAULT NULL,
  `PowderFactor` smallint(6) DEFAULT NULL,
  `BlastDiagram` varchar(500) DEFAULT NULL,
  `PumpTruckNo` varchar(500) NOT NULL,
  `DrillDia` smallint(6) NOT NULL,
  `Location` varchar(500) DEFAULT NULL,
  `BoosterUsed` float DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `SearchField` text,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_usermail_log`
--

DROP TABLE IF EXISTS `trn_usermail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_usermail_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `MailBody` longtext,
  `password` varchar(200) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_uservscapability`
--

DROP TABLE IF EXISTS `trn_uservscapability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_uservscapability` (
  `TrnroleusercapId` int(11) NOT NULL AUTO_INCREMENT,
  `MstRoleId` smallint(6) NOT NULL,
  `MstUserId` smallint(6) NOT NULL,
  `MstMenuId` smallint(6) NOT NULL,
  `Viewpermission` smallint(6) DEFAULT NULL,
  `Addpermission` smallint(6) DEFAULT NULL,
  `Modifiypermission` smallint(6) DEFAULT NULL,
  `Deletepermission` smallint(6) DEFAULT NULL,
  `Blockpermission` smallint(6) DEFAULT NULL,
  `Createdby` smallint(6) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Modifiedby` smallint(6) DEFAULT NULL,
  `Modifieddate` datetime DEFAULT NULL,
  `Deletedby` smallint(6) DEFAULT NULL,
  `Deleteddate` datetime DEFAULT NULL,
  `Blockedby` smallint(6) DEFAULT NULL,
  `Blockeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`TrnroleusercapId`),
  KEY `UserVsCapability_RoleId_idx` (`MstRoleId`),
  KEY `UserVsCapability_MenuId_idx` (`MstMenuId`),
  KEY `UserVsCapability_UserId_idx` (`MstUserId`),
  CONSTRAINT `UserVsCapability_MenuId` FOREIGN KEY (`MstMenuId`) REFERENCES `mst_menu` (`MstMenuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserVsCapability_RoleId` FOREIGN KEY (`MstRoleId`) REFERENCES `mst_role` (`MstRoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserVsCapability_UserId` FOREIGN KEY (`MstUserId`) REFERENCES `mst_user` (`MstuserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'iocllive'
--

--
-- Dumping routines for database 'iocllive'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBenchBind` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `AddBenchBind`()
BEGIN
Declare MaxBenchID varchar(20);
select M.MstMineId,M.MineId,M.MineName,M.MstPlantId,M.MstCustId,M.Customername,M.PlantName,
M.MstCoalfieldId,M.Coalfieldname,MaxMineID from mst_mines M
where B.Deletedby is null and B.Blockedby is null;
set MaxBenchID=(select  Concat('Bh',substring(concat(1,substring(Benchid,3,4))+1,2)) 
as BenchId from mst_bench order by MstbenchId desc limit 1);
select MaxBenchID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddCoalfieldsBind` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddCoalfieldsBind`()
BEGIN
Declare MaxCoalfieldsID varchar(20);
select C.MstCustId,C.CustomerId,C.Customername,C.MstPlantId,mp.Plantname,MaxCustID from mst_customer C
where C.Deletedby is null and C.Blockedby is null;
set MaxCoalfieldsID=(select  Concat('Cf',substring(concat(1,substring(coalfieldId,3,4))+1,2)) 
 as Coalfieldsid from mst_coalfields order by MstCoalfieldsId desc limit 1);
select MaxCoalfieldsID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddCustomerBind` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddCustomerBind`()
BEGIN
Declare MaxCustID varchar(20);
select P.MstPlantId,P.PlantId,P.PlantName,P.PlantAddress,P.PlantState from mst_Plant P
where P.Deletedby is null and P.Blockedby is null;
set MaxCustID=(select  Concat('Cu',substring(concat(1,substring(customerid,3,4))+1,2))  as Custid from mst_customer order by MstCustId desc limit 1);
select MaxCustID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMinesBind` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `AddMinesBind`()
BEGIN
Declare MaxMineID varchar(20);
select C.MstCustId,C.Customername,PN.PlantName,PN.MstPlantId,C.MstCoalfieldId,C.Coalfieldname from mst_coalfield C
where C.Deletedby is null and C.Blockedby is null;
set MaxMineID=(select  Concat('Mi',substring(concat(1,substring(mineid,3,4))+1,2))  
 as MineId from mst_mines order by MstMineId desc limit 1);
select MaxMineID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindBench` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindBench`()
BEGIN
Declare MaxBenchID varchar(20);
 
if not exists( select * from mst_bench) then
Begin
set MaxBenchID="Bh0001";
End;
Else
Begin
set MaxBenchID=(select  Concat('Bh',substring(concat(1,substring(BenchID,3,4))+1,2))  as BenchId from mst_bench order by MstbenchId desc limit 1);
End;
End if;
 
select MaxBenchID,B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName,(select count(*) from trn_preblast where MstbenchId=B.MstbenchId and Deletedby is null ) as TrnPreBlast
 ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId 
Left join mst_customer mc on mc.MstCustId=B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId 
Left join mst_mines mm on mm.MstMineId=B.MstMineId 

where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;
select MaxBenchID,M.MstMineId,M.MineId,M.MineName,PN.PlantName,M.MstPlantId,
M.MstCustId,mc.Customername,M.MstCoalfieldId,mcf.Coalfieldname from mst_mines M


Left join mst_plant PN on PN.MstPlantId=M.MstPlantId
Left join mst_customer mc on mc.MstCustId=M.MstCustId
Left join mst_coalfield mcf on mcf.MstCoalfieldId=M.MstCoalfieldId
where M.Deletedby is null and M.Blockedby is null  and PN.Blockedby is null and PN.Deletedby is null  and mc.Blockedby is null and mc.Deletedby is null
and mcf.Blockedby is null and mcf.Deletedby is null;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindCamera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BindCamera`(PBMstbenchId int)
BEGIN
select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PO.NoofPiles, PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 
 ,B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype ,B.MstCustId,B.MstCoalfieldId,B.MstMineId,mc.Customername,(select count(*) from trn_postblast where TrnSiteId=PB.TrnSiteId  and Deletedby is null) as ValidCamera,
 (select count(*) from trn_pilephotos where TrnSiteId=PB.TrnSiteId  and Deletedby is null) as ValidPostBlast,
mcf.Coalfieldname,mm.MineName,mp.PlantName  ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 from trn_preblast PB
 
Left join trn_postblast PO on PO.TrnSiteId=PB.TrnSiteId
 Left join mst_bench B on B.MstbenchId=PB.MstbenchId
 Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where PB.Deletedby is null and PB.Blockedby is null and PB.MstbenchId =PBMstbenchId and PB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null
and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindCoalfields` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindCoalfields`()
BEGIN
Declare MaxCoalfieldsID varchar(20);
if not exists( select * from mst_coalfield) then
Begin
set MaxCoalfieldsID="Cf0001";
End;
Else
Begin
set MaxCoalfieldsID=(select  Concat('Cf',substring(concat(1,substring(coalfieldId,3,4))+1,2)) as Custid from mst_coalfield order by MstcoalfieldId desc limit 1);
End;
End if;
 

select MaxCoalfieldsID,C.MstcoalfieldId,C.CoalfieldId,C.Coalfieldname,C.MstPlantId,C.MstCustId,mc.Customername,mp.PlantName from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId
Left join mst_customer mc on mc.MstCustId=C.MstCustId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null;
select C.MstCustId,C.Customername,PN.PlantName,PN.MstPlantId,MaxCoalfieldsID from mst_customer C
Left join mst_plant PN on PN.MstPlantId=C.MstPlantId

where C.Deletedby is null and C.Blockedby is null and PN.Deletedby is null  and PN.Blockedby is null;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindCornerPhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindCornerPhotos`()
BEGIN
select C.TrncornerphotosId,C.TrnSiteId,C.Filename,C.Filepath
 from trn_cornerphotos C
where C.Deletedby is null and C.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindCountouring` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindCountouring`()
BEGIN
select C.TrnContorId,C.TrnSiteId,C.Filename_before_Contouring ,C.Filepath_before_Contouring,C.Filename_after_Contourin,C.Filepath_after_Contouring,C.Contouringtype
 from trn_countouring C
where C.Deletedby is null and C.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindCustomer`()
BEGIN
Declare MaxCustID varchar(20);
if not exists( select * from mst_customer) then
Begin
set MaxCustID="Cu0001";
End;
Else
Begin
set MaxCustID=(select  Concat('Cu',substring(concat(1,substring(Customerid,3,4))+1,2))  as Custid from mst_customer order by MstCustId desc limit 1);
End;
End if;
select C.MstCustId,C.CustomerId,C.Customername,C.MstPlantId,mp.Plantname,MaxCustID from mst_customer C
Left join mst_plant mp on mp.MstPlantId=c.MstPlantId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null;
select P.MstPlantId,P.PlantName,MaxCustID from mst_Plant P
where P.Deletedby is null and P.Blockedby is null;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindDashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindDashboard`()
BEGIN
SELECT COUNT(*) as Plant FROM mst_plant where Deletedby is null and Blockedby is null;
SELECT COUNT(*) as Customer FROM mst_customer where Deletedby is null and Blockedby is null;
SELECT COUNT(*) as Coalfield FROM mst_coalfield where Deletedby is null and Blockedby is null;
SELECT COUNT(*) as Mines FROM mst_mines where Deletedby is null and Blockedby is null;
SELECT COUNT(*) as Users FROM mst_user where Deletedby is null and Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindLoadingSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindLoadingSheet`()
BEGIN
select L.TrnloadsheetId,L.TrnSiteId,L.HoleNo,L.BottomCharge,L.TopCharge,L.Deck,L.Booster,L.WaterColumn,L.FinalStemmingHeight
 from trn_loadingsheet L
where L.Deletedby is null and L.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindLogFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindLogFile`()
BEGIN
select LF.TrnlogId,LF.TrnmenuId,LF.Trnaction,LF.TrnuserId,LF.Trndatetime,LF.Trndescription,LF.Trncreateddate
 from trn_logfile LF
where LF.Deletedby is null and LF.Blockedby is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindMenu`()
BEGIN
select M.MstMenuId,M.Menuname,M.Menupath from mst_menu M
where M.Deletedby is null and M.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindMines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindMines`()
BEGIN
Declare MaxMineID varchar(20);
set MaxMineID=(select concat("M-",ifnull((substring(MineId,4)+1),"M-101"))
 as MineId from mst_mines order by MstMineId desc limit 1);

select MaxMineID,M.MstMineId,M.MineId,M.MineName,M.MstPlantId,M.MstCustId,mc.Customername,
mp.PlantName,M.MstCoalfieldId,mcf.Coalfieldname from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId
Left join mst_customer mc on mc.MstCustId=M.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId
where M.Deletedby is null and M.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null;
select C.MstCustId,CM.Customername,PN.PlantName,PN.MstPlantId,C.MstCoalfieldId,C.Coalfieldname from mst_coalfield C
Left join mst_plant PN on PN.MstPlantId=C.MstPlantId
Left join mst_customer CM on CM.MstCustId=C.MstCustId
where C.Deletedby is null and C.Blockedby is null and PN.Deletedby is null and C.Blockedby is null and CM.Deletedby is null and C.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPilePhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPilePhotos`(PPileno int,PTrnSiteId int)
BEGIN
select P.TrnpilesphotosId,P.TrnSiteId,P.Pileno,P.Filename_O,P.Filepath_O,
ifnull(P.GPSLatitude,'-') as GPSLatitude,ifnull(P.GPSLongitude,'-') as GPSLongitude,ifnull(P.GPSAltitude,'-') as GPSAltitude
 from trn_pilephotos P
where P.Deletedby is null and P.Blockedby is null and P.Pileno=PPileno and P.TrnSiteId=PTrnSiteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPilePhotosData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPilePhotosData`(
PBMstbenchId int 
)
BEGIN
select PP.TrnpilesphotosId,PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 
 ,(select Count(*)from  trn_pilephotos where Deletedby  is null and Blockedby is null and  TrnSiteId=PB.TrnSiteId) as Checkpost from trn_pilephotos PB
 
 /*Left join mst_bench mb on mb.MstbenchId=PB.MstbenchId*/
 left join trn_pilephotos PP on PP.TrnSiteId=PP.TrnSiteId
where PB.Deletedby is null and PB.Blockedby is null and PB.MstbenchId=PBMstbenchId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPilePhotosView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPilePhotosView`(
PBMstbenchId int 
)
BEGIN
select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 
 ,(select Count(*)from  trn_pilephotos where Deletedby  is null and Blockedby is null and  TrnSiteId=PB.TrnSiteId) as Checkpost from trn_pilephotos PB
 
 /*Left join mst_bench mb on mb.MstbenchId=PB.MstbenchId*/
 
where PB.Deletedby is null and PB.Blockedby is null and PB.MstbenchId=PBMstbenchId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPiles_Data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `BindPiles_Data`()
BEGIN


select TB.TrnpostblastId,PB.TrnSiteId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 ,B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName,TB.NoofPiles
 
 from trn_postblast TB
  left join trn_preblast PB  on TB.TrnSiteId=PB.TrnSiteId
Left join mst_bench B on B.MstbenchId=PB.MstbenchId 
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where PB.Deletedby is null and PB.Blockedby is null and TB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null and mc.Deletedby is null
and mcf.Deletedby is null and mm.Deletedby is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPlant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPlant`()
BEGIN
select P.MstPlantId,P.PlantId,P.PlantName,P.PlantAddress,P.PlantState from mst_Plant P
where P.Deletedby is null and P.Blockedby is null ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPlantname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPlantname`()
BEGIN
select P.MstPlantId,P.PlantId,P.PlantName,P.PlantAddress,P.PlantState from mst_Plant P
where P.Deletedby is null and P.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPostBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPostBlast`()
BEGIN
select PO.TrnSiteId,PO.Fragmentation,PO.Throw,PO.FlyRock,PO.BlockVolume,PO.PF,PO.VibrationLevel,PO.BlastResult,PO.NoofPiles,
PO.VibrationReport from trn_postblast PO
where PO.Deletedby is null and PO.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPostBlastData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPostBlastData`(
PBMstbenchId int 
)
BEGIN
select TB.TrnpostblastId,PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
  ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 ,(select Count(*)from  trn_postblast where Deletedby  is null and Blockedby is null and  TrnSiteId=PB.TrnSiteId) as Checkpost from trn_preblast PB


 left join trn_postblast TB on TB.TrnSiteId=PB.TrnSiteId
  Left join mst_bench B on B.MstbenchId=PB.MstbenchId
 Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where PB.Deletedby is null and PB.Blockedby is null and PB.MstbenchId=PBMstbenchId and TB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null
 and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPostBlastView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPostBlastView`(
PBMstbenchId int 
)
BEGIN
select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 
 ,(select Count(*)from  trn_postblast where Deletedby  is null and lockedby is null and  TrnSiteId=PB.TrnSiteId) as Checkpost from trn_preblast PB
 
 /*Left join mst_bench mb on mb.MstbenchId=PB.MstbenchId*/
 
where PB.Deletedby is null and PB.Blockedby is null and PB.MstbenchId=PBMstbenchId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindPreBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindPreBlast`( PMstbenchId bigint)
BEGIN
select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 from trn_preblast PB
 
 /*Left join mst_bench mb on mb.MstbenchId=PB.MstbenchId*/
 
where PB.Deletedby is null  and PB.Blockedby is null and PB.MstbenchId=PMstbenchId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindRole`()
BEGIN
Declare MaxRoleid varchar(20);
if ((select count(*) from mst_role) =0)then
Begin
set MaxRoleid="UR-101";
End;
else
Begin
set MaxRoleid=(select concat("CS-",ifnull((substring(RoleId,4)+1),"UR-101"))  from mst_role order by MstRoleId desc limit 1);

End;
End if;

select R.MstRoleId,R.RoleId,R.RoleName from mst_role R
where R.Deletedby is null  and R.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindRoleVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindRoleVsCapability`(Rflag int(100))
BEGIN
select R.MstrolecapId,R.MstRoleId,R.MstMenuId,M.Menuname,R.Viewpermission,R.Addpermission,R.Modifiedpermission,
R.Deletepermission,R.Blockpermission,R.MstRoleId from mst_menu M 
left join mst_rolevscapability R on M.MstMenuId=R.MstMenuId
where R.Deletedby is null  and R.Blockedby is null and R.MstRoleId=Rflag  and M.Deletedby is null order by R.MstMenuId asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindUser`()
BEGIN
select U.MstuserId,U.UserId,U.Username,U.Firstname,U.Lastname,U.Email,U.Mobile,
CASE
    WHEN U.Phone = 0 THEN "-"
  
    ELSE U.Phone
END as Phone ,U.Profileimg,MR.RoleName,
U.Currentpassword,U.Oldpassword,U.MstRoleId, ifnull(U.Blockedby,'-') as Blockedby from mst_user U
Left join Mst_role MR on MR.MstRoleId=U.MstRoleId 
where U.Deletedby is null and MR.Deletedby is null; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BindUserVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `BindUserVsCapability`()
BEGIN
select UC.TrnroleusercapId,UC.MstRoleId,UC.MstUserId,UC.MstMenuId,UC.Viewpermission,UC.Addpermission,UC.Modifiypermission,
UC.Deletepermission,UC.Blockpermission
 from trn_uservscapability UC
 
 
where UC.Deletedby is null  and UC.Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Dashboard_Count_menus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `Dashboard_Count_menus`()
BEGIN
SELECT COUNT(*) FROM mst_plant where Deletedby is null and Blockedby is null;
SELECT COUNT(*) FROM mst_customer where Deletedby is null and Blockedby is null;
SELECT COUNT(*) FROM mst_coalfields where Deletedby is null and Blockedby is null;
SELECT COUNT(*) FROM mst_mines where Deletedby is null and Blockedby is null;
SELECT COUNT(*) FROM mst_bench where Deletedby is null and Blockedby is null;
SELECT COUNT(*) FROM mst_user where Deletedby is null and Blockedby is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DownloadGridData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `DownloadGridData`(flag int,userby int)
BEGIN
if flag=1 then
begin
select P.MstPlantId,P.PlantId,P.PlantName,P.PlantAddress,P.PlantState from mst_Plant P
where P.Deletedby is null and P.Blockedby is null;
end;
end if;

if flag=2 then
begin
select C.MstCustId,C.CustomerId,C.Customername,C.MstPlantId,mp.Plantname from mst_customer C
Left join mst_plant mp on mp.MstPlantId=c.MstPlantId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null;
end;
end if;

if flag=3 then
begin
select C.CoalfieldId,C.Coalfieldname,C.MstPlantId,mc.Customername,mp.PlantName from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId
Left join mst_customer mc on mc.MstCustId=C.MstCustId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null;
end;
end if;

if flag=4 then
begin
select M.MstMineId,M.MineId,M.MineName,M.MstPlantId,M.MstCustId,mc.Customername,mp.PlantName,M.MstCoalfieldId,mcf.Coalfieldname from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId
Left join mst_customer mc on mc.MstCustId=M.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId
where M.Deletedby is null and M.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null;
end;
end if;

if flag=5 then
begin
select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;
end;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DownloadGrid_Data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `DownloadGrid_Data`(flag int,userby int)
BEGIN
if flag=1 then
begin
select P.PlantId,P.PlantName,P.PlantAddress from mst_Plant P
where P.Deletedby is null and P.Blockedby is null;
end;
end if;

if flag=2 then
begin
select C.CustomerId,C.Customername,mp.Plantname from mst_customer C
Left join mst_plant mp on mp.MstPlantId=c.MstPlantId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null;
end;
end if;

if flag=3 then
begin
select C.CoalfieldId,C.Coalfieldname,mc.Customername,mp.PlantName from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId
Left join mst_customer mc on mc.MstCustId=C.MstCustId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null;
end;
end if;

if flag=4 then
begin
select M.MineId,M.MineName,mc.Customername,mp.PlantName,mcf.Coalfieldname from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId
Left join mst_customer mc on mc.MstCustId=M.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId
where M.Deletedby is null and M.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null;
end;
end if;

if flag=5 then
begin
select B.BenchId,B.Benchname,B.Benchtype,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;
end;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBench` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetBench`(
BMstbenchId int
)
BEGIN
select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId from mst_bench B
where B.Deletedby  is null and B.Blockedby is null and  B.MstbenchId=B.MstbenchId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBindPhotosData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `GetBindPhotosData`(userby int,Flag int,VPlant int,
VCustomer int,VCoalfields int,VMine int,
VBench int,VPiles int)
BEGIN
/*if Flag=1 then
Begin*/
select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  ;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  ;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where TP.Deletedby is null and TP.Blockedby is null and PB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null and mc.Deletedby is null
 and mcf.Deletedby is null and mm.Deletedby is null;
/*End;
End if;
if Flag=2 then
Begin

select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null and MstPlantId= VPlant  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  and MstPlantId= VPlant  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null  and MstPlantId= VPlant ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  and MstPlantId= VPlant  ;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  and MstPlantId= VPlant  ;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null  and mp.MstPlantId= VPlant ;
End;
End if;
 if Flag=3 then
Begin

select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null and MstPlantId= VPlant  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  and MstCustId= VCustomer  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null  and  MstCustId= VCustomer ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  and  MstCustId= VCustomer;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  and  MstCustId= VCustomer;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null  and mc. MstCustId= VCustomer ;
End;
End if;
 
 if Flag=4 then
Begin

select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null and MstPlantId= VPlant  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  and MstCustId= VCustomer  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null  and MstCoalfieldId= VCoalfields ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  and MstCoalfieldId= VCoalfields  ;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  and MstCoalfieldId= VCoalfields  ;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null  and mcf.MstCoalfieldId= VCoalfields ;
End;
End if;
 if Flag=5 then
Begin

select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null and MstPlantId= VPlant  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  and MstCustId= VCustomer  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null  and MstCoalfieldId= VCoalfields ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  and MstMineId= VMine  ;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  and MstbenchId= VBench  ;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where TP.Deletedby is null and TP.Deletedby is null  and B.MstbenchId= VBench ;
End;

End if; 
 if Flag=6 then
Begin

select   PlantName,MstPlantId from  mst_plant    where  Deletedby is null and MstPlantId= VPlant  ;
select   Customername,MstCustId from  mst_customer   where  Deletedby is null  and MstCustId= VCustomer  ;
select   Coalfieldname,MstCoalfieldId from  mst_coalfield  where  Deletedby is null  and MstCoalfieldId= VCoalfields ;
select   MineName,MstMineId from  mst_mines where  Deletedby is null  and MstMineId= VCustomer  ;
select   Benchname,MstbenchId from  mst_bench  where  Deletedby is null  and MstbenchId= VMine  ;
select TP.Pileno from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null  and TP.Pileno= VPiles ;
End;

End if; 
*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCoalfields` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetCoalfields`(
CMstcoalfieldId int
)
BEGIN
select C.MstcoalfieldId,C.CoalfieldId,C.Coalfieldname,C.MstPlantId,C.MstCustId from mst_coalfield C
where C.Deletedby  is null and C.Blockedby is null and  C.MstcoalfieldId=CMstcoalfieldId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCornerPhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetCornerPhotos`(
CTrncornerphotosId int
)
BEGIN
select C.TrncornerphotosId,C.TrnSiteId,C.Filename,C.Filepath
 from trn_cornerphotos C
where C.Deletedby is null and C.Blockedby is null and  C.TrncornerphotosId=C.TrncornerphotosId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCountouring` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetCountouring`(
CTrnContorId int
)
BEGIN
select C.TrnContorId,C.TrnSiteId,C.Filename_before_Contouring ,C.Filepath_before_Contouring,C.Filename_after_Contourin,C.Filepath_after_Contouring,C.Contouringtype
 from trn_countouring C
where C.Deletedby  is null and C.Blockedby is null and  C.MstrolecapId=C.MstrolecapId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetCustomer`(
CMstCustId int
)
BEGIN

select C.MstCustId,C.CustomerId,C.Customername,C.MstPlantId from mst_customer C
where C.Deletedby  is null and C.Blockedby is null and  C.MstCustId=C.MstCustId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLoadingSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetLoadingSheet`(
LTrnloadsheetId int
)
BEGIN
select L.TrnloadsheetId,L.TrnSiteId,L.HoleNo,L.BottomCharge,L.TopCharge,L.Deck,L.Booster,L.WaterColumn,L.FinalStemmingHeight
 from trn_loadingsheet L
where L.Deletedby  is null  and L.Blockedby is null and  L.MstrolecapId=L.MstrolecapId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLogFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetLogFile`(
LFTrnlogId int
)
BEGIN
select LF.TrnlogId,LF.TrnmenuId,LF.Trnaction,LF.TrnuserId,LF.Trndatetime,LF.Trndescription,LF.Trncreateddate
 from trn_logfile LF
where LF.Deletedby  is null and LF.Blockedby is null and  LF.LFTrnlogId=LF.LFTrnlogId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetMenu`(
MMstMenuId int
)
BEGIN
select M.MstMenuId,M.Menuname,M.Menupath from mst_menu M
where M.Deletedby  is null and M.Blockedby is null and  M.MstMenuId=M.MstMenuId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetMines`(
MMstMineId int
)
BEGIN
select M.MstMineId,M.MineId,M.MineName,M.MstPlantId,M.MstCustId,M.MstCoalfieldId from mst_mines M
where M.Deletedby  is null and M.Blocked is null and  M.MstMineId=M.MstMineId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPilePhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPilePhotos`(
PTrnpilesphotosId int
)
BEGIN
select P.TrnpilesphotosId,P.TrnSiteId,P.Pileno,P.Filename,P.Filepath,P.GPSLongitude,P.GPSLongitude
 from trn_pilephotos P
where P.Deletedby  is null and P.Blockedby is null and  P.TrnpilesphotosId=PTrnpilesphotosId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPilePhotosBindView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPilePhotosBindView`(
PTrnSiteId int
)
BEGIN
select P.TrnSiteId,P.Pileno,P.Filename,P.Filepath,P.GPSLongitude,P.GPSLongitude, (select Count(*)from  trn_pilephotos 
where Deletedby  is null and  TrnSiteId=TrnSiteId) as Checkpost
from trn_pilephotos P
where P.Deletedby  is null and P.Blockedby is null and  P.TrnSiteId=P.TrnSiteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPlant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPlant`(
PMstPlantId int
)
BEGIN
select P.MstPlantId,P.PlantId,P.PlantName,P.PlantAddress,P.PlantState from mst_Plant P
where P.Deletedby  is null and P.Blockedby is null and  P.MstPlantId=P.MstPlantId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPostBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPostBlast`(
POTrnSiteId int
)
BEGIN
select PO.TrnSiteId,PO.Fragmentation,PO.Throw,PO.FlyRock,PO.BlockVolume,PO.PF,PO.VibrationLevel,PO.BlastResult,PO.NoofPiles,
PO.VibrationReport ,(select Count(*)from  trn_postblast 
where Deletedby  is null and  TrnSiteId=TrnSiteId) as Checkpost
from trn_postblast PO
where PO.Deletedby  is null and PO.Blockedby is null and  PO.TrnpostblastId=POTrnSiteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPostBlastBindView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPostBlastBindView`(
POTrnSiteId int
)
BEGIN
select PO.TrnSiteId,PO.Fragmentation,PO.Throw,PO.FlyRock,PO.BlockVolume,PO.PF,PO.VibrationLevel,PO.BlastResult,PO.NoofPiles,
PO.VibrationReport ,(select Count(*)from  trn_postblast 
where Deletedby  is null and  TrnSiteId=TrnSiteId) as Checkpost
from trn_postblast PO
where PO.Deletedby  is null and PO.Blockedby is null and  PO.TrnSiteId=PO.TrnSiteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPreBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetPreBlast`(
PBTrnSiteId int
)
BEGIN
select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PRDate,date_format(PB.Date,'%Y-%m-%d')  as PDate
 from trn_preblast PB
 where PB.Deletedby  is null and PB.Blockedby is null and  PB.TrnSiteId=PBTrnSiteId;
  
 SELECT * FROM  trn_cornerphotos where Deletedby  is null and Blockedby is null and  TrnSiteId=PBTrnSiteId;
 SELECT * FROM  trn_loadingsheet where Deletedby  is null and Blockedby is null and  TrnSiteId=PBTrnSiteId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `GetReport`(SiteID int)
BEGIN
Declare PBTrnSiteId bigint; Declare PBBenchID bigint;
set PBTrnSiteId=SiteID/*(select TrnSiteId from trn_preblast where  Deletedby  is null and Sitename=Sitename);*/ ;
set PBBenchID=(select MstbenchId from trn_preblast where  Deletedby  is null and TrnSiteId =SiteID);
select  B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,mp.PlantId,mc.CustomerId,mcf.CoalfieldId,mm.MineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName 
 from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId

where B.Deletedby is null and B.Blockedby is null and B.MstbenchId=PBBenchID and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null;

select PB.TrnSiteId,PB.MstbenchId,PB.SiteId,PB.Sitename,PB.BlastHoleDiameter,PB.DrillingPattern,PB.NoofHoles,PB.ExcavatorType,PB.ExcavatorCapacity,PB.RockType,
PB.StrataCondition,PB.BenchHeight,PB.AverageHoledepth,PB.Spacing,PB.Burden,PB.TotalChargePerround,PB.MaximumChargePerHole,PB.FiringSequence,
PB.VolumeoftheBlast,PB.PowderFactor,PB.BlastDiagram,PB.PumpTruckNo,PB.DrillDia,PB.Location,PB.BoosterUsed,date_format(PB.Date,'%d-%m-%Y') as PDate
 from trn_preblast PB
 where PB.Deletedby  is null and PB.Blockedby is null and  PB.TrnSiteId=PBTrnSiteId;
  
 SELECT * FROM  trn_cornerphotos where Deletedby  is null and Blockedby is null and  TrnSiteId=PBTrnSiteId;
 SELECT * FROM  trn_loadingsheet where Deletedby  is null and Blockedby is null and  TrnSiteId=PBTrnSiteId;
 select PO.TrnSiteId,PO.Fragmentation,PO.Throw,PO.FlyRock,PO.BlockVolume,PO.PF,PO.VibrationLevel,PO.BlastResult,PO.NoofPiles,
PO.VibrationReport ,(select Count(*)from  trn_postblast 
where Deletedby  is null and Blockedby is null and  TrnSiteId=TrnSiteId) as Checkpost
from trn_postblast PO
where PO.Deletedby  is null and PO.Blockedby is null and  PO.TrnSiteId=PBTrnSiteId;
select P.TrnSiteId,P.Pileno,P.Filename_O,P.Filepath_O, (select Count(*)from  trn_pilephotos 
where Deletedby  is null and Blockedby is null and  TrnSiteId=PBTrnSiteId) as Checkpost
from trn_pilephotos P
where P.Deletedby  is null and P.Blockedby is null and  P.TrnSiteId=PBTrnSiteId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetRole`(
RMstRoleId int
)
BEGIN
select R.MstRoleId,R.RoleId,R.RoleName from mst_role R
where R.Deletedby  is null and R.Blockedby is null and  R.MstRoleId=RMstRoleId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRoleVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetRoleVsCapability`(
RMstrolecapId int
)
BEGIN
select R.MstrolecapId,R.MstRoleId,R.MstMenuId,R.Viewpermission,R.Addpermission,R.Modifiedpermission,
R.Deletepermission,R.MstRoleId from mst_rolevscapability R
where R.Deletedby  is null and R.Blockedby is null and  R.MstrolecapId=R.MstrolecapId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetUser`(
UMstuserId int
)
BEGIN
select U.MstuserId,U.UserId,U.Username,U.Firstname,U.Lastname,U.Email,U.Mobile,U.Phone,U.Profileimg,
U.Currentpassword,U.Oldpassword,U.MstRoleId from mst_user U
where U.Deletedby  is null and U.Blockedby is null and  U.MstuserId=UMstuserId;
select  UC.TrnroleusercapId,UC.MstRoleId,UC.MstUserId,UC.MstMenuId,UC.Viewpermission,UC.Addpermission,UC.Modifiypermission,
UC.Deletepermission,UC.Blockpermission,M.MenuName
 from trn_uservscapability UC
Left join mst_menu M on UC.MstMenuId=M.MstMenuId
where UC.Deletedby  is null and UC.Blockedby is null and  UC.MstuserId=UMstuserId and UC.Deletedby is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `GetUserVsCapability`(
UCTrnroleusercapId int
)
BEGIN
select UC.TrnroleusercapId,UC.MstRoleId,UC.MstUserId,UC.MstMenuId,UC.Viewpermission,UC.Addpermission,UC.Modifiypermission,
UC.Deletepermission,UC.Blockpermission
 from trn_uservscapability UC
 where UC.Deletedby  is null and UC.Deletedby is null and  UC.TrnroleusercapId=UC.TrnroleusercapId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GlobalSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `GlobalSearch`(search varchar(500))
BEGIN
 

 
select * from mst_plant P   
where P.Deletedby is null and P.Blockedby is null and (P.PlantName like concat('%',search,'%') or P.PlantID like concat('%',search,'%') or P.PlantAddress  like concat('%',search,'%'));
select * from mst_customer C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null and (C.Customername  like concat('%',search,'%')  or C.CustomerID like concat('%',search,'%') or mp.Plantname  like concat('%',search,'%'));
select * from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId
Left join mst_customer mc on mc.MstCustId=C.MstCustId
where C.Deletedby is null and C.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null 
and (C.Coalfieldname  like concat('%',search,'%') or C.CoalfieldId  like concat('%',search,'%') or mc.Customername  like concat('%',search,'%') or mp.Plantname  like concat('%',search,'%'));
select * from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId 
Left join mst_customer mc on mc.MstCustId=M.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId
where M.Deletedby is null and M.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null
 and mcf.Deletedby is null and (M.MineName  like concat('%',search,'%') or M.MineId  like concat('%',search,'%') 
 or  mc.Customername  like concat('%',search,'%') or mp.Plantname  like concat('%',search,'%') or  mcf.Coalfieldname  like concat('%',search,'%'));

select * from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mm.Deletedby is null
 and mcf.Deletedby is null and (B.Benchname  like concat('%',search,'%') or B.BenchId  like concat('%',search,'%')  or B.Benchtype  like concat('%',search,'%') or mm.MineName  like concat('%',search,'%') or mc.Customername  like concat('%',search,'%') or mp.Plantname  like concat('%',search,'%') or  mcf.Coalfieldname  like concat('%',search,'%'));

select * from mst_role R
where R.Deletedby is null and R.Blockedby is null and (R.RoleName like concat('%',search,'%') or R.RoleId like concat('%',search,'%'));
select * from mst_user U
Left join Mst_role MR on MR.MstRoleId=U.MstRoleId
where U.Deletedby is null and U.Blockedby is null and MR.Deletedby is null and (U.UserId  like concat('%',search,'%') or U.Username  like concat('%',search,'%') or U.Firstname  like concat('%',search,'%') or U.Lastname  like concat('%',search,'%') or U.Email  like concat('%',search,'%') or U.Mobile  like concat('%',search,'%') or U.Phone  like concat('%',search,'%') or U.Profileimg  like concat('%',search,'%') or MR.RoleName  like concat('%',search,'%') or U.Currentpassword  like concat('%',search,'%') or U.Oldpassword  like concat('%',search,'%'));

select * from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mm.Deletedby is null
 and mcf.Deletedby is null and (B.Benchname  like concat('%',search,'%')
 or B.Benchtype  like concat('%',search,'%') or mm.MineName  
 like concat('%',search,'%') or mc.Customername 
 like concat('%',search,'%') or mp.Plantname  like concat('%',search,'%')  );

select * from mst_bench B
Left join  trn_preblast PB on b.MstbenchId=PB.MstbenchId
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null and mc.Deletedby is null and mm.Deletedby is null
 and mcf.Deletedby is null and PB.Deletedby is null and
  (PB.Sitename  like concat('%',search,'%')
 or PB.NoofHoles  like concat('%',search,'%') or PB.SiteID 
 like concat('%',search,'%') or  PB.NoofHoles
 like concat('%',search,'%') or PB.AverageHoledepth  like concat('%',search,'%') );
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Global_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `Global_Search`(search varchar(50))
BEGIN

 
select * from mst_plant P   
where P.Deletedby is null and P.Blockedby is null and P.SearchField like concat('%',search,'%') ;

select * from mst_customer C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId and mp.Deletedby is null
where C.Deletedby is null and C.Blockedby is null and C.SearchField  like concat('%',search,'%');


select * from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=C.MstCustId and mc.Deletedby is null
where C.Deletedby is null and C.Blockedby is null and C.SearchField  like concat('%',search,'%');


select * from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId and mp.Deletedby is null 
Left join mst_customer mc on mc.MstCustId=M.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId and mcf.Deletedby is null
where M.Deletedby is null and M.Blockedby is null and M.SearchField  like concat('%',search,'%');

select * from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where B.Deletedby is null and B.Blockedby is null and B.SearchField  like concat('%',search,'%');

select * from mst_role R
where R.Deletedby is null and R.Blockedby is null and R.SearchField like concat('%',search,'%');


select * from mst_user U
Left join Mst_role MR on MR.MstRoleId=U.MstRoleId and MR.Deletedby is null
where U.Deletedby is null and U.Blockedby is null and U.SearchField  like concat('%',search,'%');

select *from trn_preblast PB
where PB.Deletedby is null and PB.Blockedby is null and PB.SearchField  like concat('%',search,'%');

select * from trn_loadingsheet L
where L.Deletedby is null and L.Blockedby is null and L.SearchField  like concat('%',search,'%');

select *from trn_cornerphotos C
where C.Deletedby is null and C.Blockedby is null and C.SearchField  like concat('%',search,'%');

select * from trn_postblast PO
where PO.Deletedby is null and PO.Blockedby is null and PO.SearchField  like concat('%',search,'%');

select *from trn_pilephotos P
where P.Deletedby is null and P.Blockedby is null and P.SearchField  like concat('%',search,'%');


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Global_Search_New` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `Global_Search_New`(search varchar(50),flag bigint)
BEGIN

 if flag=1 then
 Begin
 
select * from mst_plant P   
where P.Deletedby is null and P.Blockedby is null and P.SearchField like concat('%',search,'%') ;
End;
End if;

 if flag=2 then
 Begin
 
select * from mst_customer C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId and mp.Deletedby is null
where C.Deletedby is null and C.Blockedby is null and C.SearchField  like concat('%',search,'%');

End;
End if;

 if flag=3 then
 Begin
 
select * from mst_coalfield C
Left join mst_plant mp on mp.MstPlantId=C.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=C.MstCustId and mc.Deletedby is null
where C.Deletedby is null and C.Blockedby is null and mc.SearchField  like concat('%',search,'%');

End;
End if;

 if flag=4 then
 Begin
 
select * from mst_mines M
Left join mst_plant mp on mp.MstPlantId=M.MstPlantId and mp.Deletedby is null 
Left join mst_customer mc on mc.MstCustId=M.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=M.MstCoalfieldId and mcf.Deletedby is null
where M.Deletedby is null and M.Blockedby is null and mcf.SearchField  like concat('%',search,'%');
End;
End if;

 if flag=5 then
 Begin
 
select * from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
where B.Deletedby is null and B.Blockedby is null and mcf.SearchField  like concat('%',search,'%');
End;
End if;

 if flag=6 then
 Begin
 
select * from mst_role R
where R.Deletedby is null and R.Blockedby is null and R.SearchField like concat('%',search,'%');

End;
End if;

 if flag=7 then
 Begin
 
select * from mst_user U
Left join Mst_role MR on MR.MstRoleId=U.MstRoleId and MR.Deletedby is null
where U.Deletedby is null and U.Blockedby is null and U.SearchField  like concat('%',search,'%');
End;
End if;

 if flag=8 then
 Begin
 select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName,(select count(*) from trn_preblast where MstbenchId=B.MstbenchId and Deletedby is null ) as TrnPreBlast
 ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId 
Left join mst_customer mc on mc.MstCustId=B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId 
Left join mst_mines mm on mm.MstMineId=B.MstMineId 

where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null 
and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null and B.mstbenchid in(

select mstbenchid from trn_preblast PB
where PB.Deletedby is null and PB.Blockedby is null and PB.SearchField  like concat('%',search,'%'));

End;
End if;

 if flag=9 then
 Begin
  select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName,(select count(*) from trn_preblast where MstbenchId=B.MstbenchId and Deletedby is null ) as TrnPreBlast
 ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId 
Left join mst_customer mc on mc.MstCustId=B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId 
Left join mst_mines mm on mm.MstMineId=B.MstMineId 

where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null 
and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null and B.mstbenchid in(

select mstbenchid from trn_preblast  
where Deletedby is null and  Blockedby is null  and trnsiteid in( 
select trnsiteid from trn_loadingsheet L
where L.Deletedby is null and L.Blockedby is null and L.SearchField  like concat('%',search,'%')));
End;
End if;

 if flag=10 then
 Begin
   select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,B.MstCustId,B.MstCoalfieldId,B.MstMineId,
mc.Customername,mcf.Coalfieldname,mm.MineName,mp.PlantName,(select count(*) from trn_preblast where MstbenchId=B.MstbenchId and Deletedby is null ) as TrnPreBlast
 ,B.BenchID,Mp.PlantID,mc.CustomerID,mcf.coalfieldid,mm.mineid
 from mst_bench B
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId 
Left join mst_customer mc on mc.MstCustId=B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId 
Left join mst_mines mm on mm.MstMineId=B.MstMineId 

where B.Deletedby is null and B.Blockedby is null and mp.Deletedby is null 
and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null and B.mstbenchid in(

select mstbenchid from trn_preblast  
where Deletedby is null and  Blockedby is null  and trnsiteid in( 
select trnsiteid from  trn_postblast PO
where PO.Deletedby is null and PO.Blockedby is null and PO.SearchField  like concat('%',search,'%')));
 

End;
End if;


 if flag=10 then
 Begin
 
select * from trn_postblast PO
where PO.Deletedby is null and PO.Blockedby is null and PO.SearchField  like concat('%',search,'%');

End;
End if;

 
/*
select *from trn_cornerphotos C
where C.Deletedby is null and C.Blockedby is null and C.SearchField  like concat('%',search,'%');

select *from trn_pilephotos P
where P.Deletedby is null and P.Blockedby is null and P.SearchField  like concat('%',search,'%');
*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUserLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `InsertUserLog`(MenuID bigint,action bigint,Userby bigint,Trndescription text)
BEGIN
INSERT INTO `trn_logfile`
(
`TrnmenuId`,
`Trnaction`,
`TrnuserId`,
`Trndatetime`,
`Trndescription`,
`Trncreateddate`)
VALUES(MenuID  ,action  ,Userby  ,now(),Trndescription,now()  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDBench` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDBench`(
BMstbenchId smallint,
BBenchId varchar(50),
BBenchname varchar(100),
BBenchtype Varchar(50),
BMstPlantId smallint,
BMstCustId smallint,
BMstCoalfieldId SmallInt,
BMstMineId SmallInt,
BUserby smallint,
BUserdate datetime,
Bflag int(100)

)
BEGIN
Declare Logstring text;
Declare LogUserName varchar(500);
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldname varchar(500);
declare Temp_Customername varchar(500);
declare Temp_Minename varchar(500);
declare Temp_Benchid varchar(500);

Declare MaxBenchID varchar(20);
 
if not exists( select * from mst_bench) then
Begin
set MaxBenchID="Bh0001";
End;
Else
Begin
set MaxBenchID=(select  Concat('Bh',substring(concat(1,substring(BenchId,3,4))+1,2)) 
 /*concat("BH-",ifnull((substring(BenchId,4)+1),"BH-101"))*/ as BenchId from mst_bench order by MstbenchId desc limit 1);
End;
End if;
 
if Bflag=1 then

begin
if exists( select * from mst_bench where BenchId=BBenchId ) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Alredy Exists ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
end;
else
begin

set BMstPlantId=(select MstPlantId from mst_mines where MstMineId=BMstMineId);
set BMstCustId=(select MstCustId from mst_mines where MstMineId=BMstMineId);
set BMstcoalfieldId=(select MstcoalfieldId from mst_mines where MstMineId=BMstMineId);
set Temp_Minename=(select Minename from mst_mines where MstMineId=BMstMineId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=BMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=BMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=BMstPlantId);
set Globalstring= concat_ws('||',MaxBenchID,BBenchname,BBenchtype,Temp_PlantName,Temp_Customername,Temp_Coalfieldname,Temp_Minename);


insert into mst_bench 
(BenchId,Benchname,Benchtype,MstPlantId,MstCustId,MstCoalfieldId,MstMineId,Createdby,Createddate,SearchField)
 value (MaxBenchID,BBenchname,BBenchtype,BMstPlantId,BMstCustId,BMstCoalfieldId,BMstMineId,BUserby,now(),Globalstring);
 select 'S' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
END;
end if;
end;

end if;


if Bflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Coalfields Insert Modify ");
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and BenchId=BBenchId) then

begin
 set Logstring=concat_WS(',',Logstring,' BenchId has changed ',BBenchId);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and Benchname=BBenchname) then
begin
 set Logstring=concat_WS(',',Logstring,' Benchname has changed ',BBenchname);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and Benchtype=BBenchtype) then
begin
 set Logstring=concat_WS(',',Logstring,' Benchtype has changed ',BBenchtype);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and MstPlantId=BMstPlantId) then
begin
 set Logstring=concat_WS(',',Logstring,' MstPlantId has changed ',BMstPlantId);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and MstCustId=BMstCustId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstCustId has changed ',BMstCustId);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and MstCoalfieldId=BMstCoalfieldId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstCoalfieldId has changed ',BMstCoalfieldId);
End;
end if;
if not exists(select * from mst_bench where MstbenchId=BMstbenchId and MstMineId=BMstMineId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstMineId has changed ',BMstMineId);
End;
end if;
set BMstPlantId=(select MstPlantId from mst_mines where MstMineId=BMstMineId);
set BMstCustId=(select MstCustId from mst_mines where MstMineId=BMstMineId);
set BMstcoalfieldId=(select MstcoalfieldId from mst_mines where MstMineId=BMstMineId);
set Temp_Benchid=(select Benchid from mst_bench where MstbenchId=BMstbenchId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=BMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=BMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=BMstPlantId);
set Globalstring= concat_ws('||',Temp_Benchid,BBenchname,BBenchtype,Temp_Customername,Temp_PlantName,Temp_Coalfieldname);


update mst_bench set Benchname=BBenchname,Benchtype=BBenchtype,MstPlantId=BMstPlantId,MstCustId=BMstCustId,
MstCoalfieldId=BMstCoalfieldId,MstMineId=BMstMineId, Modifiedby=BUserby,Modifieddate=now(),SearchField=Globalstring where MstbenchId=BMstbenchId;
 select 'M' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
end;
end if;

if Bflag=3 then
begin
if exists(select * from trn_preblast where Deletedby is null) then
Begin
 select 'ND' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
End;
Else

Begin
update mst_bench set Deletedby=BUserby,Deleteddate=now() where MstbenchId=BMstbenchId;
 select 'D' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
End;
 End if;
end;
end if;

if Bflag=4 then
begin
update mst_bench set Blockedby=BUserby,Blockeddate=now() where MstbenchId=BMstbenchId;
 select 'B' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Block ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
end;
end if;

if Bflag=5 then
/*begin
if exists( select * from mst_bench where Benchname=BBenchname and Deletedby is null  ) then
begin
set BMstPlantId=(select MstPlantId from mst_mines where MstMineId=BMstMineId);
set BMstCustId=(select MstCustId from mst_mines where MstMineId=BMstMineId);
set BMstcoalfieldId=(select MstcoalfieldId from mst_mines where MstMineId=BMstMineId);
set Temp_Minename=(select Minename from mst_mines where MstMineId=BMstMineId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=BMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=BMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=BMstPlantId);
set Globalstring= concat_ws('||',MaxBenchID,BBenchname,BBenchtype,Temp_PlantName,Temp_Customername,Temp_Coalfieldname,Temp_Minename);





update mst_bench set Benchname=BBenchname,Benchtype=BBenchtype,MstPlantId=BMstPlantId,MstCustId=BMstCustId,
MstCoalfieldId=BMstCoalfieldId,MstMineId=BMstMineId, Modifiedby=BUserby,Modifieddate=now(),SearchField=Globalstring where Benchname=BBenchname;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
end;
else*/
begin
set BMstPlantId=(select MstPlantId from mst_mines where MstMineId=BMstMineId);
set BMstCustId=(select MstCustId from mst_mines where MstMineId=BMstMineId);
set BMstcoalfieldId=(select MstcoalfieldId from mst_mines where MstMineId=BMstMineId);
set Temp_Minename=(select Minename from mst_mines where MstMineId=BMstMineId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=BMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=BMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=BMstPlantId);
set Globalstring= concat_ws('||',MaxBenchID,BBenchname,BBenchtype,Temp_PlantName,Temp_Customername,Temp_Coalfieldname,Temp_Minename);


insert into mst_bench 
(BenchId,Benchname,Benchtype,MstPlantId,MstCustId,MstCoalfieldId,MstMineId,Createdby,Createddate,SearchField)
 value (MaxBenchID,BBenchname,BBenchtype,BMstPlantId,BMstCustId,BMstCoalfieldId,BMstMineId,BUserby,now(),Globalstring);
  select 'S' as result;
  set LogUserName=(select Email from mst_user where mstuserid=BUserby) ;
 set Logstring=concat(LogUserName," Bench Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' BMstMineId ',BMstMineId,' BBenchId ',BBenchId,' BBenchname ',BBenchname,' BBenchtype ',BBenchtype,
' BMstPlantId ',BMstPlantId,' BMstCustId ',BMstCustId,' BMstCoalfieldId ',BMstCoalfieldId,' BMstMineId ',BMstMineId,' Bflag ',Bflag);
call InsertUserLog(5, '1', BUserby, Logstring);
END;
end if;
/*end;

end if;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDCoalfields` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDCoalfields`(
CMstcoalfieldId smallint,
CCoalfieldId varchar(50),
CCoalfieldname varchar(100),
CMstPlantId smallint,
CMstCustId smallint,
CUserby smallint,
CUserdate datetime,
Cflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldid varchar(500);

declare Temp_Customername varchar(500);
Declare LogUserName varchar(500);
Declare MaxCoalfieldsID varchar(20);
if not exists( select * from mst_coalfield) then
Begin
set MaxCoalfieldsID="Cf0001";
End;
Else
Begin
set MaxCoalfieldsID=(select Concat('Cf',substring(concat(1,substring(coalfieldId,3,4))+1,2)) 
 as Custid from mst_coalfield order by MstcoalfieldId desc limit 1);
 /*concat("CF-",ifnull((substring(CoalfieldId,4)+1),"CF-101"))*/
End;
End if;
 


if Cflag=1 then

begin
if exists( select * from mst_coalfield where CoalfieldId=CCoalfieldId ) then
begin
 select 'A' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Already Exists ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
end;
else
begin
set CMstPlantId=(select MstPlantId from mst_customer where MstCustId=CMstCustId);

set Temp_Customername=(select Customername from mst_customer where MstCustId=CMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_ws('||',MaxCoalfieldsID,CCoalfieldname,Temp_PlantName,Temp_Customername);


insert into mst_coalfield 
(CoalfieldId,Coalfieldname,MstPlantId,MstCustId,Createdby,Createddate,SearchField)
 value (MaxCoalfieldsID,CCoalfieldname,CMstPlantId,CMstCustId,CUserby,now(),Globalstring);
 select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
END;
end if;
end;

end if;


if Cflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Coalfields Insert Modify ");
if not exists(select * from mst_coalfield where MstcoalfieldId=CMstcoalfieldId and CoalfieldId=CCoalfieldId) then

begin
 set Logstring=concat_WS(',',Logstring,' CoalfieldId has changed ',CCoalfieldId);
End;
end if;
if not exists(select * from mst_coalfield where MstcoalfieldId=CMstcoalfieldId and Coalfieldname=CCoalfieldname) then

begin
 set Logstring=concat_WS(',',Logstring,' Coalfieldname has changed ',CCoalfieldname);
End;
end if;
if not exists(select * from mst_coalfield where MstcoalfieldId=CMstcoalfieldId and MstPlantId=CMstPlantId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstPlantId has changed ',CMstPlantId);
End;
end if;
if not exists(select * from mst_coalfield where MstcoalfieldId=CMstcoalfieldId and MstCustId=CMstCustId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstCustId has changed ',CMstCustId);
End;
end if;
set CMstPlantId=(select MstPlantId from mst_customer where MstCustId=CMstCustId);
set Temp_Coalfieldid=(select Coalfieldid from mst_coalfield where MstcoalfieldId=CMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=CMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_ws('||',Temp_Coalfieldid,CCoalfieldname,Temp_Customername,Temp_PlantName);


update mst_coalfield set Coalfieldname=CCoalfieldname,MstPlantId=CMstPlantId,MstCustId=CMstCustId,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where MstcoalfieldId=CMstcoalfieldId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
end;
end if;

if Cflag=3 then
begin
if exists(select * from mst_mines where Deletedby is null) then
Begin
 select 'ND' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
End;
Else

Begin
update mst_coalfield set Deletedby=CUserby,Deleteddate=now() where MstcoalfieldId=CMstcoalfieldId;
 select 'D' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
End;
 End if;
end;
end if;

if Cflag=4 then
begin
update mst_coalfield set Blockedby=CUserby,Blockeddate=now() where MstcoalfieldId=CMstcoalfieldId;
 select 'B' as result;
  set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Block ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
end;
end if;

if Cflag=5 then

begin
if exists( select * from mst_coalfield where Coalfieldname=CCoalfieldname and Deletedby is null  ) then
begin
set Temp_Coalfieldid=(select Coalfieldid from mst_coalfield where MstcoalfieldId=CMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=CMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_ws('||',Temp_Coalfieldid,CCoalfieldname,Temp_Customername,Temp_PlantName);
update mst_coalfield set Coalfieldname=CCoalfieldname,MstCustId=CMstCustId,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where Coalfieldname=CCoalfieldname;
 select 'S' as result;
  set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
end;
else
begin
set Temp_Customername=(select Customername from mst_customer where MstCustId=CMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_ws('||',MaxCoalfieldsID,CCoalfieldname,Temp_PlantName,Temp_Customername);
insert into mst_coalfield 
(CoalfieldId,Coalfieldname,MstPlantId,MstCustId,Createdby,Createddate,SearchField)
 value (MaxCoalfieldsID,CCoalfieldname,CMstPlantId,CMstCustId,CUserby,now(),Globalstring);
  select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Coalfields Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' CMstcoalfieldId ',CMstcoalfieldId,' CCoalfieldId ',CCoalfieldId,' CCoalfieldname ',CCoalfieldname,
 ' CMstPlantId ',CMstPlantId,' CMstCustId ',CMstCustId, ' Cflag ',Cflag);
call InsertUserLog(3, '1', CUserby, Logstring);
END;
end if;
end;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDCornerPhoto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDCornerPhoto`(
CTrncornerphotosId int,
CTrnSiteId int, 
CCRTLName varchar(500),
CCRTLPath varchar(500), 
CCRTLGPSAltitude varchar(50),
CCRTLGPSLatitude varchar(50),
CCRTLGPSLongitude varchar(50),
CCRTRName varchar(500),
CCRTRPath varchar(500),
CCRTRGPSAltitude varchar(50),
CCRTRGPSLatitude varchar(50),
CCRTRGPSLongitude varchar(50),
CCRBLName varchar(500),
CCRBLPath varchar(500),
CCRBLGPSAltitude varchar(50),
CCRBLGPSLatitude varchar(50),
CCRBLGPSLongitude varchar(50),
CCRBRName varchar(500),
CCRBRPath varchar(500),
CCRBRGPSAltitude varchar(50),
CCRBRGPSLatitude varchar(50),
CCRBRGPSLongitude varchar(50),
CUserby smallint,
CUserdate datetime,
Cflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
Declare LogUserName varchar(4000);
if Cflag=1   then

begin

/*if exists( select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," CornerPhotos Insert Already Exists ");
  set LogUserName=concat_ws(',',Logstring,'TrnSiteId',TrnSiteId,
 'CRTLName',CRTLName, 'CRTLPath',CRTLPath, 'CRTRName',CRTRName, 'CRTRPath',CRTRPath,  'CRBLName',CRBLName,
 'CRBLPath',CRBLPath, 'CRBRPath', CRBRPath ,' Cflag ',Cflag);
call InsertUserLog(11, '1', CUserby, Logstring);
end;
else
begin */
set Globalstring=concat_ws('||',CCRTLName,CCRTLGPSAltitude,CCRTLGPSLatitude,CCRTLGPSLongitude,CCRTRName,CCRTRGPSAltitude,CCRTRGPSLatitude,CCRTRGPSLongitude,
CCRBLName,CCRBLGPSAltitude,CCRBLGPSLatitude,CCRBLGPSLongitude,CCRBRName,CCRBRGPSAltitude,CCRBRGPSLatitude,CCRBRGPSLongitude);

 update trn_cornerphotos set Deletedby=CUserby,Deleteddate=now() where TrnSiteId=CTrnSiteId;
 
INSERT INTO  trn_cornerphotos 
(TrnSiteId,
CRTLName,CRTLPath,CRTLGPSAltitude,CRTLGPSLatitude,CRTLGPSLongitude,CRTRName,CRTRPath,CRTRGPSAltitude,CRTRGPSLatitude,CRTRGPSLongitude,
CRBLName,CRBLPath,CRBLGPSAltitude,CRBLGPSLatitude,CRBLGPSLongitude,CRBRName,CRBRPath,CRBRGPSAltitude,CRBRGPSLatitude,CRBRGPSLongitude,
Createby,
Createdate,SearchField)
VALUES
 (CTrnSiteId,CCRTLName,CCRTLPath,CCRTLGPSAltitude,CCRTLGPSLatitude,CCRTLGPSLongitude,CCRTRName,CCRTRPath,CCRTRGPSAltitude,CCRTRGPSLatitude,CCRTRGPSLongitude,
CCRBLName,CCRBLPath,CCRBLGPSAltitude,CCRBLGPSLatitude,CCRBLGPSLongitude,CCRBRName,CCRBRPath,CCRBRGPSAltitude,CCRBRGPSLatitude,CCRBRGPSLongitude, 
CUserby,now(),Globalstring );

 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set LogUserName=concat(LogUserName," Corner Photo Insert ");
 set LogUserName=concat_ws(',',Logstring,'TrnSiteId',CTrnSiteId,'CRTLName',CCRTLName,'CRTLPath',CCRTLPath,
 'CRTLGPSAltitude',
 CCRTLGPSAltitude,'CRTLGPSLatitude',CCRTLGPSLatitude,'CRTLGPSLongitude',
 CCRTLGPSLongitude,'CRBLName',CCRBLName,'CRBLPath',CCRBLPath,'CRBLGPSAltitude',CCRBLGPSAltitude,
'CRBLGPSLatitude',CCRBLGPSLatitude,'CRBLGPSLongitude',CCRBLGPSLongitude,'CRBRName',
CCRBRName,'CRBRPath',CCRBRPath,'CRBRGPSAltitude',CCRBRGPSAltitude,'CRBRGPSLatitude'
,CCRBRGPSLatitude,'CRBRGPSLongitude',CCRBRGPSLongitude,
'CRTRName',CCRTRName,'CRTRPath',CCRTRPath,'CRTRGPSAltitude',CCRTRGPSAltitude,'CRTRGPSLatitude',
CCRTRGPSLatitude,'CRTRGPSLongitude',CCRTRGPSLongitude,' Cflag ',Cflag);

call InsertUserLog(11, '1', CUserby, Logstring);
END;
end if;
 
if Cflag=2 then
begin
  set Logstring=concat_ws(LogUserName," CornerPhotos Insert Modify ");
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and TrnSiteId=CTrnSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' TrnSiteId has changed ',CTrnSiteId);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRBRName=CCRBRName) then
begin
 set Logstring=concat_WS(',',Logstring,' CRBRName has changed ',CCRBRName);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRBLPath=CCRBLPath) then
begin
 set Logstring=concat_WS(',',Logstring,' CRBLPath has changed ',CCRBLPath);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRBLName=CCRBLName) then
begin
 set Logstring=concat_WS(',',Logstring,' CRBLName has changed ',CCRBLName);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRTRPath=CCRTRPath) then
begin
 set Logstring=concat_WS(',',Logstring,' CRTRPath has changed ',CCRTRPath);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRTRName=CCRTRName) then
begin
 set Logstring=concat_WS(',',Logstring,' CRTRName has changed ',CCRTRName);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRTLName=CCRTLName) then
begin
 set Logstring=concat_WS(',',Logstring,' CRTLName has changed ',CCRTLName);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRTLPath=CCRTLPath) then
begin
 set Logstring=concat_WS(',',Logstring,' CRTLPath has changed ',CCRTLPath);
End;
end if;
if not exists(select * from trn_cornerphotos where TrncornerphotosId=CTrncornerphotosId and CRBRPath=CCRBRPath) then
begin
 set Logstring=concat_WS(',',Logstring,' CRBRPath has changed ',CCRBRPath);
End;
end if;
set Globalstring=concat_ws('||',CTrnSiteId,CCRTLName,CCRTLGPSAltitude,CCRTLGPSLatitude,CCRTLGPSLongitude,CCRTRName,CCRTRGPSAltitude,CCRTRGPSLatitude,CCRTRGPSLongitude,
CCRBLName,CCRBLGPSAltitude,CCRBLGPSLatitude,CCRBLGPSLongitude,CCRBRName,CCRBRGPSAltitude,CCRBRGPSLatitude,CCRBRGPSLongitude);
update trn_cornerphotos set CRTLName=CCRTLName, CRTLPath=CCRTLPath,
 CRTRName=CCRTRName, CRTRPath=CCRTRPath,  CRBLName=CCRBLName, CRBLPath=CCRBLPath, CRBRName=CCRBRName,CRBRPath=CCRBRPath,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where TrncornerphotosId=CTrncornerphotosId and  TrnSiteId=CTrnSiteId;
 select 'M' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," CornerPhotos Insert Modify ");
 set LogUserName=concat_ws(',',Logstring,'TrnSiteId',TrnSiteId,
 'CRTLName',CRTLName, 'CRTLPath',CRTLPath, 'CRTRName',CRTRName, 'CRTRPath',CRTRPath,  'CRBLName',CRBLName,
 'CRBLPath',CRBLPath, 'CRBRPath', CRBRPath ,' Cflag ',Cflag);
call InsertUserLog(11, '1', CUserby, Logstring);
end;
end if;
if Cflag=3 then
begin
update trn_cornerphotos set Deletedby=CUserby,Deleteddate=now() where TrncornerphotosId=CTrncornerphotosId;
 select 'D' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," CornerPhotos Insert Delete ");
  set LogUserName=concat_ws(',',Logstring,'TrnSiteId',TrnSiteId,
 'CRTLName',CRTLName, 'CRTLPath',CRTLPath, 'CRTRName',CRTRName, 'CRTRPath',CRTRPath,  'CRBLName',CRBLName,
 'CRBLPath',CRBLPath, 'CRBRPath', CRBRPath ,' Cflag ',Cflag);
call InsertUserLog(11, '1', CUserby, Logstring);
end;
end if;

if Cflag=4 then
begin
update trn_cornerphotos set Blockedby=CUserby,Blockeddate=now() where TrncornerphotosId=CTrncornerphotosId;
 select 'B' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," CornerPhotos Insert Block ");
  set LogUserName=concat_ws(',',Logstring,'TrnSiteId',TrnSiteId,
 'CRTLName',CRTLName, 'CRTLPath',CRTLPath, 'CRTRName',CRTRName, 'CRTRPath',CRTRPath,  'CRBLName',CRBLName,
 'CRBLPath',CRBLPath, 'CRBRPath', CRBRPath ,' Cflag ',Cflag);
call InsertUserLog(11, '1', CUserby, Logstring);
end;
end if;

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDCountouring` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDCountouring`(
CTrnContorId int,
CTrnSiteId int,
CFilename_before_Contouring varchar(500),
CFilepath_before_Contouring varchar(500),
CFilename_after_Contouring varchar(500),
CFilepath_after_Contouring varchar(500),
CContouringtype varchar(500),
CUserby smallint,
CUserdate datetime,
Cflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
Declare LogUserName varchar(500);
if Cflag=1 then

begin
if exists( select * from trn_countouring where TrnSiteId=CTrnSiteId ) then
begin
 select 'A' as result;
    set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Countouring Insert Add ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' CTrnSiteId ',CTrnSiteId,' CFilename_before_Contouring ',CFilename_before_Contouring,' CFilepath_before_Contouring ',CFilepath_before_Contouring,
' CFilename_after_Contourin ',CFilename_after_Contourin,', CFilepath_after_Contouring ',CFilepath_after_Contouring,' CContouringtype ',CContouringtype,' Cflag ',Cflag);
call InsertUserLog(15, '1', CUserby, Logstring);
end;
else
begin

set Globalstring= concat_ws('||',CTrnSiteId,CFilename_before_Contouring ,CFilepath_before_Contouring,CFilename_after_Contourin,
CFilepath_after_Contouring,CContouringtype);
insert into trn_countouring
(TrnSiteId,Filename_before_Contouring ,Filepath_before_Contouring,Filename_after_Contourin,Filepath_after_Contouring,Contouringtype,Createdby,Createddate,SearchField)
 value (CTrnSiteId,CFilename_before_Contouring ,CFilepath_before_Contouring,CFilename_after_Contourin,CFilepath_after_Contouring,CContouringtype,CUserby,now(),Globalstring);
 select 'S' as result;
    set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Countouring Insert ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' CTrnSiteId ',CTrnSiteId,' CFilename_before_Contouring ',CFilename_before_Contouring,' CFilepath_before_Contouring ',CFilepath_before_Contouring,
' CFilename_after_Contourin ',CFilename_after_Contourin,', CFilepath_after_Contouring ',CFilepath_after_Contouring,' CContouringtype ',CContouringtype,' Cflag ',Cflag);
call InsertUserLog(15, '1', CUserby, Logstring);
END;
end if;
end;

end if;


if Cflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Photos Countouring Insert Modify ");
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and TrnSiteId=CTrnSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' TrnSiteId has changed ',CTrnContorId);
End;
end if;
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and Filename_before_Contouring=CFilename_before_Contouring) then

begin
 set Logstring=concat_WS(',',Logstring,' Filename_before_Contouring has changed ',CFilename_before_Contouring);
End;
end if;
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and Filepath_before_Contouring=CFilepath_before_Contouring) then
begin
 set Logstring=concat_WS(',',Logstring,' Filepath_before_Contouring has changed ',CFilepath_before_Contouring);
End;
end if;
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and Filename_after_Contouring=CFilename_after_Contouring) then

begin
 set Logstring=concat_WS(',',Logstring,' Filename_after_Contouring has changed ',CFilename_after_Contouring);
End;
end if;
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and Filepath_after_Contouring=CFilepath_after_Contouring) then
begin
 set Logstring=concat_WS(',',Logstring,' Filepath_after_Contouring has changed ',CFilepath_after_Contouring);
End;
end if;				
if not exists(select * from trn_countouring where TrnContorId=TrnContorId and Contouringtype=CContouringtype) then

begin
 set Logstring=concat_WS(',',Logstring,' Contouringtype has changed ',CContouringtype);
End;
end if;
set Globalstring= concat_ws('||',CTrnSiteId,CFilename_before_Contouring ,CFilepath_before_Contouring,CFilename_after_Contourin,
CFilepath_after_Contouring,CContouringtype);

update trn_countouring set TrnSiteId=CTrnSiteId,Filename_before_Contouring=CFilename_before_Contouring,Filepath_before_Contouring=CFilepath_before_Contouring,
Filename_after_Contourin=CFilename_after_Contourin,Filepath_after_Contouring=CFilepath_after_Contouring,Contouringtype=CContouringtype,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where TrnContorId=CTrnContorId;
 select 'M' as result;
   set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 /* set Logstring=concat(LogUserName," Countouring Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' CTrnSiteId ',CTrnSiteId,' CFilename_before_Contouring ',CFilename_before_Contouring,' CFilepath_before_Contouring ',CFilepath_before_Contouring,
' CFilename_after_Contourin ',CFilename_after_Contourin,', CFilepath_after_Contouring ',CFilepath_after_Contouring,' CContouringtype ',CContouringtype,' Cflag ',Cflag);*/
call InsertUserLog(15, '1', CUserby, Logstring);
end;
end if;
if Cflag=3 then
begin
update trn_countouring set Deletedby=CUserby,Deleteddate=now() where TrnContorId=CTrnContorId;
 select 'D' as result;
    set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Countouring Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' CTrnSiteId ',CTrnSiteId,' CFilename_before_Contouring ',CFilename_before_Contouring,' CFilepath_before_Contouring ',CFilepath_before_Contouring,
' CFilename_after_Contourin ',CFilename_after_Contourin,', CFilepath_after_Contouring ',CFilepath_after_Contouring,' CContouringtype ',CContouringtype,' Cflag ',Cflag);
call InsertUserLog(15, '1', CUserby, Logstring);
end;
end if;

if Cflag=4 then
begin
update trn_countouring set Blockedby=CUserby,Blockeddate=now() where TrnContorId=CTrnContorId;
 select 'B' as result;
    set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Countouring Insert Block ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' CTrnSiteId ',CTrnSiteId,' CFilename_before_Contouring ',CFilename_before_Contouring,' CFilepath_before_Contouring ',CFilepath_before_Contouring,
' CFilename_after_Contourin ',CFilename_after_Contourin,', CFilepath_after_Contouring ',CFilepath_after_Contouring,' CContouringtype ',CContouringtype,' Cflag ',Cflag);
call InsertUserLog(15, '1', CUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDCustomer`(
CMstCustId smallint,
CCustomerId varchar(50),
CCustomername varchar(100),
CMstPlantId smallint,
CUserby smallint,
CUserdate datetime,
Cflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Customerid varchar(500);
Declare LogUserName varchar(500);
Declare MaxCustID varchar(20);
if not exists( select * from mst_customer) then
Begin
set MaxCustID="Cu0001";
End;
Else
Begin
set MaxCustID=(select Concat('Cu',substring(concat(1,substring(customerid,3,4))+1,2)) as Custid from mst_customer order by MstCustId desc limit 1);
/*concat("Ci",ifnull((substring(CustomerId,4)+1),"Ci0001")) */
End;
End if;
if Cflag=1 then

begin
if exists( select * from mst_customer where Customername=CCustomername and Deletedby is null ) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Already Exists ");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);
end;
else
begin
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_ws('||',MaxCustID,CCustomername,Temp_PlantName);

insert into mst_customer 
(CustomerId,Customername,MstPlantId,Createdby,Createddate,SearchField)
 value (MaxCustID,CCustomername,CMstPlantId,CUserby,now(),Globalstring);
 select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert ");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag,Globalstring);
call InsertUserLog(2, '1', CUserby, Logstring);
END;
end if;
end;

end if;


if Cflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Customer Insert Modify ");
if not exists(select * from mst_customer where MstCustId=CMstCustId and CustomerId=CCustomerId) then

begin
 set Logstring=concat_WS(',',Logstring,' CustomerId has changed ',CCustomerId);
End;
end if;
if not exists(select * from mst_customer where MstCustId=CMstCustId and Customername=CCustomername) then

begin
 set Logstring=concat_WS(',',Logstring,' Customername has changed ',CCustomername);
End;
end if;
if not exists(select * from mst_customer where MstCustId=CMstCustId and MstPlantId=CMstPlantId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstPlantId has changed',CMstPlantId);
End;
end if;
set Temp_Customerid=(select CustomerID from mst_customer where MstCustId=CMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_WS('||',Temp_Customerid,CCustomername,Temp_PlantName);
update mst_customer set Customername=CCustomername,MstPlantId=CMstPlantId,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where MstCustId=CMstCustId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Modify ");
  set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);
end;
end if;

if Cflag=3 then
begin
if exists(select * from mst_coalfield where Deletedby is null) then
Begin
  select 'ND' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);
End;
Else

Begin
update mst_customer set Deletedby=CUserby,Deleteddate=now() where MstCustId=CMstCustId;
 select 'D' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);
End;
 End if;
end;
end if;


if Cflag=4 then
begin
update mst_customer set Blockedby=CUserby,Blockeddate=now() where MstCustId=CMstCustId;
 select 'B' as result;
 set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Block ");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);
end;
end if;

if Cflag=5 then

begin
if exists( select * from mst_customer where Customername=CCustomername and Deletedby is null  ) then
begin
set Temp_plantname=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_WS('||',CCustomerId,CCustomername,Temp_plantname);
update mst_customer set Customername=CCustomername,MstPlantId=CMstPlantId,
 Modifiedby =CUserby,Modifieddate=now(),SearchField=Globalstring where   Customername=CCustomername;
 select 'A' as result;

end;
else
begin
set Temp_plantname=(select plantname from mst_plant where MstPlantId=CMstPlantId);
set Globalstring= concat_WS(CCustomerId, '||',CCustomername,Temp_plantname);

insert into mst_customer 
(CustomerId,Customername,MstPlantId,Createdby,Createddate,SearchField)
 value (MaxCustID,CCustomername,CMstPlantId,CUserby,now(),Globalstring);
END;
  select 'S' as result;
/* set LogUserName=(select Email from mst_user where mstuserid=CUserby) ;
 set Logstring=concat(LogUserName," Customer Insert Bulk Upload");
 set Logstring=concat_ws(',',Logstring,' CMstCustId ',CMstCustId,' CCustomerId ',
 MaxCustID,' CCustomername ',CCustomername, ' CMstPlantId ',CMstPlantId,' Cflag ',Cflag);
call InsertUserLog(2, '1', CUserby, Logstring);*/

end if;
end;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDLoadingSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDLoadingSheet`(
LTrnloadsheetId int,
LTrnSiteId int,
LHoleNo smallint,
LBottomCharge float,
LTopCharge float,
LDeck float,
LBooster float,
LWaterColumn float,
LFinalStemmingHeight float,
LUserby smallint,
LUserdate datetime,
Lflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
Declare LogUserName varchar(500);
if Lflag=1 then
begin

if exists( select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," LoadingSheet Insert Already Exists ");
   set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' LTrnSiteId ',LTrnSiteId,' LHoleNo ',LHoleNo,' LBottomCharge ',LBottomCharge,
' LTopCharge ',LTopCharge,' LDeck ',LDeck,' LBooster ',LBooster,' LWaterColumn ',LWaterColumn,' LFinalStemmingHeight ',LFinalStemmingHeight,' Lflag ',Lflag);
call InsertUserLog(13, '1', LUserby, Logstring);
end;
else 
begin

set Globalstring= concat_ws('||',LHoleNo,LBottomCharge,LTopCharge,LDeck,LBooster,LWaterColumn,LFinalStemmingHeight);
 

insert into trn_loadingsheet
(TrnSiteId,HoleNo,BottomCharge,TopCharge,Deck,Booster,WaterColumn,FinalStemmingHeight,Createdby,Createddate,SearchField)
 value (LTrnSiteId,LHoleNo,LBottomCharge,LTopCharge,LDeck,LBooster,LWaterColumn,LFinalStemmingHeight,LUserby,now(),Globalstring);
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=LUserby) ;
 set Logstring=concat(LogUserName," LoadingSheet Insert ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' LTrnSiteId ',LTrnSiteId,' LHoleNo ',LHoleNo,' LBottomCharge ',LBottomCharge,
' LTopCharge ',LTopCharge,' LDeck ',LDeck,' LBooster ',LBooster,' LWaterColumn ',LWaterColumn,' LFinalStemmingHeight ',LFinalStemmingHeight,' Lflag ',Lflag);
call InsertUserLog(13, '1', LUserby, Logstring);
END;
end if;
end;

end if;



if Lflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Loading Sheet Insert Modify ");
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and TrnSiteId=LTrnSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' TrnSiteId has changed ',LTrnSiteId);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and HoleNo=LHoleNo) then

begin
 set Logstring=concat_WS(',',Logstring,' HoleNo has changed ',LHoleNo);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and BottomCharge=LBottomCharge) then
begin
 set Logstring=concat_WS(',',Logstring,' BottomCharge has changed ',LBottomCharge);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and TopCharge=LTopCharge) then

begin
 set Logstring=concat_WS(',',Logstring,' TopCharge has changed ',LTopCharge);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and Deck=LDeck) then
begin
 set Logstring=concat_WS(',',Logstring,' Deck has changed ',LDeck);
End;
end if;				
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and Booster=LBooster) then

begin
 set Logstring=concat_WS(',',Logstring,' Booster has changed ',LBooster);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and WaterColumn=LWaterColumn) then

begin
 set Logstring=concat_WS(',',Logstring,' WaterColumn has changed ',LWaterColumn);
End;
end if;
if not exists(select * from trn_loadingsheet where TrnloadsheetId=LTrnloadsheetId and FinalStemmingHeight=LFinalStemmingHeight) then

begin
 set Logstring=concat_WS(',',Logstring,' FinalStemmingHeight has changed ',LFinalStemmingHeight);
End;
end if;

set Globalstring= concat_ws('||',LHoleNo,LBottomCharge,LTopCharge,LDeck,LBooster,LWaterColumn,LFinalStemmingHeight);
update trn_loadingsheet set TrnSiteId=LTrnSiteId,HoleNo=LHoleNo,BottomCharge=LBottomCharge,TopCharge=LTopCharge,Deck=LDeck,
Booster=LBooster,WaterColumn=LWaterColumn,FinalStemmingHeight=LFinalStemmingHeight,
 Modifiedby =LUserby,Modifieddate=now(),SearchField=Globalstring where TrnloadsheetId=LTrnloadsheetId;
 select 'M' as result;
  /* set LogUserName=(select Email from mst_user where mstuserid=LUserby) ;
 set Logstring=concat(LogUserName," LoadingSheet Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' LTrnSiteId ',LTrnSiteId,' LHoleNo ',LHoleNo,' LBottomCharge ',LBottomCharge,
' LTopCharge ',LTopCharge,' LDeck ',LDeck,' LBooster ',LBooster,' LWaterColumn ',LWaterColumn,' LFinalStemmingHeight ',LFinalStemmingHeight,' Lflag ',Lflag);
call InsertUserLog(13, '1', LUserby, Logstring);*/
end;
end if;
if Lflag=3 then
begin
update trn_loadingsheet set Deletedby=LUserby,Deleteddate=now() where TrnloadsheetId=LTrnloadsheetId;
 select 'D' as result;
   set LogUserName=(select Email from mst_user where mstuserid=LUserby) ;
 set Logstring=concat(LogUserName," LoadingSheet Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' LTrnSiteId ',LTrnSiteId,' LHoleNo ',LHoleNo,' LBottomCharge ',LBottomCharge,
' LTopCharge ',LTopCharge,' LDeck ',LDeck,' LBooster ',LBooster,' LWaterColumn ',LWaterColumn,' LFinalStemmingHeight ',LFinalStemmingHeight,' Lflag ',Lflag);
call InsertUserLog(13, '1', LUserby, Logstring);
end;
end if;

if Lflag=4 then
begin
update trn_loadingsheet set Blockedby=LUserby,Blockeddate=now() where TrnloadsheetId=LTrnloadsheetId;
 select 'B' as result;
   set LogUserName=(select Email from mst_user where mstuserid=LUserby) ;
 set Logstring=concat(LogUserName," LoadingSheet Insert Block ");
 set Logstring=concat_ws(',',Logstring,' LTrnloadsheetId ',LTrnloadsheetId,' LTrnSiteId ',LTrnSiteId,' LHoleNo ',LHoleNo,' LBottomCharge ',LBottomCharge,
' LTopCharge ',LTopCharge,' LDeck ',LDeck,' LBooster ',LBooster,' LWaterColumn ',LWaterColumn,' LFinalStemmingHeight ',LFinalStemmingHeight,' Lflag ',Lflag);
call InsertUserLog(13, '1', LUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDLogFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDLogFile`(
LFTrnlogId int,
LFTrnmenuId smallint,
LFTrnaction float,
LFTrnuserId float,
LFTrndatetime float,
LFTrndescription float,
LFTrncreateddate float

)
BEGIN
Declare Logstring text;
if LFflag=1 then

begin
if exists( select * from trn_logfile where TrnmenuId=LFTrnmenuId ) then
begin
 select 'A' as result;
end;
else
begin
insert into trn_logfile
(TrnlogId,TrnmenuId,Trnaction,TrnuserId,Trndatetime,Trndescription,Trncreateddate)
 value (LFTrnlogId,LFTrnmenuId,LFTrnaction,LFTrnuserId,LFTrndatetime,LFTrndescription,LFTrncreateddate);
 select 'S' as result;
       set Logstring=concat(UUserID,"logFile Insert");
call InsertUserLog(14, '1', TrnUserby, Logstring);
end;
end if;

end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDMaildetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `IUDMaildetails`( Musername varchar(100),MEmailID varchar(100),MMailBody text,Mpasswords varchar(200) )
BEGIN
INSERT INTO  trn_usermail_log
( 
username,
EmailID,
MailBody,
password,
datetime)
VALUES
( Musername ,MEmailID  ,MMailBody ,Mpasswords,now() );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDMenu`(
MMstMenuId smallint,
MMenuname varchar(50),
MMenupath varchar(100),
MUserby smallint,
MUserdate datetime,
Mflag int(100)

)
BEGIN
if Mflag=1 then

begin
if exists( select * from mst_menu where Menuname=MMenuname ) then
begin
 select 'A' as result;
end;
else
begin
insert into mst_menu 
(Menuname,Menupath,Createdby,Createddate)
 value (MMenuname,MMenupath,MUserby,now());
 select 'S' as result;
END;
end if;
end;

end if;


if Mflag=2 then
begin
update mst_menu set Menuname=MMenuname,Menupath=MMenupath,
 Modifiedby =MUserby,Modifieddate=now() where MstMenuId=MMstMenuId;
 select 'M' as result;
end;
end if;
if Mflag=3 then
begin
update mst_menu set Deletedby=MUserby,Deleteddate=now() where MstMenuId=MMstMenuId;
 select 'D' as result;
end;
end if;

if Mflag=4 then
begin
update mst_menu set Blockedby=MUserby,Blockeddate=now() where MstMenuId=MMstMenuId;
 select 'B' as result;
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDMines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDMines`(
MMstMineId smallint,
MMineId varchar(50),
MMineName varchar(100),
MMstPlantId smallint,
MMstCustId smallint,
MMstCoalfieldId smallint,
MUserby smallint,
MUserdate datetime,
Mflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
declare Temp_Mineid varchar(500);
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldname varchar(500);
declare Temp_Customername varchar(500);
Declare LogUserName varchar(500);
Declare MaxMineID varchar(20);
set MaxMineID=(select concat("M-",ifnull((substring(MineId,4)+1),"M-101")) 
as MineId from mst_mines order by MstMineId desc limit 1);

if Mflag=1 then

/*begin
if exists( select * from mst_mines where MineId=MMineId ) then
begin
 select 'A' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Already Exists ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
end;
else*/
begin
set MMstCustId=(select MstCustId from mst_coalfield where MstCoalfieldId=MMstCoalfieldId);
set MMstPlantId=(select MstPlantId from mst_coalfield where MstCoalfieldId=MMstCoalfieldId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=MMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=MMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=MMstPlantId);
set Globalstring= concat_ws('||',MMineId,MMineName,Temp_PlantName,Temp_Customername,Temp_Coalfieldname);


insert into mst_mines 
(MineId,MineName,MstPlantId,MstCustId,MstCoalfieldId,Createdby,Createddate,SearchField)
 value (MMineId,MMineName,MMstPlantId,MMstCustId,MMstCoalfieldId,MUserby,now(),Globalstring);
 select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
END;
end if;
/*end;

end if;*/


if Mflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Coalfields Insert Modify ");
if not exists(select * from mst_mines where MstMineId=MMstMineId and MineId=MMineId) then

begin
 set Logstring=concat_WS(',',Logstring,' MineId has changed ',MMineId);
End;
end if;
if not exists(select * from mst_mines where MstMineId=MMstMineId and MineName=MMineName) then
begin
 set Logstring=concat_WS(',',Logstring,' MineName has changed ',MMineName);
End;
end if;
if not exists(select * from mst_mines where MstMineId=MMstMineId and MstPlantId=MMstPlantId) then
begin
 set Logstring=concat_WS(',',Logstring,' MstPlantId has changed ',MMstPlantId);
End;
end if;
if not exists(select * from mst_mines where MstMineId=MMstMineId and MstCustId=MMstCustId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstCustId has changed ',MMstCustId);
End;
end if;
if not exists(select * from mst_mines where MstMineId=MMstMineId and MstCoalfieldId=MMstCoalfieldId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstCoalfieldId has changed ',MMstCoalfieldId);
End;
end if;
set MMstCustId=(select MstCustId from mst_coalfield where MstCoalfieldId=MMstCoalfieldId);
set MMstPlantId=(select MstPlantId from mst_coalfield where MstCoalfieldId=MMstCoalfieldId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=MMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=MMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=MMstPlantId);
set Globalstring= concat_ws('||',MMineId,MMineName,Temp_Customername,Temp_PlantName,Temp_Coalfieldname);


update mst_mines set MineId=MMineId,MineName=MMineName,MstPlantId=MMstPlantId,MstCustId=MMstCustId,MstCoalfieldId=MMstCoalfieldId,
 Modifiedby =MUserby,Modifieddate=now(),SearchField=Globalstring where MstMineId=MMstMineId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
end;
end if;

if Mflag=3 then
begin
if exists(select * from mst_bench where Deletedby is null) then
begin
update mst_mines set Deletedby=MUserby,Deleteddate=now() where MstMineId=MMstMineId;
 select 'ND' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
End;
Else

Begin
update mst_mines set Deletedby=MUserby,Deleteddate=now() where MstMineId=MMstMineId;
 select 'D' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
End;
 End if;
end;
end if;

if Mflag=4 then
begin
update mst_mines set Blockedby=MUserby,Blockeddate=now() where MstMineId=MMstMineId;
 select 'B' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Block ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
end;
end if;

if Mflag=5 then

/*begin
if exists( select * from mst_mines where MineName=MMineName and Deletedby is null  ) then
begin

set Temp_Mineid=(select Mineid from mst_mines where MstMineId=MMstMineId);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=MMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=MMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=MMstPlantId);
set Globalstring= concat_ws('||',Temp_Mineid,MineName,Temp_Customername,Temp_PlantName,Temp_Coalfieldname);

 update mst_mines set MineName=MMineName,MstCoalfieldId=MMstCoalfieldId,
 Modifiedby =MUserby,Modifieddate=now(),SearchField=Globalstring where MineName=MMineName;
 select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
end;
else*/
begin
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=MMstcoalfieldId);
set Temp_Customername=(select Customername from mst_customer where MstCustId=MMstCustId);
set Temp_PlantName=(select plantname from mst_plant where MstPlantId=MMstPlantId);
set Globalstring= concat_ws('||',MMineId,MMineName,Temp_PlantName,Temp_Customername);
  insert into mst_mines 
(MineId,MineName,MstPlantId,MstCustId,MstCoalfieldId,Createdby,Createddate,SearchField)
 value (MMineId,MMineName,MMstPlantId,MMstCustId,MMstCoalfieldId,MUserby,now(),Globalstring);
  select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=MUserby) ;
 set Logstring=concat(LogUserName," Mines Insert Bulk Upload ");
 set Logstring=concat_ws(',',Logstring,' MMstMineId ',MMstMineId,' MMineId ',MMineId,' MMineName ',MMineName,' MMstPlantId ',MMstPlantId,
' MMstCustId ',MMstCustId,' MMstCoalfieldId ',MMstCoalfieldId,' Mflag ',Mflag);
call InsertUserLog(4, '1', MUserby, Logstring);
END;
end if;
/*end;

end if;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDmstOperationUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDmstOperationUser`(
OMstuserId smallint,
OMineID smallint,
OMstRoleId smallint, 
OUserby smallint,

Oflag int(100)

)
BEGIN
 
Declare Logstring text;
if Oflag=1 then
Begin
INSERT INTO `iocl`.`mst_operationaluser`
(
`MstuserId`,
`MineID`,
`MstRoleId`,
`Createdby`,
`Createddate`)
VALUES
( OMstuserId,OMineID,OMstRoleId,OUserby,now());
 
       set Logstring=concat(UUserID,"OperationUser Insert");
call InsertUserLog(13, '1', OUserby, Logstring);
End;
End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDPilePhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDPilePhotos`(
PTrnpilesphotosId int,
PTrnSiteId int,
PPileno smallint,
PFilename varchar(500),
PFilepath varchar(500),
PGPSLatitude varchar(500),
PGPSLongitude varchar(500),
PUserby smallint,
PUserdate datetime,
Pflag int(100)

)
BEGIN
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldname varchar(500);
declare Temp_Customername varchar(500);
declare Temp_Minename varchar(500);
declare Temp_Benchname varchar(500);
declare Temp_Benchtype varchar(500);
declare PBMstbenchId varchar(500);
declare Temp_Sitename varchar(500);

Declare Logstring text;
Declare LogUserName varchar(500);
if Pflag=1 then

begin

if exists( select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilePhotos Insert Already Exists ");
  set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' PTrnSiteId ',PTrnSiteId,' PPileno ',
 PPileno,' PFilename_O',PFilename,
' PFilepath_O ',PFilepath,'PGPSLongitude',PGPSLongitude,'PGPSLongitude',PGPSLatitude,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
end;
else 
begin
set PBMstbenchId= (select  MstbenchId from trn_preblast where TrnSiteId=PTrnSiteId limit 1);
set Temp_Sitename=(select Sitename from trn_preblast where TrnSiteId=PTrnSiteId limit 1);
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);

set Globalstring=concat_ws('||',PFilename,PFilepath,PGPSLatitude,PGPSLongitude,Temp_BenchName,Temp_Minename,
Temp_Coalfieldname,Temp_Customername,Temp_PlantName,Temp_Sitename);

insert into trn_pilephotos
(TrnSiteId,Pileno,Filename_O,Filepath_O,GPSLatitude,GPSLongitude,Createdby,Createddate,SearchField)
 value (PTrnSiteId,PPileno,PFilename,PFilepath,PGPSLatitude,PGPSLongitude,PUserby,now(),Globalstring);
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Insert ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' PTrnSiteId ',PTrnSiteId,' PPileno ',
 PPileno,' PFilename_O',PFilename,
' PFilepath_O ',PFilepath,'PGPSLongitude',PGPSLongitude,'PGPSLongitude',PGPSLatitude,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
end;

end if;



if Pflag=2 then
begin
  set Logstring=concat_ws(LogUserName," PilePhotos Insert Modify ");
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and TrnSiteId=PTrnSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' TrnSiteId has changed ',PTrnSiteId);
End;
end if;
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and Pileno=PPileno) then
begin
 set Logstring=concat_WS(',',Logstring,' Pileno has changed ',PPileno);
End;
end if;
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and Filename=PFilename) then
begin
 set Logstring=concat_WS(',',Logstring,' Filename has changed ',PFilename);
End;
end if;
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and Filepath=PFilepath) then
begin
 set Logstring=concat_WS(',',Logstring,' Filepath has changed ',PFilepath);
End;
end if;
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and GPSLatitude=PGPSLatitude) then
begin
 set Logstring=concat_WS(',',Logstring,' GPSLatitude has changed ',PGPSLatitude);
End;
end if;
if not exists(select * from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId and GPSLongitude=PGPSLongitude) then
begin
 set Logstring=concat_WS(',',Logstring,' GPSLongitude has changed ',PGPSLongitude);
End;
end if;

set PTrnSiteId= (select TrnSiteId from trn_pilephotos where TrnpilesphotosId=PTrnpilesphotosId limit 1);
set PBMstbenchId= (select  MstbenchId from trn_preblast where TrnSiteId=PTrnSiteId limit 1);
set Temp_Sitename=(select Sitename from trn_preblast where TrnSiteId=PTrnSiteId limit 1);
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);

set Globalstring=concat_ws('||',PFilename,PFilepath,PGPSLatitude,PGPSLongitude,Temp_BenchName,Temp_Minename,
Temp_Coalfieldname,Temp_Customername,Temp_PlantName,Temp_Sitename);
update trn_pilephotos set TrnSiteId=PTrnSiteId,Pileno=PPileno,Filename_O=PFilename,Filepath_O=PFilepath,GPSLatitude=PGPSLongitude,GPSLongitude=PGPSLongitude,
 Modifiedby =PUserby,Modifieddate=now(),SearchField=Globalstring where TrnpilesphotosId=PTrnpilesphotosId;
 select 'M' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' PTrnSiteId ',PTrnSiteId,' PPileno ',
 PPileno,' PFilename_O ',PFilename,
' PFilepath_O ',PFilepath,'PGPSLongitude',PGPSLongitude,'PGPSLongitude',PPGPSLongitude,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
end;
end if;


if Pflag=3 then
begin
update trn_pilephotos set Deletedby=PUserby,Deleteddate=now() where  TrnSiteId=PTrnSiteId and Pileno=PPileno;
 select 'D' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' PTrnSiteId ',PTrnSiteId,
 ' PPileno ',PPileno,' PFilename_O ',PFilename,
' PFilepath_O ',PFilepath,'PGPSLongitude',PGPSLongitude,'PGPSLongitude',PGPSLongitude,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
end;
end if;

if Pflag=4 then
begin
update trn_pilephotos set Blockedby=PUserby,Blockeddate=now() where TrnSiteId=PTrnSiteId and Pileno=PPileno;
 select 'B' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Insert Block ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' PTrnSiteId ',
 PTrnSiteId,' PPileno ',PPileno,' PFilename_O ',PFilename,
' PFilepath_O ',PFilepath,'PGPSLongitude',PGPSLongitude,'PGPSLongitude',PGPSLongitude,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDPlant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDPlant`(
PMstPlantId smallint,
PPlantId varchar(50),
PPlantName varchar(100),
PPlantAddress varchar(500),
PPlantState varchar(50),
PUserby smallint,
PUserdate datetime,
Pflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
Declare LogUserName varchar(500);
if Pflag=1 then

begin

if exists( select * from mst_plant where PlantId=PPlantId or PlantName=PPlantName ) then
begin
 select 'A' as result;
  set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Already Exists ");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
end;
else 
begin

set Globalstring= concat_WS('||',PPlantId,PPlantName,PPlantAddress);
insert into mst_plant 
(PlantId,PlantName,PlantAddress,PlantState,Createdby,Createddate,SearchField)
value (PPlantId,PPlantName,PPlantAddress,PPlantState,PUserby,now(),Globalstring);
 select 'S' as result;
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName,' Plant Insert ');
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
END;
end if;
end;

end if;


if Pflag=2 then
begin
 set Logstring=concat_Ws(',',LogUserName,' Plant Insert Modify ');
if not exists(select * from mst_plant where MstPlantId=PMstPlantId and PlantId=PPlantId) then

begin
 set Logstring=concat_WS(',',Logstring,' PPlantId has changed ',PPlantId);
End;
end if;
if not exists(select * from mst_plant where MstPlantId=PMstPlantId and PlantName=PPlantName) then

begin
 set Logstring=concat_WS(',',Logstring,' PlantName has changed ',PPlantName);
End;
end if;
if not exists(select * from mst_plant where MstPlantId=PMstPlantId and PlantAddress=PPlantAddress) then

begin
 set Logstring=concat_WS(',',Logstring,' PlantAddress has changed',PPlantAddress);
End;
end if;

set Globalstring= concat_WS('||',PPlantId,PPlantName,PPlantAddress);
update mst_plant set PlantId=PPlantId,PlantName=PPlantName,PlantAddress=PPlantAddress,PlantState=PPlantState,
 Modifiedby =PUserby,Modifieddate=now(),SearchField=Globalstring where MstPlantId=PMstPlantId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;

 /*set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);*/
call InsertUserLog(1, '1', PUserby, Logstring);
end;
end if;
if Pflag=3 then
begin
if exists(select * from mst_customer where Deletedby is null and MstPlantId=PMstPlantId) then
Begin
 select 'ND' as result;
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Delete - Not success");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
End;
Else

Begin
update mst_plant set Deletedby=PUserby,Deleteddate=now() where MstPlantId=PMstPlantId;
 select 'D' as result;
 
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Delete ");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
End;
 End if;
end;
end if;

if Pflag=4 then
begin
update mst_plant set Blockedby=PUserby,Blockeddate=now() where MstPlantId=PMstPlantId;
 select 'B' as result;
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Block ");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
end;
 
end if;

if Pflag=5 then

begin
if exists( select * from mst_plant where PlantId=PPlantId or PlantName=PPlantName and Deletedby is null ) then
begin
set Globalstring= concat_WS('||',PPlantId,PPlantName,PPlantAddress);
Update mst_plant set PlantId=PPlantId , PlantName=PPlantName, Modifiedby =PUserby,Modifieddate=now(),SearchField=Globalstring  where PlantId=PPlantId or PlantName=PPlantName ;
 select 'S' as result;
  set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Bulk Upload ");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
end;
else
begin
set Globalstring= concat_WS('||',PPlantId,PPlantName,PPlantAddress);
insert into mst_plant 
(PlantId,PlantName,PlantAddress,PlantState,Createdby,Createddate,SearchField)
value (PPlantId,PPlantName,PPlantAddress,PPlantState,PUserby,now(),Globalstring);
 select 'S' as result;
END;
/*set MUserid=(select MstuserId from mst_user where Username=UUserID) ;*/
 set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," Plant Insert Bulk Upload ");
 set Logstring=concat_WS(',',Logstring,' PMstPlantId ',PMstPlantId,' PPlantId ',PPlantId,' PPlantName ',PPlantName,
 'PPlantAddress ',PPlantAddress,' PPlantState ',PPlantState,' Pflag ',Pflag);
call InsertUserLog(1, '1', PUserby, Logstring);
end if;
end;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDPostBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDPostBlast`(
POTrnpostblastId int,
POTrnSiteId int,
POFragmentation varchar(50),
POThrow varchar(50),
POFlyRock varchar(50),
POBlockVolume smallint,
POPF float,
POVibrationLevel float,
POBlastResult varchar(50),
PONoofPiles smallint,
POVibrationReport varchar(1500),
POUserby smallint,
POUserdate datetime,
POflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldname varchar(500);
declare Temp_Customername varchar(500);
declare Temp_Minename varchar(500);
declare Temp_Benchname varchar(500);
declare Temp_Benchtype varchar(500);
declare PBMstbenchId varchar(500);
Declare LogUserName varchar(5000);
if POflag=1 then

/*begin
/*if exists( select * from trn_postblast where TrnSiteId=POTrnSiteId ) then
begin
 select 'A' as result;
end;
else*/
begin
set PBMstbenchId= (select  MstbenchId from trn_preblast where TrnSiteId=POTrnSiteId limit 1);
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);

set Globalstring= concat_ws('||',POFragmentation,POThrow,POFlyRock,POBlockVolume,POPF,POVibrationLevel,POBlastResult,
PONoofPiles,Temp_BenchName,Temp_Minename,Temp_Coalfieldname,Temp_Customername,Temp_PlantName);



insert into trn_postblast
(TrnSiteId,Fragmentation,Throw,FlyRock,BlockVolume,PF,VibrationLevel,BlastResult,NoofPiles,VibrationReport,Createdby,Createddate,SearchField)
 value (POTrnSiteId,POFragmentation,POThrow,POFlyRock,POBlockVolume,POPF,POVibrationLevel,POBlastResult,PONoofPiles,POVibrationReport,POUserby,now(),Globalstring);
 select 'S' as result;
    set LogUserName=(select Email from mst_user where mstuserid=POUserby);
 set Logstring=concat(LogUserName," PostBlast Insert ");
 set Logstring=concat_ws(',',Logstring,' POTrnpostblastId ',POTrnpostblastId,' POTrnSiteId ',POTrnSiteId,' POFragmentation ',POFragmentation,' POThrow ',POThrow,
' POFlyRock ',POFlyRock,' POBlockVolume ',POBlockVolume,' POPF ',POPF,' POVibrationLevel ',POVibrationLevel,' POBlastResult ',POBlastResult,' PONoofPiles ',PONoofPiles,
' POVibrationReport ',POVibrationReport,' POflag ',POflag);
call InsertUserLog(14, '1', POUserby, Logstring);
END;
/*end if;*/


end if;


if POflag=2 then
begin
  set Logstring=concat_ws(LogUserName," PostBlast Insert Modify ");
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and TrnSiteId=POTrnSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' TrnSiteId has changed ',POTrnSiteId);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and Fragmentation=POFragmentation) then

begin
 set Logstring=concat_WS(',',Logstring,' Fragmentation has changed ',POFragmentation);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and Throw=POThrow) then
begin
 set Logstring=concat_WS(',',Logstring,' Throw has changed ',POThrow);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and FlyRock=POFlyRock) then

begin
 set Logstring=concat_WS(',',Logstring,' FlyRock has changed ',POFlyRock);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and BlockVolume=POBlockVolume) then
begin
 set Logstring=concat_WS(',',Logstring,' BlockVolume has changed ',POBlockVolume);
End;
end if;				
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and PF=POPF) then

begin
 set Logstring=concat_WS(',',Logstring,' PF has changed ',POPF);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and VibrationLevel=POVibrationLevel) then

begin
 set Logstring=concat_WS(',',Logstring,' VibrationLevel has changed ',POVibrationLevel);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and BlastResult=POBlastResult) then

begin
 set Logstring=concat_WS(',',Logstring,' BlastResult has changed ',POBlastResult);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and NoofPiles=PONoofPiles) then
begin
 set Logstring=concat_WS(',',Logstring,' NoofPiles has changed ',PONoofPiles);
End;
end if;
if not exists(select * from trn_postblast where TrnpostblastId=POTrnpostblastId and VibrationReport=POVibrationReport) then

begin
 set Logstring=concat_WS(',',Logstring,' VibrationReport has changed ',POVibrationReport);
End;
end if;
set POTrnSiteId= (select TrnSiteId from trn_postblast where TrnpostblastId=POTrnpostblastId limit 1);
set PBMstbenchId= (select  MstbenchId from trn_preblast where TrnSiteId=POTrnSiteId limit 1);
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);


set Globalstring= concat_ws('||',POFragmentation,POThrow,POFlyRock,POBlockVolume,POPF,POVibrationLevel,POBlastResult,
PONoofPiles,Temp_BenchName,Temp_Minename,Temp_Coalfieldname,Temp_Customername,Temp_PlantName);

update trn_postblast set Fragmentation=POFragmentation,Throw=POThrow,
FlyRock=POFlyRock,BlockVolume=POBlockVolume,PF=POPF,VibrationLevel=POVibrationLevel,BlastResult=POBlastResult,NoofPiles=PONoofPiles,VibrationReport=POVibrationReport,
 Modifiedby =POUserby,Modifieddate=now(),SearchField=Globalstring where TrnpostblastId=POTrnpostblastId;
 select 'M' as result;
  set LogUserName=(select Email from mst_user where mstuserid=POUserby);
  /*set Logstring=concat(LogUserName," PostBlast Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' POTrnpostblastId ',POTrnpostblastId,' POTrnSiteId ',POTrnSiteId,' POFragmentation ',POFragmentation,' POThrow ',POThrow,
' POFlyRock ',POFlyRock,' POBlockVolume ',POBlockVolume,' POPF ',POPF,' POVibrationLevel ',POVibrationLevel,' POBlastResult ',POBlastResult,' PONoofPiles ',PONoofPiles,
' POVibrationReport ',POVibrationReport,' POflag ',POflag);*/
call InsertUserLog(14, '1', POUserby, Logstring);
end;
end if;

if POflag=3 then
begin
if exists(select * from trn_pilephotos where Deletedby is null and TrnpostblastId=POTrnpostblastId) then
Begin
 select 'ND' as result;
   set LogUserName=(select Email from mst_user where mstuserid=POUserby);
 set Logstring=concat(LogUserName," PostBlast Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' POTrnpostblastId ',POTrnpostblastId,' POTrnSiteId ',POTrnSiteId,' POFragmentation ',POFragmentation,' POThrow ',POThrow,
' POFlyRock ',POFlyRock,' POBlockVolume ',POBlockVolume,' POPF ',POPF,' POVibrationLevel ',POVibrationLevel,' POBlastResult ',POBlastResult,' PONoofPiles ',PONoofPiles,
' POVibrationReport ',POVibrationReport,' POflag ',POflag);
call InsertUserLog(14, '1', POUserby, Logstring);
End;
Else

begin
update trn_postblast set Deletedby=POUserby,Deleteddate=now() where TrnpostblastId=POTrnpostblastId;
 select 'D' as result;
   set LogUserName=(select Email from mst_user where mstuserid=POUserby);
 set Logstring=concat(LogUserName," PostBlast Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' POTrnpostblastId ',POTrnpostblastId,' POTrnSiteId ',POTrnSiteId,' POFragmentation ',POFragmentation,' POThrow ',POThrow,
' POFlyRock ',POFlyRock,' POBlockVolume ',POBlockVolume,' POPF ',POPF,' POVibrationLevel ',POVibrationLevel,' POBlastResult ',POBlastResult,' PONoofPiles ',PONoofPiles,
' POVibrationReport ',POVibrationReport,' POflag ',POflag);
call InsertUserLog(14, '1', POUserby, Logstring);
End;
 End if;
end;
end if;


if POflag=4 then
begin
update trn_postblast set Blockedby=POUserby,Blockeddate=now() where  TrnpostblastId=POTrnpostblastId;
 select 'B' as result;
   set LogUserName=(select Email from mst_user where mstuserid=POUserby);
 set Logstring=concat(LogUserName," PostBlast Insert Block ");
 set Logstring=concat_ws(',',Logstring,' POTrnpostblastId ',POTrnpostblastId,' POTrnSiteId ',POTrnSiteId,' POFragmentation ',POFragmentation,' POThrow ',POThrow,
' POFlyRock ',POFlyRock,' POBlockVolume ',POBlockVolume,' POPF ',POPF,' POVibrationLevel ',POVibrationLevel,' POBlastResult ',POBlastResult,' PONoofPiles ',PONoofPiles,
' POVibrationReport ',POVibrationReport,' POflag ',POflag);
call InsertUserLog(14, '1', POUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDPreBlast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDPreBlast`(
PBTrnSiteId int,
PBMstbenchId varchar(50),
PBSiteId Varchar(50),
PBSitename Varchar(50),
PBBlastHoleDiameter smallint,
PBDrillingPattern Varchar(50),
PBNoofHoles smallint,
PBExcavatorType Varchar(50),
PBExcavatorCapacity float,
PBRockType Varchar(50),
PBStrataCondition Varchar(50),
PBBenchHeight smallint,
PBAverageHoledepth float,
PBSpacing float,
PBBurden float,
PBTotalChargePerround smallint,
PBMaximumChargePerHole smallint,
PBFiringSequence Varchar(50),
PBVolumeoftheBlast smallint,
PBPowderFactor smallint,
PBBlastDiagram Varchar(500),
PBPumpTruckNo Varchar(500),
PBDrillDia smallint,
PBLocation Varchar(500),
PBBoosterUsed float,
PBDate datetime,
PBUserby smallint,
PBUserdate datetime,
PBflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
declare Temp_PlantName varchar(500);
declare Temp_Coalfieldname varchar(500);
declare Temp_Customername varchar(500);
declare Temp_Minename varchar(500);
declare Temp_Benchname varchar(500);
declare Temp_Benchtype varchar(500);
Declare LogUserName varchar(500);
Declare MaxSiteid varchar(200);
if not Exists(select * from trn_preblast where MstbenchId=PBMstbenchId )then
Begin
set MaxSiteid="Si0001";
End;
else
Begin
set MaxSiteid=(select  Concat('Si',substring(concat(1,substring(SiteId,3,4))+1,2)) 
/*concat('Site-',substring(SiteId,6)+1) */
from trn_preblast where MstbenchId=PBMstbenchId  order by TrnSiteId desc limit 1);

End;
End if;
if PBflag=1 then

begin
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
 set Globalstring= concat_ws('||',MaxSiteid,PBSitename,PBBlastHoleDiameter,PBDrillingPattern,PBNoofHoles,PBExcavatorType,PBExcavatorCapacity,PBRockType,PBStrataCondition,
PBBenchHeight,PBAverageHoledepth,PBSpacing,PBBurden,PBTotalChargePerround,PBMaximumChargePerHole,PBFiringSequence,PBVolumeoftheBlast,PBPowderFactor,
PBPumpTruckNo,PBDrillDia,PBLocation,PBBoosterUsed,PBDate,Temp_BenchName,Temp_Minename,Temp_Coalfieldname,Temp_Customername,Temp_PlantName);
 
insert into trn_preblast
(MstbenchId,SiteId,Sitename,BlastHoleDiameter,DrillingPattern,NoofHoles,ExcavatorType,ExcavatorCapacity,RockType,StrataCondition,
BenchHeight,AverageHoledepth,Spacing,Burden,TotalChargePerround,MaximumChargePerHole,FiringSequence,VolumeoftheBlast,PowderFactor,
BlastDiagram,PumpTruckNo,DrillDia,Location,BoosterUsed,Date,Createdby,Createddate,SearchField)
 value (PBMstbenchId,MaxSiteid,PBSitename,PBBlastHoleDiameter,PBDrillingPattern,PBNoofHoles,PBExcavatorType,PBExcavatorCapacity,PBRockType,PBStrataCondition,
PBBenchHeight,PBAverageHoledepth,PBSpacing,PBBurden,PBTotalChargePerround,PBMaximumChargePerHole,PBFiringSequence,PBVolumeoftheBlast,PBPowderFactor,
PBBlastDiagram,PBPumpTruckNo,PBDrillDia,PBLocation,PBBoosterUsed,PBDate,PBUserby,now(),Globalstring);
 select max(TrnSiteId) as TrnSiteId from trn_preblast;
 select 'S' as result;
  select MaxSiteid as TrnSiteId from trn_preblast;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
end;

end if;


if PBflag=2 then
begin
  set Logstring=concat_ws(LogUserName," PreBlast Insert Modify ");
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and MstbenchId=PBMstbenchId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstbenchId has changed ',PBMstbenchId);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and SiteId=PBSiteId) then

begin
 set Logstring=concat_WS(',',Logstring,' SiteId has changed ',PBSiteId);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and Sitename=PBSitename) then
begin
 set Logstring=concat_WS(',',Logstring,' Sitename has changed ',PBSitename);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and BlastHoleDiameter=PBBlastHoleDiameter) then

begin
 set Logstring=concat_WS(',',Logstring,' BlastHoleDiameter has changed ',PBBlastHoleDiameter);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and DrillingPattern=PBDrillingPattern) then
begin
 set Logstring=concat_WS(',',Logstring,' DrillingPattern has changed ',PBDrillingPattern);
End;
end if;				
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and NoofHoles=PBNoofHoles) then

begin
 set Logstring=concat_WS(',',Logstring,' NoofHoles has changed ',PBNoofHoles);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and ExcavatorType=PBExcavatorType) then

begin
 set Logstring=concat_WS(',',Logstring,' ExcavatorType has changed ',PBExcavatorType);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and ExcavatorCapacity=PBExcavatorCapacity) then

begin
 set Logstring=concat_WS(',',Logstring,' ExcavatorCapacity has changed ',PBExcavatorCapacity);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and RockType=PBRockType) then
begin
 set Logstring=concat_WS(',',Logstring,' RockType has changed ',PBRockType);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and StrataCondition=PBStrataCondition) then

begin
 set Logstring=concat_WS(',',Logstring,' StrataCondition has changed ',PBStrataCondition);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and BenchHeight=PBBenchHeight) then
begin
 set Logstring=concat_WS(',',Logstring,' BenchHeight has changed ',PBBenchHeight);
End;
end if;				
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and AverageHoledepth=PBAverageHoledepth) then

begin
 set Logstring=concat_WS(',',Logstring,' AverageHoledepth has changed ',PBAverageHoledepth);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and Spacing=PBSpacing) then

begin
 set Logstring=concat_WS(',',Logstring,' Spacing has changed ',PBSpacing);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and Burden=PBBurden) then

begin
 set Logstring=concat_WS(',',Logstring,' Burden has changed ',PBBurden);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and TotalChargePerround=PBTotalChargePerround) then

begin
 set Logstring=concat_WS(',',Logstring,' TotalChargePerround has changed ',PBTotalChargePerround);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and MaximumChargePerHole=PBMaximumChargePerHole) then
begin
 set Logstring=concat_WS(',',Logstring,' MaximumChargePerHole has changed ',PBMaximumChargePerHole);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and FiringSequence=PBFiringSequence) then

begin
 set Logstring=concat_WS(',',Logstring,' FiringSequence has changed ',PBFiringSequence);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and VolumeoftheBlast=PBVolumeoftheBlast) then
begin
 set Logstring=concat_WS(',',Logstring,' VolumeoftheBlast has changed ',PBVolumeoftheBlast);
End;
end if;				
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and PowderFactor=PBPowderFactor) then

begin
 set Logstring=concat_WS(',',Logstring,' PowderFactor has changed ',PBPowderFactor);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and BlastDiagram=PBBlastDiagram) then

begin
 set Logstring=concat_WS(',',Logstring,' BlastDiagram has changed ',PBBlastDiagram);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and PumpTruckNo=PBPumpTruckNo) then

begin
 set Logstring=concat_WS(',',Logstring,' PumpTruckNo has changed ',PBPumpTruckNo);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and DrillDia=PBDrillDia) then

begin
 set Logstring=concat_WS(',',Logstring,' DrillDia has changed ',PBDrillDia);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and Location=PBLocation) then

begin
 set Logstring=concat_WS(',',Logstring,' Location has changed ',PBLocation);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and BoosterUsed=PBBoosterUsed) then

begin
 set Logstring=concat_WS(',',Logstring,' BoosterUsed has changed ',PBBoosterUsed);
End;
end if;
if not exists(select * from trn_preblast where TrnSiteId=PBTrnSiteId and Date=PBDate) then

begin
 set Logstring=concat_WS(',',Logstring,' Date has changed ',PBDate);
set PBMstbenchId= (select  MstbenchId from trn_preblast where TrnSiteId=PBTrnSiteId limit 1);
set Temp_Benchtype=(select Benchtype from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_BenchName=(select BenchName from mst_bench where MstbenchId=PBMstbenchId limit 1);
set Temp_Minename=(select Minename from mst_mines where MstMineId=(select MstMineId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Coalfieldname=(select Coalfieldname from mst_coalfield where MstcoalfieldId=(select MstcoalfieldId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_Customername=(select Customername from mst_customer where MstCustId=(select MstCustId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);
set Temp_PlantName=(select plantName from mst_plant where MstPlantId=(select MstPlantId from mst_bench where MstbenchId=PBMstbenchId limit 1) limit 1);


 set Globalstring= concat_ws('||',PBSitename,PBBlastHoleDiameter,PBDrillingPattern,PBNoofHoles,PBExcavatorType,PBExcavatorCapacity,PBRockType,PBStrataCondition,
PBBenchHeight,PBAverageHoledepth,PBSpacing,PBBurden,PBTotalChargePerround,PBMaximumChargePerHole,PBFiringSequence,PBVolumeoftheBlast,PBPowderFactor,
PBPumpTruckNo,PBDrillDia,PBLocation,PBBoosterUsed,PBDate,Temp_BenchName,Temp_Minename,Temp_Coalfieldname,Temp_Customername,Temp_PlantName);
End;
end if;

update trn_preblast set Sitename=PBSitename,BlastHoleDiameter=PBBlastHoleDiameter,
DrillingPattern=PBDrillingPattern,NoofHoles=PBNoofHoles,ExcavatorType=PBExcavatorType,ExcavatorCapacity=PBExcavatorCapacity,
RockType=PBRockType,StrataCondition=PBStrataCondition,BenchHeight=PBBenchHeight,AverageHoledepth=PBAverageHoledepth,Spacing=PBSpacing,
Burden=PBBurden,TotalChargePerround=PBTotalChargePerround,MaximumChargePerHole=PBMaximumChargePerHole,FiringSequence=PBFiringSequence,
VolumeoftheBlast=PBVolumeoftheBlast,PowderFactor=PBPowderFactor,BlastDiagram=PBBlastDiagram,PumpTruckNo=PBPumpTruckNo,
DrillDia=PBDrillDia,Location=PBLocation,BoosterUsed=PBBoosterUsed,Date=PBDate,
 Modifiedby =PBUserby,Modifieddate=now(),SearchField=Globalstring where TrnSiteId=PBTrnSiteId;
  /*update trn_cornerphotos set Deletedby=PBUserby,Deleteddate=now() where  TrnSiteId=PBTrnSiteId and Deletedby is null;
*/  select   TrnSiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
 select 'M' as result;
   select   SiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
/* set Logstring=concat(LogUserName," PreBlast Insert Modify ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);*/
call InsertUserLog(10, '1', PBUserby, Logstring);
end;
end if;

if PBflag=3 then
begin
if exists(select * from trn_postblast where Deletedby is null and TrnSiteId=PBTrnSiteId) then
Begin
 select 'ND' as result;
   select   SiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert Delete - Not Success");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
End;
Else

begin
update trn_preblast set Deletedby=PBUserby,Deleteddate=now() where TrnSiteId=PBTrnSiteId;
 update trn_loadingsheet set Deletedby=PBUserby,Deleteddate=now() where TrnSiteId=PBTrnSiteId and Deletedby is null;
/* update trn_cornerphotos set Deletedby=PBUserby,Deleteddate=now() where  TrnSiteId=PBTrnSiteId and Deletedby is null;
*/ select   TrnSiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
 select 'D' as result;
   select   SiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert Delete ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
End;
 End if;
end;
end if;


if PBflag=4 then
begin
update trn_preblast set Blockedby=PBUserby,Blockeddate=now() where TrnSiteId=PBTrnSiteId;
 update trn_loadingsheet set Blockedby=PBUserby,Blockeddate=now() where TrnSiteId=PBTrnSiteId and Deletedby is null;
 /*update trn_cornerphotos set Blockedby=PBUserby,Blockeddate=now()  where  TrnSiteId=PBTrnSiteId and Deletedby is null;
*/ select   TrnSiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
 select 'B' as result;
   select   SiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert Block ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
end;
end if;
if PBflag=5 then
begin
update trn_preblast set Sitename=PBSitename,BlastHoleDiameter=PBBlastHoleDiameter,
DrillingPattern=PBDrillingPattern,NoofHoles=PBNoofHoles,ExcavatorType=PBExcavatorType,ExcavatorCapacity=PBExcavatorCapacity,
RockType=PBRockType,StrataCondition=PBStrataCondition,BenchHeight=PBBenchHeight,AverageHoledepth=PBAverageHoledepth,Spacing=PBSpacing,
Burden=PBBurden,TotalChargePerround=PBTotalChargePerround,MaximumChargePerHole=PBMaximumChargePerHole,FiringSequence=PBFiringSequence,
VolumeoftheBlast=PBVolumeoftheBlast,PowderFactor=PBPowderFactor,BlastDiagram=PBBlastDiagram,PumpTruckNo=PBPumpTruckNo,
DrillDia=PBDrillDia,Location=PBLocation,BoosterUsed=PBBoosterUsed,Date=PBDate,
 Modifiedby =PBUserby,Modifieddate=now() where TrnSiteId=PBTrnSiteId;
 update trn_loadingsheet set Deletedby=PBUserby,Deleteddate=now() where TrnSiteId=PBTrnSiteId and Deletedby is null;
/* update trn_cornerphotos set Deletedby=PBUserby,Deleteddate=now() where  TrnSiteId=PBTrnSiteId and Deletedby is null;
 */ select   TrnSiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
 select 'B' as result;
   select   SiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert Bulk Upload ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
end;
end if;
if PBflag=6 then
begin
update trn_preblast set 
 Modifiedby =PBUserby,Modifieddate=now() where TrnSiteId=PBTrnSiteId;
 update trn_loadingsheet set Deletedby=PBUserby,Deleteddate=now() where TrnSiteId=PBTrnSiteId and Deletedby is null;
  
  select   TrnSiteId from trn_preblast where TrnSiteId=PBTrnSiteId;
 select 'B' as result;
set LogUserName=(select Email from mst_user where mstuserid=PBUserby);
 set Logstring=concat(LogUserName," PreBlast Insert Bulk Upload ");
 set Logstring=concat_ws(Logstring,' PBTrnSiteId ',PBTrnSiteId,' PBMstbenchId ',PBMstbenchId,' PBSiteId ',PBSiteId,' PBSitename ',PBSitename,' PBBlastHoleDiameter ',PBBlastHoleDiameter,' PBDrillingPattern ',PBDrillingPattern,' PBNoofHoles ',PBNoofHoles,' PBExcavatorType ',PBExcavatorType,' PBExcavatorCapacity ',PBExcavatorCapacity,' PBRockType ',PBRockType,
' PBStrataCondition ',PBStrataCondition,' PBBenchHeight ', PBBenchHeight,' PBAverageHoledepth ', PBAverageHoledepth,' PBSpacing ', PBSpacing,' PBBurden ', PBBurden,' PBTotalChargePerround ', PBTotalChargePerround,' PBMaximumChargePerHole ', PBMaximumChargePerHole,' PBFiringSequence ', PBFiringSequence,' PBVolumeoftheBlast ', PBVolumeoftheBlast,
' PBPowderFactor ', PBPowderFactor,' PBBlastDiagram ',PBBlastDiagram,' PBPumpTruckNo ', PBPumpTruckNo,' PBDrillDia ', PBDrillDia,' PBLocation ', PBLocation,' PBBoosterUsed ', PBBoosterUsed,' PBDate ', PBDate,' PBflag ',PBflag);
call InsertUserLog(10, '1', PBUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDRole`(
RMstRoleId smallint,
RRoleId varchar(50),
RRoleName varchar(100),
RUserby smallint,
RUserdate datetime,
Rflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;

Declare Temp_Roleid text;
Declare LogUserName varchar(500);
Declare MaxRoleid varchar(20);
Declare rolesid bigint;
if ((select count(*) from mst_role) =0)then
Begin
set MaxRoleid="Rl0001";
End;
else
Begin
set MaxRoleid=(select  Concat('Rl',substring(concat(1,substring(Roleid,3,4))+1,2))  from mst_role order by MstRoleId desc limit 1);

End;
End if;

if Rflag=1 then

begin
if exists( select * from mst_role where RoleName=RRoleName and deletedby is null ) then
begin
 select 'A' as result;

  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Insert Add ");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);
call InsertUserLog(6, '1', RUserby, Logstring);


end;
else
begin
set Globalstring= concat_ws('||',MaxRoleid,RRoleName);
insert into mst_role 
(RoleId,RoleName,Createdby,Createddate,SearchField)
 value (MaxRoleid,RRoleName,RUserby,now(),Globalstring);
 select 'S' as result;
 set rolesid=(select max(MstRoleId) from mst_role);
  insert into mst_rolevscapability
(MstRoleId,MstMenuId,Viewpermission,Addpermission,Modifiedpermission,Deletepermission,Blockpermission,Createdby,Createddate)
 
select  rolesid,mstmenuid,1,1,1,1,1,RUserby,now() from mst_menu;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Insert ");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);
call InsertUserLog(6, '1', RUserby, Logstring);
END;
end if;
end;

end if;


if Rflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Role Insert Modify ");
if not exists(select * from mst_role where MstRoleId=RMstRoleId and RoleId=RRoleId) then

begin
 set Logstring=concat_WS(',',Logstring,' RoleId has changed ',RRoleId);
End;
end if;
if not exists(select * from mst_role where MstRoleId=RMstRoleId and RoleName=RRoleName) then
begin
 set Logstring=concat_WS(',',Logstring,' RoleName has changed ',RRoleName);
End;
end if;

set Temp_Roleid=(select RoleId from mst_role where MstRoleId=RMstRoleId);
set Globalstring= concat_ws('||',Temp_Roleid,RRoleName);
update mst_role set RoleName=RRoleName,
 Modifiedby =RUserby,Modifieddate=now(),SearchField=Globalstring where MstRoleId=RMstRoleId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 /* set Logstring=concat(LogUserName," Role Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);*/
call InsertUserLog(6, '1', RUserby, Logstring);
end;
end if;

if Rflag=3 then
begin
if exists(select * from mst_user where Deletedby is null and MstRoleId=RMstRoleId) then
Begin
 select 'ND' as result;
 set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Insert Delete - Not Success");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);
call InsertUserLog(6, '1', RUserby, Logstring);
End;
Else

Begin
update mst_role set Deletedby=RUserby,Deleteddate=now() where MstRoleId=RMstRoleId;
 select 'D' as result;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);
call InsertUserLog(6, '1', RUserby, Logstring);
End;
 End if;
end;
end if;

if Rflag=4 then
begin
update mst_role set Blockedby=RUserby,Blockeddate=now() where MstRoleId=RMstRoleId;
 select 'B' as result;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Insert Block ");
 set Logstring=concat_ws(',',Logstring,' RMstRoleId ',RMstRoleId,' RRoleId ',RRoleId,' RRoleName ',RRoleName,' Rflag ',Rflag);
call InsertUserLog(6, '1', RUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDRoleVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDRoleVsCapability`(
RMstrolecapId smallint,
RMstRoleId smallint,
RMstMenuId smallint,
RViewpermission smallint,
RAddpermission smallint,
RModifiedpermission smallint,
RDeletepermission smallint,
RBlockpermission smallint,
RUserby smallint,
RUserdate datetime,
Rflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
Declare LogUserName varchar(500);
if Rflag=1 then

begin
if exists( select * from mst_rolevscapability where MstRoleId=RMstRoleId ) then
begin
 select 'A' as result;
   set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Vs Capability Insert Add ");
 set Logstring=concat_ws(',',Logstring,' RMstrolecapId ',RMstrolecapId,' RMstRoleId ',RMstRoleId,' RMstMenuId ',RMstMenuId,' RViewpermission ',RViewpermission,
' RAddpermission ',RAddpermission,' RModifiedpermission ',RModifiedpermission,' RDeletepermission ',RDeletepermission,' RBlockpermission ',RBlockpermission,' Rflag ',Rflag);
call InsertUserLog(7, '1', RUserby, Logstring);
end;
else
begin
set Globalstring= concat_ws('||',RMstRoleId,RMstMenuId,RViewpermission,RAddpermission,RModifiedpermission,RDeletepermission,RBlockpermission);
insert into mst_rolevscapability
(MstRoleId,MstMenuId,Viewpermission,Addpermission,Modifiedpermission,Deletepermission,Blockpermission,Createdby,Createddate,SearchField)
 value (RMstRoleId,RMstMenuId,RViewpermission,RAddpermission,RModifiedpermission,RDeletepermission,RBlockpermission,RUserby,now(),Globalstring);
 select 'S' as result;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Vs Capability Insert ");
 set Logstring=concat_ws(',',Logstring,' RMstrolecapId ',RMstrolecapId,' RMstRoleId ',RMstRoleId,' RMstMenuId ',RMstMenuId,' RViewpermission ',RViewpermission,
' RAddpermission ',RAddpermission,' RModifiedpermission ',RModifiedpermission,' RDeletepermission ',RDeletepermission,' RBlockpermission ',RBlockpermission,' Rflag ',Rflag);
call InsertUserLog(7, '1', RUserby, Logstring);
END;
end if;
end;

end if;
  

if Rflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Role Vs Capability Insert Modify ");
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and MstRoleId=RMstRoleId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstRoleId has changed ',RMstRoleId);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and MstMenuId=RMstMenuId) then
begin
 set Logstring=concat_WS(',',Logstring,' MstMenuId has changed ',RMstMenuId);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and Viewpermission=RViewpermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Viewpermission has changed ',RViewpermission);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and Addpermission=RAddpermission) then
begin
 set Logstring=concat_WS(',',Logstring,' Addpermission has changed ',RAddpermission);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and Modifiedpermission=RModifiedpermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Modifiedpermission has changed ',RModifiedpermission);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and Deletepermission=RDeletepermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Deletepermission has changed ',RDeletepermission);
End;
end if;
if not exists(select * from mst_rolevscapability where MstrolecapId=RMstrolecapId and Blockpermission=RBlockpermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Blockpermission has changed ',RBlockpermission);
End;
end if;
set Globalstring= concat_ws('||',RViewpermission,RAddpermission,RModifiedpermission,RDeletepermission,RBlockpermission);

update mst_rolevscapability set Viewpermission=RViewpermission,Addpermission=RAddpermission,
Modifiedpermission=RModifiedpermission,Deletepermission=RDeletepermission,Blockpermission=RBlockpermission,
 Modifiedby =RUserby,Modifieddate=now(),SearchField=Globalstring where  MstRoleId=RMstRoleId and MstMenuId=RMstMenuId;
 select 'M' as result;
 set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Vs Capability Insert Modify ");
  set Logstring=concat_ws(',',Logstring,' RMstrolecapId ',RMstrolecapId,' RMstRoleId ',RMstRoleId,' RMstMenuId ',RMstMenuId,' RViewpermission ',RViewpermission,
' RAddpermission ',RAddpermission,' RModifiedpermission ',RModifiedpermission,' RDeletepermission ',RDeletepermission,' RBlockpermission ',RBlockpermission,' Rflag ',Rflag);
call InsertUserLog(7, '1', RUserby, Logstring);
end;
end if;
if Rflag=3 then
begin
update mst_rolevscapability set Deletedby=RUserby,Deleteddate=now() where MstrolecapId=RMstrolecapId;
 select 'D' as result;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Vs Capability Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' RMstrolecapId ',RMstrolecapId,' RMstRoleId ',RMstRoleId,' RMstMenuId ',RMstMenuId,' RViewpermission ',RViewpermission,
' RAddpermission ',RAddpermission,' RModifiedpermission ',RModifiedpermission,' RDeletepermission ',RDeletepermission,' RBlockpermission ',RBlockpermission,' Rflag ',Rflag);
call InsertUserLog(7, '1', RUserby, Logstring);
end;
end if;

if Rflag=4 then
begin
update mst_rolevscapability set Blockedby=RUserby,Blockeddate=now() where MstrolecapId=RMstrolecapId;
 select 'B' as result;
  set LogUserName=(select Email from mst_user where mstuserid=RUserby) ;
 set Logstring=concat(LogUserName," Role Vs Capability Insert Block ");
 set Logstring=concat_ws(',',Logstring,' RMstrolecapId ',RMstrolecapId,' RMstRoleId ',RMstRoleId,' RMstMenuId ',RMstMenuId,' RViewpermission ',RViewpermission,
' RAddpermission ',RAddpermission,' RModifiedpermission ',RModifiedpermission,' RDeletepermission ',RDeletepermission,' RBlockpermission ',RBlockpermission,' Rflag ',Rflag);
call InsertUserLog(7, '1', RUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDUser`(
UMstuserId smallint,
UUserId varchar(50),
UUsername varchar(100),
UFirstname Varchar(100),
ULastname Varchar(100),
UEmail Varchar(100),
UMobile bigint,
UPhone bigint,
UProfileimg Varchar(1000),
UCurrentpassword varchar(100),
UOldpassword varchar(100),
UMstRoleId smallint,
UUserby smallint,
UUserdate datetime,
Uflag int(100)

)
BEGIN
Declare Logstring text;
Declare Globalstring text;
 Declare Temp_Userid text;

Declare Temp_Username text; 
Declare LogUserName varchar(500);
Declare MaxUserid varchar(20);
if not Exists(select  *  from mst_user)then
Begin
set MaxUserid="Us0001";
End;
else
Begin
set MaxUserid=(select Concat('Us',substring(concat(1,substring(userid,3,4))+1,2))  from mst_user order by MstuserId desc limit 1);

End;
End if;
if Uflag=1 then

begin
if exists( select * from mst_user where Username=UUsername and Deletedby is null ) then
begin
 select 'A' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UUserby);
  set Logstring=concat(LogUserName," User Insert Add ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
else
begin
set Globalstring= concat_ws('||',MaxUserid,UUsername,UFirstname,ULastname,UEmail,UMobile,UPhone,UCurrentpassword);

insert into mst_user 
(UserId,Username,Firstname,Lastname,Email,Mobile,Phone,Profileimg,Currentpassword,MstRoleId,Createdby,Createddate,SearchField)
 value (MaxUserid,UUsername,UFirstname,ULastname,UEmail,UMobile,UPhone,UProfileimg,UCurrentpassword,UMstRoleId,UUserby,now(),Globalstring);
 select max(mstuserid) as userid from mst_user;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
END;
end if;
end;

end if;


if Uflag=2 then
begin
  set Logstring=concat_ws(LogUserName," User Insert Modify ");
if not exists(select * from mst_user where MstuserId=UMstuserId and UserId=UUserId) then

begin
 set Logstring=concat_WS(',',Logstring,' UserId has changed ',UUserId);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Username=UUsername) then
begin
 set Logstring=concat_WS(',',Logstring,' Username has changed ',UUsername);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Firstname=UFirstname) then

begin
 set Logstring=concat_WS(',',Logstring,' Firstname has changed ',UFirstname);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Lastname=ULastname) then
begin
 set Logstring=concat_WS(',',Logstring,' Lastname has changed ',ULastname);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Email=UEmail) then

begin
 set Logstring=concat_WS(',',Logstring,' Email has changed ',UEmail);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Mobile=UMobile) then

begin
 set Logstring=concat_WS(',',Logstring,' Mobile has changed ',UMobile);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Phone=UPhone) then

begin
 set Logstring=concat_WS(',',Logstring,' Phone has changed ',UPhone);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Profileimg=UProfileimg) then

begin
 set Logstring=concat_WS(',',Logstring,' Profileimg has changed ',UProfileimg);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Currentpassword=UCurrentpassword) then

begin
 set Logstring=concat_WS(',',Logstring,' Currentpassword has changed ',UCurrentpassword);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and Oldpassword=UOldpassword) then

begin
 set Logstring=concat_WS(',',Logstring,' Oldpassword has changed ',UOldpassword);
End;
end if;
if not exists(select * from mst_user where MstuserId=UMstuserId and MstRoleId=UMstRoleId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstRoleId has changed ',UMstRoleId);
End;
end if;
/*set Temp_Userid=(select Userid from mst_user where MstUserId=UMstUserId);
set Temp_Username=(select Username from mst_user where MstUserId=UMstUserId);*/
set Temp_Userid=(select Userid from mst_user where MstUserId=UMstuserId);
set Temp_Username=(select Username from mst_user where MstUserId=UMstuserId);
set Globalstring= concat_ws('||',Temp_Userid,Temp_Username,UFirstname,ULastname,UEmail,UMobile,UPhone);

update mst_user set Firstname=UFirstname,Lastname=ULastname,
Mobile=Umobile,Phone=Uphone,Profileimg=UProfileimg,MstRoleId=UMstRoleId,
 Modifiedby =UUserby,Modifieddate=now(),SearchField=Globalstring where MstuserId=UMstuserId;
 select MstuserId as userid from mst_user where MstuserId=UMstuserId;
  select 'M' as result;
 update trn_uservscapability set  Deletedby=UUserby,Deleteddate=now()  where  MstuserId=UMstuserId;
    /*set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert Modify ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);*/
end;
end if;
if Uflag=3 then
begin
update mst_user set Deletedby=UUserby,Deleteddate=now() where MstuserId=UMstuserId;
 update trn_uservscapability set  Deletedby=UUserby,Deleteddate=now()  where  MstuserId=UMstuserId;
 select MstuserId as userid from mst_user where MstuserId=UMstuserId;
  select 'D' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert Delete ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
end if;

if Uflag=4 then
begin
update mst_user set Blockedby=UUserby,Blockeddate=now() where MstuserId=UMstuserId;
 select MstuserId as userid from mst_user where MstuserId=UMstuserId;
  select 'B' as result;
  update trn_uservscapability set  Blockedby=UUserby,Blockeddate=now()  where  MstuserId=UMstuserId;
     set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert Block ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
end if;
if Uflag=5 then
begin
/*set Temp_Userid=(select Userid from mst_user where MstUserId=UMstUserId);
set Temp_Username=(select Username from mst_user where MstUserId=UMstUserId);*/
set Globalstring = concat(/*Temp_Userid,Temp_Username,*/ UFirstname,ULastname,UMobile,UPhone);
update mst_user set Firstname=UFirstname,Lastname=ULastname,
Mobile=Umobile,Phone=Uphone,Profileimg=UProfileimg,
 Modifiedby =UUserby,Modifieddate=now(),SearchField=Globalstring where MstuserId=UMstuserId;
 
 select 'ED' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert ED ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
end if;
if Uflag=6 then
begin

set Globalstring = concat(UCurrentpassword,UOldpassword);
update mst_user set Currentpassword=UCurrentpassword,Oldpassword=UOldpassword,

 Modifiedby =UUserby,Modifieddate=now(),Passwordstatus="Yes",SearchField=Globalstring where MstuserId=UMstuserId;
 
 select 'PWD' as result;
 select * from mst_user where MstuserId=UMstuserId;
    set LogUserName=(select Email from mst_user where mstuserid=UUserby); 
 set Logstring=concat(LogUserName," User Insert PWD ");
 set Logstring=concat_ws(',',Logstring,' UCurrentpassword ',UCurrentpassword,
 ' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
end if;

if Uflag=8 then
begin
update mst_user set Blockedby=null,Blockeddate=null, Modifiedby =UUserby,Modifieddate=now() where MstuserId=UMstuserId;
 select MstuserId as userid from mst_user where MstuserId=UMstuserId;
  select 'UB' as result;
  update trn_uservscapability set   Blockedby=null,Blockeddate=null, Modifiedby =UUserby,Modifieddate=now()  where  MstuserId=UMstuserId;
     set LogUserName=(select Email from mst_user where mstuserid=UUserby);
 set Logstring=concat(LogUserName," User Insert UNBlock ");
 set Logstring=concat_ws(',',Logstring,' UMstuserId ',UMstuserId,' UUserId ',UUserId,' UUsername ',UUsername,' UFirstname ',UFirstname,
 ' ULastname ',ULastname,' UEmail ',UEmail,' UMobile ',UMobile,' UPhone ',UPhone,' UProfileimg ',UProfileimg,' UCurrentpassword ',UCurrentpassword,
 ' UMstRoleId ',UMstRoleId,' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
end if;

if Uflag=7 then
begin
if exists( select * from mst_user where Username=UEmail) then
begin

set Globalstring = concat(UCurrentpassword,UOldpassword);
 select 'A' as result;
 

update mst_user set Currentpassword=UCurrentpassword,Oldpassword=UOldpassword,

 Modifiedby =UUserby,Modifieddate=now(),Passwordstatus="No",SearchField=Globalstring where  Username=UEmail ;
 
select * from mst_user where Username=UEmail;
    set LogUserName=UEmail;
 set Logstring=concat(LogUserName," User Forgot PWD ");
 set Logstring=concat_ws(',',Logstring,' UCurrentpassword ',UCurrentpassword,
 ' Uflag ',Uflag);
call InsertUserLog(8, '1', UUserby, Logstring);
end;
else
Begin
 select 'N' as result;
End;
end if;
End;

End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUDUserVsCapability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `IUDUserVsCapability`(
UCTrnroleusercapId int,
UCMstRoleId smallint,
UCMstUserId smallint,
UCMstMenuId smallint,
UCViewpermission smallint,
UCAddpermission smallint,
UCModifiypermission smallint,
UCDeletepermission smallint,
UCBlockpermission smallint,
UCUserby smallint,
UCUserdate datetime,
UCflag int(100)

)
BEGIN
Declare Logstring text;
Declare LogUserName varchar(500);
if UCflag=1 then

begin
/*if exists( select * from trn_uservscapability where MstRoleId=UCMstRoleId ) then
begin
 select 'A' as result;
end;
else
begin*/
insert into trn_uservscapability
(MstRoleId,MstUserId,MstMenuId,Viewpermission,Addpermission,Modifiypermission,Deletepermission,Blockpermission,Createdby,Createddate)
 value (UCMstRoleId ,
UCMstUserId ,
UCMstMenuId ,
UCViewpermission ,
UCAddpermission ,
UCModifiypermission ,
UCDeletepermission ,
UCBlockpermission ,
UCUserby ,now());
 select 'S' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UCUserby);
  set Logstring=concat(LogUserName," User Vs Capability Insert  ");
 set Logstring=concat_ws(',',Logstring,' UCMstUserId ',UCMstUserId,' UCMstMenuId ',UCMstMenuId,' UCViewpermission ',UCViewpermission,' UCAddpermission ',UCAddpermission,
' UCModifiypermission ',UCModifiypermission,' UCDeletepermission ',UCDeletepermission,' UCBlockpermission ',UCBlockpermission,
 ' UCflag ',UCflag);
call InsertUserLog(9, '1', UCUserby, Logstring);
/*END;
end if;
*/ end;

end if;


if UCflag=2 then
begin
  set Logstring=concat_ws(LogUserName," Role Vs Capability Insert Modify ");
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and MstRoleId=UCMstRoleId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstRoleId has changed ',UCMstRoleId);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and MstUserId=UCMstUserId) then

begin
 set Logstring=concat_WS(',',Logstring,' MstUserId has changed ',UCMstUserId);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and MstMenuId=UCMstMenuId) then
begin
 set Logstring=concat_WS(',',Logstring,' MstMenuId has changed ',UCMstMenuId);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and Viewpermission=UCViewpermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Viewpermission has changed ',UCViewpermission);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and Addpermission=UCAddpermission) then
begin
 set Logstring=concat_WS(',',Logstring,' Addpermission has changed ',UCAddpermission);
End;
end if;				
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and Modifiedpermission=UCModifiypermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Modifiedpermission has changed ',UCModifiypermission);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and Deletepermission=UCDeletepermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Deletepermission has changed ',UCDeletepermission);
End;
end if;
if not exists(select * from trn_uservscapability where TrnroleusercapId=UCTrnroleusercapId and Blockpermission=UCBlockpermission) then

begin
 set Logstring=concat_WS(',',Logstring,' Blockpermission has changed ',UCBlockpermission);
End;
end if;

update trn_uservscapability set MstRoleId=UCMstRoleId,MstUserId=UCMstUserId,MstMenuId=UCMstMenuId,
Viewpermission=UCViewpermission,Addpermission=UCAddpermission,Modifiypermission=UCModifiypermission,
Deletepermission=UCDeletepermission,Blockpermission=UCBlockpermission,
 Modifiedby =UCUserby,Modifieddate=now() where TrnroleusercapId=UCTrnroleusercapId;

 select 'M' as result;
  /*  set LogUserName=(select Email from mst_user where mstuserid=UCUserby);
  set Logstring=concat(LogUserName," User Vs Capability Insert  ");
 set Logstring=concat_ws(',',Logstring,' UCMstUserId ',UCMstUserId,' UCMstMenuId ',UCMstMenuId,' UCViewpermission ',UCViewpermission,' UCAddpermission ',UCAddpermission,
' UCModifiypermission ',UCModifiypermission,' UCDeletepermission ',UCDeletepermission,' UCBlockpermission ',UCBlockpermission,
 ' UCflag ',UCflag);
call InsertUserLog(9, '1', UCUserby, Logstring);*/
end;
end if;
if UCflag=3 then
begin
update trn_uservscapability set Deletedby=UCUserby,Deleteddate=now() where TrnroleusercapId=UCTrnroleusercapId;
 select 'D' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UCUserby);
  set Logstring=concat(LogUserName," User Vs Capability Insert  ");
 set Logstring=concat_ws(',',Logstring,' UCMstUserId ',UCMstUserId,' UCMstMenuId ',UCMstMenuId,' UCViewpermission ',UCViewpermission,' UCAddpermission ',UCAddpermission,
' UCModifiypermission ',UCModifiypermission,' UCDeletepermission ',UCDeletepermission,' UCBlockpermission ',UCBlockpermission,
 ' UCflag ',UCflag);
call InsertUserLog(9, '1', UCUserby, Logstring);
end;
end if;

if UCflag=4 then
begin
update trn_uservscapability set Blockedby=UCUserby,Blockeddate=now() where TrnroleusercapId=UCTrnroleusercapId;
 select 'B' as result;
    set LogUserName=(select Email from mst_user where mstuserid=UCUserby);
  set Logstring=concat(LogUserName," User Vs Capability Insert  ");
 set Logstring=concat_ws(',',Logstring,' UCMstUserId ',UCMstUserId,' UCMstMenuId ',UCMstMenuId,' UCViewpermission ',UCViewpermission,' UCAddpermission ',UCAddpermission,
' UCModifiypermission ',UCModifiypermission,' UCDeletepermission ',UCDeletepermission,' UCBlockpermission ',UCBlockpermission,
 ' UCflag ',UCflag);
call InsertUserLog(9, '1', UCUserby, Logstring);
end;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Loginvalid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Loginvalid`(
UUserID varchar(100),
UPassword varchar(100)
)
BEGIN
declare MUserid bigint;
Declare Logstring text;
if exists(select Username from mst_user where Username=UUserID and Deletedby is null and Blockedby is null) then 
begin
 select 'Y' as result;
 select MstuserId, UserId, Username, Firstname, Lastname, Email, Profileimg, Currentpassword as Password,
 Oldpassword, MstRoleId,Passwordstatus from mst_user where Username=UUserID and Deletedby is null and Blockedby is null ;
select  UC.TrnroleusercapId,UC.MstRoleId,UC.MstUserId,UC.MstMenuId,UC.Viewpermission,UC.Addpermission,UC.Modifiypermission,
UC.Deletepermission,UC.Blockpermission,M.MenuName
 from trn_uservscapability UC
Left join mst_menu M on UC.MstMenuId=M.MstMenuId
where UC.Deletedby  is null and  UC.MstuserId=(select MstuserId from mst_user where Username=UUserID  and Deletedby is null and Blockedby is null);
set MUserid=(select MstuserId from mst_user where Username=UUserID and Deletedby is null and Blockedby is null) ;
set Logstring=concat(UUserID,"Login Successfull");
call InsertUserLog(17, '1', MUserid, Logstring);
END;
else
begin

 select 'N' as result;

END;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`%` PROCEDURE `new_procedure`(
VPlant int,
VCustomer int,VCoalfields int,VMine int,
VBench int,VPiles int
)
BEGIN
Select TP.Filepath_O,TP.Filename_O from 
trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId 
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId
Left join mst_customer mc on mc.MstCustId=B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId=B.MstMineId
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId
where TP.Deletedby is null and TP.Blockedby is null and

(
CASE WHEN   VPlant= 0 then mp.MstPlantId is not null else  mp.MstPlantId= VPlant End   
   
 
) and PB.Deletedby is null  and B.Deletedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby is null and mm.Deletedby is null and TC.Deletedby is null;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProfileRights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `ProfileRights`(UUserID bigint)
BEGIN
declare MUserid bigint;
Declare Logstring text;
 if exists(select MstuserId from mst_user where MstuserId=UUserID  and Deletedby is null and Blockedby is null) then
 
 Begin
 select 'Y' as result;
 select MstuserId, UserId, Username, Firstname, Lastname, Email, Profileimg, Currentpassword as Password,
 Oldpassword, MstRoleId,Passwordstatus from mst_user where MstuserId=UUserID and Deletedby is null and Blockedby is null ;
select  UC.TrnroleusercapId,UC.MstRoleId,UC.MstUserId,UC.MstMenuId,UC.Viewpermission,UC.Addpermission,UC.Modifiypermission,
UC.Deletepermission,UC.Blockpermission,M.MenuName
 from trn_uservscapability UC
Left join mst_menu M on UC.MstMenuId=M.MstMenuId
where UC.Deletedby  is null and  UC.MstuserId=(select MstuserId from mst_user where MstuserId=UUserID  and Deletedby is null and Blockedby is null);
set MUserid=(select MstuserId from mst_user where MstuserId=UUserID and Deletedby is null and Blockedby is null) ;
set Logstring=concat(UUserID,"Profile rights Check");
call InsertUserLog(17, '1', MUserid, Logstring);

END;
else
Begin
select 'N' as Result;
set MUserid=(select MstuserId from mst_user where MstuserId=UUserID and Deletedby is null and Blockedby is null) ;
set Logstring=concat(UUserID,"Profile rights Check- Not Valid");
call InsertUserLog(17, '1', MUserid, Logstring);
End;
end if;

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PythonUpdatePilesPhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `PythonUpdatePilesPhotos`(
PTrnpilesphotosId int,
Filename varchar(500),
Filepath varchar(500),
PUserby smallint,
PUserdate datetime,
Pflag int(100)

)
BEGIN
 
Declare Logstring text;
Declare LogUserName varchar(500);
 
if Pflag=1 then
/*Final Image Update*/
begin
 update trn_pilephotos set Filename_F=PFilename,Filepath_F=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Final(_F) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_F',PFilename,
' Filepath_F ',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=2 then
/*HG Image Update*/
begin
 update trn_pilephotos set Filename_HG=PFilename,Filepath_HG=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Histogram(_HG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_HG',PFilename,
' Filepath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=3 then
/*CHG Image Update*/
begin
 update trn_pilephotos set Filename_CHG=PFilename,Filepath_CHG=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Histogram(_CHG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_CHG',PFilename,
' Filepath_CHG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=4 then
/*TextFile_HG Image Update*/
begin
 update trn_pilephotos set 
 
 txtFilePath_HG=PFilepath, txtFilename_HG=PFilename,
 
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - TextFile Path Histogram(_HG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' txtFilePath_HG',PFilename,
' txtFilePath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=5 then
/*TextFile_CHG Image Update*/
begin
 update trn_pilephotos set  txtFilePath_CHG=PFilepath, txtFilename_CHG=PFilename,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - TextFile Path Histogram(_CHG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' txtFilePath_CHG',PFilename,
' txtFilePath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QuerySend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `QuerySend`(Qstring varchar(8000))
BEGIN
/*declare s varchar(8000);*/
      
        set @s=CONCAT('select TP.Pileno,PB.Sitename, PB.siteID, B.MstbenchId,B.BenchId,B.MstPlantId,PB.TrnSiteId,
        B.MstCustId,B.MstCoalfieldId,B.MstMineId,B.Benchname,B.Benchtype,mc.Customername,mcf.Coalfieldname,
        mm.MineName,mp.PlantName from trn_pilephotos TP Left join trn_preblast PB on PB.TrnSiteId = TP.TrnSiteId 
         Left Join mst_bench B on
        B.MstbenchId = PB.MstbenchId 
        Left join mst_plant mp on mp.MstPlantId = B.MstPlantId 
        Left join mst_customer mc on mc.MstCustId = B.MstCustId 
        Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId 
        Left join mst_mines mm on mm.MstMineId = B.MstMineId
         
        where TP.Deletedby is null and PB.Deletedby is null and mm.Deletedby is null and B.Deletedby is null and mp.Deletedby is null and mcf.Deletedby is null  and mc.Deletedby is null  ',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;

set @s=CONCAT(' Select TP.Filepath_O as Filepath, TP.Filename_O as Filename from trn_pilephotos TP
 Left join trn_preblast PB on PB.TrnSiteId
 = TP.TrnSiteId
 Left Join mst_bench B on B.MstbenchId = PB.MstbenchId 
 Left join mst_plant mp on mp.MstPlantId = B.MstPlantId 
 Left join mst_customer mc on mc.MstCustId 
 = B.MstCustId
 Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId
 Left join mst_mines mm on mm.MstMineId = B.MstMineId
 Left join trn_cornerphotos TC on
 TC.trnsiteID = TP.TrnSiteId
 where TP.Deletedby is null
 and PB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null and mc.Deletedby is null and mcf.Deletedby
 is null  and mm.Deletedby is null  and TC.Deletedby is null 
 and TP.Blockedby is null',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    
    set @s=CONCAT(' Select TP.Filepath_F as Filepath , TP.Filename_F  as Filename from  trn_pilephotos TP 
Left  join trn_preblast PB on PB.TrnSiteId = TP.TrnSiteId
 Left Join mst_bench B on B.MstbenchId = PB.MstbenchId
Left join mst_plant mp on mp.MstPlantId = B.MstPlantId
Left join mst_customer mc on mc.MstCustId = B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId = B.MstMineId
Left join trn_cornerphotos TC on TC.trnsiteID = TP.TrnSiteId
 where TP.Deletedby is null and PB.Deletedby is null and B.Deletedby is null  and mp.Deletedby is null  and mc.Deletedby is null
 and mcf.Deletedby is null  and mm.Deletedby is null  and TC.Deletedby is null
 and TP.Blockedby is null',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    
        set @s=CONCAT(' Select TC.CRTRPath  as Filepath, TC.CRTRName as Filename from trn_cornerphotos TC 
 Left join trn_preblast PB on PB.TrnSiteId = TC.TrnSiteId  
Left Join mst_bench B on B.MstbenchId = PB.MstbenchId  
Left join mst_plant mp on mp.MstPlantId = B.MstPlantId 
Left join mst_customer mc on mc.MstCustId = B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId
        Left join mst_mines mm on mm.MstMineId = B.MstMineId
 Left join  trn_pilephotos TP  on TP.TrnSiteId = PB.TrnSiteId
 where    TC.Deletedby is null and PB.Deletedby is null and B.Deletedby is null and mp.Deletedby is null and mc.Deletedby is null 
 and mcf.Deletedby is null and mm.Deletedby is null and TP.Deletedby is null
 ',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
      
        set @s=CONCAT(' Select TC.CRTLPath  as Filepath, TC.CRTLName as Filename from trn_cornerphotos TC 
 Left join trn_preblast PB on PB.TrnSiteId = TC.TrnSiteId 
 Left Join mst_bench B on B.MstbenchId = PB.MstbenchId 
Left join mst_plant mp on mp.MstPlantId = B.MstPlantId
Left join mst_customer mc on mc.MstCustId = B.MstCustId  
Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId = B.MstMineId 
Left join  trn_pilephotos TP  on TP.TrnSiteId = PB.TrnSiteId and TP.Deletedby is null  
where    TC.Deletedby is null  and PB.Deletedby is null and B.Deletedby is null  and mp.Deletedby is null  and mc.Deletedby is null
 and mcf.Deletedby is null  and mm.Deletedby is null
',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
      
          
        set @s=CONCAT(' Select TC.CRBRPath  as Filepath, TC.CRBRName as Filename from trn_cornerphotos TC 
 Left join trn_preblast PB on PB.TrnSiteId = TC.TrnSiteId 
Left Join mst_bench B on B.MstbenchId = PB.MstbenchId 
Left join mst_plant mp on mp.MstPlantId = B.MstPlantId
Left join mst_customer mc on mc.MstCustId = B.MstCustId
Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId
Left join mst_mines mm on mm.MstMineId = B.MstMineId  
Left join  trn_pilephotos TP  on TP.TrnSiteId = PB.TrnSiteId
where    TC.Deletedby is null and PB.Deletedby is null  and B.Deletedby is null  and mp.Deletedby is null  and mc.Deletedby is null  and mcf.Deletedby is null  
 and mm.Deletedby is null and TP.Deletedby is null 
 ',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    
       
        set @s=CONCAT(' Select TC.CRBLPath  as Filepath, TC.CRBLName as Filename from trn_cornerphotos TC 
 Left join trn_preblast PB on PB.TrnSiteId = TC.TrnSiteId
 Left Join mst_bench B on B.MstbenchId = PB.MstbenchId
Left join mst_plant mp on mp.MstPlantId = B.MstPlantId
Left join mst_customer mc on mc.MstCustId = B.MstCustId 
Left join mst_coalfield mcf on mcf.MstcoalfieldId = B.MstCoalfieldId 
Left join mst_mines mm on mm.MstMineId = B.MstMineId
Left join  trn_pilephotos TP  on PB.TrnSiteId 
where    TC.Deletedby is null
 and PB.Deletedby is null  and B.Deletedby is null  and mp.Deletedby is null  and mc.Deletedby is null  and mcf.Deletedby is null
 and mm.Deletedby is null  and TP.Deletedby is null 
 ',Qstring);
 /*SET @s = CONCAT(Qstring);*/
    PREPARE stmt FROM @s;
    EXECUTE stmt;
select 'S' as Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TestingProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `TestingProcedure`()
BEGIN

DECLARE a INT Default 1 ;
  simple_loop: LOOP     
 

INSERT INTO trn_preblast
(
MstbenchId,
SiteId,
Sitename,
BlastHoleDiameter,
DrillingPattern,
NoofHoles,
ExcavatorType,
ExcavatorCapacity,
RockType,
StrataCondition,
BenchHeight,
AverageHoledepth,
Spacing,
Burden,
TotalChargePerround,
MaximumChargePerHole,
FiringSequence,
VolumeoftheBlast,
PowderFactor,
BlastDiagram,
PumpTruckNo,
DrillDia,
Location,
BoosterUsed,
Date,
Createdby,
Createddate)
VALUES
(
'83', 'Si0001', 'Test siteName18', '18', 'Test drilling pattern', '4', 'Test Excavator Type', '18', 'Test Rock', 'Test Strata', '18', '18', '18', '18', '18', '18', 'Test Firing', '18', '18', '/Datafiles/BlastDiagram/Test_Plant18-Cu0021-Cf0021-Mine_18-Bh0020-BlastDiagram-20210426181408.jpg', '18', '18', 'Test Location', '18', '2021-04-26 00:00:00', '2', '2021-04-26 18:14:38'
);

    SET a=a+1;
    IF a=10000 THEN
      LEAVE simple_loop;
    END IF;
 END LOOP simple_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `View_Photos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `View_Photos`(
VPlant int,
VCustomer int,VCoalfields int,VMine int,
VBench int,VPiles int
)
BEGIN
 
create temporary table pilephotos(id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY ,Filepath varchar(1000),FileName varchar(1000));
 insert into pilephotos (Filepath,FileName) (Select TP.Filepath_O,TP.Filename_O from 
trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId and TC.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null and
 
(CASE WHEN  B.MstbenchId= 0 then '' else B.MstbenchId= VBench End OR 
CASE WHEN  mp.MstPlantId= 0 then '' else  mp.MstPlantId= VPlant End OR 
CASE WHEN  TP.Pileno= 0 then '' else TP.Pileno=VPiles End OR 
CASE WHEN  mc.MstCustId= 0 then '' else mc.MstCustId= VCustomer End OR 
CASE WHEN  mcf.MstCoalfieldId= 0 then '' else  mcf.MstCoalfieldId= VCoalfields End OR 
CASE WHEN  mm.MstMineId =0 then '' else  mm.MstMineId =VMine End  
 
));
 
insert into pilephotos  (Filepath,FileName) (Select TP.Filepath_F,TP.Filename_F from 
trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId and TC.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or   TP.Pileno=VPiles or
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos  (Filepath,FileName) (Select TP.Filepath_HG,TP.Filename_HG from 
trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId and TC.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or   TP.Pileno=VPiles or
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos  (Filepath,FileName) (Select TP.Filepath_CHG,TP.Filename_CHG from 
trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId and TC.Deletedby is null
where TP.Deletedby is null and TP.Blockedby is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or   TP.Pileno=VPiles or
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos  (Filepath,FileName) (Select TC.CRTRPath, TC.CRTRName from 
trn_cornerphotos TC
 
Left join trn_preblast PB on PB.TrnSiteId=TC.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null

where    TC.Deletedby is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or    
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos (Filepath,FileName)  (Select TC.CRTLPath, TC.CRTLName from 
trn_cornerphotos TC
 
Left join trn_preblast PB on PB.TrnSiteId=TC.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null

where   TC.Deletedby is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or    
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos  (Filepath,FileName) (Select TC.CRBLPath, TC.CRBLName from 
trn_cornerphotos TC
 
Left join trn_preblast PB on PB.TrnSiteId=TC.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null

where   TC.Deletedby is null and
 
 (B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or    
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
));

insert into pilephotos  (Filepath,FileName) (Select TC.CRBRPath ,TC.CRBRName from 
trn_cornerphotos TC
 
Left join trn_preblast PB on PB.TrnSiteId=TC.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null

where      TC.Deletedby is null and
 
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or    
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine
)); 
select * from pilephotos where Filepath is not null; 
DROP TEMPORARY TABLE pilephotos;
 
select B.MstbenchId,B.BenchId,B.Benchname,B.Benchtype,B.MstPlantId,TP.Filename_O,TP.Filepath_O,
B.MstCustId,B.MstCoalfieldId,B.MstMineId,mc.Customername,TC.CRTRName, 
TP.Filename_F,TP.Filepath_F,TP.Filename_HG,TP.Filepath_HG,TP.Filename_CHG,TP.Filepath_CHG,
TC.CRTRPath, TC.CRTLName, TC.CRTLPath, TC.CRBLName, TC.CRBLPath, TC.CRBRName, TC.CRBRPath ,
mcf.Coalfieldname,mm.MineName,mp.PlantName from trn_pilephotos TP 
Left join trn_preblast PB on PB.TrnSiteId=TP.TrnSiteId and PB.Deletedby is null
Left Join mst_bench B on B.MstbenchId=PB.MstbenchId and B.Deletedby is null
Left join mst_plant mp on mp.MstPlantId=B.MstPlantId and mp.Deletedby is null
Left join mst_customer mc on mc.MstCustId=B.MstCustId and mc.Deletedby is null
Left join mst_coalfield mcf on mcf.MstcoalfieldId=B.MstCoalfieldId and mcf.Deletedby is null
Left join mst_mines mm on mm.MstMineId=B.MstMineId and mm.Deletedby is null
Left join trn_cornerphotos TC on TC.trnsiteID =TP.TrnSiteId and TC.Deletedby is null
where TP.Deletedby  is null and TP.BlockedBy is null and
 
(B.MstbenchId= VBench OR  mp.MstPlantId= VPlant or   TP.Pileno=VPiles or
  mc.MstCustId= VCustomer or  mcf.MstCoalfieldId= VCoalfields or  mm.MstMineId =VMine);
/*PB.MstbenchId like CONCAT('%', VBench , '%')  or B.MstPlantId like CONCAT('%', VPlant , '%') 
or B.MstMineId like CONCAT('%', VMine , '%')  or B.MstCoalfieldId like CONCAT('%', VCoalfields , '%')  or 
B.MstCustId like CONCAT('%', VCustomer , '%') )*/
 
END ;;
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

-- Dump completed on 2021-05-05 18:36:11
