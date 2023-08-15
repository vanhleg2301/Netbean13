-- use Booking;

-- CREATE TABLE `clinics` (
--   `clinic_id` INT NOT NULL AUTO_INCREMENT,
--   `clinic_name` VARCHAR(100) NOT NULL,
--   `location` VARCHAR(200) NOT NULL,
--   `phone_number` VARCHAR(20) NOT NULL,
--   `email` VARCHAR(100) NOT NULL,
--   PRIMARY KEY (`clinic_id`)
-- );

-- INSERT INTO `clinics` (`clinic_name`, `location`, `phone_number`, `email`)
-- VALUES
--   ('ABC Clinic', '123 Main Street, City, Country', '1234567890', 'abc@example.com'),
--   ('XYZ Clinic', '456 Elm Street, City, Country', '9876543210', 'xyz@example.com'),
--   ('PQR Clinic', '789 Oak Street, City, Country', '5555555555', 'pqr@example.com');


-- select * from clinics;

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: doctris_system
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `appointments`
--
select concat_ws(cs.id,d.category_id)id,
                cs.name, cs.setting_id ,cs.status,
                d.doctor_id,d.role_id,d.doctor_name,d.username,
				d.gender,d.DOB,d.phone,d.description,d.status,d.img,d.fee,d.position 
                from Booking.doctor d inner join Booking.category_service cs 
                on d.category_id = cs.id ORDER BY RAND() LIMIT 8;
                
select * from appointments;
select * from doctor;
select * from category_blog;
select * from blog;
select * from category_service;
select * from comment_blog;
select * from doctor_service;
select * from like_blog;
select * from patient;
select * from ratestar;
select * from reservations;
select * from role;
select * from users;
select * from service;
select * from timetable;
select * from verification;

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `staff` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` double NOT NULL,
  `payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`appointment_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `appointments_ibfk_3_idx` (`staff`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,16,5,'tuoidt','2022-02-18','11:03:00','Khám lộ trình thai sản ','Assigned',532423,''),(2,19,1,'senle1423','2022-03-03','11:03:00','Tư vấn về quá trình thai sản','Complete',356000,''),(3,19,9,'tuoidt','2022-02-19','05:20:00','Tư vấn , điều trị tràn dịch khớp','Complete',500000,''),(4,20,5,'tuoidt','2022-03-02','20:23:00','Tư vấn , điều trị tràn dịch khớp','Complete',750000,''),(5,19,9,'senle1423','2022-03-02','11:30:00','Tư vấn , điều trị tràn dịch khớp','Complete',350000,''),(6,19,5,'senle1423','2022-03-11','11:30:00','Tư vấn , điều trị tràn dịch khớp','Complete',750000,''),(53,18,5,'tuoidt','2022-03-13','07:00:00','rjeje5','Complete',500000,'success'),(54,22,9,'viethoang213','2022-03-13','07:00:00','đói','Complete',500000,'success'),(55,16,5,'viethoang213','2022-03-14','07:00:00','jftjt','Complete',350000,'success'),(56,16,5,'lamtt5','2022-03-14','07:00:00','drjdj','Complete',350000,'success'),(57,17,5,'viethoang213','2022-03-14','07:00:00','ẻhh','Complete',450000,'success'),(58,19,5,'lamtt5','2022-03-14','07:00:00','tjt','Assigned',500000,'failed'),(59,18,5,'tuoidt','2022-03-15','07:00:00','rttjjr','Assigned',500000,'Pending'),(60,18,5,'lamtt5','2022-03-15','07:00:00','eherh','Assigned',500000,'success'),(61,16,5,'lamtt5','2022-03-15','07:00:00','rheh','Complete',350000,'Pending'),(62,17,5,'tuoidt','2022-03-15','07:00:00','ưegg','Pending',450000,'success'),(63,16,5,'viethoang213','2022-03-15','07:00:00','rhr','Assigned',350000,'failed'),(64,16,5,'lamtt5','2022-03-21','07:00:00','fjtrjr','Assigned',350000,'Pending'),(65,16,5,'lamtt5','2022-03-21','07:00:00','kưeg','Assigned',350000,'success');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `img` longblob,
  `describe` longtext NOT NULL,
  `date` date NOT NULL,
  `featured` tinyint DEFAULT NULL,
  `username` varchar(250) NOT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `category_id` (`category_id`),
  KEY `blog_ibfk_1_idx` (`username`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

 
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_blog`
--

