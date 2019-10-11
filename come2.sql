-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Eki 2019, 20:47:21
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `come2`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(20) NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `class_no` varchar(20) NOT NULL,
  `lesson_name` varchar(20) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `course_attandance` int(20) NOT NULL,
  `course_content` text NOT NULL,
  `course_hours` int(20) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int(20) NOT NULL,
  `exam_name` varchar(20) NOT NULL,
  `exam_attadence` varchar(20) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_class` varchar(20) NOT NULL,
  `exam_hours` time(6) NOT NULL,
  `std_id` int(20) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `std_id` (`std_id`),
  KEY `exam_class` (`exam_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `std_id` int(20) NOT NULL,
  `std_name` varchar(20) NOT NULL,
  `std_surname` varchar(20) NOT NULL,
  `std_phone no` varchar(20) NOT NULL,
  `std_age` int(20) NOT NULL,
  `std_mail` varchar(30) NOT NULL,
  `std_gender` text NOT NULL,
  `std_class` int(20) NOT NULL,
  PRIMARY KEY (`std_id`),
  KEY `std_class` (`std_class`),
  KEY `std_class_2` (`std_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `student`
--

INSERT INTO `student` (`std_id`, `std_name`, `std_surname`, `std_phone no`, `std_age`, `std_mail`, `std_gender`, `std_class`) VALUES
(171501550, 'Furkan ', 'Yazgan', '05559658264', 19, 'Furkanyazgan90@gmail.com', 'male', 1),
(171502265, 'Doruk', 'Poyraz', '05526318745', 22, 'Doruk99@gmail.com', 'male', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` int(20) NOT NULL,
  `teacher_mail` text NOT NULL,
  `teacher_phone no` int(20) NOT NULL,
  `teacher_course` int(20) NOT NULL,
  `teacher_age` int(20) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_profission` text NOT NULL,
  `std_id` int(20) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  KEY `teacher_course` (`teacher_course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `exams` (`std_id`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`std_id`);

--
-- Tablo kısıtlamaları `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `student` (`std_id`),
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`teacher_course`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