DROP TABLE IF EXISTS `category_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_id` int NOT NULL,
  `order` int DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_blog`
--

LOCK TABLES `category_blog` WRITE;
/*!40000 ALTER TABLE `category_blog` DISABLE KEYS */;
INSERT INTO `category_blog` VALUES (1,'Blog về Răng Lợi',2,1,'Các bài viết về răng lợi',1),(2,'Blog về Tim Mạch ',2,2,'Các bài viết bổ ích cho tim mạch',1),(4,'Blog về Trung',2,6,'',0),(5,'Blog về Gan',2,6,'cơ quan Gan',1),(6,'Blog về Thận',2,6,'Cơ quan Thận',1);
/*!40000 ALTER TABLE `category_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_service`
--

DROP TABLE IF EXISTS `category_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `setting_id` int NOT NULL,
  `order` int DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_service`
--

LOCK TABLES `category_service` WRITE;
/*!40000 ALTER TABLE `category_service` DISABLE KEYS */;
INSERT INTO `category_service` VALUES (2,'Sản - Phụ khoa ',3,1,'Dịch vụ về Sản - Phụ khoa ',1),(3,'Khoa Xương khớp',3,2,'Dịch vụ về xương khớp',1),(4,'Khoa Nhi',3,3,'Dịch vụ về khám chữ bệnh cho trẻ',1),(5,'Khoa Tim mạch',3,4,'Dịch vụ về tim mạch',1),(6,'Khoa Nội – Hô hấp',3,5,'Dịch vụ về hô hấp và các bệnh liên quan',1),(7,'Tai - Mũi - Họng',3,6,'Dịch vụ về chăm sóc tai mũi họng',1),(8,'Khoa Nội tiết',3,7,'Dịch vụ về nội tiết',1);
/*!40000 ALTER TABLE `category_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_blog`
--

DROP TABLE IF EXISTS `comment_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_blog` (
  `username` varchar(250) NOT NULL,
  `blog_id` int NOT NULL,
  `date` date NOT NULL,
  `describe` longtext NOT NULL,
  KEY `blog_id` (`blog_id`),
  KEY `username` (`username`),
  CONSTRAINT `comment_blog_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_blog_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_blog`
--

LOCK TABLES `comment_blog` WRITE;
/*!40000 ALTER TABLE `comment_blog` DISABLE KEYS */;
INSERT INTO `comment_blog` VALUES ('lamtt5',3,'2022-01-24','Bác sĩ Lam giỏi quá <3'),('lamtt5',3,'2022-01-24','Blog thật hữu ích'),('lamtt5',3,'2022-01-24','Mō ichi-nen tachimashita');
/*!40000 ALTER TABLE `comment_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `Category_id` int DEFAULT NULL,
  `doctor_name` varchar(350) DEFAULT NULL,
  `username` varchar(250) NOT NULL,
  `position` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `description` longtext,
  `status` tinyint(1) DEFAULT NULL,
  `img` longblob,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `role_id` (`role_id`),
  KEY `doctor_ibfk_2_idx` (`Category_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `category_service` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;

/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_service`
--

DROP TABLE IF EXISTS `doctor_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_service` (
  `doctor_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`service_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `doctor_service_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_service`
--

LOCK TABLES `doctor_service` WRITE;
/*!40000 ALTER TABLE `doctor_service` DISABLE KEYS */;
INSERT INTO `doctor_service` VALUES (16,3),(17,3),(18,4),(18,5),(19,4),(19,5);
/*!40000 ALTER TABLE `doctor_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_blog`
--

DROP TABLE IF EXISTS `like_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_blog` (
  `username` varchar(250) NOT NULL,
  `blog_id` int NOT NULL,
  `isLike` tinyint(1) NOT NULL,
  KEY `blog_id` (`blog_id`),
  KEY `username` (`username`),
  CONSTRAINT `like_blog_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE,
  CONSTRAINT `like_blog_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_blog`
--

LOCK TABLES `like_blog` WRITE;
/*!40000 ALTER TABLE `like_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `address` longtext,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'trungnvhe150239',2,1,'Hòa Lạc','2001-07-25'),(5,'hahuuviet',2,1,'Lạng Sơn','2001-08-09'),(9,'sonnt',2,1,'Phú Thọ','1999-12-09');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratestar`
--

DROP TABLE IF EXISTS `ratestar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratestar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `doctor_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `star` int NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `username` (`username`),
  CONSTRAINT `ratestar_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `ratestar_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE,
  CONSTRAINT `ratestar_ibfk_3` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratestar`
--

LOCK TABLES `ratestar` WRITE;
/*!40000 ALTER TABLE `ratestar` DISABLE KEYS */;
INSERT INTO `ratestar` VALUES (1,'anhong',NULL,3,5,'dịch vụ tốt','2022-02-21 01:59:45'),(2,'bichngoc',NULL,4,5,'dịch vụ tốt','2022-02-21 02:59:45'),(3,'hahuuviet',NULL,5,5,'dịch vụ tốt','2022-02-21 03:59:45'),(4,'hung2408',NULL,6,5,'dịch vụ tốt','2022-02-21 04:59:45'),(5,'hungkv',NULL,3,4,'dịch vụ khá ổn','2022-02-21 06:59:45'),(6,'lamtt3',NULL,3,5,'dịch vụ rất tốt','2022-02-21 05:59:45'),(7,'hahuuviet',16,NULL,5,'bác sĩ tận tình','2022-02-21 05:59:45'),(8,'hungkv',16,NULL,4,'Khám bệnh tốt','2022-02-21 05:59:45'),(9,'hung2408',16,NULL,5,'Bác sĩ rất nhiệt tình, đánh giá 5 sao luôn ','2022-02-22 09:59:45'),(10,'phantruongthao199',16,NULL,2,'Làm việc quá chậm , phải chờ lâu','2022-02-24 12:59:45');
/*!40000 ALTER TABLE `ratestar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `service_id` int NOT NULL,
  `staff` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `patient_id` (`patient_id`),
  KEY `service_id` (`service_id`),
  KEY `staff` (`staff`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON UPDATE CASCADE,
  CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`staff`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (3,1,4,'lamtt5','2022-02-23','07:40:00','Assigned','Khám tổng quan về xương',''),(4,5,8,'testsystem','2022-02-28','09:30:00','Complete','Khám về máu',''),(5,9,11,'tuoidt','2022-02-28','15:40:00','Complete','Khám tổng quát về tim mạch',''),(6,5,11,'tuoidt','2022-03-02','20:20:00','Complete','Khám tổng quát về tim mạch',''),(7,5,8,'lamtt5','2022-03-03','10:00:00','Complete','Khám về máu',''),(8,5,11,'lamtt5','2022-03-03','15:40:00','Complete','Khám tổng quan về xương',''),(40,5,5,'tuoidt','2022-03-13','07:00:00','Complete','hưiuebgksjdv ','success'),(41,5,3,'tuoidt','2022-03-15','07:00:00','Complete','fhdh','Pending');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `setting_id` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin',1,1,'Quyền quản trị ',1),(2,'Patient',1,2,'Khách hàng , Bệnh nhân',1),(3,'Doctor',1,3,'Bác sĩ',1),(4,'Staff',1,4,'Nhân viên',1),(5,'Marketting',1,5,'Quyền Marketting',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `fee` double NOT NULL,
  `description` longtext NOT NULL,
  `img` longblob NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `service_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(250) NOT NULL,
  `role_id` int NOT NULL,
  `password` varchar(350) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(350) NOT NULL,
  `img` longblob,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification` (
  `username` varchar(250) NOT NULL,
  `captcha` longtext NOT NULL,
  `lifetime` int DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification`
--

LOCK TABLES `verification` WRITE;
/*!40000 ALTER TABLE `verification` DISABLE KEYS */;
INSERT INTO `verification` VALUES ('hung2408','=AmeGyF7m6yQ7?=w',1647867262);
/*!40000 ALTER TABLE `verification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 23:05:06
