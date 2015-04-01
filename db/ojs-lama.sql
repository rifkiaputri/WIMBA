-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2015 at 05:26 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ojs`
--
CREATE DATABASE IF NOT EXISTS `ojs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ojs`;

-- --------------------------------------------------------

--
-- Table structure for table `access_keys`
--

CREATE TABLE IF NOT EXISTS `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_types`
--

CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_type_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `comments_to_ed` text,
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `current_round` tinyint(4) NOT NULL DEFAULT '1',
  `submission_file_id` bigint(20) DEFAULT NULL,
  `revised_file_id` bigint(20) DEFAULT NULL,
  `review_file_id` bigint(20) DEFAULT NULL,
  `editor_file_id` bigint(20) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `fast_tracked` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `comments_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`),
  KEY `articles_user_id` (`user_id`),
  KEY `articles_journal_id` (`journal_id`),
  KEY `articles_section_id` (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `locale`, `user_id`, `journal_id`, `section_id`, `language`, `comments_to_ed`, `citations`, `date_submitted`, `last_modified`, `date_status_modified`, `status`, `submission_progress`, `current_round`, `submission_file_id`, `revised_file_id`, `review_file_id`, `editor_file_id`, `pages`, `fast_tracked`, `hide_author`, `comments_status`) VALUES
(1, 'en_US', 2, 1, 1, 'en', '', '', '2015-03-05 12:22:01', '2015-03-05 12:22:01', '2015-03-05 12:22:01', 1, 0, 1, 1, NULL, 2, NULL, NULL, 0, 0, 0),
(2, 'en_US', 3, 1, 1, 'en', '', 'abc, 1,2,3\r\nabd, 1,3,4\r\n\r\nasc, 2,3,4', '2015-03-16 03:47:16', '2015-03-18 16:48:04', '2015-03-18 16:48:04', 3, 0, 1, NULL, NULL, 4, 3, NULL, 0, 0, 0),
(7, 'en_US', 2, 1, 1, 'en', NULL, NULL, NULL, '2015-03-19 10:31:48', '2015-03-19 10:31:48', 1, 3, 1, 8, NULL, NULL, NULL, NULL, 0, 0, 0),
(8, 'en_US', 3, 1, 1, 'en', NULL, '', '2015-03-20 08:05:39', '2015-03-20 09:29:38', '2015-03-20 09:21:01', 3, 0, 1, 9, NULL, 10, 11, NULL, 0, 0, 0),
(15, 'en_US', 3, 1, 1, 'en', NULL, NULL, '2015-03-21 09:45:43', '2015-03-21 09:45:44', '2015-03-21 09:45:43', 1, 0, 1, 20, NULL, 33, NULL, NULL, 0, 0, 0),
(20, 'en_US', 3, 1, 1, 'en', NULL, NULL, '2015-03-21 09:58:04', '2015-03-24 00:59:10', '2015-03-24 00:59:10', 1, 0, 1, 34, 42, 36, NULL, NULL, 0, 0, 0),
(21, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 10:11:20', '2015-03-21 10:11:20', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(22, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 10:25:52', '2015-03-21 10:25:52', 1, 3, 1, 37, NULL, NULL, NULL, NULL, 0, 0, 0),
(23, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 10:29:40', '2015-03-21 10:29:40', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(24, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 10:49:16', '2015-03-21 10:35:07', 1, 3, 1, 38, NULL, NULL, NULL, NULL, 0, 0, 0),
(25, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 10:55:18', '2015-03-21 10:55:18', 1, 3, 1, 39, NULL, NULL, NULL, NULL, 0, 0, 0),
(26, 'en_US', 3, 1, 1, 'en', NULL, NULL, NULL, '2015-03-21 11:45:45', '2015-03-21 10:59:22', 1, 3, 1, 40, NULL, NULL, NULL, NULL, 0, 0, 0),
(27, 'en_US', 3, 1, 1, 'en', NULL, NULL, '2015-03-24 07:22:12', '2015-03-24 07:32:19', '2015-03-24 07:32:19', 3, 0, 1, NULL, NULL, 46, 47, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_comments`
--

CREATE TABLE IF NOT EXISTS `article_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` varchar(255) NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `article_comments_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_files`
--

CREATE TABLE IF NOT EXISTS `article_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `round` tinyint(4) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `article_files_article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `article_files`
--

INSERT INTO `article_files` (`file_id`, `revision`, `source_file_id`, `source_revision`, `article_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `file_stage`, `viewable`, `date_uploaded`, `date_modified`, `round`, `assoc_id`) VALUES
(1, 1, NULL, NULL, 1, '1-1-1-SM.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 22650, 'Academic Transcript.docx', 1, NULL, '2015-03-05 12:18:04', '2015-03-05 12:18:04', 1, NULL),
(2, 1, 1, NULL, 1, '1-2-1-RV.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 22650, '1-1-1-SM.docx', 2, NULL, '2015-03-05 12:22:01', '2015-03-05 12:22:01', 1, NULL),
(3, 1, NULL, NULL, 2, '2-3-1-ED.pdf', 'application/pdf', 573484, 'makalah.pdf', 3, NULL, '2015-03-16 04:00:08', '2015-03-16 04:00:08', 1, NULL),
(3, 2, 4, 1, 2, '2-3-2-ED.pdf', 'application/pdf', 573484, '2-4-1-RV.pdf', 3, NULL, '2015-03-16 04:00:52', '2015-03-16 04:00:52', 1, NULL),
(4, 1, NULL, NULL, 2, '2-4-1-RV.pdf', 'application/pdf', 573484, 'makalah.pdf', 2, NULL, '2015-03-16 04:00:51', '2015-03-16 04:00:51', 1, NULL),
(8, 1, NULL, NULL, 7, '7-8-1-SM.pdf', 'application/pdf', 573484, 'makalah.pdf', 1, NULL, '2015-03-19 10:31:38', '2015-03-19 10:31:38', 1, NULL),
(9, 1, NULL, NULL, 8, '8-9-1-SM.pdf', 'application/pdf', 867105, '01_primadi.pdf', 1, NULL, '2015-03-20 08:01:28', '2015-03-20 08:01:28', 1, NULL),
(10, 1, 9, NULL, 8, '8-10-1-RV.pdf', 'application/pdf', 867105, '8-9-1-SM.pdf', 2, NULL, '2015-03-20 08:05:39', '2015-03-20 08:05:39', 1, NULL),
(11, 1, NULL, NULL, 8, '8-11-1-ED.pdf', 'application/pdf', 867105, '01_primadi.pdf', 3, NULL, '2015-03-20 09:16:52', '2015-03-20 09:16:52', 1, NULL),
(12, 1, NULL, NULL, 8, '8-12-1-CE.pdf', 'application/pdf', 867105, '01_primadi.pdf', 4, NULL, '2015-03-20 09:20:34', '2015-03-20 09:20:34', 1, NULL),
(13, 1, NULL, NULL, 8, '8-13-1-PB.pdf', 'application/pdf', 867105, '01_primadi.pdf', 7, NULL, '2015-03-20 09:29:24', '2015-03-20 09:29:24', 1, NULL),
(20, 1, NULL, NULL, 15, '15-20-1-SM.pdf', 'application/pdf', 323721, '08_henricus.pdf', 1, NULL, '2015-03-21 08:22:10', '2015-03-21 08:22:10', 1, NULL),
(29, 1, NULL, NULL, 15, '15-29-1-SP.pdf', 'application/pdf', 290941, '07_andhika.pdf', 6, NULL, '2015-03-21 09:08:08', '2015-03-21 09:08:08', 1, NULL),
(30, 1, NULL, NULL, 15, '15-30-1-SP.pdf', 'application/pdf', 683887, '06_iman.pdf', 6, NULL, '2015-03-21 09:08:23', '2015-03-21 09:08:23', 1, NULL),
(31, 1, NULL, NULL, 15, '15-31-1-SP.pdf', 'application/pdf', 323721, '08_henricus.pdf', 6, NULL, '2015-03-21 09:38:19', '2015-03-21 09:38:19', 1, NULL),
(32, 1, NULL, NULL, 15, '15-32-1-SP.pdf', 'application/pdf', 867105, '01_primadi.pdf', 6, NULL, '2015-03-21 09:41:44', '2015-03-21 09:41:44', 1, NULL),
(33, 1, 20, NULL, 15, '15-33-1-RV.pdf', 'application/pdf', 323721, '15-20-1-SM.pdf', 2, NULL, '2015-03-21 09:45:43', '2015-03-21 09:45:43', 1, NULL),
(34, 1, NULL, NULL, 20, '20-34-1-SM.pdf', 'application/pdf', 323721, '08_henricus.pdf', 1, NULL, '2015-03-21 09:56:56', '2015-03-21 09:56:56', 1, NULL),
(35, 1, NULL, NULL, 20, '20-35-1-SP.pdf', 'application/pdf', 290941, '07_andhika.pdf', 6, NULL, '2015-03-21 09:57:48', '2015-03-21 09:57:48', 1, NULL),
(36, 1, 34, NULL, 20, '20-36-1-RV.pdf', 'application/pdf', 323721, '20-34-1-SM.pdf', 2, NULL, '2015-03-21 09:58:05', '2015-03-21 09:58:05', 1, NULL),
(37, 1, NULL, NULL, 22, '22-37-1-SM.pdf', 'application/pdf', 323721, '08_henricus.pdf', 1, NULL, '2015-03-21 10:25:46', '2015-03-21 10:25:46', 1, NULL),
(38, 2, NULL, NULL, 24, '24-38-2-SM.pdf', 'application/pdf', 290941, '07_andhika.pdf', 1, NULL, '2015-03-21 10:49:16', '2015-03-21 10:49:16', 1, NULL),
(39, 1, NULL, NULL, 25, '25-39-1-SM.pdf', 'application/pdf', 323721, '08_henricus.pdf', 1, NULL, '2015-03-21 10:55:11', '2015-03-21 10:55:11', 1, NULL),
(40, 15, NULL, NULL, 26, '26-40-15-SM.pdf', 'application/pdf', 323721, '08_henricus.pdf', 1, NULL, '2015-03-21 11:45:45', '2015-03-21 11:45:45', 1, NULL),
(41, 1, NULL, NULL, 20, '20-41-1-RV.pdf', 'application/pdf', 2057990, '04_hafiz_alvanov.pdf', 2, NULL, '2015-03-23 12:17:07', '2015-03-23 12:17:07', 1, NULL),
(42, 1, NULL, NULL, 20, '20-42-1-ED.pdf', 'application/pdf', 290941, '07_andhika.pdf', 3, NULL, '2015-03-23 12:24:23', '2015-03-23 12:24:23', 1, NULL),
(43, 1, NULL, NULL, 20, '20-43-1-LE.pdf', 'application/pdf', 290941, '07_andhika.pdf', 5, NULL, '2015-03-23 16:26:54', '2015-03-23 16:26:54', 1, NULL),
(44, 1, NULL, NULL, 20, '20-44-1-PB.pdf', 'application/pdf', 290941, '07_andhika.pdf', 7, NULL, '2015-03-23 16:27:53', '2015-03-23 16:27:53', 1, NULL),
(45, 1, NULL, NULL, 27, '27-45-1-SP.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 190607, 'template_wimba_eng.docx', 6, NULL, '2015-03-24 07:21:24', '2015-03-24 07:21:24', 1, NULL),
(46, 1, NULL, NULL, 27, '27-46-1-RV.pdf', 'application/pdf', 484172, 'tatacara_artikel_wimba.pdf', 2, NULL, '2015-03-24 07:26:05', '2015-03-24 07:26:05', 1, NULL),
(47, 1, 46, 1, 27, '27-47-1-ED.pdf', 'application/pdf', 484172, '27-46-1-RV.pdf', 3, NULL, '2015-03-24 07:26:05', '2015-03-24 07:26:05', 1, NULL),
(48, 1, NULL, NULL, 27, '27-48-1-PB.pdf', 'application/pdf', 540165, 'template_wimba_eng.pdf', 7, NULL, '2015-03-24 07:31:46', '2015-03-24 07:31:46', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_galleys`
--

CREATE TABLE IF NOT EXISTS `article_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `html_galley` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `article_galleys_article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `article_galleys`
--

INSERT INTO `article_galleys` (`galley_id`, `locale`, `article_id`, `file_id`, `label`, `html_galley`, `style_file_id`, `seq`, `remote_url`) VALUES
(1, 'en_US', 8, 13, 'PDF', 0, NULL, 0, NULL),
(2, 'en_US', 20, 44, 'PDF', 0, NULL, 0, NULL),
(3, 'en_US', 27, 48, 'PDF', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_galley_settings`
--

CREATE TABLE IF NOT EXISTS `article_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `article_galley_settings_galley_id` (`galley_id`),
  KEY `article_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_html_galley_images`
--

CREATE TABLE IF NOT EXISTS `article_html_galley_images` (
  `galley_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `article_html_galley_images_pkey` (`galley_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_search_keyword_list`
--

CREATE TABLE IF NOT EXISTS `article_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `article_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `article_search_keyword_list`
--

INSERT INTO `article_search_keyword_list` (`keyword_id`, `keyword_text`) VALUES
(3, 'aja'),
(2, 'apa'),
(5, 'buat'),
(11, 'contoh'),
(13, 'file'),
(6, 'nyoba'),
(7, 'primadi'),
(1, 'rachmawaty'),
(10, 'supp1'),
(12, 'supplementary'),
(8, 'tabrani'),
(4, 'test'),
(9, 'untitled');

-- --------------------------------------------------------

--
-- Table structure for table `article_search_objects`
--

CREATE TABLE IF NOT EXISTS `article_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `article_search_objects`
--

INSERT INTO `article_search_objects` (`object_id`, `article_id`, `type`, `assoc_id`) VALUES
(1, 2, 1, 0),
(2, 2, 2, 0),
(3, 2, 4, 0),
(4, 2, 8, 0),
(5, 2, 16, 0),
(6, 2, 32, 0),
(7, 2, 64, 0),
(8, 2, 1, 0),
(9, 2, 2, 0),
(10, 2, 4, 0),
(11, 2, 8, 0),
(12, 2, 16, 0),
(13, 2, 32, 0),
(14, 2, 64, 0),
(15, 8, 1, 0),
(16, 8, 2, 0),
(17, 8, 4, 0),
(18, 8, 8, 0),
(19, 8, 16, 0),
(20, 8, 32, 0),
(21, 8, 64, 0),
(22, 8, 256, 0),
(23, 20, 1, 0),
(24, 20, 2, 0),
(25, 20, 4, 0),
(26, 20, 8, 0),
(27, 20, 16, 0),
(28, 20, 32, 0),
(29, 20, 64, 0),
(30, 20, 256, 35),
(31, 27, 1, 0),
(32, 27, 2, 0),
(33, 27, 4, 0),
(34, 27, 8, 0),
(35, 27, 16, 0),
(36, 27, 32, 0),
(37, 27, 64, 0),
(38, 27, 256, 45);

-- --------------------------------------------------------

--
-- Table structure for table `article_search_object_keywords`
--

CREATE TABLE IF NOT EXISTS `article_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `article_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `article_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_search_object_keywords`
--

INSERT INTO `article_search_object_keywords` (`object_id`, `keyword_id`, `pos`) VALUES
(1, 1, 0),
(1, 1, 1),
(8, 1, 0),
(8, 1, 1),
(23, 1, 0),
(23, 1, 1),
(31, 1, 0),
(31, 1, 1),
(9, 2, 0),
(9, 3, 1),
(10, 3, 1),
(10, 4, 0),
(10, 5, 2),
(10, 6, 3),
(15, 7, 0),
(15, 8, 1),
(22, 9, 0),
(30, 10, 0),
(38, 11, 0),
(38, 12, 1),
(38, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `article_settings`
--

CREATE TABLE IF NOT EXISTS `article_settings` (
  `article_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_settings_pkey` (`article_id`,`locale`,`setting_name`),
  KEY `article_settings_article_id` (`article_id`),
  KEY `article_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_settings`
--

INSERT INTO `article_settings` (`article_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abstract', 'sebuah contoh untuk menggambarkan nilai akademik.', 'string'),
(1, 'en_US', 'cleanTitle', 'Academic Transcript', 'string'),
(1, 'en_US', 'copyrightHolder', 'TestJournal', 'string'),
(1, 'en_US', 'sponsor', '', 'string'),
(1, 'en_US', 'title', 'Academic Transcript', 'string'),
(2, '', 'copyrightYear', '2015', 'string'),
(2, 'en_US', 'abstract', 'test aja buat nyoba', 'string'),
(2, 'en_US', 'cleanTitle', 'apa aja', 'string'),
(2, 'en_US', 'copyrightHolder', 'TestJournal', 'string'),
(2, 'en_US', 'sponsor', '', 'string'),
(2, 'en_US', 'title', 'apa aja', 'string'),
(8, '', 'copyrightYear', '2015', 'string'),
(8, 'en_US', 'abstract', 'Ketika penulis di tahun 1981 memulai penelitiannya tentang â€œilmu bahasa rupaâ€, penulis segera menyadari bahwa ilmu ini merupakan sesuatu yang baru dan belum ada dalam khasanah teori Barat. Seperti biasa seiring lahirnya ilmu baru, diperlukan pula istilah-istilah baru yang belum ada sebelumnya. Salah satu istilah yang penulis beri peruntukkan baru adalah istilah â€œwimbaâ€ dan istilah â€œtata ungkapanâ€ sebagai padanan dari â€œtata bahasaâ€ pada ilmu bahasa/linguistik.', 'string'),
(8, 'en_US', 'cleanTitle', 'WIMBA ASAL USUL DAN PERUNTUKKANNYA', 'string'),
(8, 'en_US', 'copyrightHolder', 'WIMBA', 'string'),
(8, 'en_US', 'sponsor', '', 'string'),
(8, 'en_US', 'title', 'WIMBA, ASAL USUL DAN PERUNTUKKANNYA', 'string'),
(15, '', 'licenseURL', '', 'string'),
(15, 'en_US', 'abstract', 'alalala', 'string'),
(15, 'en_US', 'cleanTitle', 'lalala', 'string'),
(15, 'en_US', 'copyrightHolder', 'WIMBA', 'string'),
(15, 'en_US', 'sponsor', '', 'string'),
(15, 'en_US', 'title', 'lalala', 'string'),
(20, '', 'copyrightYear', '2015', 'string'),
(20, '', 'licenseURL', '', 'string'),
(20, 'en_US', 'abstract', 'Teststst', 'string'),
(20, 'en_US', 'cleanTitle', 'Lilili', 'string'),
(20, 'en_US', 'copyrightHolder', 'WIMBA', 'string'),
(20, 'en_US', 'sponsor', '', 'string'),
(20, 'en_US', 'title', 'Lilili', 'string'),
(27, '', 'copyrightYear', '2015', 'string'),
(27, '', 'licenseURL', '', 'string'),
(27, 'en_US', 'abstract', 'Contoh pembuatan jurnal.', 'string'),
(27, 'en_US', 'cleanTitle', 'Template Journal', 'string'),
(27, 'en_US', 'copyrightHolder', 'WIMBA', 'string'),
(27, 'en_US', 'sponsor', '', 'string'),
(27, 'en_US', 'title', 'Template Journal', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `article_supplementary_files`
--

CREATE TABLE IF NOT EXISTS `article_supplementary_files` (
  `supp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `show_reviewers` tinyint(4) DEFAULT '0',
  `date_submitted` datetime NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`supp_id`),
  KEY `article_supplementary_files_file_id` (`file_id`),
  KEY `article_supplementary_files_article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `article_supplementary_files`
--

INSERT INTO `article_supplementary_files` (`supp_id`, `file_id`, `article_id`, `type`, `language`, `remote_url`, `date_created`, `show_reviewers`, `date_submitted`, `seq`) VALUES
(1, 0, 8, NULL, NULL, 'RemoteURL', '2015-03-20', 0, '2015-03-20 09:28:47', 0),
(19, 29, 15, 'Research Instrument', '', NULL, '2015-03-21', NULL, '2015-03-21 09:07:42', 0),
(20, 30, 15, '', '', NULL, '2015-03-21', NULL, '2015-03-21 09:08:23', 1),
(21, 0, 15, NULL, NULL, NULL, '2015-03-21', NULL, '2015-03-21 09:09:21', 2),
(22, 31, 15, NULL, '', NULL, '2015-03-21', NULL, '2015-03-21 09:38:19', 3),
(23, 32, 15, NULL, '', NULL, '2015-03-21', NULL, '2015-03-21 09:41:44', 4),
(24, 35, 20, NULL, '', NULL, '2015-03-21', NULL, '2015-03-21 09:57:48', 0),
(25, 45, 27, NULL, '', NULL, '2015-03-24', NULL, '2015-03-24 07:21:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_supp_file_settings`
--

CREATE TABLE IF NOT EXISTS `article_supp_file_settings` (
  `supp_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_supp_file_settings_pkey` (`supp_id`,`locale`,`setting_name`),
  KEY `article_supp_file_settings_supp_id` (`supp_id`),
  KEY `article_supp_file_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_supp_file_settings`
--

INSERT INTO `article_supp_file_settings` (`supp_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'title', 'Untitled', 'string'),
(19, 'en_US', 'creator', '', 'string'),
(19, 'en_US', 'description', '', 'string'),
(19, 'en_US', 'publisher', '', 'string'),
(19, 'en_US', 'source', '', 'string'),
(19, 'en_US', 'sponsor', '', 'string'),
(19, 'en_US', 'subject', '', 'string'),
(19, 'en_US', 'title', 'File1', 'string'),
(19, 'en_US', 'typeOther', '', 'string'),
(20, 'en_US', 'creator', '', 'string'),
(20, 'en_US', 'description', '', 'string'),
(20, 'en_US', 'publisher', '', 'string'),
(20, 'en_US', 'source', '', 'string'),
(20, 'en_US', 'sponsor', '', 'string'),
(20, 'en_US', 'subject', '', 'string'),
(20, 'en_US', 'title', 'File2', 'string'),
(20, 'en_US', 'typeOther', '', 'string'),
(21, 'en_US', 'title', 'Untitled', 'string'),
(22, 'en_US', 'creator', '', 'string'),
(22, 'en_US', 'description', '', 'string'),
(22, 'en_US', 'publisher', '', 'string'),
(22, 'en_US', 'source', '', 'string'),
(22, 'en_US', 'sponsor', '', 'string'),
(22, 'en_US', 'subject', '', 'string'),
(22, 'en_US', 'title', 'Test', 'string'),
(22, 'en_US', 'typeOther', '', 'string'),
(23, 'en_US', 'creator', '', 'string'),
(23, 'en_US', 'description', '', 'string'),
(23, 'en_US', 'publisher', '', 'string'),
(23, 'en_US', 'source', '', 'string'),
(23, 'en_US', 'sponsor', '', 'string'),
(23, 'en_US', 'subject', '', 'string'),
(23, 'en_US', 'title', 'Rachesraches', 'string'),
(23, 'en_US', 'typeOther', '', 'string'),
(24, 'en_US', 'creator', '', 'string'),
(24, 'en_US', 'description', '', 'string'),
(24, 'en_US', 'publisher', '', 'string'),
(24, 'en_US', 'source', '', 'string'),
(24, 'en_US', 'sponsor', '', 'string'),
(24, 'en_US', 'subject', '', 'string'),
(24, 'en_US', 'title', 'Supp1', 'string'),
(24, 'en_US', 'typeOther', '', 'string'),
(25, 'en_US', 'creator', '', 'string'),
(25, 'en_US', 'description', '', 'string'),
(25, 'en_US', 'publisher', '', 'string'),
(25, 'en_US', 'source', '', 'string'),
(25, 'en_US', 'sponsor', '', 'string'),
(25, 'en_US', 'subject', '', 'string'),
(25, 'en_US', 'title', 'Contoh Supplementary File', 'string'),
(25, 'en_US', 'typeOther', '', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `article_xml_galleys`
--

CREATE TABLE IF NOT EXISTS `article_xml_galleys` (
  `xml_galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `galley_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `label` varchar(32) NOT NULL,
  `galley_type` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`xml_galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `submission_id`, `primary_contact`, `seq`, `first_name`, `middle_name`, `last_name`, `suffix`, `country`, `email`, `url`, `user_group_id`) VALUES
(1, 1, 1, 1, 'Destra Bintang', '', 'Perkasa', NULL, '', 'destra.b.p@gmail.com', '', NULL),
(2, 2, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(7, 7, 1, 1, 'Destra Bintang', '', 'Perkasa', NULL, '', 'destra.b.p@gmail.com', '', NULL),
(8, 8, 1, 1, 'Primadi', '', 'Tabrani', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(15, 15, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(20, 20, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(21, 21, 1, 0, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(22, 22, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(23, 23, 1, 0, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(24, 24, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(25, 25, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(26, 26, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL),
(27, 27, 1, 1, 'Rachmawaty', '', 'Rachmawaty', NULL, '', 'rachmawatyy@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author_settings`
--

CREATE TABLE IF NOT EXISTS `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author_settings`
--

INSERT INTO `author_settings` (`author_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'orcid', '', 'string'),
(1, 'en_US', 'affiliation', '', 'string'),
(1, 'en_US', 'biography', '', 'string'),
(2, '', 'orcid', '', 'string'),
(2, 'en_US', 'affiliation', '', 'string'),
(2, 'en_US', 'biography', '', 'string'),
(7, '', 'orcid', '', 'string'),
(7, 'en_US', 'affiliation', '', 'string'),
(7, 'en_US', 'biography', '', 'string'),
(8, '', 'orcid', '', 'string'),
(8, 'en_US', 'affiliation', '', 'string'),
(8, 'en_US', 'biography', '', 'string'),
(15, '', 'orcid', '', 'string'),
(15, 'en_US', 'affiliation', '', 'string'),
(15, 'en_US', 'biography', '', 'string'),
(20, '', 'orcid', '', 'string'),
(20, 'en_US', 'affiliation', '', 'string'),
(20, 'en_US', 'biography', '', 'string'),
(21, '', 'orcid', '', 'string'),
(21, 'en_US', 'affiliation', '', 'string'),
(21, 'en_US', 'biography', '', 'string'),
(22, '', 'orcid', '', 'string'),
(22, 'en_US', 'affiliation', '', 'string'),
(22, 'en_US', 'biography', '', 'string'),
(23, '', 'orcid', '', 'string'),
(23, 'en_US', 'affiliation', '', 'string'),
(23, 'en_US', 'biography', '', 'string'),
(24, '', 'orcid', '', 'string'),
(24, 'en_US', 'affiliation', '', 'string'),
(24, 'en_US', 'biography', '', 'string'),
(25, '', 'orcid', '', 'string'),
(25, 'en_US', 'affiliation', '', 'string'),
(25, 'en_US', 'biography', '', 'string'),
(26, '', 'orcid', '', 'string'),
(26, 'en_US', 'affiliation', '', 'string'),
(26, 'en_US', 'biography', '', 'string'),
(27, '', 'orcid', '', 'string'),
(27, 'en_US', 'affiliation', '', 'string'),
(27, 'en_US', 'biography', '', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE IF NOT EXISTS `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `books_for_review`
--

CREATE TABLE IF NOT EXISTS `books_for_review` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `author_type` smallint(6) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `copy` tinyint(4) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `edition` tinyint(4) DEFAULT NULL,
  `pages` smallint(6) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_requested` datetime DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_mailed` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`book_id`),
  KEY `bfr_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `books_for_review_authors`
--

CREATE TABLE IF NOT EXISTS `books_for_review_authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  PRIMARY KEY (`author_id`),
  KEY `bfr_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `books_for_review_settings`
--

CREATE TABLE IF NOT EXISTS `books_for_review_settings` (
  `book_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `bfr_settings_pkey` (`book_id`,`locale`,`setting_name`),
  KEY `bfr_settings_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `captchas`
--

CREATE TABLE IF NOT EXISTS `captchas` (
  `captcha_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(40) NOT NULL,
  `value` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`captcha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE IF NOT EXISTS `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `citation_state` bigint(20) NOT NULL,
  `raw_citation` text,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  `lock_id` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_assoc_seq` (`assoc_type`,`assoc_id`,`seq`),
  KEY `citations_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `citations`
--

INSERT INTO `citations` (`citation_id`, `assoc_type`, `assoc_id`, `citation_state`, `raw_citation`, `seq`, `lock_id`) VALUES
(1, 257, 2, 4, 'abc, 1,2,3', 1, NULL),
(2, 257, 2, 4, 'abd, 1,3,4', 2, NULL),
(3, 257, 2, 4, 'asc, 2,3,4', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `citation_settings`
--

CREATE TABLE IF NOT EXISTS `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `num_children` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `poster_ip` varchar(15) NOT NULL,
  `poster_name` varchar(90) DEFAULT NULL,
  `poster_email` varchar(90) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_submission_id` (`submission_id`),
  KEY `comments_parent_comment_id` (`parent_comment_id`),
  KEY `comments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `completed_payments`
--

CREATE TABLE IF NOT EXISTS `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocabs`
--

CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=304 ;

--
-- Dumping data for table `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(302, 'category', 0, 0),
(303, 'interest', 0, 0),
(103, 'mods34-genre-marcgt', 0, 0),
(101, 'mods34-name-role-roleTerms-marcrelator', 0, 0),
(100, 'mods34-name-types', 0, 0),
(104, 'mods34-physicalDescription-form-marcform', 0, 0),
(102, 'mods34-typeOfResource', 0, 0),
(200, 'nlm30-publication-types', 0, 0),
(301, 'openurl10-book-genres', 0, 0),
(300, 'openurl10-journal-genres', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entries`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=317 ;

--
-- Dumping data for table `controlled_vocab_entries`
--

INSERT INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
(100, 100, 1),
(101, 100, 2),
(102, 100, 3),
(110, 101, 1),
(111, 101, 2),
(112, 101, 3),
(113, 101, 4),
(114, 101, 5),
(115, 101, 6),
(116, 101, 7),
(120, 102, 1),
(121, 102, 2),
(122, 102, 3),
(130, 103, 1),
(131, 103, 2),
(132, 103, 3),
(133, 103, 4),
(134, 103, 5),
(135, 103, 6),
(136, 103, 7),
(137, 103, 8),
(138, 103, 9),
(139, 103, 10),
(140, 103, 11),
(141, 103, 12),
(150, 104, 1),
(151, 104, 2),
(200, 200, 1),
(201, 200, 2),
(202, 200, 3),
(203, 200, 4),
(300, 300, 1),
(301, 300, 2),
(302, 300, 3),
(303, 300, 4),
(304, 300, 5),
(305, 300, 6),
(306, 300, 7),
(310, 301, 1),
(311, 301, 2),
(312, 301, 3),
(313, 301, 4),
(314, 301, 5),
(315, 301, 6),
(316, 301, 7);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entry_settings`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

INSERT INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(100, '', 'name', 'personal', 'string'),
(101, '', 'name', 'corporate', 'string'),
(102, '', 'name', 'conference', 'string'),
(110, '', 'description', 'Author', 'string'),
(110, '', 'name', 'aut', 'string'),
(111, '', 'description', 'Contributor', 'string'),
(111, '', 'name', 'ctb', 'string'),
(112, '', 'description', 'Editor', 'string'),
(112, '', 'name', 'edt', 'string'),
(113, '', 'description', 'Illustrator', 'string'),
(113, '', 'name', 'ill', 'string'),
(114, '', 'description', 'Photographer', 'string'),
(114, '', 'name', 'pht', 'string'),
(115, '', 'description', 'Sponsor', 'string'),
(115, '', 'name', 'spn', 'string'),
(116, '', 'description', 'Translator', 'string'),
(116, '', 'name', 'trl', 'string'),
(120, '', 'name', 'multimedia', 'string'),
(121, '', 'name', 'still image', 'string'),
(122, '', 'name', 'text', 'string'),
(130, '', 'name', 'article', 'string'),
(131, '', 'name', 'book', 'string'),
(132, '', 'name', 'conference publication', 'string'),
(133, '', 'name', 'issue', 'string'),
(134, '', 'name', 'journal', 'string'),
(135, '', 'name', 'newspaper', 'string'),
(136, '', 'name', 'picture', 'string'),
(137, '', 'name', 'review', 'string'),
(138, '', 'name', 'periodical', 'string'),
(139, '', 'name', 'series', 'string'),
(140, '', 'name', 'thesis', 'string'),
(141, '', 'name', 'web site', 'string'),
(150, '', 'name', 'electronic', 'string'),
(151, '', 'name', 'print', 'string'),
(200, '', 'name', 'journal', 'string'),
(201, '', 'name', 'book', 'string'),
(202, '', 'name', 'conf-proc', 'string'),
(203, '', 'name', 'thesis', 'string'),
(300, '', 'name', 'journal', 'string'),
(301, '', 'name', 'issue', 'string'),
(302, '', 'name', 'article', 'string'),
(303, '', 'name', 'proceeding', 'string'),
(304, '', 'name', 'conference', 'string'),
(305, '', 'name', 'preprint', 'string'),
(306, '', 'name', 'unknown', 'string'),
(310, '', 'name', 'book', 'string'),
(311, '', 'name', 'bookitem', 'string'),
(312, '', 'name', 'proceeding', 'string'),
(313, '', 'name', 'conference', 'string'),
(314, '', 'name', 'report', 'string'),
(315, '', 'name', 'document', 'string'),
(316, '', 'name', 'unknown', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `custom_issue_orders`
--

CREATE TABLE IF NOT EXISTS `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_section_orders`
--

CREATE TABLE IF NOT EXISTS `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataverse_files`
--

CREATE TABLE IF NOT EXISTS `dataverse_files` (
  `dvfile_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supp_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `study_id` bigint(20) NOT NULL DEFAULT '0',
  `content_source_uri` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dvfile_id`),
  KEY `dataverse_files_supp_id` (`supp_id`),
  KEY `dataverse_files_submission_id` (`submission_id`),
  KEY `dataverse_files_study_id` (`study_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dataverse_studies`
--

CREATE TABLE IF NOT EXISTS `dataverse_studies` (
  `study_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `edit_uri` varchar(255) NOT NULL,
  `edit_media_uri` varchar(255) NOT NULL,
  `statement_uri` varchar(255) NOT NULL,
  `persistent_uri` varchar(255) NOT NULL,
  `data_citation` text,
  PRIMARY KEY (`study_id`),
  KEY `dataverse_studies_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstones`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_settings`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `edit_assignments`
--

CREATE TABLE IF NOT EXISTS `edit_assignments` (
  `edit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `can_review` tinyint(4) NOT NULL DEFAULT '1',
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_underway` datetime DEFAULT NULL,
  PRIMARY KEY (`edit_id`),
  KEY `edit_assignments_article_id` (`article_id`),
  KEY `edit_assignments_editor_id` (`editor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `edit_assignments`
--

INSERT INTO `edit_assignments` (`edit_id`, `article_id`, `editor_id`, `can_edit`, `can_review`, `date_assigned`, `date_notified`, `date_underway`) VALUES
(1, 2, 1, 1, 1, NULL, '2015-03-16 03:48:20', '2015-03-16 03:48:22'),
(2, 8, 2, 1, 1, NULL, '2015-03-20 08:23:18', '2015-03-20 08:23:23'),
(4, 20, 2, 1, 1, NULL, '2015-03-23 12:03:08', '2015-03-23 12:03:11'),
(5, 27, 2, 1, 1, NULL, '2015-03-24 07:23:53', '2015-03-24 07:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `edit_decisions`
--

CREATE TABLE IF NOT EXISTS `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_article_id` (`article_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `edit_decisions`
--

INSERT INTO `edit_decisions` (`edit_decision_id`, `article_id`, `round`, `editor_id`, `decision`, `date_decided`) VALUES
(1, 2, 1, 2, 3, '2015-03-16 04:10:42'),
(2, 2, 1, 2, 1, '2015-03-16 04:18:04'),
(3, 8, 1, 2, 1, '2015-03-20 09:17:05'),
(4, 20, 1, 2, 2, '2015-03-23 12:22:03'),
(5, 20, 1, 2, 1, '2015-03-23 16:23:28'),
(6, 20, 1, 2, 1, '2015-03-24 00:59:10'),
(7, 27, 1, 2, 1, '2015-03-24 07:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`log_id`, `assoc_type`, `assoc_id`, `sender_id`, `date_sent`, `ip_address`, `event_type`, `from_address`, `recipients`, `cc_recipients`, `bcc_recipients`, `subject`, `body`) VALUES
(1, 257, 1, 2, '2015-03-05 12:22:03', '::1', NULL, '"Destra Bintang Perkasa" <destra.bintang.perkasa@gmail.com>', 'destra.b.p@gmail.com', NULL, NULL, '[TJ] Submission Acknowledgement', 'Destra Bintang Perkasa:\n\nThank you for submitting the manuscript, "Academic Transcript" to TestJournal. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/ojs-2.4.5/index.php/test/author/submission/1\nUsername: destrabintangp\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nDestra Bintang Perkasa\nTestJournal\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(2, 257, 2, 3, '2015-03-16 03:47:18', '::1', NULL, '"Destra Bintang Perkasa" <destra.bintang.perkasa@gmail.com>', 'rachmawatyy@gmail.com', NULL, NULL, '[TJ] Submission Acknowledgement', 'Rachmawaty Rachmawaty:\n\nThank you for submitting the manuscript, "apa aja" to TestJournal. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/ojs-2.4.5/index.php/test/author/submission/2\nUsername: raches\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nDestra Bintang Perkasa\nTestJournal\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(3, 257, 2, 2, '2015-03-16 04:30:40', '::1', NULL, '"Destra Bintang Perkasa" <destra.b.p@gmail.com>', 'destra.b.p@gmail.com', NULL, NULL, '[TJ] Article Review Request', 'Destra Bintang Perkasa:\r\n\r\nI believe that you would serve as an excellent reviewer of the manuscript, "apa aja," which has been submitted to TestJournal. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.\r\n\r\nPlease log into the journal web site by 2015-03-23 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is http://localhost/ojs-2.4.5/index.php/test\r\n\r\nThe review itself is due 2015-04-13.\r\n\r\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). http://localhost/ojs-2.4.5/index.php/test/login/resetPassword/destrabintangp?confirm=70e25d\r\n\r\nSubmission URL: http://localhost/ojs-2.4.5/index.php/test/reviewer/submission/1\r\n\r\nThank you for considering this request.\r\n\r\nDestra Bintang Perkasa\r\ndestra.b.p@gmail.com\r\n\r\n\r\n\r\n"apa aja"\r\n\r\nAbstract\r\ntest aja buat nyoba\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(4, 257, 2, 2, '2015-03-18 16:35:34', '::1', NULL, '"Destra Bintang Perkasa" <destra.b.p@gmail.com>', 'destra.bintang.perkasa@gmail.com', NULL, NULL, '[TJ] Article Review Completed', 'destraaaa :\r\n\r\nI have now completed my review of "apa aja" for TestJournal, and submitted my recommendation, "Accept Submission."\r\n\r\nDestra Bintang Perkasa\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(5, 257, 8, 3, '2015-03-20 08:05:41', '::1', NULL, '"Destra Bintang Perkasa" <destra.bintang.perkasa@gmail.com>', 'rachmawatyy@gmail.com', NULL, NULL, '[TJ] Submission Acknowledgement', 'Rachmawaty Rachmawaty:\n\nThank you for submitting the manuscript, "WIMBA, ASAL USUL DAN PERUNTUKKANNYA" to WIMBA. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/ojs-2.4.5/index.php/wimba/author/submission/8\nUsername: raches\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nDestra Bintang Perkasa\nWIMBA\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(6, 257, 15, 3, '2015-03-21 09:45:48', '::1', NULL, '"Destra Bintang Perkasa" <destra.bintang.perkasa@gmail.com>', 'rachmawatyy@gmail.com', NULL, NULL, '[WIMBA] Submission Acknowledgement', 'Rachmawaty Rachmawaty:\n\nThank you for submitting the manuscript, "lalala" to WIMBA. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/ojs-2.4.5/index.php/wimba/author/submission/15\nUsername: raches\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nDestra Bintang Perkasa\nWIMBA\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(7, 257, 20, 3, '2015-03-21 09:58:06', '::1', NULL, '"Destra Bintang Perkasa" <destra.bintang.perkasa@gmail.com>', 'rachmawatyy@gmail.com', NULL, NULL, '[WIMBA] Submission Acknowledgement', 'Rachmawaty Rachmawaty:\n\nThank you for submitting the manuscript, "Lilili" to WIMBA. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/ojs-2.4.5/index.php/wimba/author/submission/20\nUsername: raches\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nDestra Bintang Perkasa\nWIMBA\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(8, 257, 20, 3, '2015-03-23 12:24:24', '::1', NULL, '"Rachmawaty Rachmawaty" <rachmawatyy@gmail.com>', 'destra.b.p@gmail.com', NULL, NULL, '[WIMBA] Revised Version Uploaded', 'Destra Bintang Perkasa:\n\nA revised version of "Lilili" has been uploaded by the author Rachmawaty Rachmawaty.\n\nSubmission URL: http://localhost/ojs-2.4.5/index.php/wimba/editor/submissionReview/20\n\nDestra Bintang Perkasa\nWIMBA\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test'),
(9, 257, 20, 2, '2015-03-24 04:42:30', '::1', NULL, '"Destra Bintang Perkasa" <destra.b.p@gmail.com>', 'rachmawatyy@gmail.com', NULL, NULL, '[WIMBA] Lilili', 'Tes ngirim email pake OJS.\n________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test');

-- --------------------------------------------------------

--
-- Table structure for table `email_log_users`
--

CREATE TABLE IF NOT EXISTS `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default`
--

CREATE TABLE IF NOT EXISTS `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL),
(2, 'NOTIFICATION_MAILLIST', 0, 1, NULL, NULL),
(3, 'NOTIFICATION_MAILLIST_WELCOME', 0, 1, NULL, NULL),
(4, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
(5, 'PASSWORD_RESET', 0, 1, NULL, NULL),
(6, 'USER_REGISTER', 0, 1, NULL, NULL),
(7, 'USER_VALIDATE', 0, 1, NULL, NULL),
(8, 'REVIEWER_REGISTER', 0, 1, NULL, NULL),
(9, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL),
(10, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL),
(11, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL),
(12, 'SUBMISSION_ACK', 1, 1, NULL, 65536),
(13, 'SUBMISSION_UNSUITABLE', 1, 1, 512, 65536),
(14, 'SUBMISSION_COMMENT', 0, 1, NULL, NULL),
(15, 'SUBMISSION_DECISION_REVIEWERS', 0, 1, 512, 4096),
(16, 'EDITOR_ASSIGN', 1, 1, 256, 512),
(17, 'REVIEW_CANCEL', 1, 1, 512, 4096),
(18, 'REVIEW_REQUEST', 1, 1, 512, 4096),
(19, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 512, 4096),
(20, 'REVIEW_REQUEST_ONECLICK', 1, 1, 512, 4096),
(21, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 512, 4096),
(22, 'REVIEW_REQUEST_ATTACHED', 0, 1, 512, 4096),
(23, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 512, 4096),
(24, 'REVIEW_CONFIRM', 1, 1, 4096, 512),
(25, 'REVIEW_DECLINE', 1, 1, 4096, 512),
(26, 'REVIEW_COMPLETE', 1, 1, 4096, 512),
(27, 'REVIEW_ACK', 1, 1, 512, 4096),
(28, 'REVIEW_REMIND', 0, 1, 512, 4096),
(29, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096),
(30, 'REVIEW_REMIND_ONECLICK', 0, 1, 512, 4096),
(31, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(32, 'EDITOR_DECISION_ACCEPT', 0, 1, 512, 65536),
(33, 'EDITOR_DECISION_REVISIONS', 0, 1, 512, 65536),
(34, 'EDITOR_DECISION_RESUBMIT', 0, 1, 512, 65536),
(35, 'EDITOR_DECISION_DECLINE', 0, 1, 512, 65536),
(36, 'COPYEDIT_REQUEST', 1, 1, 512, 8192),
(37, 'COPYEDIT_COMPLETE', 1, 1, 8192, 65536),
(38, 'COPYEDIT_ACK', 1, 1, 512, 8192),
(39, 'COPYEDIT_AUTHOR_REQUEST', 1, 1, 512, 65536),
(40, 'COPYEDIT_AUTHOR_COMPLETE', 1, 1, 65536, 512),
(41, 'COPYEDIT_AUTHOR_ACK', 1, 1, 512, 65536),
(42, 'COPYEDIT_FINAL_REQUEST', 1, 1, 512, 8192),
(43, 'COPYEDIT_FINAL_COMPLETE', 1, 1, 8192, 512),
(44, 'COPYEDIT_FINAL_ACK', 1, 1, 512, 8192),
(45, 'LAYOUT_REQUEST', 1, 1, 512, 768),
(46, 'LAYOUT_COMPLETE', 1, 1, 768, 512),
(47, 'LAYOUT_ACK', 1, 1, 512, 768),
(48, 'PROOFREAD_AUTHOR_REQUEST', 1, 1, 512, 65536),
(49, 'PROOFREAD_AUTHOR_COMPLETE', 1, 1, 65536, 512),
(50, 'PROOFREAD_AUTHOR_ACK', 1, 1, 512, 65536),
(51, 'PROOFREAD_REQUEST', 1, 1, 512, 12288),
(52, 'PROOFREAD_COMPLETE', 1, 1, 12288, 512),
(53, 'PROOFREAD_ACK', 1, 1, 512, 12288),
(54, 'PROOFREAD_LAYOUT_REQUEST', 1, 1, 512, 768),
(55, 'PROOFREAD_LAYOUT_COMPLETE', 1, 1, 768, 512),
(56, 'PROOFREAD_LAYOUT_ACK', 1, 1, 512, 768),
(57, 'EMAIL_LINK', 0, 1, 1048576, NULL),
(58, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576),
(59, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576),
(60, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576),
(61, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576),
(62, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576),
(63, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152),
(64, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152),
(65, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152),
(66, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152),
(67, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL),
(68, 'GIFT_AVAILABLE', 0, 1, NULL, NULL),
(69, 'GIFT_USER_REGISTER', 0, 1, NULL, NULL),
(70, 'GIFT_USER_LOGIN', 0, 1, NULL, NULL),
(71, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 512),
(72, 'BFR_REVIEW_REMINDER', 0, 1, 256, 65536),
(73, 'BFR_REVIEW_REMINDER_LATE', 0, 1, 256, 65536),
(74, 'BFR_BOOK_ASSIGNED', 0, 1, 256, 65536),
(75, 'BFR_BOOK_DENIED', 0, 1, 256, 65536),
(76, 'BFR_BOOK_REQUESTED', 0, 1, 65536, 256),
(77, 'BFR_BOOK_MAILED', 0, 1, 256, 65536),
(78, 'BFR_REVIEWER_REMOVED', 0, 1, 256, 65536),
(79, 'LUCENE_ARTICLE_INDEXING_ERROR_NOTIFICATION', 1, 1, NULL, NULL),
(80, 'LUCENE_JOURNAL_INDEXING_ERROR_NOTIFICATION', 1, 1, NULL, NULL),
(81, 'LUCENE_SEARCH_SERVICE_ERROR_NOTIFICATION', 1, 1, NULL, NULL),
(82, 'OFR_REVIEW_REMINDER', 0, 1, 256, 65536),
(83, 'OFR_REVIEW_REMINDER_LATE', 0, 1, 256, 65536),
(84, 'OFR_OBJECT_ASSIGNED', 0, 1, 256, 65536),
(85, 'OFR_OBJECT_DENIED', 0, 1, 256, 65536),
(86, 'OFR_OBJECT_REQUESTED', 0, 1, 65536, 256),
(87, 'OFR_OBJECT_MAILED', 0, 1, 256, 65536),
(88, 'OFR_REVIEWER_REMOVED', 0, 1, 256, 65536),
(89, 'SWORD_DEPOSIT_NOTIFICATION', 0, 1, NULL, NULL),
(90, 'THESIS_ABSTRACT_CONFIRM', 0, 1, NULL, NULL),
(91, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
(92, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('BFR_BOOK_ASSIGNED', 'en_US', 'Book for Review: Book Assigned', 'Dear {$authorName}:\n\nThis email confirms that {$bookForReviewTitle} has been assigned to you for a book review to be completed by {$bookForReviewDueDate}.\n\nPlease ensure that your mailing address in your online user profile is up-to-date. This address will be used to mail a copy of the book to you for the review.\n\nThe mailing address that we currently have on file is:\n{$authorMailingAddress}\n\nIf this address is incomplete or you are no longer at this address, please use the following user profile URL to update your address:\n\nUser Profile URL: {$userProfileUrl}\n \nTo submit your book review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\n{$editorialContactSignature}', 'This email is sent by an editor to a book review author when an editor assigns the book for review to the author.'),
('BFR_BOOK_ASSIGNED', 'id_ID', 'Buku untuk Review: Buku yang ditugaskan', 'Kepada {$authorName}:\n\nEmail ini mengkonfirmasi bahwa  {$bookForReviewTitle} telah ditugaskan kepada Anda untuk review buku yang diselesaikan sebelum {$bookForReviewDueDate}.\n\nPastikan alamat surat menyurat Anda di profil pengguna online Anda up-to-date.  Alamat ini akan digunakan untuk mengirimkan buku kepada Anda untuk review. \n\nAlamat surat menyurat yang saat ini kami miliki ada di file:\n{$authorMailingAddress}\n\nJika alamat ini tidak lengkap atau Anda tidak lagi berada di alamat ini, mohon gunakan URL profil pengguna untuk meng-update alamat Anda:\n\nURL Profil Pengguna: {$userProfileUrl}\n \nUntuk menyerahkan review buku Anda, log in ke website jurnal dan lengkapi proses penyerahan artikel online. \n\nURL Naskah: {$submissionUrl}\n\nSilakan hubungi saya jika Anda punya pertanyaan atau kepedulian tentang review buku ini. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh editor untuk penulis review buku saat editor memberikan buku untuk review kepada penulis. '),
('BFR_BOOK_DENIED', 'en_US', 'Book for Review', 'Dear {$authorName}:\n\nUnfortunately, I am not able to assign {$bookForReviewTitle} to you at this time for a book review.\n\nI hope you consider reviewing another book from our listing, either at this time or in the future.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an interested author when a book is no longer available for review.'),
('BFR_BOOK_DENIED', 'id_ID', 'Buku untuk Review', 'Kepada {$authorName}:\n\nSayangnya, saya tidak bisa memberikan {$bookForReviewTitle}kepada Anda sekarang ini untuk review buku.  \n\nSaya harap Anda mempertimbangkan untuk mereview buku lain dari daftar kami, sekarang atau di masa depan. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh editor kepada penulis yang tertarik saat buku tidak lagi tersedia untuk review. '),
('BFR_BOOK_MAILED', 'en_US', 'Book for Review: Book Mailed', 'Dear {$authorName}:\n\nThis email confirms that I have mailed a copy of {$bookForReviewTitle} to the following mailing address from your online user profile:\n{$authorMailingAddress}\n \nTo submit your book review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\n{$editorialContactSignature}', 'This email is sent by an editor to a book review author when the editor has mailed a copy of the book to the author.'),
('BFR_BOOK_MAILED', 'id_ID', 'Buku untuk Review: Buku dikirimkan lewat email', 'Kepada {$authorName}:\n\nEmail ini mengkonfirmasi bahwa saya telah mengirimkan buku {$bookForReviewTitle} ke alamat surat berikut ini dari profil pengguna online Anda:\n{$authorMailingAddress}\n \nUntuk menyerahkan review buku Anda, log in ke website jurnal dan lengkapi proses penyerahan artikel online. \n\nURL Naskah: {$submissionUrl}\n\nSilakan hubungi saya jika Anda punya pertanyaan atau kepedulian tentan review buku ini. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh editor kepada penulis review buku saat editor telah mengirimkan satu buku kepada penulis. '),
('BFR_BOOK_REQUESTED', 'en_US', 'Book for Review: Book Requested', 'Dear {$editorName}:\n\nI am interested in writing a book review of {$bookForReviewTitle}.\n\nCan you please confirm whether this book is still available for review?\n\n{$authorContactSignature}', 'This email is sent to an editor by an author interested in writing a book review for a listed book.'),
('BFR_BOOK_REQUESTED', 'id_ID', 'Buku untuk Review: Buku yang diminta', 'Kepada{$editorName}:\n\nSaya tertarik menulis review buku {$bookForReviewTitle}.\n\nDapatkah Anda mengkonfirmasi apakah buku ini masih tersedia untuk review? \n\n{$authorContactSignature}', 'Email ini dikirim kepada editor oleh penulis yang tertarik dalam menulis review buku untuk buku yang ada di daftar. '),
('BFR_REVIEWER_REMOVED', 'en_US', 'Book for Review', 'Dear {$authorName}:\n\nThis email confirms that you have been removed as the book reviewer for {$bookForReviewTitle}, which will be made available to other authors interested in reviewing the book.\n\nI hope you consider reviewing another book from our listing, either at this time or in the future.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an interested author when a book is no longer available for review.'),
('BFR_REVIEWER_REMOVED', 'id_ID', 'Buku untuk Review', 'Kepada {$authorName}:\n\nEmail ini mengkonfirmasi bahwa Anda telah dipindahkan sebagai reviewer buku untuk {$bookForReviewTitle}, yang akan menjadi tersedia untuk penulis lain yang tertarik mereview buku. \n\nSaya harap Anda bersedia mereview buku lain dari daftar kamu, baik sekarang maupun lain waktu. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh editor kepada penulis yang tertarik saat buku tidak lagi tersedia untuk review. '),
('BFR_REVIEW_REMINDER', 'en_US', 'Book for Review: Due Date Reminder', 'Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} is due {$bookForReviewDueDate}.\n\nTo submit your book review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}', 'This is an automatically generated email that is sent to a book for review author as a reminder that the due date for the review is approaching.'),
('BFR_REVIEW_REMINDER', 'id_ID', ' Buku untuk Review: Pengingat Tanggal Jatuh Tempo', 'Kepada{$authorName}:\n\nHanya mengingatkan review buku Anda tentang {$bookForReviewTitle} jatuh tempo tanggal {$bookForReviewDueDate}.\n\nUntuk menyerahkan review buku Anda, silakan log in ke website jurnal dan melengkapi proses penyerahan artikel online. Untuk kenyamanan Anda, URL penyerahan telah disediakan di bawah ini. \n\nURL Naskah: {$submissionUrl}\n\nSilakan hubungi saya jika Anda mempunyai pertanyaan atau kepedulian tentang review buku ini. \n\nTerima kasih untuk kontribusi Anda untuk jurnal dan saya tidak sabar untuk menerima naskah Anda.\n\n{$editorialContactSignature}', 'Ini adalah email otomatis yang dikirim ke reviewer sebagai pengingat bahwa tanggal bats akhir untuk review telah dekat. '),
('BFR_REVIEW_REMINDER_LATE', 'en_US', 'Book for Review: Review Due', 'Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} was due {$bookForReviewDueDate} but has not been received yet.\n\nTo submit your book review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}', 'This is an automatically generated email that is sent to a book for review author after the review due date has passed.'),
('BFR_REVIEW_REMINDER_LATE', 'id_ID', 'Buku untuk Review: Review Jatuh Tempo', 'Kepada {$authorName}:\n\nHanya mengingatkan review buku Anda tentang {$bookForReviewTitle} telah jatuh tempo tanggal {$bookForReviewDueDate} tetapi belum kami terima.\n\nUntuk menyerahkan review buku Anda, log in ke website jurnal dan lengkapi proses penyerahan artikel online. Untuk kenyamanan Anda, URL naskah telah disediakan di bawah ini. \n\nURL Naskah: {$submissionUrl}\n\nSilakan hubungi saya jika Anda mempunyai pertanyaan atau kepedulian tentang review buku ini. \n\nTerima kasih untuk kontribusi Anda pada jurnal dan saya menunggu naskah Anda. \n\n{$editorialContactSignature}', 'Ini adalah email otomatis yang dikirim ke buku untuk penulis review setelah tanggal jatuh tempo review telah lewat.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},\n\nCould you please verify or provide us with the proper citation for the following reference from your article, {$articleTitle}:\n\n{$rawCitation}\n\nThanks!\n\n{$userFirstName}\nCopy-Editor, {$journalName}\n', 'This email allows copyeditors to request additional information about references from authors.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'id_ID', 'Pengeditan Sitiran', '{$authorFirstName},\n\nDapatkah Anda memverifikasi atau menyediakan Sitiran yang tepat untuk kami untuk referensi berikut ini dari artikel Anda, {$articleTitle}:\n\n{$rawCitation}\n\nTerima kasih!\n\n{$userFirstName}\nCopy-Editor, {$journalName}\n', 'Email ini memudahkan copyeditor untuk meminta informasi tambahan tentang referensi dari penulis.'),
('COPYEDIT_ACK', 'en_US', 'Copyediting Acknowledgement', '{$copyeditorName}:\n\nThank you for copyediting the manuscript, "{$articleTitle}," for {$journalName}. It will make an important contribution to the quality of this journal.\n\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a submission''s Copyeditor to acknowledge that the Copyeditor has successfully completed the copyediting process and thank them for their contribution.'),
('COPYEDIT_ACK', 'id_ID', 'Pernyataan Copyediting', '{$copyeditorName}:\n\nTerima kasih untuk meng-copyedit manuskrip, "{$articleTitle}," untuk {$journalName}. Ini akan membuat kontribusi penting untuk kualitas jurnal ini. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian untuk Copyeditor naskah untuk menyatakan bahwa copyeditor telah menyelesaikan proses copyediting dengn sukses dan berterima kasih  untuk kontribusi mereka. '),
('COPYEDIT_AUTHOR_ACK', 'en_US', 'Copyediting Review Acknowledgement', '{$authorName}:\n\nThank you for reviewing the copyediting of your manuscript, "{$articleTitle}," for {$journalName}. We look forward to publishing this work.\n\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a submission''s Author to confirm completion of the Author''s copyediting process and thank them for their contribution.'),
('COPYEDIT_AUTHOR_ACK', 'id_ID', 'Pernyataan Review Copyediting', '{$authorName}:\n\nTerima kasih telah mereview copyediting manuskrip Anda, "{$articleTitle}," untuk {$journalName}. Kami menunggu untuk menerbitkan karya ini.\n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian kepada Penulis naskah untuk mengkonfirmasi penyelesaian proses copyediting penulis dan berterima kasih untuk kontribusi mereka. '),
('COPYEDIT_AUTHOR_COMPLETE', 'en_US', 'Copyediting Review Completed', '{$editorialContactName}:\n\nI have now reviewed the copyediting of the manuscript, "{$articleTitle}," for {$journalName}, and it is ready for the final round of copyediting and preparation for Layout.\n\nThank you for this contribution to my work,\n{$authorName}', 'This email is sent by the Author to the Section Editor to notify them that the Author''s copyediting process has been completed.'),
('COPYEDIT_AUTHOR_COMPLETE', 'id_ID', 'Review Copyediting Selesai', '{$editorialContactName}:\n\nSaya sekarang telah mereview copyediting manuskrip, "{$articleTitle}," untuk {$journalName}, dan siap untuk putaran terakhir copyediting dan persiapan layout. \n\nTerima kasih untuk kontribusi ini untuk karya saya.,\n{$authorName}', 'Email ini dikirim oleh Penulis kepada Editor Bagian untuk memberitahu mereka bahwa proses copyediting penulis telah selesai.'),
('COPYEDIT_AUTHOR_REQUEST', 'en_US', 'Copyediting Review Request', '{$authorName}:\n\nYour submission "{$articleTitle}" for {$journalName} has been through the first step of copyediting, and is available for you to review by following these steps.\n\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 1.\n3. Open the downloaded submission.\n4. Review the text, including copyediting proposals and Author Queries.\n5. Make any copyediting changes that would further improve the text.\n6. When completed, upload the file in Step 2.\n7. Click on METADATA to check indexing information for completeness and accuracy.\n8. Send the COMPLETE email to the editor and copyeditor.\n\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$authorUsername}\n\nThis is the last opportunity to make substantial copyediting changes to the submission. The proofreading stage, that follows the preparation of the galleys, is restricted to correcting typographical and layout errors.\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a submission''s Author to request that they proofread the work of the copyeditor. It provides access information for the manuscript and warns that this is the last opportunity the author has to make substantial changes.'),
('COPYEDIT_AUTHOR_REQUEST', 'id_ID', 'Permintaan Review Copyediting', '{$authorName}:\nNaskah Anda "{$articleTitle}" untuk {$journalName} telah melewati langkah pertama copyediting, dan tersedia untuk Anda untuk mereview dengan langkah-langkah berikut ini.\n\n1. Klik URL Penyerahan di bawah ini.\n2. Login ke jurnal dan klik di File yang ditampilkan di langkah 1. \n3. Buka naskah yang telah diunduh.\n4. Review teks ini, termasuk proposal copyedit dan Pertanyaan Penulis.\n5. Buatlah perubahan copyediting apapun yang selanjutnya akan meningkatkan teks. \n6. Saat selesai, upload file tersebut di Langkah 2. \n7. Klik di METADATA untuk mengecek informasi pengindeksan untuk kelengkapan dan keakuratan.\n8. Kirim email LENGKAP kepada editor dan copyeditor.\n\nURL Penyerahan: {$submissionCopyeditingUrl}\nNama pengguna Penulis: {$authorUsername}\n\nIni adalah kesempatan terbaik untuk membuat perubahan copyediting besar ke naskah. Tahap proofreading, yang mengikuti persiapa galley, terlarang untuk mengoreksi kesalahan layout dan tipografi. \n\nJika Anda tidak dapat bertanggung jawab atas pekerjaan ini saat ini atau mempunyai pertanyaan apapun, silakan hubungi saya. Terima kasih untuk kontribusi Anda kepada jurnal ini. \n\n{$editorialContactSignature}', 'Email ini dikirimkan oleh Editor Bagian kepada Penulis naskah untuk meminta mereka mem-proofreadi pekerjaan copyeditor. Email ini memberikan informasi akses untuk manuskrip dan memperingatkan bahwa ini adalah kesempatan terakhir penulis harus membuat perubahan besar. '),
('COPYEDIT_COMPLETE', 'en_US', 'Copyediting Completed', '{$editorialContactName}:\n\nWe have now copyedited your submission "{$articleTitle}" for {$journalName}. To review the proposed changes and respond to Author Queries, please follow these steps:\n\n1. Log into the journal using URL below with your username and password (use Forgot link if needed).\n2. Click on the file at 1. Initial Copyedit File to download and open copyedited version.\n3. Review the copyediting, making changes using Track Changes in Word, and answer queries.\n4. Save file to desktop and upload it in 2. Author Copyedit.\n5. Click the email icon under COMPLETE and send email to the editor.\n\nThis is the last opportunity that you have to make substantial changes. You will be asked at a later stage to proofread the galleys, but at that point only minor typographical and layout errors can be corrected.\n\nManuscript URL: {$submissionEditingUrl}\nUsername: {$authorUsername}\n\nIf you are unable to undertake this work at this time or have any questions,\nplease contact me. Thank you for your contribution to this journal.\n\n{$copyeditorName}', ''),
('COPYEDIT_COMPLETE', 'id_ID', 'Copyediting Selesai', '{$editorialContactName}:\n\nKami sekarang telah meng-copyedit naskah Anda "{$articleTitle}" for {$journalName}. Untuk mereview perubahan yang diusulkan dan merespon Pertanyaan Penulis, ikuti langkah-langkah berikut ini: \n\n1. Login ke jurnal dengan menggunakan URL di bawah ini dengan nama pengguna dan kata sandi Anda (gunakan tautan Lupa jika diperlukan). \n2. Klik di file di 1. File Copyedit Awal untuk mengunduh dan membuka versi yang telah di-copyedit. \n3. Review copyediting, membuat perubahan menggunakan Melacak Perubahan di Word, dan menjawab pertanyaan. \n4. Simpan file di desktop dan upload file ini di  2. Copyedit Penulis\n5. Klik ikon email di bawah LENGKAP dan kirimkan email ke editor. \n\nIni adalah kesempatan terakhir Anda harus membuat perubahan besar. Anda akan diminta di tahap selanjutnya untuk proofread galley, tapi saat itu kesalahan layout dan tipografi minor dapat dikoreksi. \n\nURL Manuskrip: {$submissionEditingUrl}\nNama pengguna Penulis: {$authorUsername}\n\nJika Anda tidak dapat bertanggungjawab atas pekerjaan ini sekarang atau mempunyai pertanyaan apapun, silakan hubungi saya. Terima kasih untuk kontribusi Anda untuk jurnal ini. \n\n{$copyeditorName}', ''),
('COPYEDIT_FINAL_ACK', 'en_US', 'Copyediting Final Review Acknowledgement', '{$copyeditorName}:\n\nThank you for completing the copyediting of the manuscript, "{$articleTitle}," for {$journalName}. This preparation of a "clean copy" for Layout is an important step in the editorial process.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Copyeditor acknowledges completion of the final round of copyediting and thanks them for their contribution.'),
('COPYEDIT_FINAL_ACK', 'id_ID', 'Pernyataan Review Final Copyediting', '{$copyeditorName}:\n\nTerima kasih telah menyelesaikan copyediting manuskrip, "{$articleTitle}," untuk {$journalName}. Persiapan "salinan bersih" untuk layout adalah sebuah langkah penting di proses editorial. \n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian kepada Copyeditor menyatakan putaran terakhir copyediting telah selesai dan berterima kasih  untuk kontribusi mereka. '),
('COPYEDIT_FINAL_COMPLETE', 'en_US', 'Copyediting Final Review Completed', '{$editorialContactName}:\n\nI have now prepared a clean, copyedited version of the manuscript, "{$articleTitle}," for {$journalName}. It is ready for Layout and the preparation of the galleys.\n\n{$copyeditorName}', 'This email from the Copyeditor to the Section Editor notifies them that the final round of copyediting has been completed and that the layout process may now begin.'),
('COPYEDIT_FINAL_COMPLETE', 'id_ID', 'Review Final Copyediting Selesai', '{$editorialContactName}:\n\nSaya telah menyiapkan versi copyedited manuskrip yang bersih, "{$articleTitle}," untuk {$journalName}. Ini siap untuk galley persiapan dan layout. \n\n{$copyeditorName}', 'Email ini dari Copyeditor kepada Editor Bagian yang memberitahu mereka bahwa putaran terakhir copyediting telah selesai dan proses layout boleh dimulai. '),
('COPYEDIT_FINAL_REQUEST', 'en_US', 'Copyediting Final Review', '{$copyeditorName}:\n\nThe author and editor have now completed their copyediting review of "{$articleTitle}" for {$journalName}. A "clean copy" now needs to be prepared for Layout by going through the following steps.\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 2.\n3. Open the downloaded file and incorporate all copyedits and query responses.\n4. Save clean file, and upload to Step 3 of Copyediting.\n5. Click on METADATA to check indexing information (saving any corrections).\n6. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$copyeditorUsername}\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Copyeditor requests that they perform a final round of copyediting on a submission before it enters the layout process.'),
('COPYEDIT_FINAL_REQUEST', 'id_ID', 'Review Final Copyediting', '{$copyeditorName}:\n\nPenulis dan editor telah menyelesaikan review copyediting mereka tentang "{$articleTitle}" untuk {$journalName}. Salinan yang "bersih" perlu disiapkan untuk Layout dengan melewati langkah-langkah di bawah ini. \n\n1. Klik URL Penyerahan di bawah ini. \n2. Login ke jurnal dan klik di File yang ditampilkan di Langkah 2. \n3. Buka file yang sudah diunduh dan mempersatukan seluruh copyedit dan respon pertanyaan. \n4. Simpan file yang bersih, dan upload ke Langkah 3 copyediting.\n5. Klik METADATA untuk mengecek informasi pengindeksan (menyimpan koreksi apapun)\n6. Kirim email LENGKAP kepada editor.\n\n{$journalName} URL: {$journalUrl}\nURL Penyerahan: {$submissionCopyeditingUrl}\nNama pengguna Copy Editor: {$copyeditorUsername}\n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian kepada Copyeditor meminta mereka melakukan putaran terakhir copyediting pada naskah sebelum memasuki proses layout.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$copyeditorName}:\n\nI would ask that you undertake the copyediting of "{$articleTitle}" for {$journalName} by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 1.\n3. Consult Copyediting Instructions posted on webpage.\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.\n5. Save copyedited file, and upload to Step 1 of Copyediting.\n6. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$copyeditorUsername}\n\n{$editorialContactSignature}', 'This email is sent by a Section Editor to a submission''s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('COPYEDIT_REQUEST', 'id_ID', 'Copyediting Request', '{$copyeditorName}:\n\nSaya meminta Anda bertanggungjawab atas proses copyediting  "{$articleTitle}" untuk{$journalName} dengan mengikuti langkah-langkah berikut.\n1. Klik URL Penyerahan di bawah ini.\n2. Login ke jurnal dan klik di file yang ditampilkan di Langkah 1. \n3. Baca Instruksi Copyediting yang diposting di halaman web. \n4. Buka file yang sudah diunduh dan copyedit, sementara menambahkan Pertanyaan Penulis seperti yang dibutuhkan. \n5. Simpan file yang telah dicopyedit, dan upload ke Langkah 1 copyediting.\n6. Kirim email LENGKAP kepada editor.\n\n{$journalName} URL: {$journalUrl}\nURL Penyerahan: {$submissionCopyeditingUrl}\nNama pengguna Copy Editor: {$copyeditorUsername}\n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian kepada Copyeditor naskah untuk meminta mereka memulai proses copyediting. Email ini memberikan informasi tentang naskah dan bagaimana mengaksesnya. '),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:\n\nThe submission, "{$articleTitle}," to {$journalName} has been assigned to you to see through the editorial process in your role as Section Editor.\n\nSubmission URL: {$submissionUrl}\nUsername: {$editorUsername}\n\nThank you,\n{$editorialContactSignature}', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_ASSIGN', 'id_ID', 'Tugas Editorial', '{$editorialContactName}:\n\nNaskah, "{$articleTitle}," untuk {$journalName} telah ditugaskan kepada Anda untuk has been assigned to you to see through the editorial process in your role as Section Editor.  \n\nURL Penyerahan: {$submissionUrl}\nNama Pengguna Editor: {$editorUsername}\n\nTerima kasih,\n{$editorialContactSignature}', 'Email ini memberitahu Editor Bagian bahwa Editor telah memberikan tugas untuk mengawasi naskah dalam proses pengeditan. Email ini memberikan informasi tentang naskah dan bagaimana untuk mengakses situs jurnal.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, "{$articleTitle}".\n\nOur decision is to:\n\n{$editorialContactSignature}\n', 'This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_ACCEPT', 'id_ID', 'Editor Decision', '{$authorName}:\n\nKami telah mengambil keputusan mengenai naskah Anda untuk {$journalTitle}, "{$articleTitle}".\n\nKeputusan kami adalah:\n\n{$editorialContactSignature}\n', 'Email ini dari Editor atau Editor Bagian kepada penulis berisi keputusan akhir tentang naskah mereka.'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, "{$articleTitle}".\n\nOur decision is to:\n\n{$editorialContactSignature}\n', 'This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'id_ID', 'Keputusan Editor', '{$authorName}:\n\nKami telah mengambil keputusan mengenai naskah Anda untuk {$journalTitle}, "{$articleTitle}".\n\nKeputusan kami adalah:\n\n{$editorialContactSignature}\n', 'Email ini dari Editor atau Editor Bagian kepada penulis berisi keputusan akhir tentang naskah mereka.'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, "{$articleTitle}".\n\nOur decision is to:\n\n{$editorialContactSignature}\n', 'This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_RESUBMIT', 'id_ID', 'Keputusan Editor', '{$authorName}:\n\nKami telah mengambil keputusan mengenai naskah Anda untuk  {$journalTitle}, "{$articleTitle}".\n\nKeputusan kami adalah:\n\n{$editorialContactSignature}\n', 'Email ini dari Editor atau Editor Bagian kepada penulis berisi keputusan akhir tentang naskah mereka.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, "{$articleTitle}".\n\nOur decision is to:\n\n{$editorialContactSignature}\n', 'This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'id_ID', 'Keputusan Editor', '{$authorName}:\n\nKami telah mengambil keputusan mengenai naskah Anda untuk {$journalTitle}, "{$articleTitle}".\n\nKeputusan kami adalah:\n\n{$editorialContactSignature}\n', 'Email ini dari Editor atau Editor Bagian kepada penulis berisi keputusan akhir tentang naskah mereka.'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing "{$articleTitle}" by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$journalName} at "{$articleUrl}".', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('EMAIL_LINK', 'id_ID', 'Artikel tentang Minat yang mungkin', 'Mungkin Anda tertarik untuk membaca "{$articleTitle}" oleh {$authorName} diterbitkan di Vol {$volume}, No {$number} ({$year}) di {$journalName} di "{$articleUrl}".', 'Template email ini menyediakan pembaca yang telah terdaftar sebuah kesempatan untuk mengirimkan informasi tentang sebuah artikel untuk seseorang yang mungkin tertarik. Ini tersedia melalui Alat Baca dan harus diaktifkan oleh Manajer Jurnal di halaman Administrasi Alat Baca. '),
('GIFT_AVAILABLE', 'en_US', '{$giftNoteTitle}', 'Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\n{$giftNote}\n\n\nYou will receive a follow-up email that includes login details and instructions for redeeming your gift.\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n', 'This email notifies a gift recipient that a gift has been purchased and is available for redemption.'),
('GIFT_USER_LOGIN', 'en_US', 'Redeem Your Gift: Login Details', 'Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\nTo redeem your gift, please login to the journal website at {$giftUrl}\n\nYour username: {$username}\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n', 'This email notifies a gift recipient of their login details.'),
('GIFT_USER_REGISTER', 'en_US', 'Redeem Your Gift: Login Details', 'Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\nTo redeem your gift, please login to the journal website at {$giftUrl}\n\nYour username: {$username}\nYour password: {$password}\n\nOnce logged in, you can change your password at any time.\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n', 'This email notifies a gift recipient of their login details for a new account.'),
('LAYOUT_ACK', 'en_US', 'Layout Acknowledgement', '{$layoutEditorName}:\n\nThank you for preparing the galleys for the manuscript, "{$articleTitle}," for {$journalName}. This is an important contribution to the publishing process.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor acknowledges completion of the layout editing process and thanks the layout editor for their contribution.'),
('LAYOUT_ACK', 'id_ID', 'Pernyataan Layout', '{$layoutEditorName}:\n\nTerima kasih untuk menyiapkan galley untuk manuskrip, "{$articleTitle}," untuk {$journalName}. Ini adalah kontribusi penting untuk proses penerbitan. \n\n{$editorialContactSignature}', ' Email ini dari Editor Bagian kepada Editor Layout yang menyatakan bahwa proses pengeditan layout telah selesai dan berterima kasih untuk kontribusi mereka.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:\n\nGalleys have now been prepared for the manuscript, "{$articleTitle}," for {$journalName} and are ready for proofreading.\n\nIf you have any questions, please contact me.\n\n{$layoutEditorName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_COMPLETE', 'id_ID', 'Galley Lengkap', '{$editorialContactName}:\n\nGalley sekarang telah disiapkan untuk manuskrip, "{$articleTitle}," untuk {$journalName} dan siap untuk proofreading. \n\nJika Anda mempunyai pertanyaan, silakan hubungi saya.\n\n{$layoutEditorName}', 'Email ini dari Editor Layout untuk Editor Bagian yang memberitahu mereka bahwa proses layout telah selesai. '),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$layoutEditorName}:\n\nThe submission "{$articleTitle}" to {$journalName} now needs galleys laid out by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and use the Layout Version file to create the galleys according to the journal''s standards.\n3. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionLayoutUrl}\nUsername: {$layoutEditorUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LAYOUT_REQUEST', 'id_ID', 'Permintaan Galleys', '{$layoutEditorName}:\n\nNaskah "{$articleTitle}" ke {$journalName} sekarang membutuhkan galley yang dikeluarkan dengan langkah-langkah berikut ini. \n1. Klik URL Penyerahan di bawah ini.\n2. Login ke jurnal dan gunakan file versi layout untuk membuat galley menurut standar jurnal. \n3. Kirim email LENGKAP kepada editor.\n\n{$journalName} URL: {$journalUrl}\nURL Penyerahan: {$submissionLayoutUrl}\nNama pengguna Layout Editor: {$layoutEditorUsername}\n\nJika Anda tidak bisa bertanggung jawab atas pekerjaan ini saat ini atau mempunyai pertanyaan apapub, silakan hubungi saya. Terima kasih untuk kontribusi Anda untuk jurnal ini. \n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian kepada Editor Layout yang memberitahu mereka bahwa mereka telah diberikan tugas untuk melakukan pengeditan layout pada naskah. Email ini memberikan informasi tentang naskah dan bagaimana mengaksesnya. '),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$journalName}', 'Dear [University Librarian]\n\n{$journalName} <{$journalUrl}>, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.\n\n[Brief description of journal]\n\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$journalUrl}/gateway/lockss\n\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.\n\nThank you,\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal''s LOCKSS Publisher Manifest.'),
('LOCKSS_EXISTING_ARCHIVE', 'id_ID', 'Permintaan Pengarsipan untuk {$journalName}', 'Kepada [Pustakawan Universitas]\n\n{$journalName} <{$journalUrl}>, adalah sebuah jurnal yang anggota fakultas Anda, [name of member], berperan sebagai [nama posisi]. Jurnal akan membuat arsip LOCKSS (Lots of Copies Keep Stuff Safe) dengan ini dan perpustakaan universitas lain.\n\n[Deskripsi singkat tentang jurnal]\n\nURL ke LOCKSS Publisher Manifest untuk jurnal kami: {$journalUrl}/gateway/lockss\n\nKami mengerti Anda telah berpartisipasi di LOCKSS. Jika kami dapat menyediakan metadata tambahan apapun untuk tujuan mendaftarkan jurnal kami dengan versi Anda tentang LOCKSS, kami akan senang menyediakannya.\n\nTerima kasih,\n{$principalContactSignature}', 'Email ini meminta penjaga arsip LOCKSS untuk mempertimbangkan memasukkan jurnal ini di arsip mereka. Email ini menyediakan URL ke LOCKSS Publisher Manifest jurnal.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$journalName}', 'Dear [University Librarian]\n\n{$journalName} <{$journalUrl}>, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.\n\n[Brief description of journal]\n\nThe LOCKSS Program <http://lockss.org/>, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.\n\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.\n\nThank you,\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('LOCKSS_NEW_ARCHIVE', 'id_ID', 'Permintaan Mengarsipkan untuk {$journalName}', 'Kepada [Pustakawan Universitas]\n\n{$journalName} <{$journalUrl}>, adalah sebuah jurnal yang anggota fakultas Anda, [name of member] berperan sebagai [nama posisi]. Jurnal akan membuat arsip  LOCKSS (Lots of Copies Keep Stuff Safe) dengan ini dan perpustakaan universitas lain.\n\n[Deskripsi singkat tentang jurnal]\n\nProgram LOCKSS <http://lockss.org/> prakarsa penerbit/ perpustakaan internasional, adalah sebuah contoh bekerja dari repositori pengarsipan dan pemeliharaan, detail tambahan di bawah ini. Perangkat lunak, yang digunakan pada komputer personal biasa, bebas biaya; sistem dengan mudah dibawa online; membutuhkan sedikit perawatan terus menerus.\n\nUntuk membantu mengarsipkan jurnal kami, kami mengundang Anda untuk menjadi anggota komunitas LOCKSS untuk membantu mengoleksi dan memelihara judul yang dihasilkan oleh fakultas Anda dan siswa-siswa lain di seluruh dunia. Untuk melakukannya, utuslah staf Anda untuk mengunjungi situs LOCKSS untuk informasi tentang bagaimana sistem ini beroperasi. Saya menunggu kabar dari Anda tentang kemungkinan untuk menyediakan dukungan pengarsipan ini untuk jurnal ini.   \n\nTerima kasih,\n{$principalContactSignature}', 'Email ini mendorong penerima untuk berpartisipasi di prakarsa LOCKSS dan memasukkan jurnal ini di arsip. Email ini menyediakan informasi tentang prakarsa LOCKSS dan cara-cara untuk terlibat.  '),
('LUCENE_ARTICLE_INDEXING_ERROR_NOTIFICATION', 'en_US', 'Article Indexing Error', 'An indexing error occurred while updating the article index.\n\nThe error message generated by the web service (if any): "{$error}"\n\nThis email was generated by Open Journal Systems'' Lucene search plugin.', 'This email template is used to notify the technical contact\nof a journal that an error occurred during article indexing.'),
('LUCENE_JOURNAL_INDEXING_ERROR_NOTIFICATION', 'en_US', 'Journal Indexing Error', 'An indexing error occurred while indexing the journal "{$journalName}".\n\nThe error message generated by the web service (if any): "{$error}"\n\nThis email was generated by Open Journal Systems'' Lucene search plugin.', 'This email template is used to notify the technical contact\nof a journal that an error occurred during journal indexing.'),
('LUCENE_SEARCH_SERVICE_ERROR_NOTIFICATION', 'en_US', 'Journal Search Service Error', 'An error occurred while someone tried to search the installation "{$siteName}".\n\nThe error message generated by the web service (if any): "{$error}"\n\nThis email was generated by Open Journal Systems'' Lucene search plugin.', 'This email template is used to notify the technical contact\nof a journal that an error occurred while trying to access the Solr search service.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$journalName} and the user {$userFullName} (username "{$userName}").\n\nThe item being paid for is "{$itemName}".\nThe cost is {$itemCost} ({$itemCurrencyCode}).\n\nThis email was generated by Open Journal Systems'' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('MANUAL_PAYMENT_NOTIFICATION', 'id_ID', ' Pemberitahuan Pembayaran Manual ', ' Pembayaran manual harus diproses untuk jurnal dan {$journalName} pengguna {$userFullName} (nama pengguna "{$userName}").\nThe item being paid for "{$itemName}". \nBiaya adalah {$itemCost} ({$itemCurrencyCode}). \nSurat elektronik ini dibuat oleh plugin pembayaran manual IOJS.', ' Email ini digunakan untuk memberitahukan kontak manajer jurnal bahwa pembayaran manual dibutuhkan.'),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:\n\n{$notificationContents}\n\nLink: {$url}\n\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION', 'id_ID', 'Notifikasi baru dari {$siteTitle}', 'Anda mempunyai notifikasi baru dari {$siteTitle}:\n\n{$notificationContents}\n\ntautan: {$url}\n\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang telah terdaftar yang memilih untuk menerima tipe notifikasi ini dikirim melalui email kepada mereka. '),
('NOTIFICATION_MAILLIST', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.\n\n{$principalContactSignature}', 'This email is sent to unregistered users on the notification mailing list.'),
('NOTIFICATION_MAILLIST', 'id_ID', 'Notifikasi baru dari {$siteTitle}', 'Anda punya notifikasi baru dari {$siteTitle}:\n--\n{$notificationContents}\n\ntautan: {$url}\n--\n\nJika Anda ingin berhenti menerima email notifikasi, pergilah ke {$unsubscribeLink} dan masukkan alamat email dan kata sandi Anda.\n\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang telah terdaftar di mailing list notifikasi.'),
('NOTIFICATION_MAILLIST_PASSWORD', 'id_ID', 'informasi mailing list notifikasi Anda untuk {$siteTitle}', 'Kata sandi baru Anda untuk menon-aktifkan email notifikasi adalah: {$password}\n\nJika Anda ingin berhenti menerima email notifikasi, pergilah ke {$unsubscribeLink} dan masukkan alamat email dan kata sandi Anda.\n\n{$principalContactSignature}', 'Email ini dikirim ke pengguna yang tidak terdaftar di mailing list notifikasi saat mereka menunjukkan bahwa mereka lupa kata sandi mereka atau tidak bisa login. Email ini menyediakan URL yang bisa mereka ikuti untuk mengatur ulang kata sandi mereka. '),
('NOTIFICATION_MAILLIST_WELCOME', 'en_US', 'Welcome to the the {$siteTitle} mailing list!', 'You have signed up to receive notifications from {$siteTitle}.\n\nPlease click on this link to confirm your request and add your email address to the mailing list: {$confirmLink}\n\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.\n\n{$principalContactSignature}', 'This email is sent to an unregistered user who just registered with the notification mailing list.'),
('NOTIFICATION_MAILLIST_WELCOME', 'id_ID', 'Selamat datang ke  mailing list{$siteTitle}!', 'Anda telah sign up untuk menerima notifikasi dari {$siteTitle}.\n			\nKlik di tautan ini untuk mengkonfirmasi permintaan Anda dan tambahkan alamat email Anda ke mailing list: {$confirmLink}\n\nJika Anda ingin berhenti menerima email notifikasi, pergilah ke {$unsubscribeLink} dan masukkan alamat email dan kata sandi Anda.\n\nKata sandi Anda untuk menon-aktifkan email adalah: {$password}\n\n{$principalContactSignature}', 'Email ini dikirim ke pengguna yang tidak terdaftar yang baru saja terdaftar dengan mailing list notifikasi.'),
('OFR_OBJECT_ASSIGNED', 'en_US', 'Object for Review: Object Assigned', 'Dear {$authorName}:\n\nThis email confirms that {$objectForReviewTitle} has been assigned to you for an object review to be completed by {$objectForReviewDueDate}.\n\nPlease ensure that your mailing address in your online user profile is up-to-date. This address will be used to mail a copy of the object to you for the review.\n\nThe mailing address that we currently have on file is:\n{$authorMailingAddress}\n\nIf this address is incomplete or you are no longer at this address, please use the following user profile URL to update your address:\n\nUser Profile URL: {$userProfileUrl}\n \nTo submit your object review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this object review.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an object review author when an editor assigns the object for review to the author.'),
('OFR_OBJECT_DENIED', 'en_US', 'Object for Review', 'Dear {$authorName}:\n\nUnfortunately, I am not able to assign {$objectForReviewTitle} to you at this time for an object review.\n\nI hope you consider reviewing another object from our listing, either at this time or in the future.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an interested author when an object is no longer available for review.'),
('OFR_OBJECT_MAILED', 'en_US', 'Object for Review: Object Mailed', 'Dear {$authorName}:\n\nThis email confirms that I have mailed a copy of {$objectForReviewTitle} to the following mailing address from your online user profile:\n{$authorMailingAddress}\n \nTo submit your object review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this object review.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an object review author when the editor has mailed a copy of the object to the author.'),
('OFR_OBJECT_REQUESTED', 'en_US', 'Object for Review: Object Requested', 'Dear {$editorName}:\n\nI am interested in writing an object review of {$objectForReviewTitle}.\n\nCan you please confirm whether this object is still available for review?\n\n{$authorContactSignature}', 'This email is sent to an editor by an author interested in writing an object review for a listed object.'),
('OFR_REVIEWER_REMOVED', 'en_US', 'Object for Review', 'Dear {$authorName}:\n\nThis email confirms that you have been removed as the object reviewer for {$objectForReviewTitle}.\n\nI hope you consider reviewing another object from our listing, either at this time or in the future.\n\n{$editorialContactSignature}', 'This email is sent by an editor to an interested author when an object is no longer available for review.'),
('OFR_REVIEW_REMINDER', 'en_US', 'Object for Review: Due Date Reminder', 'Dear {$authorName}:\n\nThis is a friendly reminder that your object review of {$objectForReviewTitle} is due {$objectForReviewDueDate}.\n\nTo submit your object review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this object review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}', 'This is an automatically generated email that is sent to an object for review author as a reminder that the due date for the review is approaching.'),
('OFR_REVIEW_REMINDER_LATE', 'en_US', 'Object for Review: Review Due', 'Dear {$authorName}:\n\nThis is a friendly reminder that your object review of {$objectForReviewTitle} was due {$objectForReviewDueDate} but has not been received yet.\n\nTo submit your object review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this object review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}', 'This is an automatically generated email that is sent to an object for review author after the review due date has passed.'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:\n\n{$journalName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$journalUrl}) to review articles and items of interest.\n\nThanks for the continuing interest in our work,\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('OPEN_ACCESS_NOTIFY', 'id_ID', 'Akses Terbuka Terbitan Terkini', 'Pembaca:\n\n{$journalName} telah membuat terbitan berikut ini tersedia di format akses terbuka. Kami mengundang Anda untuk mereview Daftar Isi di sini dan kemudian mengunjungi web site kami({$journalUrl}) untuk mereview artikel dan item minat.\n\nTerima kasih untuk melanjutkan minat Anda terhadap karya kami,\n{$editorialContactSignature}', 'Email ini dikirim untuk pembaca yang telah terdaftar yang ingin menerima email notifikasi saat terbitan menjadi akses terbuka.'),
('PASSWORD_RESET', 'en_US', 'Password Reset', 'Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.\n\nYour username: {$username}\nYour new password: {$password}\n\n{$principalContactSignature}', 'This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('PASSWORD_RESET', 'id_ID', 'Atur Ulang Kata Sandi', 'Kata sandi Anda telah sukses diatur ulang untuk penggunaan dengan web site {$siteTitle}. Ingatlah nama pengguna dan kata sandi ini karena diperlukan untuk semua pekerjaan di jurnal.\n\nNama pengguna Anda: {$username}\nKata sandi baru Anda: {$password}\n\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang terdaftar saat mereka telah sukses mengatur ulang kata sandi mereka dengan mengikuti proses yang dideskripsikan di email  PASSWORD_RESET_CONFIRM.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.\n\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.\n\nReset my password: {$url}\n\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PASSWORD_RESET_CONFIRM', 'id_ID', 'Konfirmasi Atur Ulang Kata Sandi', 'Kami telah menerima permintaan untuk mengatur ulang kata sandi Anda untuk web site {$siteTitle}.\n\nJika Anda tidak membuat permintaan ini, mohon abaikan email ini dan kata sandi Anda tidak akan diganti. Jika Anda ingin mengatur ulang kata sandi Anda, klik di URL di bawah ini. \n\nAtur ulang kata sandi saya: {$url}\n\n{$principalContactSignature}', 'Email ini dikirimkan untuk pengguna yang telah terdaftar saat mereka menunjukkan bahwa mereka lupa kata sandi mereka atau tidak bisa login. Email ini menyediakan URL yang dapat mereka ikuti untuk mengatur ulang kata sandi mereka.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$journalName}. This activity may need further investigation or manual intervention.\n                       \nThis email was generated by Open Journal Systems'' PayPal plugin.\n\nFull post information for the request:\n{$postInfo}\n\nAdditional information (if supplied):\n{$additionalInfo}\n\nServer vars:\n{$serverVars}\n', 'This email template is used to notify a journal''s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'id_ID', ' Kegiatan pembayaran paypal yang tidak biasa ', ' IOJS telah menemukan kegiatan yang tidak biasa yang berhubungan dengan bantuan pembayaran paypal untuk jurnal {$journalName}. Kegiatan ini mungkin dibutuhkan investigasi yang lebih lanjut atau intervensi manual. Emai ini diciptakan oleh OJS PayPal plugin.\nInformasi posting penuh untuk permohonan:\n{$postInfo}\nInformasi tambahan (jika tersedia):\n{$additionalInfo}\nVariasi Server :\n{$serverVars}\n', ' Email ini digunakan untuk memberitahukan jurnal kontak utama yang mempunyai kegiatan yang mencurigakan atau kegiatan yang membutuhkan intervensi manual yang ditemukan oleh plugin paypal.'),
('PROOFREAD_ACK', 'en_US', 'Proofreading Acknowledgement', '{$proofreaderName}:\n\nThank you for proofreading the galleys for the manuscript, "{$articleTitle}," for {$journalName}. This work makes an important contribution to the quality of this journal.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Proofreader confirms completion of the proofreader''s proofreading process and thanks them for their contribution.'),
('PROOFREAD_ACK', 'id_ID', 'Proofreading Acknowledgement', '{$proofreaderName}:\n\nTerima kasih telah mem-proofreading galley untuk manuskrip, "{$articleTitle}," untuk {$journalName}. Pekerjaan ini memberikan kontribusi penting pada kualitas jurnal ini. \n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian untuk Proofreader mengkonfirmasi penyelesaian proses proofreading dan berterima kasih  untuk kontribusi mereka. '),
('PROOFREAD_AUTHOR_ACK', 'en_US', 'Proofreading Acknowledgement (Author)', '{$authorName}:\n\nThank you for proofreading the galleys for your manuscript, "{$articleTitle}," in {$journalName}. We are looking forward to publishing your work shortly.\n\nIf you subscribe to our notification service, you will receive an email of the Table of Contents as soon as it is published. If you have any questions, please contact me.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Author acknowledges completion of the initial proofreading process and thanks them for their contribution.'),
('PROOFREAD_AUTHOR_ACK', 'id_ID', 'Pernyataan Proofreading (Penulis)', '{$authorName}:\n\nTerima kasih telah mem-proofreading galley untuk manuskrip Anda, "{$articleTitle}," di {$journalName}. Kami menunggu untuk menerbitkan karya kami dalam waktu dekat ini. \n\nJika Anda berlangganan layanan notifikasi kami, Anda akan menerima email tentang Daftar Isi secepat Daftar Isi itu diterbitkan. Jika Anda mempunyai pertanyaa, silakan hubungi saya. \n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian untuk Penulis menyatakan bahwa proses proofreading awal telah selesai dan berterima kasih  untuk kontribusi mereka.'),
('PROOFREAD_AUTHOR_COMPLETE', 'en_US', 'Proofreading Completed (Author)', '{$editorialContactName}:\n\nI have completed proofreading the galleys for my manuscript, "{$articleTitle}," for {$journalName}. The galleys are now ready to have any final corrections made by the Proofreader and Layout Editor.\n\n{$authorName}', 'This email from the Author to the Proofreader and Editor notifies them that the Author''s round of proofreading is complete and that details can be found in the article comments.'),
('PROOFREAD_AUTHOR_COMPLETE', 'id_ID', 'Proofreading Selesai (Penulis)', '{$editorialContactName}:\n\nSaya telah menyelesaikan proofreading galley untuk manuskrip saya, "{$articleTitle}," untuk {$journalName}. Galley sekarang siap untuk mendapatkan koreksi final oleh Proofreader dan Editor Layout.\n\n{$authorName}', 'Email ini dari Penulis untuk Proofreader dan Editor yang memberitahu mereka bahwa putaran proofreading Penulis telah selesai dan detail dapat ditemukan di komentar artikel.'),
('PROOFREAD_AUTHOR_REQUEST', 'en_US', 'Proofreading Request (Author)', '{$authorName}:\n\nYour submission "{$articleTitle}" to {$journalName} now needs to be proofread by folllowing these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and view PROOFING INSTRUCTIONS\n3. Click on VIEW PROOF in Layout and proof the galley in the one or more formats used.\n4. Enter corrections (typographical and format) in Proofreading Corrections.\n5. Save and email corrections to Layout Editor and Proofreader.\n6. Send the COMPLETE email to the editor.\n\nSubmission URL: {$submissionUrl}\nUsername: {$authorUsername}\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Author notifies them that an article''s galleys are ready for proofreading. It provides information about the article and how to access it.'),
('PROOFREAD_AUTHOR_REQUEST', 'id_ID', 'Permintaan Proofreading (Penulis)', '{$authorName}:\n\nNaskah Anda "{$articleTitle}" untuk {$journalName} sekarang perlu di-proofread dengan mengikuti langkah-langkah berikut ini.\n1. Klik di URL Penyerahan berikut ini.\n2. Login ke jurnal dan lihar INSTRUKSI PROOFING .\n3. Klik di LIHAT PROOF di Layout dan galley proof di satu atau lebih format yang digunakan. \n4. Masukkan koreksi (tipografi dan format) dalam koreksi proofreading.\n5. Simpan dan kirimkan email tentang koreksi ke Editor Layout dan Proofreader.\n6. Kirim email LENGKAP kepada editor.\n\nURL Penyerahan: {$submissionUrl}\nNama pengguna Penulis: {$authorUsername}\n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian untuk Penulis yang memberitahu mereka bahwa galley artikel siap untuk di-proofreading. Email ini memberikan informasi tentang artikel dan bagaimana mengaksesnya.'),
('PROOFREAD_COMPLETE', 'en_US', 'Proofreading Completed', '{$editorialContactName}:\n\nI have completed proofreading the galleys for the manuscript, "{$articleTitle}," for {$journalName}. The galleys are now ready to have any final corrections made by the Layout Editor.\n\n{$proofreaderName}', 'This email from the Proofreader to the Section Editor notifies them that the Proofreader has completed the proofreading process.'),
('PROOFREAD_COMPLETE', 'id_ID', 'Proofreading Selesai', '{$editorialContactName}:\n\nSaya telah menyelesaikan proses proofreading galley untuk manuskrip, "{$articleTitle}," untuk {$journalName}. Galley sekarang siap untuk koreksi final yang dibuat oleh Editor Layout. \n\n{$proofreaderName}', 'Email ini dari Proofreader untuk Editor Bagian yang memberitahu mereka bahwa Proofreader telah menyelesaikan proses proofreading. '),
('PROOFREAD_LAYOUT_ACK', 'en_US', 'Proofreading Acknowledgement (Layout Editor)', '{$layoutEditorName}:\n\nThank you for completing the proofreading corrections for the galleys associated with the manuscript, "{$articleTitle}," for {$journalName}. This represents an important contribution to the work of this journal.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor acknowledges completion of the final stage of proofreading and thanks them for their contribution.'),
('PROOFREAD_LAYOUT_ACK', 'id_ID', 'Pernyataan Proofreading (Editor Layout)', '{$layoutEditorName}:\n\nTerima kasih untuk menyelesaikan koreksi proofreading untuk galley yang diasosiasikan dengan manuskrip, "{$articleTitle}," untuk {$journalName}. Ini mewakili kontribusi penting untuk karya jurnal ini. \n\n{$editorialContactSignature}', 'Email dari Editor Bagian untuk Editor Layout menyatakan bahwa tahap akhir proofreading telah selesai dan berterima kasih untuk kontribusi mereka. '),
('PROOFREAD_LAYOUT_COMPLETE', 'en_US', 'Proofreading Completed (Layout Editor)', '{$editorialContactName}:\n\nThe galleys have now been corrected, following their proofreading, for the manuscript, "{$articleTitle}," for {$journalName}. This piece is now ready to publish.\n\n{$layoutEditorName}', 'This email from the Layout Editor to the Section Editor notifies them that the final stage of proofreading has been completed and the article is now ready to publish.'),
('PROOFREAD_LAYOUT_COMPLETE', 'id_ID', 'Proofreading Selesai (Editor Layout)', '{$editorialContactName}:\n\nGalley sekarang telah dikoreksi, mengikuti proofreading mereka, untuk manuskrip, "{$articleTitle}," untuk {$journalName}. Bagian ini sekarang siap untuk diterbitkan.\n\n{$layoutEditorName}', 'Email ini dari Editor Layout untuk Editor Bagian yang memberitahu mereka bahwa tahap akhir proofreading telah selesai dan artikel sekarang siap untuk diterbitkan. '),
('PROOFREAD_LAYOUT_REQUEST', 'en_US', 'Proofreading Request (Layout Editor)', '{$layoutEditorName}:\n\nThe submission "{$articleTitle}" to {$journalName} has been proofread by the author and proofreader, and any corrections should now be made by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal consult Proofreading Corrections to create corrected galleys.\n3. Upload the revised galleys.\n4. Send the COMPLETE email in Proofreading Step 3 to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubnmission URL: {$submissionUrl}\nUsername: {$layoutEditorUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor notifies them that an article''s galleys are ready for final proofreading. It provides information on the article and how to access it.'),
('PROOFREAD_LAYOUT_REQUEST', 'id_ID', 'Permintaan Proofreading (Editor Layout)', '{$layoutEditorName}:\n\nNaskah "{$articleTitle}" untuk {$journalName} telah diproofread oleh penulis dan proofreader, dan koreksi apapun harus dibuat dengan mengikuti langkah-langkah berikut ini. \n1. Klik di URL Penyerahan di bawah ini. \n2. Login ke jurnal baca Koreksi Proofreading untuk membuat galley yang dikoreksi. \n3. Upload galley yang telah direvisi.\n4. Kirim email LENGKAP di Proofreading Langkah 3 kepada editor.\n\n{$journalName} URL: {$journalUrl}\nURL Penyerahan: {$submissionUrl}\nNama pengguna Layout Editor: {$layoutEditorUsername}\n\nJika Anda tidak bisa bertanggung jawab atas pekerjaan ini saat ini atau mempunyai pertanyaan, silakan hubungi saya. Terima kasih atas kontribusi Anda untuk jurnal ini. \n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian untuk Editor Layout yang memberitahu mereka bahwa galley artikel siap untuk proofreading final. Email ini memberikan informasi tentang artikel dan bagaimana mengaksesnya. '),
('PROOFREAD_REQUEST', 'en_US', 'Proofreading Request', '{$proofreaderName}:\n\nThe submission "{$articleTitle}" to {$journalName} now needs to be proofread by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and view PROOFING INSTRUCTIONS.\n3. Click on VIEW PROOF in Layout and proof the galley in the one or more formats used.\n4. Enter corrections (typographical and format) in Proofreading Corrections.\n5. Save and email corrections to Layout Editor.\n6. Send the COMPLETE email to the editor.\n\nManuscript URL: {$submissionUrl}\nUsername: {$proofreaderUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}', 'This email from the Section Editor to the Proofreader requests that they perform proofreading of an article''s galleys. It provides information about the article and how to access it.'),
('PROOFREAD_REQUEST', 'id_ID', 'Pemintaan Proofreading', '{$proofreaderName}:\n\nNaskah "{$articleTitle}"  untuk {$journalName} sekarang perlu di-proofread dengan langkah-langkah berikut ini.\n1. Klik di URL Penyerahan di bawah ini.\n2. Login ke jurnal dan lihat INSTRUKSI PROOFING. \n3. Klik di LIHAT PROOF di Layout dan proof galley di satu atau lebih format yang digunakan.  \n4. Masukkan koreksi (tipografi dan format) di Koreksi Proofreading.\n5. Simpan dan kirimkan email tentang koreksi kepada Editor Layout.\n6. Kirim email LENGKAP kepada editor.\n\nURL Manuskrip: {$submissionUrl}\nNama pengguna Proofreader: {$proofreaderUsername}\n\nJika Anda tidak bisa bertanggung jawab atas pekerjaan ini atau mempunyai pertanyaan, silakan hubungi saya. Terima kasih untuk kontribusi Anda untuk jurnal ini.\n\n{$editorialContactSignature}', 'Email ini dari Editor Bagian untuk Proofreader meminta bahwa mereka melakukan proofreading terhadap galley artikel. Email ini memberikan informasi tentang artikel dan bagaimana mengaksesnya. '),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:\n\n{$journalName} has just published its latest issue at {$journalUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.\n\nThanks for the continuing interest in our work,\n{$editorialContactSignature}', 'This email is sent to registered readers via the "Notify Users" link in the Editor''s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('PUBLISH_NOTIFY', 'id_ID', 'tTerbitan Baru diterbitkan', 'Pembaca:\n\n{$journalName} baru saja menerbitkan terbitan terbarunya di {$journalUrl}. Kami mengundang Anda untuk mereview Daftar Isi dan kemudian mengunjungi web site kami untuk mereivew artikel dan item minat.\n\nTerima kasih untuk melanjutkan minat pada pekerjaan kami,\n{$editorialContactSignature}', 'Email ini dikirim untuk pembaca yang terdaftar melalui tautan "Beritahu Pengguna"  di User Home Editor. Email ini memberitahu pembaca tentang terbitan baru dan mengundang mereka untuk mengunjungi jurnal di URL yang telah disediakan. '),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$journalName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you''ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.\n\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.\n\nUsername: {$username}\nPassword: {$password}\n\nThank you,\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEWER_REGISTER', 'id_ID', 'Pendaftaran sebagai Reviewer dengan {$journalName}', 'Untuk alasan keahlian Anda, kami telah berinisiatif mendaftarkan nama Anda di database reviewer untuk {$journalName}. Ini tidak memerlukan bentuk komitmen apapun di pihak Anda, tapi hanya memudahkan kami untuk mendekati Anda dengan naskah untuk direview. Saat diundang untuk mereview, Anda akan mempunyai kesempatan untuk melihat judul dan abtrak makalah dalam pertanyaan, dan Anda akan selalu berada dalam posisi untuk menerima atau menolak undangan. Anda dapat juga meminta kapanpun agar nama Anda dipindahkan dari daftar reviewer. \n\nKami menyediakan Anda dengan nama pengguna dan kata sandi, yang digunakan di semua interaksi dengan jurnal di websitenya. Anda bisa, sebagai contoh, untuk mengupdate profil Anda, termasuk minat mereview Anda.  \n\nNama pengguna: {$username}\nKata sandi: {$password}\n\nTerima kasih,\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang baru terdaftar untuk menyambut mereka ke sistem dan menyediakan catatan nama pengguna dan kata sandi mereka. '),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:\n\nThank you for completing the review of the submission, "{$articleTitle}," for {$journalName}. We appreciate your contribution to the quality of the work that we publish.\n\n{$editorialContactSignature}', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_ACK', 'id_ID', 'Pernyataan Review Artikel', '{$reviewerName}:\n\nTerima kasih telah menyelesaikan review naskah, "{$articleTitle}," untuk {$journalName}. Kami menghargai kontribusi Anda untuk kualitas karya yang kami terbitkan. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian untuk mengkonfirmasi kuitansi review yang telah selesai dan berterima kasih kepada Reviewer untuk kontribusi mereka.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:\n\nWe have decided at this point to cancel our request for you to review the submission, "{$articleTitle}," for {$journalName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal''s review process in the future.\n\nIf you have any questions, please contact me.\n\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CANCEL', 'id_ID', 'Permintaan Review dibatalkan', '{$reviewerName}:\n\nKami telah memutuskan saat ini untuk membatalkan permintaan kami untuk Anda mereview naskah, "{$articleTitle}," untuk {$journalName}. Kami meminta maaf untuk ketidaknyamanan ini dan kami harap bisa menghubungi Anda untuk membantu proses review jurnal ini di masa depan. \n\nJika Anda mempunyai pertanyaan, silakan hubungi saya. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian untuk Reviewer yang sedang mereview naskah untuk memberitahu mereka bahwa review dibatalkan. '),
('REVIEW_COMPLETE', 'en_US', 'Article Review Completed', '{$editorialContactName}:\n\nI have now completed my review of "{$articleTitle}" for {$journalName}, and submitted my recommendation, "{$recommendation}."\n\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor to notify them that a review has been completed and the comments and recommendations have been recorded on the journal web site.'),
('REVIEW_COMPLETE', 'id_ID', 'Review Artikel Selesai', '{$editorialContactName}:\n\nSaya telah menyelesaikan review saya tentang "{$articleTitle}" untuk {$journalName}, dan menyerahkan rekomendasi saya, "{$recommendation}."\n\n{$reviewerName}', 'Email ini dikirim oleh Reviewer untuk Editor Bagian untuk memberitahu mereka bahwa review telah selesai dan komentar serta rekomendasi telah dicatat di web site jurnal. '),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', '{$editorialContactName}:\n\nI am able and willing to review the submission, "{$articleTitle}," for {$journalName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.\n\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_CONFIRM', 'id_ID', 'Bisa mereview', '{$editorialContactName}:\n\nSaya bisa dan bersedia mereview naskah, "{$articleTitle}," untuk {$journalName}. Terima kasih untuk memikirkan saya, dan saya berencana untuk menyelesaikan review sebelum tanggal jatuh temponya, {$reviewDueDate}, jika tidak sebelumnya.\n\n{$reviewerName}', 'Email ini dikirim oleh Reviewer untuk Editor Bagian sebagai respon pada permintaan review untuk memberitahu Editor Bagian yang permintaan reviewnya telah diterima dan akan diselesaikan sebelum tanggal yang ditentukan. '),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', '{$editorialContactName}:\n\nI am afraid that at this time I am unable to review the submission, "{$articleTitle}," for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.\n\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_DECLINE', 'id_ID', 'Tidak bisa mereview', '{$editorialContactName}:\n\nSaya khawatir saat ini saya tidak bisa mereview naskah, "{$articleTitle}," untuk {$journalName}. Terima kasih untuk memikirkan saya dan di waktu yang lain silakan hubungi saya.\n\n{$reviewerName}', 'Email ini dikriim oleh Reviewer untuk Editor Bagian sebagai respon pada permintaan review untuk memberitahu Editor Bagian yang permintaan reviewnya telah ditolak. .'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, "{$articleTitle}," for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.\n\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:\n\nHanya sebagai pengingat tentang permintaan kami untuk review naskah Anda, "{$articleTitle},"  untuk  {$journalName}.  Kami berharap memiliki review ini sebelum tanggal {$reviewDueDate}, dan akan senang untuk menerimanya secepat Anda bisa menyiapkan review ini.\n\nJika Anda tidak punya nama pengguna dan kata sandi untuk web site jurnal, Anda dapat menggunakan tautan ini untuk mengatur ulang kata sandi Anda (yang kemudian akan diemail kepada Anda beserta nama pengguna Anda). {$passwordResetUrl}\n\nURL Penyerahan: {$submissionReviewUrl}\n\nMohon konfirmasi kemampuan Anda untuk menyelesaikan kontribusi vital ini untuk pekerjaan jurnal. Saya menunggu kabar dari Anda. \n\n{$editorialContactSignature}', 'Email ini dikirim oleh Editor Bagian untuk Editor untuk mengingatkan Reviewer bahwa review mereka jatuh tempo.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, "{$articleTitle}," for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.\n\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer''s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO', 'id_ID', 'Pengingat Review Naskah Otomatis', '{$reviewerName}:\n\nHanya sebagai pengingat tentang permintaan kami untuk review naskah Anda, "{$articleTitle},"  untuk  {$journalName}.  Kami berharap memiliki review ini sebelum tanggal {$reviewDueDate}, dan email ini secara otomasti dihasilkan dan dikirim setelah melewati tanggal tersebut. Kami masih akan senang untuk menerimanya secepat Anda bisa menyiapkan review ini. \n\n\nJika Anda tidak punya nama pengguna dan kata sandi untuk web site jurnal, Anda dapat menggunakan tautan ini untuk mengatur ulang kata sandi Anda (yang kemudian akan diemail kepada Anda beserta nama pengguna Anda). {$passwordResetUrl}\n\n\nURL Penyerahan: {$submissionReviewUrl}\n\nMohon konfirmasi kemampuan Anda untuk menyelesaikan kontribusi vital ini untuk pekerjaan jurnal. Saya menunggu kabar dari Anda. \n\n{$editorialContactSignature}', 'Email ini secara otomatis terkirim saat tanggal jatuh tempo review sudah berlalu (lihat Pilihan Review di bawah Setup Jurnal, Langkah 2) dan akses Reviewer satu-klik tidak aktifkan. Tugas yang dijadwalkan harus diaktifkan dan dikonfigurasi (lihat file konfigurasi situs). '),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, "{$articleTitle}," for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer''s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'id_ID', 'Pengingat Review Naskah Otomatis', '{$reviewerName}:\n\nHanya sebagai pengingat tentang permintaan kami untuk mereview naskah Anda, "{$articleTitle},"  untuk  {$journalName}.  Kami berharap memiliki review ini sebelum tanggal {$reviewDueDate}, dan email ini secara otomatis dihasilkan dan dikirim setelah melewati tanggal tersebut. Kami masih akan senang untuk menerimanya secepat Anda bisa menyiapkan review ini. \n\nURL Penyerahan: {$submissionReviewUrl}\n\nMohon konfirmasi kemampuan Anda untuk menyelesaikan kontribusi vital ini untuk pekerjaan jurnal. Saya menunggu kabar dari Anda. \n\n\n{$editorialContactSignature}', 'Email ini secara otomatis terkirim saat tanggal jatuh tempo review berlalu (lihat Pilihan Review di bawah Setup Jurnal, Langkah 2) dan akses Reviewer satu-klik diaktifkan. Tugas yang dijadwalkan harus diaktifkan dan dikonfigurasi (lihat file konfigurasi situs). '),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, "{$articleTitle}," for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_ONECLICK', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:\n\nHanya sebagai pengingat tentang permintaan kami untuk review naskah Anda, "{$articleTitle},"  untuk  {$journalName}.  Kami berharap memiliki review ini sebelum tanggal {$reviewDueDate}, dan akan senang untuk menerimanya secepat Anda bisa menyiapkan review ini.\n\nURL Penyerahan: {$submissionReviewUrl}\n\nMohon konfirmasi kemampuan Anda untuk menyelesaikan kontribusi vital ini untuk pekerjaan jurnal. Saya menunggu kabar dari Anda. \n\n{$editorialContactSignature}', 'Email ini akan dikirimkan oleh Editor Bagian untuk mengingatkan Reviewer bahwa review mereka memasuki jatuh tempo.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, "{$articleTitle}," which has been submitted to {$journalName}. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$journalUrl}\n\nThe review itself is due {$reviewDueDate}.\n\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST', 'id_ID', 'Permintaan Review Artikel', '{$reviewerName}:\n\nSaya yakin Anda dapat menjadi reviewer handal manuskrip, "{$articleTitle}," yang telah diserahkan ke {$journalName}. Abstrak naskah disertakan di bawah ini, dan saya harap Anda mempertimbangkan untuk mengambil tugas penting ini untuk kami. \n\n\nMohon login ke web site jurnal sebelum tanggal {$weekLaterDate} untuk menunjukkan apakah Anda akan mengambil Review ini atau tidak, serta untuk mengakses naskah dan mencatat Review dan rekomendasi Anda. Web sitenya adalah {$journalUrl}\n\nReview jatuh tempo tanggal {$reviewDueDate}.\n\nJika Anda tidak punya nama pengguna dan kata sandi untuk web site jurnal, Anda dapat menggunakan tautan ini untuk mengatur ulang kata sandi Anda (yang kemudian akan diemail kepada Anda beserta nama pengguna Anda). \n\n{$passwordResetUrl}\n\nURL Penyerahan: {$submissionReviewUrl}\n\nTerima kasih untuk mempertimbangkan permintaan ini.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'Email ini dari Editor Bagian untuk Reviewer yang meminta Reviewer untuk menerima atau menolak tugas mereview naskah. Email ini memberikan informasi tentang naskah seperti judul dan abstrak, tanggal jatuh tempo review, dan bagaimana mengakses naskah itu sendiri. Pesan ini digunakan saat proses review standar dipilih di Setup Jurnal, Langkah 2. (Jika tidak, lihat  REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, "{$articleTitle}," and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.\n\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\nReview Guidelines\n\n{$reviewGuidelines}\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED', 'id_ID', 'Permintaan Review Artikel', '{$reviewerName}:\n\nSaya yakin Anda akan berperan sebagai Reviewer handal manuskrip, "{$articleTitle}," dan saya meminta Anda untuk mempertimbangkan tugas penting ini untuk kami. Petunjuk Review untuk jurnal ini dilampirkan di bawah ini, dan naskah dilampirkan di email ini. Review naskah, beserta rekomendasi Anda harus diemail ke saya sebelum tanggal {$reviewDueDate}.\n\nMohon tunjukkan di email balasan sebelum {$weekLaterDate} apakah Anda bisa atau bersedia melakukan review.\n\nTerima kasih untuk mempertimbangkan permintaan ini.\n\n{$editorialContactSignature}\n\n\nPetunjuk Review\n\n{$reviewGuidelines}\n', 'Email ini dikirim oleh Editor Bagian untuk Reviewer yang meminta mereka menerima atau menolak tugas mereview naskah. Naskah disertakan di lampiran. Pesan ini digunakan saat proses review lampiran-email dipilih di Setup Jurnal, Langkah 2. (jika tidak lihat REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nThis regards the manuscript "{$articleTitle}," which is under consideration by {$journalName}.\n\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.\n\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.\n\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\nReview Guidelines\n\n{$reviewGuidelines}\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, "{$articleTitle}," which has been submitted to {$journalName}. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.\n\nThe review itself is due {$reviewDueDate}.\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK', 'id_ID', 'Permintaan Review Artikel', '{$reviewerName}:\n\nSaya yakin Anda akan berperan sebagai Reviewer handal manuskrip, "{$articleTitle}," yang telah diserahkan ke {$journalName}. Abstrak naskah disertakan di bawah ini, dan saya harap Anda akan mempertimbangkan untuk mengambil tugas penting ini untuk kami.\n\nLogin ke web site jurnal sebelum tanggal {$weekLaterDate} untuk menunjukkan apakah Anda akan mengambil review atau tidak, serta untuk mengakses naskah dan mencatat review dan rekomendasi Anda.\n\nReview jatuh tempo sebelum tanggal {$reviewDueDate}.\n\nURL Penyerahan: {$submissionReviewUrl}\n\nTerima kasih untuk mempertimbangkan permintaan ini.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'Email ini dari Editor Bagian untuk Reviewer yang meminta Reviewer untuk menerima atau menolak tugas mereview naskah. Email ini memberikan informasi tentang naskah seperti judul dan abstrak, tanggal jatuh tempo tijauan, dan bagaimana mengakses naskah itu sendiri. Pesan ini digunakan saat proses review standar dipilih di Setup Jurnal, Langkah 2 dan akses Reviewer satu kali klik dapat digunakan. '),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nThis regards the manuscript "{$articleTitle}," which is under consideration by {$journalName}.\n\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.\n\nThe review itself is due {$reviewDueDate}.\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:\n\nThis regards the manuscript "{$articleTitle}," which is under consideration by {$journalName}.\n\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$journalUrl}\n\nThe review itself is due {$reviewDueDate}.\n\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n"{$articleTitle}"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', '{$editorialContactName}:\n\nA revised version of "{$articleTitle}" has been uploaded by the author {$authorName}.\n\nSubmission URL: {$submissionUrl}\n\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:\n\nThank you for submitting the manuscript, "{$articleTitle}" to {$journalName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: {$submissionUrl}\nUsername: {$authorUsername}\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK', 'id_ID', 'Pernyataan Naskah', '{$authorName}:\n\nTerima kasih untuk menyerahkan manuskrip, "{$articleTitle}" untuk {$journalName}. Dengan sistem manajemen jurnal online yang kami gunakan, Anda akan bisa melacak kemajuan naskah dalam proses editorial dengan login ke web site jurnal:\n\nURL Manuskrip: {$submissionUrl}\nNama pengguna Penulis: {$authorUsername}\n\nJika Anda mempunyai pertanyaan, silakan hubungi saya. Terima kasih untuk mempertimbangkan jurnal ini sebagai tempat untuk karya Anda. \n\n{$editorialContactSignature}', 'Email ini, saat sudah bisa, secara otomatis terkirim ke penulis saat dia menyelesaikan proses penyerahan manuskrip ke jurnal. Email ini memberikan informasi tentang pelacakan naskah dalam proses dan berterima kasih pada penulis untuk penyerahan ini. '),
('SUBMISSION_COMMENT', 'en_US', 'Submission Comment', '{$name}:\n\n{$commentName} has added a comment to the submission, "{$articleTitle}" in {$journalName}:\n\n{$comments}', 'This email notifies the various people involved in a submission''s editing process that a new comment has been posted.'),
('SUBMISSION_COMMENT', 'id_ID', 'Komentar Naskah', '{$name}:\n\n{$commentName} telah menambahkan komentar ke naskah, "{$articleTitle}" di {$journalName}:\n\n{$comments}', 'Email ini memberitahu berbagai orang yang terlibat di proses pengeditan naskah bahwa komentar baru telah diposting. '),
('SUBMISSION_DECISION_REVIEWERS', 'en_US', 'Decision on "{$articleTitle}"', 'As one of the reviewers for the submission, "{$articleTitle}," to {$journalName}, I am sending you the reviews and editorial decision sent to the author of this piece. Thank you again for your important contribution to this process.\n\n{$editorialContactSignature}\n\n{$comments}', 'This email notifies the reviewers of a submission that the review process has been completed. It includes information about the article and the decision reached, and thanks the reviewers for their contributions.'),
('SUBMISSION_DECISION_REVIEWERS', 'id_ID', 'Keputusan di "{$articleTitle}"', 'Sebagai salah satu reveiwer untuk naskah, "{$articleTitle}," untuk {$journalName}, saya mengirim Anda Review dan keputusan editorial yang dikirimkan untuk penulis bagian ini. Terima kasih lagi untuk kontribusi penting Anda untuk proses ini. \n \n{$editorialContactSignature}\n\n{$comments}', 'Email ini memberitahu reviewer naskah bahwa proses Review telah selesai, termasuk informasi tentang artikel dan keputusan yang telah dibuat, dan terima kasih kepada reveiwer untuk kontribusi mereka. '),
('SUBMISSION_UNSUITABLE', 'en_US', 'Unsuitable Submission', '{$authorName}:\n\nAn initial review of "{$articleTitle}" has made it clear that this submission does not fit within the scope and focus of {$journalName}. I recommend that you consult the description of this journal under About, as well as its current contents, to learn more about the work that we publish. You might also consider submitting this manuscript to another, more suitable journal.\n\n{$editorialContactSignature}', ''),
('SUBMISSION_UNSUITABLE', 'id_ID', 'Naskah yang tidak cocok', '{$authorName}:\n\nReview awal "{$articleTitle}" telah memutuskan naskah ini tidak cocok dengan ruang lingkup dan fokus {$journalName}. Saya merekomendasikan Anda untuk melihat lagi deskripsi jurnal di bawah Tentang, serta kontennya yang sekarang, untuk mempelajari lebih jauh tentang karya yang kami terbitkan. Anda juga dapat mempertimbangkan untuk menyerahkan manuskrip ini ke jurnal lain yang lebih cocok. \n{$editorialContactSignature}', ''),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:\n\nYour {$journalName} subscription has expired.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, "{$username}".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'id_ID', 'Langganan Berakhir', '{$subscriberName}:\n\nLangganan {$journalName} Anda telah berakhir.\n\n{$subscriptionType}\nTanggal Berakhir: {$expiryDate}\n\nUntuk memperbarui langganan Anda, pergi ke website jurnal. Anda bisa login ke sistem dengan nama pengguna Anda, "{$username}".\n\nJika Anda mempunyai pertanyaan, silakan hubungi saya.\n\n{$subscriptionContactSignature}', 'Email ini memberitahu pelanggan bahwa langganan mereka telah berakhir. Email ini menyediakan URL jurnal bersama dengan instruksi untuk akses.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:\n\nYour {$journalName} subscription has expired.\nPlease note that this is the final reminder that will be emailed to you.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, "{$username}".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'id_ID', 'Langganan Berakhir Pengingat Akhir', '{$subscriberName}:\n\nLangganan {$journalName} Anda telah berakhir.\nPerhatikan bahwa ini adalah pengingat akhir yang akan diemail kepada Anda. \n\n{$subscriptionType}\nTanggal Berakhir: {$expiryDate}\n\nUntuk memperbarui langganan Anda, pergi ke website jurnal. Anda bisa login ke sistem dengan nama pengguna Anda, "{$username}".\n\nJika Anda mempunyai pertanyaan, silakan hubungi saya.\n\n{$subscriptionContactSignature}', 'Email ini memberitahu pelanggan bahwa langganan mereka telah berakhir. Email ini menyediakan URL jurnal bersama dengan instruksi untuk akses. '),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:\n\nYour {$journalName} subscription is about to expire.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, "{$username}".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'id_ID', 'Pemberitahuan Masa Berakhir Langganan', '{$subscriberName}:\n\nLangganan {$journalName} Anda akan segera berakhir.\n\n{$subscriptionType}\nTanggal Berakhir: {$expiryDate}\n\nUntuk memastikan kesinambungan akses Anda ke jurnal ini, pergi ke website jurnal dan perbarui langganan Anda. Anda bisa login ke sistem dengan nama pengguna Anda, "{$username}".\n\nJika Anda mempunyai pertanyaan, silakan hubungi saya.\n\n{$subscriptionContactSignature}', 'Email ini memberitahu pelanggan bahwa langganan mereka akan segera berakkhir. Email ini menyediakan URL jurnal bersama dengan instruksi untuk akses. ');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:\n\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:\n\n{$subscriptionType}\n\nTo access content that is available only to subscribers, simply log in to the system with your username, "{$username}".\n\nOnce you have logged in to the system you can change your profile details and password at any point.\n\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'id_ID', 'Notifikasi Langganan', '{$subscriberName}:\n\nAnda sekarang telah didaftar sebagai pelanggan di sistem manajemen jurnal online kami untuk  {$journalName}, dengan langganan sebagai berikut:\n\n{$subscriptionType}\n\nUntuk mengakses konten yang tersedia hanya untuk pelanggan, hanya login ke sistem dengan nama pengguna Anda, "{$username}".\n\nSaat Anda telah login ke sistem, Anda dapat mengganti detail profil dan kata sandi kapanpun. \n\nPerhatikan bahwa jika Anda mempunyai langganan institusional,  pengguna di institusi Anda tidak perlu login karena permintaan untuk konten langganan akan secara otomatis disahkan oleh sistem. \n\nJika Anda mempunyai pertanyaan, silakan hubungi saya.\n\n{$subscriptionContactSignature}', 'Email ini memberitahu pembaca yang telah terdaftar bahwa Manajer telah membuat langganan untuk mereka. Email ini memberikan informasi tentang URL jurnal  bersama dengan instruksi untuk akses.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nUser:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INDL', 'id_ID', 'Pembelian Langganan: Individu', 'Langganan individu telah dibeli online untuk {$journalName} dengan detail berikut ini.\n\nTipe Langganan:\n{$subscriptionType}\n\nPengguna:\n{$userDetails}\n\nInformasi Keanggotaan (Jika tersedia):\n{$membership}\n\nUntuk melihat atau mengedit langganan ini, gunakan URL berikut ini.\n\nURL Langganan: {$subscriptionUrl}\n', 'Email ini memberitahu Manajer Langganan bahwa langganan individu telah dibeli online. Email ini memberikan informasi ringkasan tentang langganan dan tautan akses cepat ke langganan yang dibeli.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to ''Active''.\n\nSubscription Type:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (if provided):\n{$domain}\n\nIP Ranges (if provided):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'id_ID', 'Beli Langganan: Institusi', 'Langganan Insititusi telah dibeli online untuk {$journalName} dengan detail berikut ini. Untuk mengaktifkan langganan ini, gunakan URL langganan yang telah disediakan dan atur status langganan menjadi ''Aktif''.  \n\nTipe Langganan:\n{$subscriptionType}\n\nInstitusi:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (jika tersedia):\n{$domain}\n\nIP Ranges (jika tersedia):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nInformasi Keanggotaan (jika tersedia):\n{$membership}\n\nUntuk melihat atau mengedit langganan ini, gunakan URL berikut ini.\n\nURL Langganan: {$subscriptionUrl}\n', 'Email ini memberitahu Manajer Langganan bahwa langganan institusional telah dibeli online. Email ini memberikan informasi ringkasan tentang langganan dan tautan akses cepat ke langganan yang telah dibeli.'),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nUser:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'id_ID', 'Pembaruan Langganan: Individu', 'Langganan individu telah diperbarui online untuk {$journalName} dengan detail berikut ini.\n\nTipe Langganan:\n{$subscriptionType}\n\nPengguna:\n{$userDetails}\n\nInformasi Keanggotaan (jika tersedia):\n{$membership}\n\nUntuk melihat atau mengedit langganan ini, gunakan URL berikut ini.\n\nURL Langganan: {$subscriptionUrl}\n', 'Email ini memberitahu Manajer Langganan bahwa langganan institusional telah dibeli online. Email ini memberikan informasi ringkasan tentang langganan dan tautan akses cepat ke langganan yang telah dibeli.'),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (if provided):\n{$domain}\n\nIP Ranges (if provided):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'id_ID', 'Pembaruan Langganan: Institusional', 'Langganan Institusional telah diperbarui online untuk {$journalName} dengan detail berikut ini.\n\nTipe Langganan:\n{$subscriptionType}\n\nInstitusi:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (jika tersedia):\n{$domain}\n\nIP Ranges (jika tersedia):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nInformasi Keanggotaan (jika tersedia):\n{$membership}\n\nUntuk melihat atau mengedit langganan ini, gunakan URL berikut ini.\n\nURL Langganan: {$subscriptionUrl}\n', 'Email ini memberitahu Manajer Langganan bahwa langganan institusional telah dibeli online. Email ini memberikan informasi ringkasan tentang langganan dan tautan akses cepat ke langganan yang telah dibeli.'),
('SWORD_DEPOSIT_NOTIFICATION', 'en_US', 'Deposit Notification', 'Congratulations on the acceptance of your submission, "{$articleTitle}", for publication in {$journalName}. If you choose, you may automatically deposit your submission in one or more repositories.\n\nGo to {$swordDepositUrl} to proceed.\n\nThis email was generated by Open Journal Systems'' SWORD deposit plugin.', 'This email template is used to notify an author of optional deposit points for SWORD deposits.'),
('SWORD_DEPOSIT_NOTIFICATION', 'id_ID', 'Notifikasi Deposit', 'Selamat atas diterimanya naskah Anda, "{$articleTitle}", untuk penerbitan di  {$journalName}. Jika Anda memilih, Anda boleh secara otomatis menyimpan naskah Anda di satu repositori atau lebih.  \n\nPergi ke {$swordDepositUrl} untuk melanjutkan.\n\nEmail ini dihasilkan oleh Plugin deposit SWORD Open Journal System.', 'Template email ini digunakan untuk memberitahu penulis poin deposit opsional untuk SWORD deposits.'),
('THESIS_ABSTRACT_CONFIRM', 'en_US', 'Thesis Abstract Submission', 'This email was automatically generated by the {$journalName} thesis abstract submission form.\n\nPlease confirm that the submitted information is correct. Upon receiving your confirmation, the abstract will be published in the online edition of the journal.\n\nSimply reply to {$thesisName} ({$thesisEmail}) with the contents of this message and your confirmation, as well as any recommended clarifications or corrections.\n\nThank you.\n\n\nTitle : {$title} \nAuthor : {$studentName}\nDegree : {$degree}\nDegree Name: {$degreeName}\nDepartment : {$department}\nUniversity : {$university}\nAcceptance Date : {$dateApproved}\nSupervisor : {$supervisorName}\n\nAbstract\n--------\n{$abstract}\n\n{$thesisContactSignature}', 'This email template is used to confirm a thesis abstract submission by a student. It is sent to the student''s supervisor, who is asked to confirm the details of the submitted thesis abstract.'),
('THESIS_ABSTRACT_CONFIRM', 'id_ID', 'Penyerahan Abstrak Tesis', 'Email ini secara otomatis dihasilkan oleh formulir penyerahan abstrak tesis{$journalName}.\n\nKonfirmasi bahwa informasi yang diserahkan benar. Saat menerima konfirmasi Anda, abstrak akan diterbitkan di edisi online jurnal.\n\nBalas ke {$thesisName} ({$thesisEmail}) dengan konten pesan ini dan konfirmasi Anda, serta koreksi atau klarifikasi yang direkomendasikan.  \n\nTerima kasih.\n\n\nJudul : {$title} \nPenulis : {$studentName}\nGelar : {$degree}\nNama Gelar: {$degreeName}\nDepartemen : {$department}\nUniversitas : {$university}\nData Penerimaan : {$dateApproved}\nSupervisor : {$supervisorName}\n\nAbstrak\n--------\n{$abstract}\n\n{$thesisContactSignature}', 'Template email ini digunakan untuk mengkonfirmasi penyerahan abstrak tesis oleh siswa. Ini dikirim ke supervisor penulis, yang diminta untuk mengkonfirmasi detail abstrak tesis yang diserahkan. '),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}\n\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal''s list of users by contacting me.\n\nUsername: {$username}\nPassword: {$password}\n\nThank you,\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_REGISTER', 'id_ID', 'Pendaftaran Jurnal', '{$userFullName}\n\nAnda sekarang telah terdaftar sebagai pengguna dengan {$journalName}. Kami telah memasukkan nama pengguna dan kata sandi Anda di email ini, yang dibutuhkan untuk semua pekerjaan dengan jurnal ini di dalam websitenya. Kapanpun, Anda dapat meminta untuk dipindahkan dari daftar pengguna jurnal dengan menghubungi saya. \n\nNama pengguna: {$username}\nKata Sandi: {$password}\n\nTerima kasih,\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang baru terdaftar untuk menyambut mereka ke sistem dan menyediakan catatan nama pengguna dan kata sandi mereka.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}\n\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:\n\n{$activateUrl}\n\nThank you,\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.'),
('USER_VALIDATE', 'id_ID', 'Validasikan Akun Anda', '{$userFullName}\n\nAnda telah membuat satu akun dengan {$journalName}, tapi sebelum Anda dapat mulai menggunakannya, Anda perlu memvalidasi akun email Anda/ untuk melakukan ini, ikutilah tautan di bawah ini. \n\n{$activateUrl}\n\nTerima kasih,\n{$principalContactSignature}', 'Email ini dikirim untuk pengguna yang baru terdaftar untuk menyambut mereka ke sistem dan menyediakan catatan nama pengguna dan kata sandi mereka. ');

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE IF NOT EXISTS `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `event_log`
--

INSERT INTO `event_log` (`log_id`, `assoc_type`, `assoc_id`, `user_id`, `date_logged`, `ip_address`, `event_type`, `message`, `is_translated`) VALUES
(1, 257, 1, 2, '2015-03-05 12:22:03', '::1', 268435457, 'log.author.submitted', 0),
(2, 257, 2, 3, '2015-03-16 03:47:18', '::1', 268435457, 'log.author.submitted', 0),
(3, 257, 2, 1, '2015-03-16 03:48:20', '::1', 805306369, 'log.editor.editorAssigned', 0),
(4, 257, 2, 2, '2015-03-16 03:58:32', '::1', 1073741825, 'log.review.reviewerAssigned', 0),
(5, 257, 2, 2, '2015-03-16 04:00:08', '::1', 805306372, 'log.editor.editorFile', 0),
(6, 257, 2, 2, '2015-03-16 04:10:43', '::1', 805306371, 'log.editor.decision', 0),
(7, 257, 2, 2, '2015-03-16 04:18:04', '::1', 805306371, 'log.editor.decision', 0),
(8, 257, 2, 2, '2015-03-16 04:31:18', '::1', 1073741845, 'log.review.reviewAcceptedByProxy', 0),
(9, 257, 2, 2, '2015-03-18 16:35:34', '::1', 1073741833, 'log.review.reviewRecommendationSet', 0),
(10, 257, 2, 2, '2015-03-18 16:37:54', '::1', 1342177285, 'log.copyedit.initialEditComplete', 0),
(11, 257, 2, 2, '2015-03-18 16:38:03', '::1', 1342177286, 'log.copyedit.finalEditComplete', 0),
(12, 257, 8, 3, '2015-03-20 08:05:41', '::1', 268435457, 'log.author.submitted', 0),
(13, 257, 8, 2, '2015-03-20 08:23:18', '::1', 805306369, 'log.editor.editorAssigned', 0),
(14, 257, 8, 2, '2015-03-20 08:23:21', '::1', 805306369, 'log.editor.editorAssigned', 0),
(15, 257, 8, 2, '2015-03-20 08:30:14', '::1', 1073741825, 'log.review.reviewerAssigned', 0),
(16, 257, 8, 2, '2015-03-20 08:34:39', '::1', 1073741845, 'log.review.reviewDeclinedByProxy', 0),
(17, 257, 8, 2, '2015-03-20 08:35:57', '::1', 1073741825, 'log.review.reviewerAssigned', 0),
(18, 257, 8, 1, '2015-03-20 09:12:45', '::1', 1073741830, 'log.review.reviewAccepted', 0),
(19, 257, 8, 1, '2015-03-20 09:15:35', '::1', 1073741833, 'log.review.reviewRecommendationSet', 0),
(20, 257, 8, 2, '2015-03-20 09:16:52', '::1', 805306372, 'log.editor.editorFile', 0),
(21, 257, 8, 2, '2015-03-20 09:17:05', '::1', 805306371, 'log.editor.decision', 0),
(22, 257, 8, 2, '2015-03-20 09:20:10', '::1', 1342177285, 'log.copyedit.initialEditComplete', 0),
(23, 257, 8, 2, '2015-03-20 09:20:20', '::1', 1342177286, 'log.copyedit.finalEditComplete', 0),
(24, 257, 15, 3, '2015-03-21 09:45:48', '::1', 268435457, 'log.author.submitted', 0),
(25, 257, 20, 3, '2015-03-21 09:58:06', '::1', 268435457, 'log.author.submitted', 0),
(26, 257, 20, 2, '2015-03-23 12:03:08', '::1', 805306369, 'log.editor.editorAssigned', 0),
(27, 257, 20, 2, '2015-03-23 12:05:23', '::1', 1073741825, 'log.review.reviewerAssigned', 0),
(28, 257, 20, 1, '2015-03-23 12:16:43', '::1', 1073741830, 'log.review.reviewAccepted', 0),
(29, 257, 20, 1, '2015-03-23 12:17:08', '::1', 1073741843, 'log.review.reviewerFile', 0),
(30, 257, 20, 1, '2015-03-23 12:20:41', '::1', 1073741843, 'log.review.reviewerFile', 0),
(31, 257, 20, 1, '2015-03-23 12:21:22', '::1', 1073741833, 'log.review.reviewRecommendationSet', 0),
(32, 257, 20, 2, '2015-03-23 12:22:03', '::1', 805306371, 'log.editor.decision', 0),
(33, 257, 20, 3, '2015-03-23 12:24:24', '::1', 536870913, 'log.author.documentRevised', 0),
(34, 257, 20, 2, '2015-03-23 16:23:30', '::1', 805306371, 'log.editor.decision', 0),
(35, 257, 20, 2, '2015-03-24 00:59:10', '::1', 805306371, 'log.editor.decision', 0),
(36, 257, 27, 3, '2015-03-24 07:22:13', '::1', 268435457, 'log.author.submitted', 0),
(37, 257, 27, 2, '2015-03-24 07:23:53', '::1', 805306369, 'log.editor.editorAssigned', 0),
(38, 257, 27, 2, '2015-03-24 07:24:38', '::1', 1073741825, 'log.review.reviewerAssigned', 0),
(39, 257, 27, 1, '2015-03-24 07:28:35', '::1', 1073741830, 'log.review.reviewAccepted', 0),
(40, 257, 27, 1, '2015-03-24 07:29:29', '::1', 1073741833, 'log.review.reviewRecommendationSet', 0),
(41, 257, 27, 2, '2015-03-24 07:31:05', '::1', 805306371, 'log.editor.decision', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_log_settings`
--

CREATE TABLE IF NOT EXISTS `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_log_settings`
--

INSERT INTO `event_log_settings` (`log_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'authorName', 'Destra Bintang Perkasa', 'string'),
(2, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(3, 'editorId', '1', 'string'),
(3, 'editorName', 'destraaaa ', 'string'),
(4, 'reviewerName', 'Destra Bintang Perkasa', 'string'),
(4, 'reviewId', '1', 'string'),
(4, 'round', '1', 'string'),
(5, 'fileId', '3', 'string'),
(6, 'decision', 'Resubmit for Review', 'string'),
(6, 'editorName', 'Destra Bintang Perkasa', 'string'),
(7, 'decision', 'Accept Submission', 'string'),
(7, 'editorName', 'Destra Bintang Perkasa', 'string'),
(8, 'reviewerName', 'Destra Bintang Perkasa', 'string'),
(8, 'reviewId', '1', 'string'),
(8, 'round', '1', 'string'),
(8, 'userName', 'Destra Bintang Perkasa', 'string'),
(9, 'articleId', '2', 'string'),
(9, 'reviewerName', 'Destra Bintang Perkasa', 'string'),
(9, 'reviewId', '1', 'string'),
(9, 'round', '1', 'string'),
(10, 'copyeditorName', 'Destra Bintang Perkasa', 'string'),
(11, 'copyeditorName', 'Destra Bintang Perkasa', 'string'),
(12, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(13, 'editorId', '2', 'string'),
(13, 'editorName', 'Destra Bintang Perkasa', 'string'),
(14, 'editorId', '2', 'string'),
(14, 'editorName', 'Destra Bintang Perkasa', 'string'),
(15, 'reviewerName', 'Destra Bintang Perkasa', 'string'),
(15, 'reviewId', '2', 'string'),
(15, 'round', '1', 'string'),
(16, 'reviewerName', 'Destra Bintang Perkasa', 'string'),
(16, 'reviewId', '2', 'string'),
(16, 'round', '1', 'string'),
(16, 'userName', 'Destra Bintang Perkasa', 'string'),
(17, 'reviewerName', 'destraaaa ', 'string'),
(17, 'reviewId', '3', 'string'),
(17, 'round', '1', 'string'),
(18, 'articleId', '8', 'string'),
(18, 'reviewerName', 'destraaaa ', 'string'),
(18, 'reviewId', '3', 'string'),
(18, 'round', '1', 'string'),
(19, 'articleId', '8', 'string'),
(19, 'reviewerName', 'destraaaa ', 'string'),
(19, 'reviewId', '3', 'string'),
(19, 'round', '1', 'string'),
(20, 'fileId', '11', 'string'),
(21, 'decision', 'Accept Submission', 'string'),
(21, 'editorName', 'Destra Bintang Perkasa', 'string'),
(22, 'copyeditorName', 'Destra Bintang Perkasa', 'string'),
(23, 'copyeditorName', 'Destra Bintang Perkasa', 'string'),
(24, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(25, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(26, 'editorId', '2', 'string'),
(26, 'editorName', 'Destra Bintang Perkasa', 'string'),
(27, 'reviewerName', 'destraaaa ', 'string'),
(27, 'reviewId', '4', 'string'),
(27, 'round', '1', 'string'),
(28, 'articleId', '20', 'string'),
(28, 'reviewerName', 'destraaaa ', 'string'),
(28, 'reviewId', '4', 'string'),
(28, 'round', '1', 'string'),
(29, 'reviewId', '4', 'string'),
(30, 'reviewId', '4', 'string'),
(31, 'articleId', '20', 'string'),
(31, 'reviewerName', 'destraaaa ', 'string'),
(31, 'reviewId', '4', 'string'),
(31, 'round', '1', 'string'),
(32, 'decision', 'Revisions Required', 'string'),
(32, 'editorName', 'Destra Bintang Perkasa', 'string'),
(33, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(33, 'fileId', '42', 'string'),
(34, 'decision', 'Accept Submission', 'string'),
(34, 'editorName', 'Destra Bintang Perkasa', 'string'),
(35, 'decision', 'Accept Submission', 'string'),
(35, 'editorName', 'Destra Bintang Perkasa', 'string'),
(36, 'authorName', 'Rachmawaty Rachmawaty', 'string'),
(37, 'editorId', '2', 'string'),
(37, 'editorName', 'Destra Bintang Perkasa', 'string'),
(38, 'reviewerName', 'destraaaa ', 'string'),
(38, 'reviewId', '5', 'string'),
(38, 'round', '1', 'string'),
(39, 'articleId', '27', 'string'),
(39, 'reviewerName', 'destraaaa ', 'string'),
(39, 'reviewId', '5', 'string'),
(39, 'round', '1', 'string'),
(40, 'articleId', '27', 'string'),
(40, 'reviewerName', 'destraaaa ', 'string'),
(40, 'reviewId', '5', 'string'),
(40, 'round', '1', 'string'),
(41, 'decision', 'Accept Submission', 'string'),
(41, 'editorName', 'Destra Bintang Perkasa', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `external_feeds`
--

CREATE TABLE IF NOT EXISTS `external_feeds` (
  `feed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `display_homepage` tinyint(4) NOT NULL DEFAULT '0',
  `display_block` smallint(6) NOT NULL DEFAULT '0',
  `limit_items` tinyint(4) DEFAULT '0',
  `recent_items` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `external_feeds_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `external_feed_settings`
--

CREATE TABLE IF NOT EXISTS `external_feed_settings` (
  `feed_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `external_feed_settings_pkey` (`feed_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(2, 2, 0, 'MODS 3.4', 'lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter', 0, 0, 0),
(3, 3, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(4, 4, 0, 'Inject metadata into a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(5, 5, 0, 'Extract metadata from a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
(6, 6, 0, 'Inject metadata into a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
(7, 10, 0, 'NLM 3.0 XML Citation Output', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 0, 0, 0),
(8, 11, 0, 'NLM Journal Publishing V3.0 ref-list', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 0, 0),
(9, 12, 0, 'NLM Journal Publishing V2.3 ref-list', 'lib.pkp.classes.filter.GenericSequencerFilter', 0, 0, 0),
(10, 11, 0, 'NLM 2.3: NLM 3.0', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 9, 1),
(11, 13, 0, 'NLM 2.3: NLM 3.0 to 2.3', 'lib.pkp.classes.xslt.XSLTransformationFilter', 0, 9, 2),
(12, 8, 0, 'CrossRef', 'lib.pkp.plugins.citationLookup.crossref.filter.CrossrefNlm30CitationSchemaFilter', 1, 0, 0),
(13, 8, 0, 'ISBNdb', 'lib.pkp.classes.filter.GenericSequencerFilter', 1, 0, 0),
(14, 15, 0, 'ISBNdb (from NLM)', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbNlm30CitationSchemaIsbnFilter', 0, 13, 1),
(15, 16, 0, 'ISBNdb', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbIsbnNlm30CitationSchemaFilter', 0, 13, 2),
(16, 8, 0, 'PubMed', 'lib.pkp.plugins.citationLookup.pubmed.filter.PubmedNlm30CitationSchemaFilter', 1, 0, 0),
(17, 8, 0, 'WorldCat', 'lib.pkp.plugins.citationLookup.worldcat.filter.WorldcatNlm30CitationSchemaFilter', 1, 0, 0),
(18, 9, 0, 'ABNT Citation Output', 'lib.pkp.plugins.citationOutput.abnt.filter.Nlm30CitationSchemaAbntFilter', 0, 0, 0),
(19, 14, 0, 'ABNT Reference List', 'lib.pkp.classes.citation.PlainTextReferencesListFilter', 0, 0, 0),
(20, 9, 0, 'APA Citation Output', 'lib.pkp.plugins.citationOutput.apa.filter.Nlm30CitationSchemaApaFilter', 0, 0, 0),
(21, 14, 0, 'APA Reference List', 'lib.pkp.classes.citation.PlainTextReferencesListFilter', 0, 0, 0),
(22, 9, 0, 'MLA Citation Output', 'lib.pkp.plugins.citationOutput.mla.filter.Nlm30CitationSchemaMlaFilter', 0, 0, 0),
(23, 14, 0, 'MLA Reference List', 'lib.pkp.classes.citation.PlainTextReferencesListFilter', 0, 0, 0),
(24, 9, 0, 'Vancouver Citation Output', 'lib.pkp.plugins.citationOutput.vancouver.filter.Nlm30CitationSchemaVancouverFilter', 0, 0, 0),
(25, 14, 0, 'Vancouver Reference List', 'lib.pkp.classes.citation.PlainTextReferencesListFilter', 0, 0, 0),
(26, 7, 0, 'FreeCite', 'lib.pkp.plugins.citationParser.freecite.filter.FreeciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(27, 7, 0, 'ParaCite', 'lib.pkp.plugins.citationParser.paracite.filter.ParaciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(28, 7, 0, 'ParsCit', 'lib.pkp.plugins.citationParser.parscit.filter.ParscitRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(29, 7, 0, 'RegEx', 'lib.pkp.plugins.citationParser.regex.filter.RegexRawCitationNlm30CitationSchemaFilter', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_groups`
--

CREATE TABLE IF NOT EXISTS `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2, 'mods34=>mods34-xml', 'plugins.metadata.mods34.mods34XmlOutput.displayName', 'plugins.metadata.mods34.mods34XmlOutput.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(*)', 'xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),
(3, 'article=>mods34', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),
(4, 'mods34=>article', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)', 'class::classes.article.Article'),
(5, 'citation=>nlm30', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'class::lib.pkp.classes.citation.Citation', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(6, 'nlm30=>citation', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'class::lib.pkp.classes.citation.Citation'),
(7, 'plaintext=>nlm30-element-citation', 'plugins.metadata.nlm30.citationParsers.displayName', 'plugins.metadata.nlm30.citationParsers.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(8, 'nlm30-element-citation=>nlm30-element-citation', 'plugins.metadata.nlm30.citationLookup.displayName', 'plugins.metadata.nlm30.citationLookup.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(9, 'nlm30-element-citation=>plaintext', 'plugins.metadata.nlm30.citationOutput.displayName', 'plugins.metadata.nlm30.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
(10, 'nlm30-element-citation=>nlm30-xml', 'plugins.metadata.nlm30Xml.citationOutput.displayName', 'plugins.metadata.nlm30Xml.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'xml::*'),
(11, 'submission=>nlm30-article-xml', 'plugins.metadata.nlm30.nlm30XmlOutput.displayName', 'plugins.metadata.nlm30.nlm30XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
(12, 'submission=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm23XmlOutput.displayName', 'plugins.metadata.nlm30.nlm23XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
(13, 'nlm30-article-xml=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.displayName', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.description', 'xml::*', 'xml::*'),
(14, 'submission=>reference-list', 'plugins.metadata.nlm30.refList.displayName', 'plugins.metadata.nlm30.refList.description', 'class::lib.pkp.classes.submission.Submission', 'class::lib.pkp.classes.citation.PlainTextReferencesList'),
(15, 'nlm30-element-citation=>isbn', 'plugins.citationLookup.isbndbExtraction.displayName', 'plugins.citationLookup.isbndbExtraction.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
(16, 'isbn=>nlm30-element-citation', 'plugins.citationLookup.isbndbLookup.displayName', 'plugins.citationLookup.isbndbLookup.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)');

-- --------------------------------------------------------

--
-- Table structure for table `filter_settings`
--

CREATE TABLE IF NOT EXISTS `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filter_settings`
--

INSERT INTO `filter_settings` (`filter_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(8, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
(8, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(9, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
(10, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
(10, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(11, '', 'xsl', 'lib/pkp/plugins/metadata/nlm30/filter/nlm30-to-23-ref-list.xsl', 'string'),
(11, '', 'xslType', '2', 'int'),
(12, '', 'phpVersionMin', '5.0.0', 'string'),
(13, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
(14, '', 'phpVersionMin', '5.0.0', 'string'),
(15, '', 'phpVersionMin', '5.0.0', 'string'),
(16, '', 'phpVersionMin', '5.0.0', 'string'),
(17, '', 'phpVersionMin', '5.0.0', 'string'),
(19, '', 'citationOutputFilterName', 'lib.pkp.plugins.citationOutput.abnt.filter.Nlm30CitationSchemaAbntFilter', 'string'),
(19, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(19, '', 'ordering', '2', 'int'),
(21, '', 'citationOutputFilterName', 'lib.pkp.plugins.citationOutput.apa.filter.Nlm30CitationSchemaApaFilter', 'string'),
(21, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(21, '', 'ordering', '2', 'int'),
(23, '', 'citationOutputFilterName', 'lib.pkp.plugins.citationOutput.mla.filter.Nlm30CitationSchemaMlaFilter', 'string'),
(23, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(23, '', 'ordering', '2', 'int'),
(25, '', 'citationOutputFilterName', 'lib.pkp.plugins.citationOutput.vancouver.filter.Nlm30CitationSchemaVancouverFilter', 'string'),
(25, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(25, '', 'ordering', '1', 'int'),
(26, '', 'phpVersionMin', '5.0.0', 'string'),
(27, '', 'phpVersionMin', '5.0.0', 'string'),
(28, '', 'phpVersionMin', '5.0.0', 'string'),
(29, '', 'phpVersionMin', '5.0.0', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE IF NOT EXISTS `gifts` (
  `gift_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `gift_type` smallint(6) NOT NULL,
  `gift_assoc_id` bigint(20) NOT NULL,
  `buyer_first_name` varchar(40) NOT NULL,
  `buyer_middle_name` varchar(40) DEFAULT NULL,
  `buyer_last_name` varchar(90) NOT NULL,
  `buyer_email` varchar(90) NOT NULL,
  `buyer_user_id` bigint(20) DEFAULT NULL,
  `recipient_first_name` varchar(40) NOT NULL,
  `recipient_middle_name` varchar(40) DEFAULT NULL,
  `recipient_last_name` varchar(90) NOT NULL,
  `recipient_email` varchar(90) NOT NULL,
  `recipient_user_id` bigint(20) DEFAULT NULL,
  `date_redeemed` datetime DEFAULT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `gift_note_title` varchar(90) DEFAULT NULL,
  `gift_note` text,
  `notes` text,
  PRIMARY KEY (`gift_id`),
  KEY `gifts_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `publish_email` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `context` bigint(20) DEFAULT NULL,
  `about_displayed` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `groups_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_memberships`
--

CREATE TABLE IF NOT EXISTS `group_memberships` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `about_displayed` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `group_memberships_pkey` (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_settings`
--

CREATE TABLE IF NOT EXISTS `group_settings` (
  `group_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `group_settings_pkey` (`group_id`,`locale`,`setting_name`),
  KEY `group_settings_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscriptions`
--

CREATE TABLE IF NOT EXISTS `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscription_ip`
--

CREATE TABLE IF NOT EXISTS `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_id`, `journal_id`, `volume`, `number`, `year`, `published`, `current`, `date_published`, `date_notified`, `last_modified`, `access_status`, `open_access_date`, `show_volume`, `show_number`, `show_year`, `show_title`, `style_file_name`, `original_style_file_name`) VALUES
(1, 1, 1, '01', 2015, 1, 0, '2015-03-18 00:00:00', NULL, '2015-03-21 05:09:50', 1, NULL, 1, 1, 1, 0, NULL, NULL),
(2, 1, 1, '1', 2009, 1, 1, '2015-03-20 07:55:16', NULL, '2015-03-20 07:55:16', 1, NULL, 1, 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE IF NOT EXISTS `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galleys`
--

CREATE TABLE IF NOT EXISTS `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galley_settings`
--

CREATE TABLE IF NOT EXISTS `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE IF NOT EXISTS `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue_settings`
--

INSERT INTO `issue_settings` (`issue_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'coverPageAltText', '', 'string'),
(1, 'en_US', 'coverPageDescription', '', 'string'),
(1, 'en_US', 'description', 'The first journal in 2015.', 'string'),
(1, 'en_US', 'hideCoverPageArchives', '0', 'int'),
(1, 'en_US', 'hideCoverPageCover', '0', 'int'),
(1, 'en_US', 'showCoverPage', '1', 'int'),
(1, 'en_US', 'title', 'WIMBA', 'string'),
(2, 'en_US', 'coverPageAltText', '', 'string'),
(2, 'en_US', 'coverPageDescription', '', 'string'),
(2, 'en_US', 'description', '', 'string'),
(2, 'en_US', 'fileName', 'cover_issue_2_en_US.jpg', 'string'),
(2, 'en_US', 'height', '1476', 'int'),
(2, 'en_US', 'hideCoverPageArchives', '0', 'int'),
(2, 'en_US', 'hideCoverPageCover', '0', 'int'),
(2, 'en_US', 'originalFileName', 'sampul jurnal wimba 1 no 1 2009.jpg', 'string'),
(2, 'en_US', 'showCoverPage', '1', 'int'),
(2, 'en_US', 'title', '', 'string'),
(2, 'en_US', 'width', '1063', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE IF NOT EXISTS `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(5) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'wimba', 1, 'en_US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal_settings`
--

CREATE TABLE IF NOT EXISTS `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'allowRegAuthor', '1', 'bool'),
(1, '', 'allowRegReader', '1', 'bool'),
(1, '', 'allowRegReviewer', '1', 'bool'),
(1, '', 'categories', 'N;', 'object'),
(1, '', 'contactEmail', 'destra.bintang.perkasa@gmail.com', 'string'),
(1, '', 'contactFax', '', 'string'),
(1, '', 'contactName', 'Destra Bintang Perkasa', 'string'),
(1, '', 'contactPhone', '', 'string'),
(1, '', 'contributors', 'a:0:{}', 'object'),
(1, '', 'copyrightHolderType', '', 'string'),
(1, '', 'copyrightNoticeAgree', '0', 'bool'),
(1, '', 'copyrightYearBasis', '', 'string'),
(1, '', 'copySubmissionAckAddress', '', 'string'),
(1, '', 'copySubmissionAckPrimaryContact', '0', 'bool'),
(1, '', 'copySubmissionAckSpecified', '0', 'bool'),
(1, '', 'displayCurrentIssue', '0', 'bool'),
(1, '', 'emailSignature', '________________________________________________________________________\r\nTest Journal\r\nhttp://localhost/ojs-2.4.5/index.php/test', 'string'),
(1, '', 'envelopeSender', '', 'string'),
(1, '', 'fastTrackFee', '0', 'int'),
(1, '', 'includeCopyrightStatement', '0', 'bool'),
(1, '', 'includeLicense', '0', 'bool'),
(1, '', 'itemsPerPage', '25', 'int'),
(1, '', 'journalTheme', '', 'string'),
(1, '', 'licenseURL', '', 'string'),
(1, '', 'mailingAddress', '', 'string'),
(1, '', 'membershipFee', '0', 'int'),
(1, '', 'metaCitationOutputFilterId', '0', 'int'),
(1, '', 'metaCitations', '0', 'bool'),
(1, '', 'metaCoverage', '0', 'bool'),
(1, '', 'metaDiscipline', '0', 'bool'),
(1, '', 'metaSubject', '0', 'bool'),
(1, '', 'metaSubjectClass', '0', 'bool'),
(1, '', 'metaType', '0', 'bool'),
(1, '', 'numPageLinks', '10', 'int'),
(1, '', 'numWeeksPerReview', '4', 'int'),
(1, '', 'onlineIssn', '', 'string'),
(1, '', 'printIssn', '', 'string'),
(1, '', 'publicationFee', '0', 'int'),
(1, '', 'publisherInstitution', '', 'string'),
(1, '', 'publisherUrl', '', 'string'),
(1, '', 'purchaseArticleFee', '0', 'int'),
(1, '', 'requireAuthorCompetingInterests', '0', 'bool'),
(1, '', 'requireReviewerCompetingInterests', '0', 'bool'),
(1, '', 'rtAbstract', '1', 'bool'),
(1, '', 'rtAddComment', '1', 'bool'),
(1, '', 'rtCaptureCite', '1', 'bool'),
(1, '', 'rtDefineTerms', '1', 'bool'),
(1, '', 'rtEmailAuthor', '1', 'bool'),
(1, '', 'rtEmailOthers', '1', 'bool'),
(1, '', 'rtPrinterFriendly', '1', 'bool'),
(1, '', 'rtSupplementaryFiles', '1', 'bool'),
(1, '', 'rtViewMetadata', '1', 'bool'),
(1, '', 'sponsors', 'a:0:{}', 'object'),
(1, '', 'submissionFee', '0', 'int'),
(1, '', 'supportedFormLocales', 'a:1:{i:0;s:5:"en_US";}', 'object'),
(1, '', 'supportedLocales', 'a:2:{i:0;s:5:"en_US";i:1;s:5:"id_ID";}', 'object'),
(1, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:"en_US";}', 'object'),
(1, '', 'supportEmail', 'rachmawatyy@gmail.com', 'string'),
(1, '', 'supportName', 'Rachmawaty', 'string'),
(1, '', 'supportPhone', '', 'string'),
(1, '', 'useEditorialBoard', '0', 'bool'),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href="/ojs-2.4.5/index.php/test/about">About the Journal</a> page for the journal''s section policies, as well as the <a href="/ojs-2.4.5/index.php/test/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="/ojs-2.4.5/index.php/test/user/register">register</a> with the journal prior to submitting or, if already registered, can simply <a href="/ojs-2.4.5/index.php/index/login">log in</a> and begin the five-step process.', 'string'),
(1, 'en_US', 'authorSelfArchivePolicy', 'This journal permits and encourages authors to post items submitted to the journal on personal websites or institutional repositories both prior to and after publication, while providing bibliographic details that credit, if applicable, its publication in this journal.', 'string'),
(1, 'en_US', 'copyeditInstructions', 'The copyediting stage is intended to improve the flow, clarity, grammar, wording, and formatting of the article. It represents the last chance for the author to make any substantial changes to the text because the next stage is restricted to typos and formatting corrections. \n\nThe file to be copyedited is in Word or .rtf format and therefore can easily be edited as a word processing document. The set of instructions displayed here proposes two approaches to copyediting. One is based on Microsoft Word''s Track Changes feature and requires that the copy editor, editor, and author have access to this program. A second system, which is software independent, has been borrowed, with permission, from the Harvard Educational Review. The journal editor is in a position to modify these instructions, so suggestions can be made to improve the process for this journal.\n\n\n<h4>Copyediting Systems</h4>\n\n<strong>1. Microsoft Word''s Track Changes</strong>\n\nUnder Tools in the menu bar, the feature Track Changes enables the copy editor to make insertions (text appears in color) and deletions (text appears crossed out in color or in the margins as deleted). The copy editor can posit queries to both the author (Author Queries) and to the editor (Editor Queries) by inserting these queries in square brackets. The copyedited version is then uploaded, and the editor is notified. The editor then reviews the text and notifies the author.\n\nThe editor and author should leave those changes with which they are satisfied. If further changes are necessary, the editor and author can make changes to the initial insertions or deletions, as well as make new insertions or deletions elsewhere in the text. Authors and editors should respond to each of the queries addressed to them, with responses placed inside the square brackets. \n\nAfter the text has been reviewed by editor and author, the copy editor will make a final pass over the text accepting the changes in preparation for the layout and galley stage.\n\n\n<strong>2. Harvard Educational Review </strong>\n\n<strong>Instructions for Making Electronic Revisions to the Manuscript</strong>\n\nPlease follow the following protocol for making electronic revisions to your manuscript:\n\n<strong>Responding to suggested changes.</strong>\n&nbsp; For each of the suggested changes that you accept, unbold the text.\n&nbsp; For each of the suggested changes that you do not accept, re-enter the original text and <strong>bold</strong> it.\n\n<strong>Making additions and deletions.</strong>\n&nbsp; Indicate additions by <strong>bolding</strong> the new text.\n&nbsp; Replace deleted sections with: <strong>[deleted text]</strong>.\n&nbsp; If you delete one or more sentence, please indicate with a note, e.g., <strong>[deleted 2 sentences]</strong>.\n\n<strong>Responding to Queries to the Author (QAs).</strong>\n&nbsp; Keep all QAs intact and bolded within the text. Do not delete them.\n&nbsp; To reply to a QA, add a comment after it. Comments should be delimited using:\n<strong>[Comment:]</strong>\n&nbsp; e.g., <strong>[Comment: Expanded discussion of methodology as you suggested]</strong>.\n\n<strong>Making comments.</strong>\n&nbsp; Use comments to explain organizational changes or major revisions\n&nbsp; e.g., <strong>[Comment: Moved the above paragraph from p. 5 to p. 7].</strong>\n&nbsp; Note: When referring to page numbers, please use the page numbers from the printed copy of the manuscript that was sent to you. This is important since page numbers may change as a document is revised electronically.\n\n<h4>An Illustration of an Electronic Revision</h4>\n\n<ol>\n<li><strong>Initial copyedit.</strong> The journal copy editor will edit the text to improve flow, clarity, grammar, wording, and formatting, as well as including author queries as necessary. Once the initial edit is complete, the copy editor will upload the revised document through the journal Web site and notify the author that the edited manuscript is available for review.</li>\n<li><strong>Author copyedit.</strong> Before making dramatic departures from the structure and organization of the edited manuscript, authors must check in with the editors who are co-chairing the piece. Authors should accept/reject any changes made during the initial copyediting, as appropriate, and respond to all author queries. When finished with the revisions, authors should rename the file from AuthorNameQA.doc to AuthorNameQAR.doc (e.g., from LeeQA.doc to LeeQAR.doc) and upload the revised document through the journal Web site as directed.</li>\n<li><strong>Final copyedit.</strong> The journal copy editor will verify changes made by the author and incorporate the responses to the author queries to create a final manuscript. When finished, the copy editor will upload the final document through the journal Web site and alert the layout editor to complete formatting.</li>\n</ol>', 'string'),
(1, 'en_US', 'description', 'lalalalallala', 'string'),
(1, 'en_US', 'donationFeeDescription', 'Donations of any amount to this journal are gratefully received and provide a means for the editors to continue to provide a journal of the highest quality to its readers.', 'string'),
(1, 'en_US', 'donationFeeName', 'Donations to journal', 'string'),
(1, 'en_US', 'fastTrackFeeDescription', 'With the payment of this fee, the review, editorial decision, and author notification on this manuscript is guaranteed to take place within 4 weeks.', 'string'),
(1, 'en_US', 'fastTrackFeeName', 'Fast-Track Review', 'string'),
(1, 'en_US', 'homeHeaderTitleImage', 'a:6:{s:4:"name";s:14:"logo wimba.jpg";s:10:"uploadName";s:30:"homeHeaderTitleImage_en_US.jpg";s:5:"width";i:300;s:6:"height";i:80;s:8:"mimeType";s:10:"image/jpeg";s:12:"dateUploaded";s:19:"2015-03-24 06:02:12";}', 'object'),
(1, 'en_US', 'homeHeaderTitleType', '1', 'string'),
(1, 'en_US', 'initials', 'WIMBA', 'string'),
(1, 'en_US', 'journalPageFooter', '<p>Desain Komunikasi Visual</p><p>Fakultas Seni Rupa dan Desain</p><p>Institut Teknologi Bandung</p>', 'string'),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library''s electronic journal holdings. As well, it may be worth noting that this journal''s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).', 'string'),
(1, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://www.lockss.org/">More...</a>', 'string'),
(1, 'en_US', 'membershipFeeDescription', 'The payment of this fee will enroll you as a member in this association for one year and provide you with free access to this journal.', 'string'),
(1, 'en_US', 'membershipFeeName', 'Association Membership', 'string'),
(1, 'en_US', 'navItems', 'a:1:{i:0;a:2:{s:4:"name";s:0:"";s:3:"url";s:0:"";}}', 'object'),
(1, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', 'string'),
(1, 'en_US', 'privacyStatement', 'The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.', 'string'),
(1, 'en_US', 'proofInstructions', '<p>The proofreading stage is intended to catch any errors in the galley''s spelling, grammar, and formatting. More substantial changes cannot be made at this stage, unless discussed with the Section Editor. In Layout, click on VIEW PROOF to see the HTML, PDF, and other available file formats used in publishing this item.</p>\n	<h4>For Spelling and Grammar Errors</h4>\n\n	<p>Copy the problem word or groups of words and paste them into the Proofreading Corrections box with "CHANGE-TO" instructions to the editor as follows:</p>\n\n	<pre>1. CHANGE...\n	then the others\n	TO...\n	than the others</pre>\n	<br />\n	<pre>2. CHANGE...\n	Malinowsky\n	TO...\n	Malinowski</pre>\n	<br />\n\n	<h4>For Formatting Errors</h4>\n\n	<p>Describe the location and nature of the problem in the Proofreading Corrections box after typing in the title "FORMATTING" as follows:</p>\n	<br />\n	<pre>3. FORMATTING\n	The numbers in Table 3 are not aligned in the third column.</pre>\n	<br />\n	<pre>4. FORMATTING\n	The paragraph that begins "This last topic..." is not indented.</pre>', 'string'),
(1, 'en_US', 'publicationFeeDescription', 'If this paper is accepted for publication, you will be asked to pay an Article Publication Fee to cover publications costs.', 'string'),
(1, 'en_US', 'publicationFeeName', 'Article Publication', 'string'),
(1, 'en_US', 'purchaseArticleFeeDescription', 'The payment of this fee will enable you to view, download, and print this article.', 'string'),
(1, 'en_US', 'purchaseArticleFeeName', 'Purchase Article', 'string'),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href="/ojs-2.4.5/index.php/test/user/register">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal''s <a href="/ojs-2.4.5/index.php/test/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', 'string'),
(1, 'en_US', 'refLinkInstructions', '<h4>To Add Reference Linking to the Layout Process</h4>\n	<p>When turning a submission into HTML or PDF, make sure that all hyperlinks in the submission are active.</p>\n	<h4>A. When the Author Provides a Link with the Reference</h4>\n	<ol>\n	<li>While the submission is still in its word processing format (e.g., Word), add the phrase VIEW ITEM to the end of the reference that has a URL.</li>\n	<li>Turn that phrase into a hyperlink by highlighting it and using Word''s Insert Hyperlink tool and the URL prepared above.</li>\n	</ol>\n	<h4>B. Enabling Readers to Search Google Scholar For References</h4>\n	<ol>\n		<li>While the submission is still in its word processing format (e.g., Word), copy the title of the work referenced in the References list (if it appears to be too common a titleâ€”e.g., "Peace"â€”then copy author and title).</li>\n		<li>Paste the reference''s title between the %22''s, placing a + between each word: http://scholar.google.com/scholar?q=%22PASTE+TITLE+HERE%22</li>\n\n	<li>Add the phrase GS SEARCH to the end of each citation in the submission''s References list.</li>\n	<li>Turn that phrase into a hyperlink by highlighting it and using Word''s Insert Hyperlink tool and the URL prepared in #2.</li>\n	</ol>\n	<h4>C. Enabling Readers to Search for References with a DOI</h4>\n	<ol>\n	<li>While the submission is still in Word, copy a batch of references into CrossRef Text Query http://www.crossref.org/freeTextQuery/.</li>\n	<li>Paste each DOI that the Query provides in the following URL (between = and &): http://www.cmaj.ca/cgi/external_ref?access_num=PASTE DOI#HERE&link_type=DOI.</li>\n	<li>Add the phrase CrossRef to the end of each citation in the submission''s References list.</li>\n	<li>Turn that phrase into a hyperlink by highlighting the phrase and using Word''s Insert Hyperlink tool and the appropriate URL prepared in #2.</li>\n	</ol>', 'string'),
(1, 'en_US', 'submissionChecklist', 'a:6:{i:0;a:2:{s:5:"order";s:1:"1";s:7:"content";s:165:"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).";}i:1;a:2:{s:5:"order";s:1:"2";s:7:"content";s:38:"The submission file is in .PDF format.";}i:2;a:2:{s:5:"order";s:1:"3";s:7:"content";s:60:"Where available, URLs for the references have been provided.";}i:3;a:2:{s:5:"order";s:1:"4";s:7:"content";s:239:"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.";}i:4;a:2:{s:5:"order";s:1:"5";s:7:"content";s:225:"The text adheres to the stylistic and bibliographic requirements outlined in the <a href="/ojs-2.4.5/index.php/test/about/submissions#authorGuidelines" target="_new">Author Guidelines</a>, which is found in About the Journal.";}i:5;a:2:{s:5:"order";s:1:"6";s:7:"content";s:232:"If submitting to a peer-reviewed section of the journal, the instructions in <a href="javascript:openHelp(''http://localhost/ojs-2.4.5/index.php/test/help/view/editorial/topic/000044'')">Ensuring a Blind Review</a> have been followed.";}}', 'object'),
(1, 'en_US', 'submissionFeeDescription', 'Authors are required to pay an Article Submission Fee as part of the submission process to contribute to review costs.', 'string'),
(1, 'en_US', 'submissionFeeName', 'Article Submission', 'string'),
(1, 'en_US', 'title', 'WIMBA', 'string'),
(1, 'en_US', 'waiverPolicy', 'If you do not have funds to pay such fees, you will have an opportunity to waive each fee. We do not want fees to prevent the publication of worthy work.', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `metadata_descriptions`
--

CREATE TABLE IF NOT EXISTS `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_description_settings`
--

CREATE TABLE IF NOT EXISTS `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE IF NOT EXISTS `metrics` (
  `load_id` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` smallint(6) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) DEFAULT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_journal_id` (`metric_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`load_id`, `assoc_type`, `context_id`, `issue_id`, `submission_id`, `assoc_id`, `day`, `month`, `file_type`, `country_id`, `region`, `city`, `metric_type`, `metric`) VALUES
('usage_events_20150305.log', 256, 1, NULL, NULL, 1, '20150305', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 7),
('usage_events_20150306.log', 256, 1, NULL, NULL, 1, '20150306', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 4),
('usage_events_20150307.log', 256, 1, NULL, NULL, 1, '20150307', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150311.log', 256, 1, NULL, NULL, 1, '20150311', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150315.log', 256, 1, NULL, NULL, 1, '20150315', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150316.log', 256, 1, NULL, NULL, 1, '20150316', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 2),
('usage_events_20150319.log', 256, 1, NULL, NULL, 1, '20150319', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 6),
('usage_events_20150320.log', 256, 1, NULL, NULL, 1, '20150320', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 35),
('usage_events_20150320.log', 257, 1, 2, 8, 8, '20150320', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 2),
('usage_events_20150320.log', 259, 1, 2, NULL, 2, '20150320', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 13),
('usage_events_20150320.log', 260, 1, 2, 8, 1, '20150320', '201503', 2, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150321.log', 256, 1, NULL, NULL, 1, '20150321', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 19),
('usage_events_20150321.log', 259, 1, 2, NULL, 2, '20150321', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 2),
('usage_events_20150323.log', 256, 1, NULL, NULL, 1, '20150323', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 4),
('usage_events_20150323.log', 257, 1, 2, 8, 8, '20150323', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150323.log', 257, 1, 2, 20, 20, '20150323', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150323.log', 259, 1, 2, NULL, 2, '20150323', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 7),
('usage_events_20150323.log', 260, 1, 2, 8, 1, '20150323', '201503', 2, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150323.log', 260, 1, 2, 20, 2, '20150323', '201503', 2, NULL, 0, NULL, 'ojs::counter', 1),
('usage_events_20150324.log', 256, 1, NULL, NULL, 1, '20150324', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 24),
('usage_events_20150324.log', 259, 1, 2, NULL, 2, '20150324', '201503', NULL, NULL, 0, NULL, 'ojs::counter', 6),
('usage_events_20150324.log', 260, 1, 2, 27, 3, '20150324', '201503', 2, NULL, 0, NULL, 'ojs::counter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mutex`
--

CREATE TABLE IF NOT EXISTS `mutex` (
  `i` tinyint(4) NOT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutex`
--

INSERT INTO `mutex` (`i`) VALUES
(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(2, 1, 1, 2, 16777217, '2015-03-16 03:47:18', NULL, 257, 2),
(3, 1, 1, 2, 268435477, '2015-03-18 16:42:28', NULL, 0, 0),
(4, 1, 2, 2, 268435477, '2015-03-18 16:42:28', NULL, 0, 0),
(5, 1, 3, 2, 268435477, '2015-03-18 16:42:28', '2015-03-20 11:30:00', 0, 0),
(6, 1, 0, 2, 268435477, '2015-03-18 16:42:29', '2015-03-24 02:54:50', 0, 0),
(11, 1, 1, 2, 268435477, '2015-03-20 07:55:17', NULL, 0, 0),
(12, 1, 2, 2, 268435477, '2015-03-20 07:55:17', NULL, 0, 0),
(13, 1, 3, 2, 268435477, '2015-03-20 07:55:17', '2015-03-20 11:30:00', 0, 0),
(14, 1, 0, 2, 268435477, '2015-03-20 07:55:17', '2015-03-24 02:54:50', 0, 0),
(15, 1, 2, 2, 16777217, '2015-03-20 08:05:41', NULL, 257, 8),
(16, 1, 2, 2, 16777234, '2015-03-20 09:15:07', NULL, 257, 8),
(17, 1, 3, 2, 16777222, '2015-03-20 09:29:38', '2015-03-20 11:29:59', 257, 8),
(18, 1, 2, 2, 16777222, '2015-03-20 09:29:38', NULL, 257, 8),
(26, 1, 2, 2, 16777217, '2015-03-21 09:45:49', NULL, 257, 15),
(27, 1, 2, 2, 16777217, '2015-03-21 09:58:06', NULL, 257, 20),
(28, 1, 2, 2, 16777234, '2015-03-23 12:20:28', NULL, 257, 20),
(29, 1, 3, 2, 16777222, '2015-03-23 16:28:07', NULL, 257, 20),
(30, 1, 2, 2, 16777222, '2015-03-23 16:28:07', NULL, 257, 20),
(33, 1, 2, 2, 16777217, '2015-03-24 07:22:13', NULL, 257, 27),
(34, 1, 2, 2, 16777234, '2015-03-24 07:28:56', NULL, 257, 27),
(35, 1, 3, 2, 16777222, '2015-03-24 07:31:58', NULL, 257, 27),
(36, 1, 2, 2, 16777222, '2015-03-24 07:31:58', NULL, 257, 27);

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_list`
--

CREATE TABLE IF NOT EXISTS `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE IF NOT EXISTS `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscription_settings`
--

CREATE TABLE IF NOT EXISTS `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oai_resumption_tokens`
--

CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `objects_for_review`
--

CREATE TABLE IF NOT EXISTS `objects_for_review` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_object_type_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `available` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`object_id`),
  KEY `ofr_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `object_for_review_assignments`
--

CREATE TABLE IF NOT EXISTS `object_for_review_assignments` (
  `assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_requested` datetime DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_mailed` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_reminded_before` datetime DEFAULT NULL,
  `date_reminded_after` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`assignment_id`),
  UNIQUE KEY `ofr_assignments_pkey` (`object_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `object_for_review_persons`
--

CREATE TABLE IF NOT EXISTS `object_for_review_persons` (
  `person_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `ofr_person_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `object_for_review_settings`
--

CREATE TABLE IF NOT EXISTS `object_for_review_settings` (
  `object_id` bigint(20) NOT NULL,
  `review_object_metadata_id` bigint(20) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `ofr_settings_pkey` (`object_id`,`review_object_metadata_id`),
  KEY `ofr_settings_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_transactions`
--

CREATE TABLE IF NOT EXISTS `paypal_transactions` (
  `txn_id` varchar(17) NOT NULL,
  `txn_type` varchar(20) DEFAULT NULL,
  `payer_email` varchar(127) DEFAULT NULL,
  `receiver_email` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `payment_date` varchar(127) DEFAULT NULL,
  `payer_id` varchar(13) DEFAULT NULL,
  `receiver_id` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pln_deposits`
--

CREATE TABLE IF NOT EXISTS `pln_deposits` (
  `deposit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `status` bigint(20) DEFAULT '0',
  `date_status` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pln_deposit_objects`
--

CREATE TABLE IF NOT EXISTS `pln_deposit_objects` (
  `deposit_object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(36) NOT NULL,
  `deposit_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`deposit_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE IF NOT EXISTS `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `journal_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`locale`,`journal_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `locale`, `journal_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', '', 0, 'crontab', 'a:8:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.pln.classes.tasks.Depositor";s:9:"frequency";a:1:{s:4:"hour";s:2:"25";}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";s:2:"24";}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:2;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:3;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:4;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:5;a:3:{s:9:"className";s:28:"classes.tasks.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:6;a:3:{s:9:"className";s:40:"classes.tasks.SubscriptionExpiryReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:7;a:3:{s:9:"className";s:36:"classes.tasks.OpenAccessNotification";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}}', 'object'),
('acronplugin', '', 0, 'enabled', '1', 'bool'),
('almplugin', '', 0, 'apiKey', '', 'string'),
('almplugin', '', 0, 'depositArticles', '1', 'bool'),
('almplugin', '', 0, 'depositUrl', 'http://pkp-alm.lib.sfu.ca/load/deposit.php', 'string'),
('almplugin', '', 0, 'enabled', '0', 'bool'),
('authorbiosblockplugin', '', 1, 'enabled', '0', 'bool'),
('coinsplugin', '', 0, 'enabled', '1', 'bool'),
('developedbyblockplugin', '', 0, 'context', '2', 'int'),
('developedbyblockplugin', '', 0, 'enabled', '1', 'bool'),
('developedbyblockplugin', '', 0, 'seq', '0', 'int'),
('developedbyblockplugin', '', 1, 'context', '2', 'int'),
('developedbyblockplugin', '', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', '', 1, 'seq', '0', 'int'),
('donationblockplugin', '', 0, 'context', '2', 'int'),
('donationblockplugin', '', 0, 'enabled', '1', 'bool'),
('donationblockplugin', '', 0, 'seq', '5', 'int'),
('donationblockplugin', '', 1, 'context', '2', 'int'),
('donationblockplugin', '', 1, 'enabled', '0', 'bool'),
('donationblockplugin', '', 1, 'seq', '7', 'int'),
('fontsizeblockplugin', '', 0, 'context', '2', 'int'),
('fontsizeblockplugin', '', 0, 'enabled', '1', 'bool'),
('fontsizeblockplugin', '', 0, 'seq', '6', 'int'),
('fontsizeblockplugin', '', 1, 'context', '2', 'int'),
('fontsizeblockplugin', '', 1, 'enabled', '0', 'bool'),
('fontsizeblockplugin', '', 1, 'seq', '9', 'int'),
('helpblockplugin', '', 0, 'context', '2', 'int'),
('helpblockplugin', '', 0, 'enabled', '1', 'bool'),
('helpblockplugin', '', 0, 'seq', '1', 'int'),
('helpblockplugin', '', 1, 'context', '2', 'int'),
('helpblockplugin', '', 1, 'enabled', '0', 'bool'),
('helpblockplugin', '', 1, 'seq', '1', 'int'),
('informationblockplugin', '', 1, 'context', '2', 'int'),
('informationblockplugin', '', 1, 'enabled', '0', 'bool'),
('informationblockplugin', '', 1, 'seq', '10', 'int'),
('keywordcloudblockplugin', '', 1, 'enabled', '0', 'bool'),
('languagetoggleblockplugin', '', 0, 'context', '2', 'int'),
('languagetoggleblockplugin', '', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', '', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', '', 1, 'context', '2', 'int'),
('languagetoggleblockplugin', '', 1, 'enabled', '0', 'bool'),
('languagetoggleblockplugin', '', 1, 'seq', '6', 'int'),
('luceneplugin', '', 0, 'autosuggest', '1', 'bool'),
('luceneplugin', '', 0, 'autosuggestType', '2', 'int'),
('luceneplugin', '', 0, 'customRanking', '0', 'bool'),
('luceneplugin', '', 0, 'enabled', '0', 'bool'),
('luceneplugin', '', 0, 'facetCategoryAuthors', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategoryCoverage', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategoryDiscipline', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategoryJournalTitle', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategoryPublicationDate', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategorySubject', '1', 'bool'),
('luceneplugin', '', 0, 'facetCategoryType', '1', 'bool'),
('luceneplugin', '', 0, 'highlighting', '1', 'bool'),
('luceneplugin', '', 0, 'instId', 'localhost', 'string'),
('luceneplugin', '', 0, 'lastEmailTimestamp', '0', 'int'),
('luceneplugin', '', 0, 'password', 'please change', 'string'),
('luceneplugin', '', 0, 'pullIndexing', '0', 'bool'),
('luceneplugin', '', 0, 'searchEndpoint', 'http://localhost:8983/solr/ojs/search', 'string'),
('luceneplugin', '', 0, 'simdocs', '1', 'bool'),
('luceneplugin', '', 0, 'spellcheck', '1', 'bool'),
('luceneplugin', '', 0, 'username', 'admin', 'string'),
('mods34metadataplugin', '', 0, 'metadataPluginControlledVocabInstalled', '1', 'bool'),
('navigationblockplugin', '', 0, 'context', '2', 'int'),
('navigationblockplugin', '', 0, 'enabled', '1', 'bool'),
('navigationblockplugin', '', 0, 'seq', '5', 'int'),
('navigationblockplugin', '', 1, 'context', '2', 'int'),
('navigationblockplugin', '', 1, 'enabled', '1', 'bool'),
('navigationblockplugin', '', 1, 'seq', '0', 'int'),
('nlm30metadataplugin', '', 0, 'metadataPluginControlledVocabInstalled', '1', 'bool'),
('notificationblockplugin', '', 0, 'context', '2', 'int'),
('notificationblockplugin', '', 0, 'enabled', '1', 'bool'),
('notificationblockplugin', '', 0, 'seq', '3', 'int'),
('notificationblockplugin', '', 1, 'context', '2', 'int'),
('notificationblockplugin', '', 1, 'enabled', '0', 'bool'),
('notificationblockplugin', '', 1, 'seq', '2', 'int'),
('openurl10metadataplugin', '', 0, 'metadataPluginControlledVocabInstalled', '1', 'bool'),
('readingtoolsblockplugin', '', 1, 'enabled', '0', 'bool'),
('relateditemsblockplugin', '', 1, 'enabled', '0', 'bool'),
('roleblockplugin', '', 1, 'context', '2', 'int'),
('roleblockplugin', '', 1, 'enabled', '1', 'bool'),
('roleblockplugin', '', 1, 'seq', '2', 'int'),
('staticpagesplugin', '', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', '', 1, 'context', '2', 'int'),
('subscriptionblockplugin', '', 1, 'enabled', '0', 'bool'),
('subscriptionblockplugin', '', 1, 'seq', '2', 'int'),
('tinymceplugin', '', 0, 'enabled', '1', 'bool'),
('tinymceplugin', '', 1, 'enabled', '1', 'bool'),
('usageeventplugin', '', 0, 'uniqueSiteId', '54f834f5709c4', 'string'),
('usagestatsplugin', '', 0, 'accessLogFileParseRegex', '/^(\\S+) \\S+ \\S+ \\[(.*?)\\] "(\\S+).*?" \\d+ \\d+ "(.*?)" "(.*?)"/', 'string'),
('usagestatsplugin', '', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', '', 0, 'enabled', '1', 'bool'),
('userblockplugin', '', 0, 'context', '2', 'int'),
('userblockplugin', '', 0, 'enabled', '1', 'bool'),
('userblockplugin', '', 0, 'seq', '2', 'int'),
('userblockplugin', '', 1, 'context', '2', 'int'),
('userblockplugin', '', 1, 'enabled', '1', 'bool'),
('userblockplugin', '', 1, 'seq', '1', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE IF NOT EXISTS `processes` (
  `process_id` varchar(23) NOT NULL,
  `process_type` tinyint(4) NOT NULL,
  `time_started` bigint(20) NOT NULL,
  `obliterated` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `processes_pkey` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `published_articles`
--

CREATE TABLE IF NOT EXISTS `published_articles` (
  `published_article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `access_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`published_article_id`),
  UNIQUE KEY `published_articles_article_id` (`article_id`),
  KEY `published_articles_issue_id` (`issue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `published_articles`
--

INSERT INTO `published_articles` (`published_article_id`, `article_id`, `issue_id`, `date_published`, `seq`, `access_status`) VALUES
(1, 2, 1, '2015-03-18 00:00:00', 1, 0),
(2, 8, 2, '2015-03-20 09:21:00', 1, 0),
(3, 20, 2, '2015-03-23 16:24:12', 2, 0),
(4, 27, 2, '2015-03-24 07:32:18', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `queued_payments`
--

CREATE TABLE IF NOT EXISTS `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE IF NOT EXISTS `referrals` (
  `referral_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `link_count` bigint(20) NOT NULL,
  PRIMARY KEY (`referral_id`),
  UNIQUE KEY `referral_article_id` (`article_id`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `referral_settings`
--

CREATE TABLE IF NOT EXISTS `referral_settings` (
  `referral_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `referral_settings_pkey` (`referral_id`,`locale`,`setting_name`),
  KEY `referral_settings_referral_id` (`referral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review_assignments`
--

CREATE TABLE IF NOT EXISTS `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `regret_message` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `review_assignments`
--

INSERT INTO `review_assignments` (`review_id`, `submission_id`, `reviewer_id`, `competing_interests`, `regret_message`, `recommendation`, `date_assigned`, `date_notified`, `date_confirmed`, `date_completed`, `date_acknowledged`, `date_due`, `date_response_due`, `last_modified`, `reminder_was_automatic`, `declined`, `replaced`, `cancelled`, `reviewer_file_id`, `date_rated`, `date_reminded`, `quality`, `review_round_id`, `stage_id`, `review_method`, `round`, `step`, `review_form_id`, `unconsidered`) VALUES
(1, 2, 2, NULL, NULL, 1, '2015-03-16 03:58:31', '2015-03-16 04:30:40', '2015-03-16 04:31:18', '2015-03-18 16:35:34', NULL, '2015-04-13 01:00:00', NULL, '2015-03-18 16:35:34', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0),
(2, 8, 2, NULL, NULL, NULL, '2015-03-20 08:30:14', '2015-03-20 08:32:49', '2015-03-20 08:34:38', NULL, NULL, '2015-04-17 01:00:00', NULL, '2015-03-20 08:34:38', 0, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0),
(3, 8, 1, NULL, NULL, 1, '2015-03-20 08:35:56', '2015-03-20 09:11:21', '2015-03-20 09:12:45', '2015-03-20 09:15:35', NULL, '2015-04-17 01:00:00', NULL, '2015-03-20 09:15:35', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0),
(4, 20, 1, NULL, NULL, 2, '2015-03-23 12:05:22', '2015-03-23 12:13:51', '2015-03-23 12:16:43', '2015-03-23 12:21:22', NULL, '2015-04-20 01:00:00', NULL, '2015-03-23 12:21:22', 0, 0, 0, 0, 41, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0),
(5, 27, 1, NULL, NULL, 1, '2015-03-24 07:24:37', '2015-03-24 07:26:41', '2015-03-24 07:28:35', '2015-03-24 07:29:29', NULL, '2015-04-21 01:00:00', NULL, '2015-03-24 07:29:29', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review_forms`
--

CREATE TABLE IF NOT EXISTS `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `review_forms`
--

INSERT INTO `review_forms` (`review_form_id`, `assoc_type`, `assoc_id`, `seq`, `is_active`) VALUES
(1, 256, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review_form_elements`
--

CREATE TABLE IF NOT EXISTS `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `review_form_elements`
--

INSERT INTO `review_form_elements` (`review_form_element_id`, `review_form_id`, `seq`, `element_type`, `required`, `included`) VALUES
(1, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review_form_element_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_form_element_settings`
--

INSERT INTO `review_form_element_settings` (`review_form_element_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'question', 'penilaian', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `review_form_responses`
--

CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_form_responses`
--

INSERT INTO `review_form_responses` (`review_form_element_id`, `review_id`, `response_type`, `response_value`) VALUES
(1, 1, 'string', '80'),
(1, 3, 'string', '80'),
(1, 4, 'string', '80'),
(1, 5, 'string', '80');

-- --------------------------------------------------------

--
-- Table structure for table `review_form_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_form_settings`
--

INSERT INTO `review_form_settings` (`review_form_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'description', 'coba test dulu', 'string'),
(1, 'en_US', 'title', 'Review Form 1', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `review_object_metadata`
--

CREATE TABLE IF NOT EXISTS `review_object_metadata` (
  `metadata_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_object_type_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `metadata_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `display` tinyint(4) DEFAULT NULL,
  `metadata_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`metadata_id`),
  KEY `review_object_metadata_metadata_id` (`metadata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_object_metadata_settings`
--

CREATE TABLE IF NOT EXISTS `review_object_metadata_settings` (
  `metadata_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_object_metadata_settings_pkey` (`metadata_id`,`locale`,`setting_name`),
  KEY `review_object_metadata_settings_metadata_id` (`metadata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review_object_types`
--

CREATE TABLE IF NOT EXISTS `review_object_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `type_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `review_object_type_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_object_type_settings`
--

CREATE TABLE IF NOT EXISTS `review_object_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_object_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `review_object_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review_rounds`
--

CREATE TABLE IF NOT EXISTS `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `review_rounds`
--

INSERT INTO `review_rounds` (`review_round_id`, `submission_id`, `stage_id`, `round`, `review_revision`, `status`) VALUES
(1, 1, NULL, 1, 1, NULL),
(2, 2, NULL, 1, 1, NULL),
(3, 8, NULL, 1, 1, NULL),
(4, 15, NULL, 1, 1, NULL),
(5, 20, NULL, 1, 1, NULL),
(6, 27, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  UNIQUE KEY `roles_pkey` (`journal_id`,`user_id`,`role_id`),
  KEY `roles_journal_id` (`journal_id`),
  KEY `roles_user_id` (`user_id`),
  KEY `roles_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`journal_id`, `user_id`, `role_id`) VALUES
(0, 1, 1),
(1, 1, 16),
(1, 1, 4096),
(1, 2, 256),
(1, 2, 4096),
(1, 2, 65536),
(1, 2, 1048576),
(1, 3, 16),
(1, 3, 65536),
(1, 3, 1048576);

-- --------------------------------------------------------

--
-- Table structure for table `rt_contexts`
--

CREATE TABLE IF NOT EXISTS `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `rt_contexts`
--

INSERT INTO `rt_contexts` (`context_id`, `version_id`, `title`, `abbrev`, `description`, `cited_by`, `author_terms`, `define_terms`, `geo_terms`, `seq`) VALUES
(1, 1, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(2, 1, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(3, 1, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(4, 1, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 3),
(5, 1, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 4),
(6, 1, 'Relevant portals', 'Relevant portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(7, 1, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 6),
(8, 1, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(9, 1, 'Data sets', 'Data sets', 'Provides access to agricultural statistics.', 0, 0, 0, 0, 8),
(10, 1, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 9),
(11, 1, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(12, 1, 'Web search', 'Web search', 'Enter search terms for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(13, 2, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(14, 2, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(15, 2, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(16, 2, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 3),
(17, 2, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 4),
(18, 2, 'Dissertations', 'Dissertations', 'Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.', 0, 0, 0, 0, 5),
(19, 2, 'Relevant portals', 'Relevant portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 6),
(20, 2, 'Databases', 'Databases', 'Art & Architecture Databases', 0, 0, 0, 0, 7),
(21, 2, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(22, 2, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 9),
(23, 2, 'Teaching files', 'Teaching files', 'Provide educators with quick and easy access to the learning objects and lesson materials found in these databases that would help with the teaching of concepts and materials in their field.', 0, 0, 0, 0, 10),
(24, 2, 'e-Journals', 'e-Journals', 'Electronic Journals', 0, 0, 0, 0, 11),
(25, 2, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 12),
(26, 2, 'Web search', 'Web search', 'Enter a search term for Internet resources through Google search engine.', 0, 0, 0, 0, 13),
(27, 3, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(28, 3, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(29, 3, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(30, 3, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 3),
(31, 3, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 4),
(32, 3, 'Multimedia', 'Multimedia', 'Multimedia Resources', 0, 0, 0, 0, 5),
(33, 3, 'Astro data', 'Astro data', 'Provide access to astronomy data.', 0, 0, 0, 0, 6),
(34, 3, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(35, 3, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(36, 3, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(37, 3, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(38, 3, 'Web search', 'Web search', 'Enter a search term for Internet resources through Google search engine.', 0, 0, 0, 0, 11),
(39, 4, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(40, 4, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(41, 4, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(42, 4, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 3),
(43, 4, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 4),
(44, 4, 'Relevant portals', 'Relevant portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(45, 4, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(46, 4, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 7),
(47, 4, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 8),
(48, 4, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(49, 4, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 10),
(50, 5, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(51, 5, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 1),
(52, 5, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 2),
(53, 5, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 3),
(54, 5, 'Relevant portals', 'Relevant portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 4),
(55, 5, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(56, 5, 'e-Journals', 'e-Journals', 'Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.', 0, 0, 0, 0, 6),
(57, 5, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 7),
(58, 5, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(59, 5, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(60, 5, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(61, 5, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(62, 6, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(63, 6, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(64, 6, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(65, 6, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 3),
(66, 6, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 4),
(67, 6, 'Relevant portals', 'Relevant portals', 'Portals related to chemistry', 0, 0, 0, 0, 5),
(68, 6, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 6),
(69, 6, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(70, 6, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(71, 6, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(72, 6, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(73, 6, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(74, 7, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(75, 7, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(76, 7, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 2),
(77, 7, 'Cognitive theory', 'Cognitive theory', 'Check the encyclopedic entries to give you the foundationof cognitive theory.', 0, 0, 0, 0, 3),
(78, 7, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 4),
(79, 7, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(80, 7, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(81, 7, 'Multimedia', 'Multimedia', 'Multimedia resources for Cognitive Sciences', 0, 0, 0, 0, 7),
(82, 7, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(83, 7, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(84, 7, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(85, 7, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(86, 8, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(87, 8, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(88, 8, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(89, 8, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 3),
(90, 8, 'Databases', 'Databases', 'Databases containing information related to Computing Science', 0, 0, 0, 0, 4),
(91, 8, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(92, 8, 'Tech. reports', 'Tech. reports', 'Provide gateway to technical report collections.', 0, 0, 0, 0, 6),
(93, 8, 'Patents', 'Patents', 'Access to Canada, U.S. and Europe patent information.', 0, 0, 0, 0, 7),
(94, 8, 'Standards', 'Standards', 'Access to standards information that is frequently consulted by computer scientists.', 0, 0, 0, 0, 8),
(95, 8, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 9),
(96, 8, 'Multimedia', 'Multimedia', 'Multimedia resources', 0, 0, 0, 0, 10),
(97, 8, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(98, 8, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 12),
(99, 8, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 13),
(100, 8, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 14),
(101, 9, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(102, 9, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(103, 9, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 2),
(104, 9, 'Working papers', 'Working papers', 'Search the largest online, free research paper collections in economics.', 0, 0, 0, 0, 3),
(105, 9, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 4),
(106, 9, 'Relevant portals', 'Relevant portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(107, 9, 'Nat''l statistics', 'Nat''l statistics', 'Provides access to statistics in economic studies.', 0, 0, 0, 0, 6),
(108, 9, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 7),
(109, 9, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(110, 9, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(111, 9, 'Government policy', 'Gov Policy', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(112, 9, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(113, 9, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 12),
(114, 10, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(115, 10, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(116, 10, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 2),
(117, 10, 'e-Journals', 'e-Journals', 'Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.', 0, 0, 0, 0, 3),
(118, 10, 'Related theory', 'Related theory', 'Access to published scholarly articles and studies in the foundations of education, and in related disciplines outside the field of education, which contribute to the advancement of educational theory.', 0, 0, 0, 0, 4),
(119, 10, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 5),
(120, 10, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 6),
(121, 10, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(122, 10, 'Multimedia', 'Multimedia', 'Multimedia Content', 0, 0, 0, 0, 8),
(123, 10, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(124, 10, 'Relevant portals', 'Relevant portals', 'Education-related Portals', 0, 0, 0, 0, 10),
(125, 10, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `rt_searches`
--

CREATE TABLE IF NOT EXISTS `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=661 ;

--
-- Dumping data for table `rt_searches`
--

INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(1, 1, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(2, 1, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(3, 1, 'Rice bibliography', 'The Rice Bibliography was begun in 1961 and is now the world''s largest source of scientific information about rice. Almost 8,000 new references are added each year and these cover all subjects related to rice culture.', 'http://ricelib.irri.cgiar.org:81/search/w', 'http://ricelib.irri.cgiar.org:81/search/?searchtype=w&searcharg={$formKeywords}', NULL, 2),
(4, 1, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(5, 1, 'AgEcon Search: Research in agricultural Economics', 'AgEcon Search is designed to electronically distribute reports of scholarly research in the field of agricultural economics.', 'http://agecon.lib.umn.edu/', 'http://agecon.lib.umn.edu/cgi-bin/view.pl?bool=AND&fields=author&detail=0&keywords={$formKeywords}', NULL, 4),
(6, 1, 'The Digital Library of the Commons (DLC)', 'DLC is a gateway to the international literature on the commons . This site contains a Working Paper Archive of author-submitted papers, as well as full-text conference papers, dissertations, working papers and pre-prints, and reports.', 'http://dlc.dlib.indiana.edu/', 'http://dlc.dlib.indiana.edu/perl/search?abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear_srchtype=ALL&_action_search=Search&abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear={$formKeywords}', NULL, 5),
(7, 1, 'PESTIS document database', 'The Pesticide Information Service (PESTIS) is an on-line database for the pesticide use reform and sustainable agriculture communities, made available on the EcoNet computer network. It contains over 400 news items, action alerts, newsletter articles and fact sheets.', 'http://www.panna.org/resources/pestis.html', 'http://www.panna.org/system/searchResults.html?p=1&lang=en&include=&exclude=&penalty=.05&mode=&searchScope=all&q={$formKeywords}', NULL, 6),
(8, 1, 'Common Names for Plant Diseases', 'This resource is an electronic version of: Common names for plant diseases, 1994. Published: St. Paul, Minn.: APS Press, 1994. This compilation provides an updated, combined version of lists of names published in Phytopathology News and Plant Disease.', 'http://www.apsnet.org/online/common/', 'http://www.apsnet.org/online/common/query.asp', 'scope=/online/common/names/&FreeText=on&SearchString={$formKeywords}', 7),
(9, 1, 'Vegetable MD online', 'Vegetable MD Online was developed to provide access to the many Vegetable Disease Fact Sheets produced over the years by Media Services at Cornell. The addition of color photographs enhances the use of these sheets for plant disease diagnosis. The fact sheets also include information about planting methods, irrigation, weed control, insects, handling, field selection, and other issues related to vegetables and their cultivation.', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp?target={$formKeywords}', NULL, 8),
(10, 1, 'VITIS-VEA', 'VITIS-VEA, Viticulture and Enology Abstracts is an international German or English-language publications database in the field of viticulture and enology. It covers grapevine morphology, physiology, and biochemistry, soil science, genetics and grapevine breeding, phytopathology and grapevine protection, cellar techniques, economics of viticulture and enology, and the microbiology of wine.', 'http://vitis-vea.zadi.de/stichwortsuche_eng.htm', 'http://vitis-vea.zadi.de/VITISVEA_ENG/SDF?STICHWORT_O=includes&FORM_F1=AUT1&FORM_SO=Ascend&STICHWORT={$formKeywords}', NULL, 9),
(11, 1, 'World Agricultural Information Centre (WAICENT)', 'This site contains information management and dissemination on desertification, gender and sustainable development, food standards, animal genetic resources, post-harvest operations, agro-biodiversity and food systems in urban centres.', 'http://www.fao.org/waicent/index_en.asp', 'http://www.fao.org/waicent/search/simple_s_result.asp?publication=1&webpage=2&photo=3&press=5&CGIAR=1&QueryString={$formKeywords}', NULL, 10),
(12, 1, 'FAO document repository', 'FAO Document Repository collects and disseminates on the Internet full FAO documents and publications as well as selected non-FAO publications. Three types of searches are provided and several language options are available.', 'http://www.fao.org/documents/', 'http://www.fao.org/documents/advanced_s_result.asp?form_c=AND&RecordsPerPage=50&QueryString={$formKeywords}', NULL, 11),
(13, 2, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(14, 2, 'FAO Glossary of Biotechnology for Food and Agriculture', 'This site provides a tabbed list of words and their definitions, but no search function.  Online searches are free.  There is a bound book version of the dictionary available for sale.', 'http://www.fao.org/biotech/index_glossary.asp', 'http://www.fao.org/biotech/find-form-n.asp', 'terms={$formKeywords}', 1),
(15, 2, 'NAL Agricultural Thesaurus', 'NAL Agricultural Thesaurus was created to meet the needs of the United States Department of Agriculture (USDA), Agricultural Research Service (ARS), for an agricultural thesaurus. NAL Agricultural Thesaurus is for anyone describing, organizing and classifying agricultural resources such as: books, articles, catalogs, databases, patents, games, educational materials, pictures, slides, film, videotapes, software, other electronic media, or websites. It is organized into 17 subject categories.', 'http://agclass.nal.usda.gov/agt/agt.htm', 'http://agclass.nal.usda.gov/agt/mtw.exe?k=default&p=A&l=60&s=2&t=1&n=100&w={$formKeywords}', NULL, 2),
(16, 2, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(17, 2, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(18, 2, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(19, 2, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(20, 3, 'AgEcon Search: Research in agricultural Economics', 'AgEcon Search is designed to electronically distribute reports of scholarly research in the field of agricultural economics.', 'http://agecon.lib.umn.edu/', 'http://agecon.lib.umn.edu/cgi-bin/view.pl?bool=AND&fields=key&detail=0&keywords={$formKeywords}', NULL, 0),
(21, 3, 'CropSEARCH', 'Index to plant lists of hundreds of crop species.', 'http://www.hort.purdue.edu/newcrop/SearchEngine.html', 'http://index.cc.purdue.edu:8765/query.html?col=pumerge&charset=iso-8859-1&ht=0&qp=%2Bsite%3Ahort.purdue.edu&qs=&qc=&pw=100%25&ws=0&la=en&qm=0&st=1&nh=10&lk=1&rf=0&rq=0&si=0&puhead=header.html&pufoot=footer.html&qt={$formKeywords}', NULL, 1),
(22, 3, 'The Digital Library of the Commons (DLC)', 'DLC is a gateway to the international literature on the commons . This site contains a Working Paper Archive of author-submitted papers, as well as full-text conference papers, dissertations, working papers and pre-prints, and reports.', 'http://dlc.dlib.indiana.edu/', 'http://dlc.dlib.indiana.edu/perl/search?abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear_srchtype=ALL&_action_search=Search&abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear={$formKeywords}', NULL, 2),
(23, 3, 'FAS online', 'The Foreign Agricultural Service (FAS) of the U.S. Department of Agriculture (USDA) produces hundreds of documents each year that chart and analyze production, consumption, trade flows, and market opportunities for about 100 agricultural products. Includes market-and commodity-specific reports, data and statistics, news, trade leads, information on export and import programs, and more.', 'http://www.fas.usda.gov/fassearch.asp', 'http://www.fas.usda.gov/FASSearch_results_H.asp?SearchString={$formKeywords}', NULL, 3),
(24, 3, 'PESTIS document database', 'The Pesticide Information Service (PESTIS) is an on-line database for the pesticide use reform and sustainable agriculture communities, made available on the EcoNet computer network. It contains over 400 news items, action alerts, newsletter articles and fact sheets.', 'http://www.panna.org/resources/pestis.html', 'http://www.panna.org/system/searchResults.html?p=1&lang=en&include=&exclude=&penalty=.05&mode=&searchScope=all&q={$formKeywords}', NULL, 4),
(25, 3, 'PlantFacts', 'PlantFacts includes guides for answering plant-related questions from 46 different universities and government institutions across the United States and Canada. Over 20,000 pages of Extension fact sheets and bulletins provide a concentrated source of plant-related information. PlantFacts has merged several digital collections developed at Ohio State University to become an international knowledge bank and multimedia learning center.', 'http://plantfacts.osu.edu/', 'http://plantfacts.osu.edu/action.lasso?-Layout=input&-Search=-nothing&-Response=results_list2.lasso&-AnyError=error.lasso&searchitem={$formKeywords}', NULL, 5),
(26, 3, 'National PLANTS database', 'Focuses on the vascular and nonvascular plants of the United States and its territories. The PLANTS database includes checklists, distributional data, crop information, plants symbols, plant growth data, references and other plant information.', 'http://plants.usda.gov/', 'http://www.nrcs.usda.gov/search.asp?site=NPDC&ct=ALL&qu={$formKeywords}', NULL, 6),
(27, 3, 'Common Names for Plant Diseases', 'This resource is an electronic version of: Common names for plant diseases, 1994. Published: St. Paul, Minn.: APS Press, 1994. This compilation provides an updated, combined version of lists of names published in Phytopathology News and Plant Disease.', 'http://www.apsnet.org/online/common/', 'http://www.apsnet.org/online/common/query.asp', 'scope=/online/common/names/&FreeText=on&SearchString={$formKeywords}', 7),
(28, 3, 'Rice bibliography', 'The Rice Bibliography was begun in 1961 and is now the world''s largest source of scientific information about rice. Almost 8,000 new references are added each year and these cover all subjects related to rice culture.', 'http://ricelib.irri.cgiar.org:81/search/w', 'http://ricelib.irri.cgiar.org:81/search/w?SEARCH={$formKeywords}', NULL, 8),
(29, 3, 'Vegetable MD online', 'Vegetable MD Online was developed to provide access to the many Vegetable Disease Fact Sheets produced over the years by Media Services at Cornell. The addition of color photographs enhances the use of these sheets for plant disease diagnosis. The fact sheets also include information about planting methods, irrigation, weed control, insects, handling, field selection, and other issues related to vegetables and their cultivation.', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp?target={$formKeywords}', NULL, 9),
(30, 3, 'VITIS-VEA', 'VITIS-VEA, Viticulture and Enology Abstracts is an international German or English-language publications database in the field of viticulture and enology. It covers grapevine morphology, physiology, and biochemistry, soil science, genetics and grapevine breeding, phytopathology and grapevine protection, cellar techniques, economics of viticulture and enology, and the microbiology of wine.', 'http://vitis-vea.zadi.de/stichwortsuche_eng.htm', 'http://vitis-vea.zadi.de/VITISVEA_ENG/SDF?STICHWORT_O=includes&FORM_F1=AUT1&FORM_SO=Ascend&STICHWORT={$formKeywords}', NULL, 10),
(31, 4, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(32, 4, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(33, 4, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(34, 4, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(35, 4, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(36, 4, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(37, 4, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(38, 5, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(39, 5, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(40, 5, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(41, 5, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(42, 5, 'E-STREAMS', 'E-STREAMS: Electronic reviews of Science & Technology References covering Engineering, Agriculture, Medicine and Science. Each issue contains 30+ STM reviews, covering new titles in Engineering, Agriculture, Medicine and Science. Each review is signed, and includes the email address of the reviewer. The reviews feature short TOCs, a list of contributors and bibliographic information.', 'http://www.e-streams.com/', 'http://www.e-streams.com/c3/cgi-bin/search.pl', 'boolean=AND&case=Insensitive&terms={$formKeywords}', 4),
(43, 6, 'AgNIC', 'AgNIC is a guide to quality agricultural information on the Internet as selected by the National Agricultural Library, Land-Grant Universities, and other institutions.', 'http://www.agnic.org/', 'http://www.agnic.org/advsearch/?submitted=1&searchtype=AgResource&keywords={$formKeywords}', NULL, 0),
(44, 6, 'AGRICOLA articles (NAL Web: 1982- )', 'AGRICOLA covers the areas of agriculture, agricultural administration, agricultural laws and legislation, agricultural regulations, agricultural economics, agricultural education and training, agricultural extension and advisory work, agricultural engineering, agricultural products, animal science, entomology, aquatic science, fisheries, feed science, food science, food products, forestry, geography, meteorology, climatology, history, home economics, human ecology, household textiles and clothing, human nutrition, natural resources, pesticides, plant science, pollution, soil science, rural sociology, rural development, and human parasitology. It indexes journal articles and other publications as well as audiovisual materials, maps, books, software, conference proceedings, theses, research reports and government documents.', 'http://agricola.nal.usda.gov/', 'http://agricola.nal.usda.gov/cgi-bin/Pwebrecon.cgi?BOOL1=all+of+these&FLD1=Keyword+Anywhere+%28GKEY%29&GRP1=AND+with+next+set&SAB2=&BOOL2=any+of+these&FLD2=Subject+%28SKEY%29&GRP2=AND+with+next+set&SAB3=&BOOL3=as+a+phrase&FLD3=Title+%28TKEY%29&GRP3=AND+with+next+set&SAB4=&BOOL4=as+a+phrase&FLD4=Author+Name+%28NKEY%29&PID=4294&SEQ=20060511212523&CNT=25&HIST=1&SAB1={$formKeywords}', NULL, 1),
(45, 6, 'AgriSurf! - The Farmers Search Engine', 'From family farms to agribusiness, almost 20,000 sites "hand picked by agricultural experts" are arranged in categories, indexed, rated for speed and reliability of access, labeled with the flag of their country of origin, and may be searched using keywords. Annotations are taken from the sites'' self-descriptions.', 'http://www.agrisurf.com/agrisurfscripts/agrisurf.asp?index=_25', 'http://www.agrisurf.com/?cx=009099332680230023402%3Asp1yugldxek&cof=FORID%3A10&q={$formKeywords}', NULL, 2),
(46, 6, 'Farms.com', 'Established in 1995, Farms.com has been instrumental in the development of the Agricultural Internet. Now recognized throughout North America as the leading Agriculture Internet resource, Farms.com has successfully combined agri-business experience with the vast power of the Internet to provide producers with the information, services, and markets they need to make sound business decisions and increase profitability.', 'http://canada.eharvest.com/', 'http://www.agrisurf.com/agrisurfscripts/inc/farms/search.asp?index=_25&rbtn=ALL&ft=on&SearchString={$formKeywords}', NULL, 3),
(47, 6, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/srsapp/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 4),
(48, 6, 'World Agricultural Information Centre (WAICENT)', 'This site contains information management and dissemination on desertification, gender and sustainable development, food standards, animal genetic resources, post-harvest operations, agro-biodiversity and food systems in urban centres.', 'http://www.fao.org/waicent/index_en.asp', 'http://www.fao.org/waicent/search/simple_s_result.asp?publication=1&webpage=2&photo=3&press=5&CGIAR=1&QueryString={$formKeywords}', NULL, 5),
(49, 6, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 6),
(50, 6, 'Agriculture 21', 'Contains news and features on agricultural and food-supply issues worldwide, as well as downloadable publications, links to databases, subject guides, and access to divisions of the FAO Agriculture Department. Includes search engine.', 'http://www.fao.org/ag/', 'http://www.fao.org/ag/search/agfind.asp?Find=Find&SortBy=rank[d]&Scope=/ag&CiuserParam3=agfind.asp&lang=en&FMMod=any&FSRest=<&FSRestval=any&Action=Execute&SearchString={$formKeywords}', NULL, 7),
(51, 7, 'FAO document repository', 'FAO Document Repository collects and disseminates on the Internet full FAO documents and publications as well as selected non-FAO publications. Three types of searches are provided and several language options are available.', 'http://www.fao.org/documents/', 'http://www.fao.org/documents/advanced_s_result.asp?form_c=AND&RecordsPerPage=50&QueryString={$formKeywords}', NULL, 0),
(52, 7, 'National Ag Safety Databases (NASD)', 'The National Ag Safety Databases (NASD) is a database of materials devoted to increased safety, health and injury prevention in agriculture, listed by topic and state. Video resources are indexed, there are special listings for conference proceedings, posters and other materials.', 'http://www.cdc.gov/search.htm', 'http://www.cdc.gov/search.do?action=search&x=0&y=0&queryText={$formKeywords}', NULL, 1),
(53, 7, 'E-Answers', 'A collection of over 250,000 pages of full text electronic documents from the Extension Services and Agricultural Experiment Stations of over fifteen states of the United States, searchable by keyword and by region of the country. A single-stop access to a large number of useful and reputable publications on topics in agriculture, family topics, consumer issues, environment, economics, and public policy.', 'http://e-answers.adec.edu/', 'http://e-answers.adec.edu/cgi-bin/htsearch?config=ea-all&words={$formKeywords}', NULL, 2),
(54, 7, 'National Plants Databases', 'From the U.S. Department of Agriculture Natural Resources Conservation Service, "The PLANTS Databases is a single source of standardized information about plants. . . focuse[d] on vascular plants, mosses, liverworts, hornworts, and lichens of the U.S. and its territories. The PLANTS Databases includes names, checklists, automated tools, identification information, species abstracts, distributional data, crop information, plant symbols, plant growth data, plant materials information, plant links, references, and other plant information." An FAQ section linked to the banner provides additional information.', 'http://plants.usda.gov/', 'http://www.nrcs.usda.gov/search.asp?site=NPDC&ct=ALL&qu={$formKeywords}', NULL, 3),
(55, 8, 'Agricultural Conferences, Meetings, Seminars Calendar', 'This calendar strives to include all major national and international agricultural meetings and others of apparent scientific importance. We will incorporate local level meetings only when they seem to be scientifically significant. Meetings outside our purview will be left to appropriate local, regional, or organization-specific calendars. We do plan to create links to such calendars when they are available. Provides a central repository for information and links to information concerning upcoming agricultural conferences, with emphasis on those of scientific significance.', 'http://www.agnic.org/mtg/', 'http://www.agnic.org/events/index.html?submitted=1&searchtype=keyword&keywords={$formKeywords}', NULL, 0),
(56, 8, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 1),
(57, 8, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 2),
(58, 9, 'Breeds of Livestock', 'Web site allows users to search for information on livestock by world region or by species name. Data is available on cattle, horses, swine, goats, and sheep and organized as encyclopedia entries.', 'http://www.ansi.okstate.edu/breeds/', 'http://www.google.com/search?q=site%3Aansi.okstate.edu+breeds+', NULL, 0),
(59, 9, 'USDA Economics and Statistics System', 'USDA Economics and Statistics System contains more than 400 reports and datasets from the economics agencies of the U.S. Department of Agriculture. These materials cover U.S. and international agriculture and related topics. Most reports are text files that contain time-sensitive information. Most data sets are in spreadsheet format and include time-series data that are updated yearly.', 'http://usda.mannlib.cornell.edu/', 'http://usda.mannlib.cornell.edu/MannUsda/search.do?action=fullKeywordSearch&titlesearch=titlesearch&includeAMS=includeAMS&simple_search_term={$formKeywords}', NULL, 1),
(60, 10, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(61, 10, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(62, 10, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(63, 10, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(64, 11, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(65, 11, 'Agriculture 21', 'This site contains news and features on agricultural and food-supply issues worldwide, as well as downloadable publications, links to databases, subject guides, and access to divisions of the FAO Agriculture Department. Includes search engine.', 'http://www.fao.org/ag/', 'http://www.fao.org/ag/search/agfind.asp?SortBy=rank%5Bd%5D&Scope=%2Fag&FSRestVal=any&Action=Execute&SearchString={$formKeywords}', NULL, 1),
(66, 11, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(67, 11, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 3),
(68, 11, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 4),
(69, 11, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(70, 11, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 6),
(71, 11, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(72, 11, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(73, 11, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(74, 11, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 10),
(75, 12, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(76, 12, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(77, 12, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(78, 12, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(79, 13, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(80, 13, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(81, 13, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(82, 13, 'SPIRO (Architecture Slide Library, University of California - Berkeley)', 'SPIRO (slide & photograph image retrieval online) provides access to images and descriptive information about 20% of the Library''s collection of 200,000 35mm slides.', 'http://www.mip.berkeley.edu/query_forms/browse_spiro_form.html', 'http://www.mip.berkeley.edu/cgi-bin/browse_spiro_new/tmp?db_handle=browse_spiro&object=&place=&aat_term=&aat_term2=&source=&image_id=&kw=&from_date=&period=any&result_type=thumbnail_with_descr&name={$formKeywords}', NULL, 3),
(83, 13, 'GreatBuildings.com', 'This gateway to architecture around the world and across history documents a thousand buildings and hundreds of leading architects, with 3D models, photographic images and architectural drawings, commentaries, bibliographies, web links, and more, for famous designers and structures of all kinds.', 'http://www.greatbuildings.com/search.html', 'http://www.greatbuildings.com/cgi-bin/gbc-search.cgi?search=architect&architect={$formKeywords}', NULL, 4),
(84, 13, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 5),
(85, 14, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(86, 14, 'Columbia Encyclopedia', 'Serving as a "first aid" for those who read, the sixth edition of the Columbia Encyclopedia contains over 51,000 entries with 80,000 hypertext links.', 'http://www.bartleby.com/65/', 'http://www.bartleby.com/cgi-bin/texis/webinator/65search?search_type=full&query={$formKeywords}', NULL, 1),
(87, 14, 'WordWeb Online', 'WordWeb is an international dictionary and word finder with more than 280 000 possible lookup words and phrases. It is also available as Windows software.\n\nWordWeb fully covers American, British, Australian, Canadian and Asian English spellings and words.', 'http://www.wordwebonline.com/', 'http://www.wordwebonline.com/search.pl?w={$formKeywords}', NULL, 2),
(88, 14, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(89, 14, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(90, 14, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(91, 14, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(92, 15, 'SPIRO (Architecture Slide Library, University of California - Berkeley)', 'SPIRO (slide & photograph image retrieval online) provides access to images and descriptive information about 20% of the Library''s collection of 200,000 35mm slides.', 'http://www.mip.berkeley.edu/query_forms/browse_spiro_form.html', 'http://www.mip.berkeley.edu/cgi-bin/browse_spiro_new/tmp?db_handle=browse_spiro&object=&place=&aat_term=&aat_term2=&source=&image_id=&from_date=&period=any&result_type=thumbnail_with_descr&name=&kw={$formKeywords}', NULL, 0),
(93, 15, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 1),
(94, 15, 'GreatBuildings.com', 'This gateway to architecture around the world and across history documents a thousand buildings and hundreds of leading architects, with 3D models, photographic images and architectural drawings, commentaries, bibliographies, web links, and more, for famous designers and structures of all kinds.', 'http://www.greatbuildings.com/search.html', 'http://www.greatbuildings.com/cgi-bin/gbc-search.cgi?search=building&building={$formKeywords}', NULL, 2),
(95, 16, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(96, 16, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(97, 16, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(98, 16, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(99, 16, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(100, 16, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(101, 16, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(102, 17, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(103, 17, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(104, 17, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(105, 17, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(106, 18, 'Networked Digital Library of Theses and Dissertations Union Catalog', 'This Union Catalog serves as a repository of rich graduate educational material contributed by a number of member institutions worldwide.  This project is a joint development with NDLTD and VTLS Inc.  It is hoped that this project will increase the availability of student research for scholars, empowere students to convey a richer message through the use of multimedia and hypermedia technologies and advance digital library technology worldwide.', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon?sessionid=2006051219043826835&skin=ndltd&submittheform=Search&usersrch=1&beginsrch=1&elementcount=3&function=INITREQ&search=SCAN&lng=en&pos=1&conf=.%2Fchameleon.conf&u1=4&host=localhost%2B3668%2BDEFAULT&t1={$formKeywords}', NULL, 0),
(107, 18, 'CRL Foreign Doctoral Dissertation Databases', 'The CRL''s (Center For Research Libraries) database for dissertations published outside of the United States and Canada is still in the construction phase.  At this point, a total of 15,000 of 750,000 records are loaded into the database.  Searchable by author, institution name, title, year, translated title, subject keywords, language, and country, the database also provides instructions for interlibrary loan procedure.', 'http://www.crl.edu/default.asp', 'http://www.crl.edu/DBSearch/catalogSearchNew.asp?sort=R&req_type=X&search={$formKeywords}', NULL, 1),
(108, 18, 'Scirus ETD Search', 'NDLTD offers a search service provided by Scirus, which is based on data harvested from the Union Archive hosted by OCLC.', 'http://www.ndltd.org/info/description.en.html', 'http://www.scirus.com/srsapp/search?rep=ndl&q={$formKeywords}', NULL, 2),
(109, 18, 'Dissertation.com', 'Academic publishers of masters theses and doctoral PhD dissertations. Search 1000s of dissertation abstracts in dissertation database.', 'http://dissertation.com/', 'http://dissertation.com/browse.php?criteria=all&submit.x=23&submit.y=5&keyword={$formKeywords}', NULL, 3),
(110, 19, 'The Art, Design, Architecture & Media Information Gateway (ADAM)', 'ADAM is being developed to provide a gateway to information about fine art, design, architecture, applied arts, media, theory, museum studies and conservation and professional practice related to any of the above. It is one of the eLib Access to Network Resources (ANR) projects and received its funding from JISC. A user survey to measure information needs and search methods, annual reports, and service usage statistics are published at the site.', 'http://www.adam.ac.uk/index.html', 'http://www.adam.ac.uk/ixbin/hixserv?_IXDB_=adam&%7BUPPER%7D%24%3Fany%3A+IX_MODE+rel%3D1+%28%24any%29+INDEX+res_keywords=.&%24+with+res_pub=.&%24sort+@descending+%24%24relevance=.&%24%3F%21x%3A%28%28collection+or+item%29+in+res_granularity%29=.&_IXSPFX_=s&submit-button=SUMMARY&%24%3Dany%3D%24={$formKeywords}', NULL, 0),
(111, 19, 'Akropolis.net', 'The premier architecture resource on the Internet, including Architects, Interior Designers, Landscapers, employment, free web sites, free portfolios, search engine, and more.', 'http://www.akropolis.net/', 'http://www.akropolis.net/search/index.ahtml?referredby=home&action=SEARCH&words={$formKeywords}', NULL, 1),
(112, 20, 'Artcyclopedia.com', 'This site has compiled a comprehensive index of every artist represented at hundreds of museum sites, image archives, and other online resources.  The site has started out by covering the biggest and best sites around, and has links for most well-known artists:  contains 1800 art sites, and offers over 60,000 links to an estimated 150,000 artworks by 8,100 renowned artists.', 'http://www.artcyclopedia.com/', 'http://www.artcyclopedia.com/scripts/tsearch.pl?type=2&t={$formKeywords}', NULL, 0),
(113, 20, 'Union List of Artists Names', 'Contains biographical information about artists and architects, including variant names, pseudonyms, and language variants.', 'http://www.getty.edu/research/tools/vocabulary/ulan/', 'http://www.getty.edu/vow/ULANServlet?nation=&english=Y&role=&page=1&find={$formKeywords}', NULL, 1),
(114, 21, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com/mind/+{$formKeywords}', NULL, 0),
(115, 22, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(116, 22, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(117, 22, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(118, 22, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(119, 23, 'ARTSEDGE', 'ARTSEDGE supports the place of arts education at the center of the curriculum through the creative and appropriate uses of technology. ARTSEDGE helps educators to teach in, through and about the arts.', 'http://artsedge.kennedy-center.org/', 'http://artsedge.kennedy-center.org/search/search_perform.cfm?advanced=false&contentTypes=&artsSubjects=&x=31&y=9&keywords={$formKeywords}', NULL, 0),
(120, 23, 'ArtsEdNet', 'ArtsEdNet, an online service developed by the Getty Education Institute for the Arts, supports the needs of the K-12 arts education community. It focuses on helping arts educators, general classroom teachers using the arts in their curriculum, museum educators, and university', 'http://www.getty.edu/artsednet/home.html', 'http://www.google.com/search?hl=en&btnG=Search&q=site%3Awww.getty.edu%2Feducation%2F+{$formKeywords}', NULL, 1),
(121, 24, 'Arts Journal', 'Arts Journal is a weekday digest of some of the best arts and cultural journalism. Each day Arts Journal combs through more than 100 English-language newspapers, magazines and publications featuring writing about arts and culture. Direct links to the most interesting or important stories are posted every weekday on the Arts Journal news pages. Stories from sites that charge for access are excluded as are sites which require visitors to register, with the exception of the New York Times.', 'http://www.artsjournal.com/', 'http://www.google.com/custom?domains=artsjournal.com&sitesearch=artsjournal.com&sa=GoogleSearch&cof=LW:240;L:http://www.artsjournal.com/img/logo.gif;LH:52;AH:left;S:http://www.artsjournal.com;AWFID:edabed9eb3afda60;&q={$formKeywords}', NULL, 0),
(122, 24, 'Aesthetics On-line', 'In Aesthetics On-line you''ll find articles about aesthetics, philosophy of art, art theory and art criticism, as well as information about aesthetics events worldwide, and links to other aesthetics-related resources on the internet, including the Aesthetics-L email discussion list.', 'http://www.aesthetics-online.org/', 'http://www.aesthetics-online.org/tech/search.cgi?context=Site&terms={$formKeywords}', NULL, 1),
(123, 24, 'Architronic', 'Architronic is a scholarly refereed journal, exploring the new ranges of architectural communication available through digital media. It is a platform for both presenting and reviewing research as a journal, and a forum for stimulating dialogue on emerging ideas.', 'http://architronic.saed.kent.edu/', 'http://www.google.com/search?q=site:architronic.saed.kent.edu+', NULL, 2),
(124, 25, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(125, 25, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(126, 25, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(127, 25, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(128, 25, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(129, 25, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 5),
(130, 25, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(131, 25, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(132, 25, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(133, 25, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 9),
(134, 25, 'The ArchNewsNow', 'The ArchNewsNow (ANN) newsletter, launched in February 2002, is delivered daily to subscribers -- free of charge -- via e-mail by 9:30AM (New York time). It hyperlinks directly to the latest news and commentary gleaned from sources around the world.', 'http://www.archnewsnow.com/', 'http://www.archnewsnow.com/cgi-local/search.pl?Required={$formKeywords}', NULL, 10),
(135, 26, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(136, 26, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(137, 26, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(138, 26, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(139, 27, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(140, 27, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(141, 27, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(142, 27, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(143, 27, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(144, 27, 'AstroLinks', 'AstroLinks provides links that will lead you to a voluminous amount of astronomical data and information.', 'http://www.astro.univie.ac.at/', 'http://www.google.com/search?q=site%3Aastro.univie.ac.at+{$formKeywords}', NULL, 5),
(145, 27, 'Astronomy Resources from STScI', 'Astronomical Internet resources by the Space Telescope Science Institute.', 'http://www.stsci.edu/science/net-resources.html', 'http://www.stsci.edu/resources/WebSearch?uq=&notq=&command=Submit&query={$formKeywords}', NULL, 6),
(146, 27, 'Astrophysics Data System', 'Astrophysics Data System contains abstracts from hundreds of publications, colloquia, symposia, proceedings, and internal NASA reports, and provides free and unrestricted access to scanned images of journals, conference proceedings and books in Astronomy and Astrophysics.', 'http://adsabs.harvard.edu/abstract_service.html', 'http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?db_key=AST&sim_query=YES&aut_xct=NO&aut_logic=OR&obj_logic=OR&object=&start_mon=&start_year=&end_mon=&end_year=&ttl_logic=OR&txt_logic=OR&text=&nr_to_return=100&start_nr=1&start_entry_day=&start_entry_mon=&start_entry_year=&min_score=&jou_pick=ALL&ref_stems=&data_and=ALL&group_and=ALL&sort=SCORE&aut_syn=YES&ttl_syn=YES&txt_syn=YES&aut_wt=1.0&obj_wt=1.0&ttl_wt=0.3&txt_wt=3.0&aut_wgt=YES&obj_wgt=YES&ttl_wgt=YES&txt_wgt=YES&ttl_sco=YES&txt_sco=YES&version=1&title=&author={$formKeywords}', NULL, 7),
(147, 27, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://fnalpubs.fnal.gov/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/wwwscan?subfile=wwwhepau&submit=Browse&rawcmd=', NULL, 8),
(148, 27, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 9),
(149, 27, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 10),
(150, 28, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(151, 28, 'Encyclopedia of Astronomy and Astrophysics', 'Encyclopedia of Astronomy and Astrophysics is the most comprehensive reference on astronomy and astrophysics ever published. Comprising more than 2.5 million words, the site provides 24-hour free trial and 30 day free institutional trial.', 'http://www.ency-astro.com/', 'http://eaa.iop.org/index.cfm?action=search.home&quick=1&field1=&newsearch=1&coll=ft&query1={$formKeywords}', NULL, 1),
(152, 28, 'Encyclopedia Astronautica', 'Encyclopedia Astronautica is likely the best source for international space flight information.', 'http://www.astronautix.com/', 'http://www.google.com/custom?sa=Search&cof=L%3Ahttp%3A%2F%2Fwww.astronautix.com%2Fgraphics%2Fl%2Flogo.gif%3BAH%3Acenter%3BGL%3A0%3BAWFID%3A3cf675793eb3c420%3B&sitesearch=www.astronautix.com&domains=www.astronautix.com&q={$formKeywords}', NULL, 2),
(153, 28, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(154, 28, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(155, 28, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(156, 28, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(157, 29, 'AstroLinks', 'AstroLinks provides links that will lead you to a voluminous amount of astronomical data and information.', 'http://www.astro.univie.ac.at/', 'http://www.google.com/search?q=site%3Aastro.univie.ac.at+', NULL, 0),
(158, 29, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(159, 29, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 2),
(160, 29, 'Astronomy Resources from STScI', 'Astronomical Internet resources by the Space Telescope Science Institute.', 'http://www.stsci.edu/science/net-resources.html', 'http://www.stsci.edu/resources/WebSearch?uq=&notq=&command=Submit&query={$formKeywords}', NULL, 3),
(161, 29, 'Astrophysics Data System', 'Astrophysics Data System contains abstracts from hundreds of publications, colloquia, symposia, proceedings, and internal NASA reports, and provides free and unrestricted access to scanned images of journals, conference proceedings and books in Astronomy and Astrophysics.', 'http://adsabs.harvard.edu/abstract_service.html', 'http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?db_key=AST&sim_query=YES&aut_xct=NO&aut_logic=OR&obj_logic=OR&author=&object=&start_mon=&start_year=&end_mon=&end_year=&ttl_logic=OR&txt_logic=OR&text=&nr_to_return=100&start_nr=1&start_entry_day=&start_entry_mon=&start_entry_year=&min_score=&jou_pick=ALL&ref_stems=&data_and=ALL&group_and=ALL&sort=SCORE&aut_syn=YES&ttl_syn=YES&txt_syn=YES&aut_wt=1.0&obj_wt=1.0&ttl_wt=0.3&txt_wt=3.0&aut_wgt=YES&obj_wgt=YES&ttl_wgt=YES&txt_wgt=YES&ttl_sco=YES&txt_sco=YES&version=1&title={$formKeywords}', NULL, 4),
(162, 29, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://fnalpubs.fnal.gov/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/www?AUTHOR=&C=&REPORT-NUM=&AFFILIATION=&cn=&k=&cc=&eprint=+&eprint=&topcit=&url=&J=+&*=&ps=+&DATE=&*=+&FORMAT=WWW&SEQUENCE=&TITLE={$formKeywords}', NULL, 5),
(163, 29, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?author1=&pubdate_year=&volume=&firstpage=&src=hw&hits=10&hitsbrief=25&resourcetype=1&andorexactfulltext=and&fulltext={$formKeywords}', NULL, 6),
(164, 29, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 7),
(165, 30, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(166, 30, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(167, 30, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(168, 30, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(169, 31, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(170, 31, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(171, 31, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(172, 31, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(173, 31, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(174, 32, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(175, 33, 'HEASARC', 'HEASARC is a source of gamma-ray, X-ray, and extreme ultraviolet observations of cosmic (non-solar) sources. This site provides access to archival data, associated analysis software, data format standards, documentation, expertise in how to use them, as well as relevant educational and outreach material.', 'http://heasarc.gsfc.nasa.gov/', 'http://heasarc.gsfc.nasa.gov/cgi-bin/search/search.pl?tquery={$formKeywords}', NULL, 0),
(176, 33, 'UK Astronomy Data Centre', 'UK Astronomy Data Centre houses a good selection of data from the UK''s ground based telescopes as well as a number of catalogues.', 'http://archive.ast.cam.ac.uk/', 'http://archive.ast.cam.ac.uk/cgi-bin/wdb/wfsurvey/wfsurvey/query?tab_date_obs=on&date_obs=&tab_utstart=on&utstart=&tab_object=on&object=&tab_runno=on&runno=&tab_fband=on&fband=&tab_fsys=on&fsys=&tab_exposure=on&exposure=&box=00+30+00&tab_ra=on&ra=&tab_dec=on&scionly=on&max_rows_returned=1500&dec={$formKeywords}', NULL, 1),
(177, 34, 'International Astronomy Meetings List', 'International Astronomy Meetings List provides links to the meeting web page, contact e-mail addresses, and abstracts provided by NASA''s Astrophysics Data System (ADS) if, and when they are available.', 'http://cadcwww.dao.nrc.ca/meetings/meetings.html', 'http://cadcwww.dao.nrc.ca/cadcbin/wdb/cadcmisc/meetings/query?tab_meeting_no=on&meeting_no=&tab_title=on&web=&tab_location=on&location=&contact=&email=&address=&tab_date_start=on&date_start=&tab_end_date=on&end_date=&max_rows_returned=10&title=&keywords={$formKeywords}', NULL, 0),
(178, 34, 'Scholarly Societies Project Meeting/Conference Announcement List', 'Scholarly Societies Project Meeting/Conference Announcement List is a searchable service provided by the University of Waterloo (Canada) Scholarly Societies Project.', 'http://www.lib.uwaterloo.ca/society/meetings.html', 'http://ssp-search.uwaterloo.ca/cd.cfm', 'search_type=advanced&field1=any&boolean1=and&operator1=and&field2=any&textfield2=&boolean2=and&operator2=and&field3=any&textfield3=&boolean3=and&operator3=and&founded=none&after=&before=&Go8=Search&textfield1={$formKeywords}', 1),
(179, 35, 'Space Science Education Resource Directory', 'Space Science Education Resource Directory is a convenient way to find NASA space science products for use in classrooms, science museums, planetariums, and other settings.', 'http://teachspacescience.org/cgi-bin/ssrtop.plex', 'http://teachspacescience.org/cgi-bin/search.plex?mode=basic&bgrade=allgrades&btopic=alltopics&submit.x=47&submit.y=14&keywords={$formKeywords}', NULL, 0),
(180, 35, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 1),
(181, 35, 'Space Science Education Home Page -- Goddard Space Flight Center', 'Data from several NASA missions, student activities, teacher resources', 'http://gsfc.nasa.gov/education/education_home.html', 'http://search.nasa.gov/nasasearch/search/search.jsp?nasaInclude={$formKeywords}', NULL, 2),
(182, 36, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(183, 36, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://www.canada.gc.ca/main_e.html', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(184, 36, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(185, 36, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(186, 36, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(187, 36, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(188, 36, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(189, 36, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(190, 36, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(191, 37, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(192, 37, 'ASTRONOMY magazine', 'ASTRONOMY magazine, the world''s best selling English magazine, offers visitors a wide variety of information for both hobbyist and armchair astronomers alike.', 'http://www.astronomy.com/home.asp', 'http://www.astronomy.com/asy/default.aspx?c=se&outsideHidden=Yes&searchStr={$formKeywords}', NULL, 1),
(193, 37, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 2),
(194, 37, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 3),
(195, 37, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 4);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(196, 37, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 5),
(197, 37, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 6),
(198, 38, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(199, 38, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(200, 38, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(201, 38, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(202, 39, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(203, 39, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(204, 39, 'ClinicalTrials.gov', 'ClinicalTrials.gov provides patients, family members, health care professionals, and members of the public, easy and free access to information on clinical studies for a wide range of diseases and conditions.', 'http://www.clinicaltrials.gov/', 'http://www.clinicaltrials.gov/ct/search;jsessionid=6EC2379952077D66434C74BCF3542697?&submit=Search&term={$formKeywords}', NULL, 2),
(205, 39, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(206, 39, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(207, 39, 'Animal Info: Information on Rare, Threatened and Endangered Mammals', 'Animal Info offers information on the biology and ecology of various species as well as current status of rare and endangered mammals. Also provides links to animal interest organizations and publications. Users can search an individual species index by common and scientific name, a species group index and a country index.', 'http://www.animalinfo.org/', 'http://search.atomz.com/search/?sp-a=00081051-sp00000000&sp-q={$formKeywords}', NULL, 5),
(208, 39, 'BioMed Central (Requires Registration)', 'BioMed Central publishes original, peer-reviewed research in all areas of biomedical research, with immediate, barrier-free access for all. BioMed Central is structured into journals, each of which covers a broad area of biology or medicine.', 'http://www.biomedcentral.com/', 'http://www.google.com/search?q=site%3Abiomedcentral.com+{$formKeywords}', NULL, 6),
(209, 39, 'PubMed', 'This is an experimental interface to several databases published by the NLM. Included are Medline and Pre-Medline, Popline, Toxline, GenBank DNA sequences, GenBank Protein Sequences, BioMolecule 3D structures, and Complete Genomes. This resource contains links to the full text of the articles when available.', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 7),
(210, 39, 'PubMed Central: an archive of life science journals', 'PubMed Central is a digital archive of life sciences journal literature managed by the National Center', 'http://www.pubmedcentral.nih.gov/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?search=Search&db=pmc&cmd=search&pmfilter_Fulltext=on&pmfilter_Relevance=on&term={$formKeywords}', NULL, 8),
(211, 40, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(212, 40, 'Life Sciences Dictionary from BioTech', 'Life Sciences Dictionary from BioTech comprises 8,300+ terms relating to biochemistry, biotechnology, botany, cell biology and genetics, as well as selective entries on ecology, limnology, pharmacology, toxicology and medicine.', 'http://biotech.icmb.utexas.edu/search/dict-search.html', 'http://biotech.icmb.utexas.edu/search/dict-search2.html?bo1=AND&search_type=normal&def=&&word={$formKeywords}', NULL, 1),
(213, 40, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(214, 40, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(215, 40, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(216, 40, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(217, 41, 'Animal Info: Information on Rare, Threatened and Endangered Mammals', 'Animal Info offers information on the biology and ecology of various species as well as current status of rare and endangered mammals. Also provides links to animal interest organizations and publications. Users can search an individual species index by common and scientific name, a species group index and a country index.', 'http://www.animalinfo.org/', 'http://search.atomz.com/search/?sp-a=00081051-sp00000000&sp-q={$formKeywords}', NULL, 0),
(218, 41, 'ClinicalTrials.gov', 'ClinicalTrials.gov provides patients, family members, health care professionals, and members of the public, easy and free access to information on clinical studies for a wide range of diseases and conditions.', 'http://www.clinicaltrials.gov/', 'http://www.clinicaltrials.gov/ct/search;jsessionid=6EC2379952077D66434C74BCF3542697?&submit=Search&term={$formKeywords}', NULL, 1),
(219, 41, 'FishBase', 'The FishBase Databases contains information on over 27,000 species, over 76,000 synonyms, 137,930 common names, over 35,000 pictures, and over 30,000 references. Entries include family, order, class, English name, distribution, biology, environment, climate zone, and additional information. Entries also offer a number of links for more specific data such as synonyms, countries, key facts, pictures, FAO areas, spawning, reproduction, predators, diet composition, and more.', 'http://www.fishbase.org/home.htm', 'http://www.fishbase.org/ComNames/CommonNameSearchList.cfm?Crit1_FieldName=COMNAMES.ComName&Crit1_FieldType=CHAR&Crit1_Operator=CONTAINS&CommonName_required=Common name can not be blank&CommonName={$formKeywords}', NULL, 2),
(220, 41, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(221, 41, 'BioMed Central (Requires Registration)', 'BioMed Central publishes original, peer-reviewed research in all areas of biomedical research, with immediate, barrier-free access for all. BioMed Central is structured into journals, each of which covers a broad area of biology or medicine.', 'http://www.biomedcentral.com/', 'http://www.google.com/search?q=site%3Abiomedcentral.com+{$formKeywords}', NULL, 4),
(222, 41, 'MEDLINEplus: health information', 'MEDLINEplus presents up-to-date, quality health care information from the National Library of Medicine at the National Institutes of Health. Both health professionals and consumers can depend on MEDLINEplus for accurate, current medical information. This service provides access to extensive information about specific diseases and conditions and also has links to consumer health information from the National Institutes of Health, dictionaries, news, lists of hospitals and physicians, health information in Spanish and other languages, and clinical trials.', 'http://medlineplus.gov/', 'http://search.nlm.nih.gov/medlineplus/query?DISAMBIGUATION=true&FUNCTION=search&SERVER2=server2&SERVER1=server1&x=25&y=7&PARAMETER={$formKeywords}', NULL, 5),
(223, 41, 'PubMed', 'This is an experimental interface to several databases published by the NLM. Included are Medline and Pre-Medline, Popline, Toxline, GenBank DNA sequences, GenBank Protein Sequences, BioMolecule 3D structures, and Complete Genomes. This resource contains links to the full text of the articles when available.', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(224, 41, 'PubMed Central: an archive of life science journals', 'PubMed Central is a digital archive of life sciences journal literature managed by the National Center', 'http://www.pubmedcentral.nih.gov/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?search=Search&db=pmc&cmd=search&pmfilter_Fulltext=on&pmfilter_Relevance=on&term={$formKeywords}', NULL, 7),
(225, 42, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(226, 42, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(227, 42, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(228, 42, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(229, 43, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(230, 43, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(231, 43, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(232, 43, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(233, 43, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&amp;mode=quicksearch&amp;WISindexid1=WISall&amp;WISsearch1={$formKeywords}', 4),
(234, 44, 'Nature Biotechnology Directory', 'Nature Biotechnology Directory Website, a global information resource listing over 8,000 organizations, product and service providers in the biotechnology industry.', 'http://www.guide.nature.com/', 'http://www.biocompare.com/nature/search.asp?contentid=1&maxrecords=50&search={$formKeywords}', NULL, 0),
(235, 44, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 1),
(236, 44, ' National Library of Medicine Gateway', 'NLM Gateway allows users to search in multiple retrieval systems at the U.S. National Library of Medicine (NLM). The current Gateway searches MEDLINE/PubMed, OLDMEDLINE, LOCATORplus, MEDLINEplus, ClinicalTrials.gov, DIRLINE, Meeting Abstracts, and HSRProj. Useful to physicians, researchers, students and the general public for an overall search of NLM''s information resources.', 'http://gateway.nlm.nih.gov/gw/Cmd', 'http://gateway.nlm.nih.gov/gw/Cmd?GM2K_FORM=GMBasicSearch&enterKey=&ORBagentPort=14610&Perform_Search.x=19&Perform_Search.y=13&UserSearchText={$formKeywords}', NULL, 2),
(237, 44, 'BiologyBrowser', 'BiologyBrowser, produced by BIOSIS, is a free web site offering resources for the life sciences information community. An interactive portal designed "to connect life sciences researchers with free, useful resources and other like-minded scientists from all around the world." Includes annotated links to news and life science Web sites, a nomenclatural glossary for zoology, a zoological thesaurus, a forum for biologists and scientists to discuss findings, and more. Searchable.', 'http://www.biologybrowser.org/', 'http://www.biologybrowser.org/cgi-bin/search/hyperseek.cgi?howmuch=ALL&Terms={$formKeywords}', NULL, 3),
(238, 44, 'Bioresearch Online', 'Virtual community for the bioresearch and life sciences industry featuring daily news, product updates, discussion forums, and online chat with information on manufacturing, technology, equipment, supplies, software, and careers.', 'http://www.bioresearchonline.com/', 'http://www.bioresearchonline.com/IndustrySearch/SearchResults.aspx?TabIndex=3&keyword={$formKeywords}', NULL, 4),
(239, 44, 'Biospace', 'BioSpace is a provider of web-based resources and information to the life science industry. For 20 years BioSpace has helped to accelerate communication and discovery among business and scientific leaders in the biopharmaceutical market. With a well-established site infrastructure and loyal online audience of over 1 million unique monthly visitors, BioSpace.com offers an unparalleled distribution channel for recruitment, investment, product, event and other life science industry messages.', 'http://www.biospace.com', 'http://www.google.com/search?q=site:www.biospace.com+{$formKeywords}', NULL, 5),
(240, 45, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com/mind/+{$formKeywords}', NULL, 0),
(241, 46, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 0),
(242, 47, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(243, 47, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(244, 47, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(245, 47, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(246, 47, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(247, 47, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(248, 47, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(249, 47, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(250, 47, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(251, 48, 'Biospace', 'BioSpace is a provider of web-based resources and information to the life science industry. For 20 years BioSpace has helped to accelerate communication and discovery among business and scientific leaders in the biopharmaceutical market. With a well-established site infrastructure and loyal online audience of over 1 million unique monthly visitors, BioSpace.com offers an unparalleled distribution channel for recruitment, investment, product, event and other life science industry messages.', 'http://www.biospace.com', 'http://www.biospace.com/Default.aspx', 'ctl00$DropDownList1=News&ctl00$TextBox1={$formKeywords}', 0),
(252, 48, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 1),
(253, 48, 'The Scientist', 'The Scientist is the online resource for the printed magazine, The Scientist. Provides access to information useful to those working in or studying the life sciences.', 'http://www.the-scientist.com/', 'http://www.the-scientist.com/search/dosearch/', 'box_type=toolbar&search_restriction=all&order_by=date&search_terms={$formKeywords}', 2),
(254, 48, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 3),
(255, 48, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=TITLE_CHAR&FullText_CHAR={$formKeywords}', NULL, 4),
(256, 48, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 5),
(257, 49, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(258, 49, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(259, 49, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(260, 49, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(261, 50, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(262, 50, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(263, 50, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(264, 50, 'The Corporate Library', 'The Corporate Library is intended to serve as a central repository for research, study and critical thinking about the nature of the modern global corporation, with a special focus on corporate governance and the relationship between company management, their boards and their shareowners. Use this site to retrieve biographies for the companies in the S&P 1500 Supercomposite Index. Screen on a variety of features to identify matching directors (e.g. company name, age, attendance problems, # shares held, etc.) The site also contains research reports on trends in corporate governance.', 'http://www.thecorporatelibrary.com/', 'http://thecorporatelibrary.master.com/texis/master/search/?s=SS&q={$formKeywords}', NULL, 3),
(265, 50, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 4),
(266, 50, 'Intute: Social Sciences', 'Intute: Social Sciences is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 5),
(267, 50, 'Brint.com', 'Extensive information portal with news, analysis and links related to business, commerce, economics, information technology, and information resources.', 'http://www.brint.com/', 'http://portal.brint.com/cgi-bin/cgsearch/cgsearch.cgi?query={$formKeywords}', NULL, 6),
(268, 51, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(269, 51, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(270, 51, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(271, 51, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(272, 52, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(273, 52, 'Online Dictionary of the Social Sciences', 'Online Dictionary of the Social Sciences is a searchable dictionary of terms commonly used in the social sciences. Both phrase and keyword searches are facilitated.', 'http://bitbucket.icaap.org/', 'http://bitbucket.icaap.org/dict.pl?definition={$formKeywords}', NULL, 1),
(274, 52, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(275, 52, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(276, 52, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(277, 52, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(278, 53, 'The Corporate Library', 'The Corporate Library is intended to serve as a central repository for research, study and critical thinking about the nature of the modern global corporation, with a special focus on corporate governance and the relationship between company management, their boards and their shareowners. Use this site to retrieve biographies for the companies in the S&P 1500 Supercomposite Index. Screen on a variety of features to identify matching directors (e.g. company name, age, attendance problems, # shares held, etc.) The site also contains research reports on trends in corporate governance.', 'http://www.thecorporatelibrary.com/', 'http://thecorporatelibrary.master.com/texis/master/search/?s=SS&q={$formKeywords}', NULL, 0),
(279, 53, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 1),
(280, 53, 'Intute: Social Sciences', 'Intute: Social Sciences is  a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 2),
(281, 54, 'Brint.com', 'Extensive information portal with news, analysis and links related to business, commerce, economics, information technology, and information resources.', 'http://www.brint.com/', 'http://portal.brint.com/cgi-bin/cgsearch/cgsearch.cgi?query={$formKeywords}', NULL, 0),
(282, 54, 'SMEALSearch', 'SMEALSearch is a publicly available vertical digital library and search engine hosted at Penn State''s Smeal College of Business that focuses on academic business documents. SmealSearch crawls the web and harvests, catalogs, and indexes academic business documents. It is based on the computer and information science engine, CiteSeer, initially developed at NEC Research Institute by Kurt Bollacker, Lee Giles and Steve Lawrence. The search engine crawls websites of academia, commerce, research institutes, government agencies, etc. for academic business documents, including published articles, working papers, white papers, consulting reports, etc. For certain documents, SmealSearch only indexes and stores the hyperlinks to those documents. SMEALSearch generates a citation analysis for all the academic articles harvested and ranks them in order of their citation rates (the most cited articles are listed first) similar to the ranking of CiteSeer and the Google Scholar.', 'http://130.203.133.125/SMEALSearchAbout.html', 'http://130.203.133.125/cs?submit=Search+Documents&q={$formKeywords}', NULL, 1),
(283, 54, 'Roubini Global Economics (RGE) Montor', 'Includes daily economic analysis for individual countries, and information on emerging markets, financial markets, banking, and other topics. Contains original content and links to government and news sources. Searchable.', 'http://www.rgemonitor.com/', 'http://www.rgemonitor.com/?option=com_content&task=search&kwd={$formKeywords}', NULL, 2),
(284, 55, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(285, 55, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(286, 55, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(287, 55, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(288, 56, 'Business Week', 'Business Week''s Web site provides the full text of the current issue, plus selected articles from earlier editions. There is also a searchable archive covering three years of articles from the print magazine, although charges apply for retrieving the full articles. Other features include updated news in the Daily Briefing section and BW Plus!, offering archive articles and other content on such topics as the computer industry, women in business, and business book reviews.', 'http://www.businessweek.com/', 'http://search.businessweek.com/search97cgi/s97_cgi?action=FilterSearch&ServerKey=Primary&filter=bwfilt.hts&command=GetMenu&ResultMaxDocs=500&ResultCount=25&resulttemplate=bwarchiv.hts&querytext={$formKeywords}', NULL, 0),
(289, 56, 'businesswire.com', 'Offers company press releases, searchable by company name, industry, region, or keyword/concept. Each company''s releases are broken down by topic, i.e., earnings, management changes, mergers/acquisitions, products, etc.', 'http://www.businesswire.com/', 'http://home.businesswire.com/portal/site/home/?epi_menuItemID=e23d7f2be635f4725e0fa455c6908a0c&epi_menuID=887566059a3aedb6efaaa9e27a808a0c&epi_baseMenuID=384979e8cc48c441ef0130f5c6908a0c&searchHereRadio=false&ndmHsc=v2*A0*J2*L1*N-1002313*Z{$formKeywords}', NULL, 1),
(290, 56, 'Fortune', 'Fortune magazine''s Web site offers the full text of the print publication back to September 1995, plus links to special features like the Fortune 500, Best Cities for Business, Investor''s Guide, and others.', 'http://www.fortune.com/fortune/', 'http://search.money.cnn.com/pages/search.jsp?Coll=moneymag_xml&QuerySubmit=true&Page=1&LastQuery=&magazine=fort&QueryText={$formKeywords}', NULL, 2),
(291, 56, 'The McKinsey Quarterly', 'The McKinsey Quarterly, a unique print and online publication published by McKinsey & Company, the leading global management consultancy, has long been a trusted source of strategic thinking, industry scenarios, and real-world market analysis.', 'http://www.mckinseyquarterly.com/home.aspx', 'http://www.mckinseyquarterly.com/search_result.aspx', 'search_query={$formKeywords}', 3);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(292, 56, 'Inc.com', 'Inc.com, the website for Inc. magazine, delivers advice, tools, and services, to help business owners and CEOs start, run, and grow their businesses more successfully.  Inc. magazine archives date back to 1988 and are fully searchable. Site also features products, services, and online tools for virtually every business or management task.', 'http://www.inc.com/home/', 'http://www.inc.com/cgi-bin/finder.cgi?query={$formKeywords}', NULL, 4),
(293, 56, 'Business Finance Magazine', 'Trade magazine for finance executives. Subject areas include Budgeting & Reporting; Cost Management; Performance Management; Risk Management; E-Business; Technology & Software; more. Also includes full article archives; Webcasts; Salary Central; an events & vendor directory; Web links; Research Reports; e-Newsletters. Visitors can participate in a regularly updated slate of research projects.', 'http://www.businessfinancemag.com/', 'http://www.businessfinancemag.com/site/search/search.cfm?site=BF&qs={$formKeywords}', NULL, 5),
(294, 57, 'Free EDGAR database of corporate information', 'EDGAR, the Electronic Data Gathering, Analysis, and Retrieval system, performs automated collection, validation, indexing, acceptance, and forwarding of submissions by companies and others who are required by law to file forms with the U.S. Securities and Exchange Commission (SEC).', 'http://sec.freeedgar.com/', 'http://sec.freeedgar.com/resultsCompanies.asp?searchfrom=new&searchtype=name&x=27&y=3&searchvalue={$formKeywords}', NULL, 0),
(295, 57, 'ThomasRegister', '"Free access to: over 168,000 companies; 68,000 product and service categories; thousands of online suppliers catalogs and web site links; over 2 million line items available for secvure online ordering; and, over 1 million downloadable CAD drawings."', 'http://www.thomasregister.com/', 'http://www.thomasnet.com/prodsearch.html?cov=NA&which=prod&navsec=search&what={$formKeywords}', NULL, 1),
(296, 57, 'Microsoft Investor', 'Microsoft''s investor information page -- free. Has links to information on all of the companies that it covers.', 'http://moneycentral.msn.com/investor/home.asp', 'http://moneycentral.msn.com/money.search?q={$formKeywords}', NULL, 2),
(297, 57, 'BPubs.com', 'Business Publications Search Engine', 'http://www.bpubs.com/', 'http://www.bpubs.com/cgi/search.cgi?bool=or&query={$formKeywords}', NULL, 3),
(298, 57, 'Global Edge', 'International business information include Country Insights'' information on all countries, along with extensive links to research resources.', 'http://globaledge.msu.edu/ibrd/ibrd.asp', 'http://globaledge.msu.edu/ibrd/busresmain.asp?search=1&SearchTerms={$formKeywords}', NULL, 4),
(299, 57, 'Bond Markets Online', 'Bond Market Association, association for bond market professionals, provides information and education resources for bond market professionals that underwrite, trade and sell debt securities. Includes policy issues, advocacy, news, research and statistics for bond professionals and investors.', 'http://www.bondmarkets.com/', 'http://www.bondmarkets.com/search/search.pl?nocpp=1&Match=1&Realm=bondmarkets&sort-method=1&Terms={$formKeywords}', NULL, 5),
(300, 57, 'TaxLinks', 'A link and data aggregator focusing on tax payers and tax professionals. Its strength lies in its free databases of IRS Revenue Rulings since 1960 and Revenue Procedures since 1995. TaxLinks links up with tax sites above. Again, the content of the databases may not be totally complete, but they''re free and easily accessible from the home page.', 'http://www.taxlinks.com/', 'http://www.taxlinks.com/_vti_bin/shtml.dll/search.htm', 'VTI-GROUP=0&search={$formKeywords}', 6),
(301, 57, 'Hoover''s Online! Company Info', 'Databases of information on tens of thousands of the largest or fastest-growing public and private U.S. companies. Information provided includes company address, number of employees, key people, financial data, news items and selected Web links to company Web site, SEC filings, and current stock prices. Some information is fee-based, but quite a bit of content is still freely available.', 'http://www.hoovers.com/free/?abforward=true', 'http://www.hoovers.com/free/search/simple/xmillion/index.xhtml?page=1&which=company&query_string={$formKeywords}', NULL, 7),
(302, 58, 'H-Net Humanities and Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www.h-net.msu.edu/', 'http://www.h-net.org/logsearch/index.cgi?type=keyword&order=relevance&list=All+lists&hitlimit=25&smonth=00&syear=1989&emonth=11&eyear=2004&phrase={$formKeywords}', NULL, 0),
(303, 58, 'Intute: Social Sciences - Conferences and Events', 'Intute: Social Sciences - Conferences and Events provides search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(304, 58, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 2),
(305, 58, 'TechCalendar', 'TechCalendar is a searchable/browseable event directory, with categories such as: Internet/Online, Communications, Software & Services, Vertical Markets, Computing Platforms, and Computing Industry.', 'http://www.techweb.com/calendar/', 'http://www.tsnn.com/partner/results/results_techweb.cfm?city=&select=-1&country=-1&classid=0&Month=-1&subject={$formKeywords}', NULL, 3),
(306, 59, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(307, 59, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://www.canada.gc.ca/main_e.html', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(308, 59, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(309, 59, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/searchresults.asp?formname=frmAdvanced&keywordstype=1&month=&year=&pub=1&news=1&links=1&allsubjects=1&alldepts=1&alldoctypes=1&keywords={$formKeywords}', NULL, 3),
(310, 59, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(311, 59, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/engine/search/query.pl?action=FilterSearch&filter=europaflt.hts&Collection=fullEUROPA&ResultTemplate=europarslt_ascii.hts&ResultCount=25&ResultMaxDocs=200&DefaultLG=en&ViewTemplate=europaview.hts&QueryText={$formKeywords}', NULL, 5),
(312, 59, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(313, 59, 'Business.gov', 'Business.gov is  an online resource guide designed to provide legal and regulatory information to America''s small businesses. Entrepreneurs can use this gateway to federal, state and local information in order to quickly define their problems and find solutions on topics ranging from federal advertising laws to local zoning codes. In addition to self-help articles, interactive guides, and the ability to complete transactions on line such as applying for a Federal EIN, the site also connects users with sources of in-person help from government officials, attorneys and business counselors in their local area.', 'http://www.business.gov/', 'http://www.business.gov:80/appmanager/bg/main?_nfpb=true&_windowLabel=T209963971174660224846&_urlType=action&_pageLabel=bg_page_home&siteId=&view=search=fromSearchBox=1&numHitsPerPage=10&query={$formKeywords}', NULL, 7),
(314, 59, 'Organization for Economic Co-operation and Development', 'The OECD groups 30 member countries sharing a commitment to democratic government and the market economy. With active relationships with some 70 other countries, NGOs and civil society, it has a global reach. Best known for its publications and its statistics, its work covers economic and social issues from macroeconomics, to trade, education, development and science and innovation.', 'http://www.oecd.org/', 'http://www.oecd.org/searchResult/0,2665,en_2649_201185_1_1_1_1_1,00.html?fpSearchExact=3&fpSearchText={$formKeywords}', NULL, 8),
(315, 59, 'E-Commerce Information from the European Union', 'Statistics, research, and discussion lists.', 'http://europa.eu.int/information_society/ecowor/ebusiness/index_en.htm', 'http://europa.eu.int/geninfo/query/engine/search/query.pl?action=FilterSearch&filter=europaflt.hts&collection=fullEUROPA&ResultTemplate=europarslt_ascii.hts&ResultCount=25&ResultMaxDocs=200&DefaultLG=en&ViewTemplate=europaview.hts&QueryText={$formKeywords}', NULL, 9),
(316, 59, 'Country Studies: Area Handbook Series', 'From the Library of Congress, this site provides extensive information on foreign countries.  The Country Studies Series presents a description and analysis of the historical setting and the social, economic, political, and national security systems and institutions of countries throughout the world.', 'http://lcweb2.loc.gov/frd/cs/cshome.html', 'http://search.loc.gov:8765/query.html?col=loc&qp=url%3A%2Frr%2Ffrd%2F&submit.x=11&submit.y=9&qt={$formKeywords}', NULL, 10),
(317, 59, 'Strategis', 'This site was developed by Industry Canada and provides a searchable database of Canadian companies, business information for each sector, a list of business support services, and a guide to business laws and regulations.  Trade Data Online provides Canadian and US trade data.', 'http://strategis.ic.gc.ca/engdoc/main.html', 'http://strategis.ic.gc.ca/cio/search-recherche/search.do?language=eng&V_SEARCH.command=search&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.date.modified&searchCriteriaArray%28V_SEARCH__returnedField%29=site_product_code&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.description&searchCriteriaArray%28V_SEARCH__returnedField%29=description&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.type&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.creator&searchCriteriaArray%28V_SEARCH__returnedField%29=vdksummary&searchCriteria%28V_SEARCH__charMap%29=8859&searchCriteria%28V_SEARCH__resultsJSP%29=%2FsiteResults.do&searchCriteria%28V_SEARCH__customSearchJSP%29=%2FcustomSearch.do&searchCriteria%28V_SEARCH__documentJSP%29=%2Fdocument.do&searchCriteria%28V_SEARCH__locale%29=en_CA&searchCriteria%28V_SEARCH__baseURL%29=search.do&searchCriteria%28V_CUSTOM__searchWithin%29=false&searchCriteria%28V_CUSTOM__collection%29=industry&searchCriteria%28V_CUSTOM__details%29=show&searchCriteria%28V_SEARCH__sortSpec%29=score+desc&searchCriteria%28V_CUSTOM__operator%29=AND&searchCriteria%28V_CUSTOM__column%29=FULLTEXT&searchCriteria%28V_CUSTOM__userInput%29={$formKeywords}', NULL, 11),
(318, 59, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www-fed-all&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=5&y=16&mw0={$formKeywords}', NULL, 12),
(319, 59, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 13),
(320, 59, 'THOMAS: Legislative Information on the Internet', 'Through Thomas, the Library of Congress offers the text of bills in the United States Congress, the full text of the Congressional Record, House and Senate committee reports, and historical documents.', 'http://thomas.loc.gov/', 'http://thomas.loc.gov/cgi-bin/thomas', 'congress=109&database=text&MaxDocs=1000&querytype=phrase&Search=SEARCH&query={$formKeywords}', 14),
(321, 60, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(322, 60, 'Businesswire', 'Offers company press releases, searchable by company name, industry, region, or keyword/concept. Each company''s releases are broken down by topic, i.e., earnings, management changes, mergers/acquisitions, products, etc.', 'http://www.businesswire.com/', 'http://home.businesswire.com/portal/site/home/?epi_menuItemID=e23d7f2be635f4725e0fa455c6908a0c&epi_menuID=887566059a3aedb6efaaa9e27a808a0c&epi_baseMenuID=384979e8cc48c441ef0130f5c6908a0c&searchHereRadio=false&ndmHsc=v2*A0*J2*L1*N-1002313*Z{$formKeywords}', NULL, 1),
(323, 60, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 2),
(324, 60, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(325, 60, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 4),
(326, 60, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(327, 60, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 6),
(328, 60, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(329, 60, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(330, 60, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(331, 60, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 10),
(332, 60, 'CNN Finance', 'Headline financial news and markets: keep up with what''s going on in the world of finance.', 'http://cnnfn.com/', 'http://search.money.cnn.com/pages/search.jsp?QueryText={$formKeywords}', NULL, 11),
(333, 60, 'Nikkei Business Publications Asia', 'Japan BizTech is a source for technology and business news from Japan and Asia developed by Nikkei Business Publications. It covers the latest news and research breakthroughs in the communications, electronics and computer industries in Japan and other Asian countries. An online directory for technology and business contacts throughout Asia in banking, communications, transport equipment and wholesale is available at the site.', 'http://neasia.nikkeibp.com/', 'http://neasia.nikkeibp.com/cgi-bin/search.pl?stype=&lang=eng&b=1&t=1&u=0&alt=1&l=0&default=1&d=0&k=0&au=0&terms={$formKeywords}', NULL, 12),
(334, 61, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(335, 61, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(336, 61, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(337, 61, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(338, 62, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(339, 62, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(340, 62, 'OAIster (Open Archives Initaitive research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(341, 62, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(342, 62, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(343, 62, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'app=allGRAYLIT&INTERFACE=1WINDOW&FORM=/DistributedSearch.html&$$AUTHOR=&$$QTITLE=&$$SUBJECT=&$$ABSTRACT=&$$START_YEAR=&$$END_YEAR=&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&COLLECTION=nepis&MAXDOCS=50&QUERY={$formKeywords}', 5),
(344, 62, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of\nreferences to more than 11 million articles published in 4300 biomedical\njournals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(345, 63, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(346, 63, 'General Chemistry Online: Glossary', 'Searchable and browsable by topic or letter. Part of General Chemistry Online.', 'http://antoine.frostburg.edu/chem/senese/101/glossary.shtml', 'http://antoine.frostburg.edu/cgi-bin/senese/searchglossary.cgi?shtml=%2Fchem%2Fsenese%2F101%2Fglossary.shtml&query={$formKeywords}', NULL, 1),
(347, 63, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(348, 63, 'NIST Chemistry WebBook', 'This site provides thermochemical, thermophysical, and ion energetics data \ncompiled by NIST under the Standard Reference Data Program.', 'http://webbook.nist.gov/chemistry/', 'http://webbook.nist.gov/cgi/cbook.cgi?Units=SI&Name={$formKeywords}', NULL, 3),
(349, 63, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(350, 63, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(351, 63, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(352, 64, 'chemdex.org', 'Searchable directory of more than 7,000 chemistry related\nsites. Includes general chemistry, organizations, Web portals, biography,\nsoftware, standards, and more. Users may rate and review sites. Some features\nrequire free registration. Based at the Department of Chemistry, University of\nSheffield, England.', 'http://www.chemdex.org/', 'http://www.chemdex.org/action.php?action=search', 'current_cat_id=&table=link&form_input_search_keyword={$formKeywords}', 0),
(353, 64, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(354, 64, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 2),
(355, 64, 'Eric Weisstein''s World of Science--Chemistry', 'Includes extensive encyclopedias of astronomy, chemistry, mathematics, physics, and scientific biography. Entries include definitions, diagrams, formulas, cross-references, and related resources. Searchable, and browsable alphabetically or by topic. Also has a "random entry" feature. The author is a scientist with advanced degrees in physics and planetary science.', 'http://scienceworld.wolfram.com/chemistry/', 'http://scienceworld.wolfram.com/search/index.cgi?sitesearch=scienceworld.wolfram.com%2Fchemistry&q={$formKeywords}', NULL, 3),
(356, 64, 'General Chemistry Online', 'An introduction that includes hyperlinked notes, guides,\nand articles for first semester chemistry. There is a glossary, FAQs and a\ntrivia quiz. The Toolbox provides interactive graphing, a pop-up periodic table,\nand calculators. Additionally, Tutorials contains self-guided tutorials,\nquizzes, and drills on specific topics. There is one database of 800 common\ncompound names, formulas, structures, and properties, and another for over 400\nannotated Web sites. From a chemistry professor at Frostburg State University,\nMaryland. Searchable.', 'http://antoine.frostburg.edu/chem/senese/101/', 'http://marie.frostburg.edu/cgi-bin/htsearch?method=and&config=htdig&restrict=101&exclude=print-&format=builtin-long&sort=score&words={$formKeywords}', NULL, 4),
(357, 64, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 5),
(358, 64, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of\nreferences to more than 11 million articles published in 4300 biomedical\njournals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(359, 64, 'TOXNET', 'TOXNET provides a searchable collection of databases on toxicology, hazardous chemicals, and related areas.', 'http://toxnet.nlm.nih.gov/', 'http://toxnet.nlm.nih.gov/cgi-bin/sis/search', 'submit2=&amp;basicsearch=/cgi-bin/sis/htmlgen?index.html&revisesearch=/home/httpd/htdocs/index.html&revisesearch=/home/httpd/htdocs/html/index.html&second_search=1&chemsyn=1&database=toxline&database=dart&database=hsdb&database=iris&database=iter&database=genetox&database=ccris&database=tri2003&database=chemid&database=hpd&database=hazmap&Stemming=1&and=1&xfile=1&queryxxx={$formKeywords}', 7),
(360, 65, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(361, 65, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(362, 65, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(363, 65, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(364, 66, 'ChemFinder (Requires Registration)', 'This site enabling searching of the CS database by chemical name, CAS Number, molecular formula, or molecular weight. Also provides links to many chemical information web sites.', 'http://chemfinder.cambridgesoft.com/', 'http://chemfinder.cambridgesoft.com/result.asp?polyQuery={$formKeywords}', NULL, 0),
(365, 66, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 1),
(366, 66, 'Chemistry.Org', 'chemistry.org is the online gateway to ACS resources, products, and services for members, chemists, scientists, chemical industry professionals, educators, students, children and science enthusiasts.', 'https://portal.chemistry.org/portal/acs/corg/memberapp', 'http://google.acs.org/search?site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q={$formKeywords}', NULL, 2),
(367, 66, 'Hazardous Chemical Databases', 'This database, created at the University of Akron, will allow the user to retrieve information for any of 23,495 hazardous chemicals or ''generic'' entries based on a keyword search.', 'http://ull.chemistry.uakron.edu/erd/', 'http://ull.chemistry.uakron.edu/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=DEFAULT&restrict=&exclude=&words={$formKeywords}', NULL, 3),
(368, 67, 'ChemCenter', 'This is a pooling of Web resources from the American Chemical Society and Chemical Abstracts Service, including STNEasy, the ACS Graduate School Finder, Chemcyclopedia and more. It will eventually feature unique resources as well.', 'http://www.chemistry.org/portal/a/c/s/1/home.html', 'http://google.acs.org/search?by=&site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q={$formKeywords}', NULL, 0),
(369, 68, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(370, 68, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(371, 68, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(372, 68, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(373, 68, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(374, 69, 'chemistry.org Meeting Locator', 'chemistry.orgâ€™s Meeting Locator will allow you to find details about meetings, workshops, short courses, and symposia of interest to practitioners of the chemical-related sciences.', 'http://acswebapplications.acs.org/applications/meetinglocator/home.cfm', 'http://google.acs.org/search?site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q=meetings+{$formKeywords}', NULL, 0),
(375, 69, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+', NULL, 1),
(376, 69, 'All Conferences Directory', 'All Conferences Directory is a searchable database of Computer Science and Technology conferences that organizes conferences by category and offers information regarding paper submission deadlines.', 'http://all-conferences.com/Computers/', 'http://www.allconferences.com/Search/output.php?Title={$formKeywords}', NULL, 2),
(377, 70, 'General Chemistry Online', 'An introduction that includes hyperlinked notes, guides,\nand articles for first semester chemistry. There is a glossary, FAQs and a\ntrivia quiz. The Toolbox provides interactive graphing, a pop-up periodic table,\nand calculators. Additionally, Tutorials contains self-guided tutorials,\nquizzes, and drills on specific topics. There is one database of 800 common\ncompound names, formulas, structures, and properties, and another for over 400\nannotated Web sites. From a chemistry professor at Frostburg State University,\nMaryland. Searchable.', 'http://antoine.frostburg.edu/chem/senese/101/', 'http://marie.frostburg.edu/cgi-bin/htsearch?method=and&config=htdig&restrict=101&exclude=print-&format=builtin-long&sort=score&words={$formKeywords}', NULL, 0),
(378, 70, 'Science Learning Network', 'Science Learning Network is a community of educators, students, schools, science museums, and other institutions demonstrating a new model for inquiry into. Contains a variety of inquiry-posed problems, information, demonstrations, and labs.', 'http://www.sln.org/', 'http://192.231.162.154:8080/query.html?col=first&ht=0&qp=&qs=&qc=&pw=600&ws=1&la=&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&si=0&qt={$formKeywords}', NULL, 1),
(379, 70, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 2),
(380, 71, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(381, 71, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as \n\nprovincial, territorial and municipal governments. There is a Departments and Agencies link, and \n\nthe A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which \n\noutlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian \n\nGovernment, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together \n\ninformation from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(382, 71, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(383, 71, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(384, 71, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(385, 71, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(386, 71, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(387, 71, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(388, 71, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(389, 72, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(390, 72, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/news/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(391, 72, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(392, 72, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(393, 72, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 4),
(394, 73, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(395, 73, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(396, 73, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(397, 73, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(398, 74, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(399, 74, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(400, 74, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(401, 74, 'Behavior and Brain Sciences', 'Behavior and Brain Sciences is running on eprints.org open archive software, a freely distributable archive system available from eprints.org.', 'http://www.bbsonline.org/perl/search', 'http://www.bbsonline.org/perl/search?title_abstract_keywords_srchtype=all&authors_srchtype=all&year=&_satisfyall=ALL&_order=order0&submit=Search&.cgifields=publication&title_abstract_keywords=&authors={$formKeywords}', NULL, 3),
(402, 74, 'CogPrints', 'CogPrints is an electronic archive for papers in any area of Psychology, Neuroscience, and Linguistics, and many areas of Computer Science and Biology, which uses the self-archiving software of eprints.org. This archive can be searched by author, title or keyword. Both preprints and published refereed articles are included, with full contact details for each author.', 'http://cogprints.soton.ac.uk/', 'http://cogprints.ecs.soton.ac.uk/perl/search/simple?meta=&meta_merge=ALL&full=&full_merge=ALL&person_merge=ALL&date=&_satisfyall=ALL&_order=bytitle&_action_search=Search&person={$formKeywords}', NULL, 4),
(403, 74, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 5),
(404, 74, 'Medline', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4,300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(405, 75, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(406, 75, 'Dictionary of Philosophy of Mind', 'Dictionary of Philosophy of Mind is a searchable database of peer-reviewed articles on concepts and individuals in the field of philosophy.', 'http://www.artsci.wustl.edu/~philos/MindDict/', 'http://search.yahoo.com/search?vp=dictionary&vs=artsci.wustl.edu&va={$formKeywords}', NULL, 1),
(407, 75, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(408, 75, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(409, 75, 'Wordnet', 'Wordnet is an online lexical reference system whose design is inspired by current psycholinguistic theories of human lexical memory. English nouns, verbs, adjectives and adverbs are organized into synonym sets, each representing one underlying lexical concept. Different relations link the synonym sets.', 'http://wordnet.princeton.edu', 'http://wordnet.princeton.edu/perl/webwn?sub=Search+WordNet&o2=&o0=1&o7=&o5=&o1=1&o6=&o4=&o3=&h=&s={$formKeywords}', NULL, 4),
(410, 75, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(411, 75, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(412, 76, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(413, 76, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(414, 76, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(415, 76, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(416, 77, 'Stanford Encyclopedia of Philosophy', 'The Stanford Encyclopedia of Philosophy is a dynamic reference work that has been rapidly growing.  The goal of this project is  to produce an authoritative and comprehensive dynamic reference work devoted to the academic discipline of philosophy that will be kept up to date dynamically so as to remain useful to those in academia and the general public.', 'http://plato.stanford.edu/about.html', 'http://plato.stanford.edu/cgi-bin/webglimpse.cgi?ID=1&nonascii=on&maxfiles=50&maxlines=30&maxchars=10000&query={$formKeywords}', NULL, 0),
(417, 77, 'MITECS: The MIT Encyclopedia of the Cognitive Sciences', 'MITECS: The MIT Encyclopedia of the Cognitive Sciences is a free online access to abstracts, bibliographies, and links from this comprehensive reference work. (To read the full-length entries you have to pay.)', 'http://cognet.mit.edu/library/erefs/mitecs/', 'http://gb-server.mit.edu/search?btnG=Search&site=mit&client=mit&proxyreload=1&proxystylesheet=http%3A%2F%2Fcognet.mit.edu%2Fgoogle-mithome.xsl&output=xml_no_dtd&as_dt=i&as_sitesearch=cognet.mit.edu&q={$formKeywords}', NULL, 1),
(418, 78, 'Institut des Sciences Cognitives', 'The National Center for Scientific Research in France promoting study of cognition, especially in humans. Many of the working papers and links to other websites are in English.', 'http://www.isc.cnrs.fr/index_en.htm', 'http://www.google.com/custom?cof=T%3Ablack%3BLW%3A118%3BALC%3Ared%3BL%3Ahttp%3A%2F%2Fwww.isc.cnrs.fr%2Flogoisc.gif%3BLC%3Ablue%3BLH%3A76%3BBGC%3Awhite%3BAH%3Acenter%3BVLC%3Apurple%3BAWFID%3Abbb9fffe574108ac%3B&domains=www.isc.cnrs.fr&sitesearch=www.isc.cnrs.fr&q={$formKeywords}', NULL, 0),
(419, 78, 'The Encyclopedia of Psychology', 'The Encyclopedia of Psychology is intended to facilitate browsing in any area of psychology.', 'http://www.psychology.org/', 'http://www.psychology.org/cgi-bin/links2/search.cgi?query={$formKeywords}', NULL, 1),
(420, 78, 'Enpsychlopedia', 'Enpsychlopedia - Provides a search of psychcentral and several other mental health sites. You can access every time you want Provides a search of psychcentral and several other mental health sites. ', 'http://www.enpsychlopedia.com/', 'http://www.enpsychlopedia.com/index.php?subber=&site=&qq={$formKeywords}', NULL, 2),
(421, 78, 'CogWeb', 'CogWeb is a research tool for exploring the relevance of the study of human cognition to communication and the arts. It is edited by Francis Steen, assistant professor in Communication Studies at UCLA. CogWeb contains several hundred items and is continually under construction.', 'http://cogweb.ucla.edu/', 'http://search.atomz.com/search/?sp-advanced=1&sp-w-control=1&sp-a=00070a1a-sp00000000&sp-c=100&sp-p=any&sp-q={$formKeywords}', NULL, 3),
(422, 78, 'Behavior and Brain Sciences', 'Behavior and Brain Sciences is running on eprints.org open archive software, a freely distributable archive system available from eprints.org.', 'http://www.bbsonline.org/perl/search', 'http://www.bbsonline.org/perl/search?title_abstract_keywords_srchtype=all&authors=&authors_srchtype=all&year=&_satisfyall=ALL&_order=order0&submit=Search&.cgifields=publication&title_abstract_keywords={$formKeywords}', NULL, 4),
(423, 78, 'CogPrints', 'CogPrints is an electronic archive for papers in any area of Psychology, Neuroscience, and Linguistics, and many areas of Computer Science and Biology, which uses the self-archiving software of eprints.org. This archive can be searched by author, title or keyword. Both preprints and published refereed articles are included, with full contact details for each author.', 'http://cogprints.soton.ac.uk/', 'http://cogprints.ecs.soton.ac.uk/perl/search/simple?meta=&meta_merge=ALL&full_merge=ALL&person=&person_merge=ALL&date=&_satisfyall=ALL&_order=bytitle&_action_search=Search&full={$formKeywords}', NULL, 5),
(424, 78, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&author1=&src=ml&disp_type=&fulltext={$formKeywords}', NULL, 6),
(425, 78, 'Medline', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4,300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 7),
(426, 78, 'Psycoloquy', 'An Open Archive of refereed reprints of all target articles, commentaries and responses from Psycoloquy, a peer-reviewed journal of Open Peer Commentary, sponsored by the American Psychological Association, indexed in PsycINFO, and published since 1990 (Archive is complete)', 'http://psycprints.ecs.soton.ac.uk/', 'http://psycprints.ecs.soton.ac.uk/perl/search?_order=bytitle&abstract%2Fkeywords%2Ftitle_srchtype=ALL&_satisfyall=ALL&abstract%2Fkeywords%2Ftitle={$formKeywords}', NULL, 8),
(427, 79, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(428, 79, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(429, 79, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(430, 79, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(431, 79, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(432, 80, 'COGSCI Cognitive Science Discussion List', 'COGSCI Cognitive Science Discussion List is a website for the International Cognitive Science Discussion List.', 'http://cogsci.weenink.com/', 'https://listserv.surfnet.nl/scripts/wa.exe?S2=COGSCI&0=S&s=&f=&a=&I=-3&q={$formKeywords}', NULL, 0),
(433, 80, 'Intute: Social Sciences - Conferences and Events', 'Intute: Social Sciences - Conferences and Events provides search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(434, 80, 'Medical Conferences.com', 'Medical Conferences.com is the Internet''s leading conference portal for medical and health-care professionals along with the associated supporting business community. This searchable database of over 7,000 medical conferences and CME events is an invaluable resource for all healthcare professionals.', 'http://www.medicalconferences.com/', 'http://www.medicalconferences.com/scripts/search_partner.pl?PID=234523&L=&Q_DATE_STARTD=-&Q_DATE_STARTM=-&Q_DATE_STARTY=-&Q_DATE_ENDD=-&Q_DATE_ENDM=-&Q_DATE_ENDY=-&x=4&y=11&&K={$formKeywords}', NULL, 2),
(435, 81, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(436, 82, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 0),
(437, 83, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(438, 83, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. In addition to Department web sites, the government has been creating Portals which bring together \ninformation from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(439, 83, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(440, 83, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(441, 83, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(442, 83, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(443, 83, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(444, 83, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(445, 83, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(446, 84, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(447, 84, 'The Scientist', 'The Scientist is the online resource for the printed magazine, The Scientist, and provides access to information useful to those working in or studying the life sciences.', 'http://www.the-scientist.com/', 'http://www.the-scientist.com/search/dosearch/', 'box_type=toolbar&search_restriction=all&order_by=date&search_terms={$formKeywords}', 1),
(448, 84, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 2),
(449, 84, 'Newsdirectory', 'Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 3),
(450, 85, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(451, 85, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(452, 85, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(453, 85, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(454, 86, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(455, 86, 'Collection of Computer Science Bibliographies', 'Contains about 1,200 bibliographies with over 1 million references, including over 100,000 web links to the full text of the article.', 'http://liinwww.ira.uka.de/bibliography/index.html#about', 'http://liinwww.ira.uka.de/csbib?online=&maxnum=200&sort=year&query={$formKeywords}', NULL, 1),
(456, 86, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(457, 86, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(458, 86, 'NCSTRL', 'NCSTRL is an international collection of computer science research reports and papers made available for non-commercial use from a number of participating institutions and archives. NCSTRL provides access to over 20,000 technical reports in computer science.', 'http://www.ncstrl.org:8900/ncstrl/index.html', 'http://www.ncstrl.org:8900/ncstrl/servlet/search?formname=simple&group=archive&sort=rank&fulltext={$formKeywords}', NULL, 4),
(459, 86, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 5),
(460, 86, 'arXiv.org', 'ArXiv is an e-print service in the fields of physics, mathematics, non-linear science and computer science.', 'http://arxiv.org/', 'http://arxiv.org/search?searchtype=all&query={$formKeywords}', NULL, 6),
(461, 86, 'devx', 'devx provides full text of more than 100,000 indexed and searchable articles, reviews, and more.', 'http://www.devx.com/', 'http://www.google.com/custom?cof=T%3A%23000000%3BLW%3A70%3BBIMG%3Ahttp%3A%2F%2Fwww.devxcom%2Fimages%2Fredesign%2Fbackground2.gif%3BALC%3A%23000099%3BL%3Ahttp%3A%2F%2Fwww.devx.com%2Fimages%2Fredesign%2Fnewlogosm2.gif%3BLC%3A%23000099%3BLH%3A70%3BBGC%3AFAFAE6%3BAH%3Aleft%3BVLC%3A%23000099%3BGL%3A0%3BAWFID%3Aaf259f950e64cb71%3B&domains=devx.com%3Bprojectcool.com%3Bvb2themax.com&sitesearch=devx.com&sa.x=16&sa.y=25&q={$formKeywords}', NULL, 7),
(462, 86, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 8),
(463, 87, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(464, 87, 'Webopedia', 'Webopedia is an online dictionary with definitions of technical terms related to computers and the Internet.', 'http://www.webopedia.com/', 'http://search.internet.com/www.webopedia.com?IC_QueryDatabases=www.webopedia.com&IC_QueryText={$formKeywords}', NULL, 1),
(465, 87, 'WhatIs.com', 'WhatIs.com is an online encyclopedia of information technology terms.', 'http://whatis.techtarget.com/', 'http://whatis.techtarget.com/wsearchResults/1,290214,sid9,00.html?query={$formKeywords}', NULL, 2),
(466, 87, 'Free On-Line Dictionary of Computing', 'FOLDOC is a searchable dictionary of acronyms, jargon, programming languages, tools, architecture, operating systems, networking, theory, conventions, standards, mathematics, telecoms, electronics, institutions, companies, projects, products, and history related to computing.', 'http://foldoc.org/', 'http://foldoc.org/{$formKeywords}', NULL, 3),
(467, 87, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 4),
(468, 87, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 5),
(469, 87, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 6),
(470, 87, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 7),
(471, 88, 'arXiv.org', 'ArXiv is an e-print service in the fields of physics, mathematics, non-linear science and computer science.', 'http://arxiv.org/', 'http://arxiv.org/search?searchtype=all&query={$formKeywords}', NULL, 0),
(472, 88, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 1),
(473, 88, 'Collection of Computer Science Bibliographies', 'Contains about 1,200 bibliographies with over 1 million references, including over 100,000 web links to the full text of the article.', 'http://liinwww.ira.uka.de/bibliography/index.html#about', 'http://liinwww.ira.uka.de/csbib?online=&maxnum=200&sort=year&query={$formKeywords}', NULL, 2),
(474, 88, 'NCSTRL', 'NCSTRL is an international collection of computer science research reports and papers made available for non-commercial use from a number of participating institutions and archives. NCSTRL provides access to over 20,000 technical reports in computer science.', 'http://www.ncstrl.org:8900/ncstrl/index.html', 'http://www.ncstrl.org:8900/ncstrl/servlet/search?formname=simple&group=archive&sort=rank&fulltext={$formKeywords}', NULL, 3),
(475, 88, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 4),
(476, 88, 'devx', 'devx provides full text of more than 100,000 indexed and searchable articles, reviews, and more.', 'http://www.devx.com/', 'http://www.google.com/custom?cof=T%3A%23000000%3BLW%3A70%3BBIMG%3Ahttp%3A%2F%2Fwww.devxcom%2Fimages%2Fredesign%2Fbackground2.gif%3BALC%3A%23000099%3BL%3Ahttp%3A%2F%2Fwww.devx.com%2Fimages%2Fredesign%2Fnewlogosm2.gif%3BLC%3A%23000099%3BLH%3A70%3BBGC%3AFAFAE6%3BAH%3Aleft%3BVLC%3A%23000099%3BGL%3A0%3BAWFID%3Aaf259f950e64cb71%3B&domains=devx.com%3Bprojectcool.com%3Bvb2themax.com&sitesearch=devx.com&sa.x=16&sa.y=25&q={$formKeywords}', NULL, 5),
(477, 88, 'HCI Bibliography: : Human-Computer Interaction Resources', 'The HCI Bibliography (HCIBIB) is a free-access bibliography on Human-Computer Interaction, with over 28,5000 records in a searchable database.', 'http://www.hcibib.org/', 'http://www.hcibib.org/gs.cgi?highlight=checked&action=Search&terms={$formKeywords}', NULL, 6),
(478, 89, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(479, 89, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(480, 89, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(481, 89, 'O''Reilly Search', 'Search for books, articles, weblogs, conferences, and other resources published or maintained by O''Reilly & Associates, world-renowned publishers.', 'http://www.oreillynet.com/search/', 'http://catsearch.atomz.com/search/catsearch/?sp-a=sp1000a5a9&sp-f=ISO-8859-1&sp-t=cat_search&sp-advanced=1&sp-p=any&sp-d=custom&sp-date-range=-1&sp-q-1=&sp-x-1=collection&sp-c=10&sp-m=1&sp-s=0&sp-q={$formKeywords}', NULL, 3),
(482, 89, 'Safari Tech Books Online', 'O''Reilly''s online technical reference library.', 'http://safari.oreilly.com', 'http://safari.oreilly.com/search?_formName=searchForm&searchlistbox=Entire Site&searchtextbox={$formKeywords}', NULL, 4),
(483, 89, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 5),
(484, 90, 'Collection of Computer Science Bibliographies', 'Collection of Computer Science Bibliographies - A searchable collection of bibliographies from various sources, covering most aspects of computer science. Access references to journal articles, conference papers, & technical reports. The collection currently contains more than 2 millions of references (mostly to journal articles, conference papers and technical reports), clustered in about 1500 bibliographies, and consists of more than 2.3 GBytes (530MB gzipped) of BibTeX entries. More than 600 000 references contain cross references to citing or cited publications. More than 1 million of references contain URLs to an online version of the paper. Abstracts are available for more than 800 000 entries. There are more than 2000 links to other sites carrying bibliographic information.', 'http://liinwww.ira.uka.de/bibliography/index.html', 'http://liinwww.ira.uka.de/mpsbib?field=&year=&sincd=&before=&results=citation&maxnum=40&online=on&query={$formKeywords}', NULL, 0),
(485, 90, 'Engineering E-journal Search Engine (EESE)', 'The Engineering E-journal Search Engine (EESE) searches the full text of over 100 free and full text engineering e-Journals.', 'http://www.eevl.ac.uk/eese/index.html', 'http://www.eevl.ac.uk/eevl-cross-results.htm?tab=all&eevl_sect=eevl&exact=on&method=All&searchst={$formKeywords}', NULL, 1),
(486, 90, 'CompuScience', '"CompuScience" is a bibliographic database covering literature in the field of computer science and computer technology. Dating back to 1936, the database comprises about 656.378 citations.  CompuScience is integrated in io-port.net, the portal for computer science in Germany and Europe.  CompuScience contains the abstracts of the ACM Computing Reviews and the Computer Science Section of Zentralblatt fÃ¼r Mathematik (MATH database) and the abstracts of over 95 selected journals in this area. Citations contain bibliographic information and indexing terms. Many records also include an abstract. Most citations are classified according to the Computing Reviews Classification Scheme of ACM.', 'http://www.fiz-informationsdienste.de/en/DB/compusci/index.html', 'http://www.io-port.net/ioport2004/singlefieldSearch.do?feld1=fulltext&eingabe2=&eingabe3=&eingabe4=&eingabe5=&sortierung=jahr&query=&Abschicken=Suchen&eingabe1={$formKeywords}', NULL, 2),
(487, 91, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(488, 91, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(489, 91, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(490, 91, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(491, 92, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(492, 93, 'Canadian Patents Database', 'Canadian Patent Database lets you access over 75 years of patent descriptions and images. You can search, retrieve and study more than 1,500,000 patent documents', 'http://patents1.ic.gc.ca/intro-e.html', 'http://patents1.ic.gc.ca/fcgi-bin/patquery_eo_el?-t=_&-l=ibm.html&-m=50&-c=/cpoti/prod/verity/coll/cpd&ERROR_MSG=Query failed with rc =&GENERAL={$formKeywords}', NULL, 0),
(493, 93, 'Europe''s Network of Patent Databases (Esp@cenet)', 'Europe''s Network of Patent Databases (Esp@cenet) is a free service for accessing patent information. Four database files may be searched: (1)European Patents (most recent 24 months, with PDF files); (2) PCT(WO) patents (most recent 24 months, with PDF files); (3) worldwide patents (coverage depends on country, mostly back to 1960s or 1970s); and (4) Japanese patents (1976-present). Since 1970, each patent family in the collection has a representative document with a searchable English-language title and abstract.', 'http://ep.espacenet.com', 'http://v3.espacenet.com/results?AB=fiber&sf=q&FIRST=1&CY=ep&LG=en&DB=EPODOC&st=AB&Submit=SEARCH&=&=&=&=&=&kw={$formKeywords}', NULL, 1),
(494, 93, 'USPTO', 'USPTO databases cover the period from 1 January 1976 to the most recent weekly issue date (usually each Tuesday). Also has the ability to order patents within this system.', 'http://www.uspto.gov/', 'http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-bool.html&r=0&f=S&l=50&FIELD1=&co1=AND&TERM2=&FIELD2=&d=ptxt&TERM1={$formKeywords}', NULL, 2),
(495, 94, 'The International Organization for Standardization (ISO)', 'The International Organization for Standardization (ISO) is a worldwide federation of national standards bodies from some 140 countries. ISO''s work has resulted in some 12,000 International Standards, representing more than 300,000 pages in English and French.', 'http://www.iso.ch/iso/en/CatalogueListPage.CatalogueList', 'http://www.iso.ch/iso/en/CombinedQueryResult.CombinedQueryResult?queryString={$formKeywords}', NULL, 0),
(496, 94, 'Request For Comments (RFCs)', 'The Requests for Comments (RFC) document series is a set of technical and organizational notes about the Internet (originally the ARPANET), beginning in 1969. Memos in the RFC series discuss many aspects of computer networking, including protocols, procedures, programs, and concepts, as well as meeting notes, opinions, and sometimes humor.', 'http://www.rfc-editor.org/rfcsearch.html', 'http://www.rfc-editor.org/cgi-bin/rfcsearch.pl?opt=All+Fields&num=25&filefmt=txt&search_doc=search_all&match_method=prefix&sort_method=newer&abstract=absoff&keywords=keyoff&format=ftp&searchwords={$formKeywords}', NULL, 1),
(497, 94, 'XML.com', 'An exhaustive site on all things XML (Extensible Markup Language), from schemas and style to the Semantic Web. Largely oriented toward power users, but includes useful FAQs for newcomers. Searchable. From the O''Reilly & Associates publishing house. ', 'http://www.xml.com/', 'http://search.atomz.com/search/?sp-a=sp1000a5a9&sp-f=ISO-8859-1&sp-t=cat_search&sp-x-1=collection&sp-q-1=xml&sp-q={$formKeywords}', NULL, 2),
(498, 95, 'All Conferences Directory', 'All Conferences Directory is a searchable database of Computer Science and Technology conferences that organizes conferences by category and offers information regarding paper submission deadlines.', 'http://all-conferences.com/Computers/', 'http://www.allconferences.com/Search/search.php3?Search={$formKeywords}', NULL, 0),
(499, 95, 'DB and LP: Conferences and Workshops', 'DB and LP: Conferences and Workshops contains a list of computer science conferences and Workshops: past, present and future.', 'http://www.informatik.uni-trier.de/~ley/db/conf/index.a.html', 'http://www.google.com/search?hl=en&lr=&q=site%3Awww.informatik.uni-trier.de%2F+conf+{$formKeywords}', NULL, 1),
(500, 95, 'Netlib Conferences Databases', 'The Netlib Conferences Databases contains information about upcoming conferences, lectures, and other meetings relevant to the fields of mathematics and computer science.', 'http://www.netlib.org/confdb/confsearch.html', 'http://netlib2.cs.utk.edu/cgi-bin/csearch/confdisp.pl?ip_address=160.36.58.108&ip_name=netlib-old.cs.utk.edu&tcp_port=8123&database_name=%2Fusr%2Flocal%2Fwais%2Findexes%2Fconfdb&search_term={$formKeywords}', NULL, 2),
(501, 95, 'TechCalendar', 'TechCalendar is a searchable/browseable event directory, with categories such as: Internet/Online, Communications, Software & Services, Vertical Markets, Computing Platforms, and Computing Industry.', 'http://www.techweb.com/calendar/', 'http://www.tsnn.com/partner/results/results_techweb.cfm?city=&select=-1&country=-1&classid=120&Month=-1&subject={$formKeywords}', NULL, 3),
(502, 96, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(503, 97, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', NULL, 0),
(504, 97, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 1),
(505, 98, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(506, 98, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(507, 98, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(508, 98, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(509, 98, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(510, 98, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(511, 98, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(512, 98, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(513, 98, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(514, 99, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(515, 99, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/news/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1),
(516, 99, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(517, 99, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(518, 99, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 4),
(519, 99, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 5),
(520, 100, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(521, 100, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(522, 100, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(523, 100, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(524, 101, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(525, 101, 'Intute: Social Sciences', 'Intute is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 1),
(526, 101, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 2),
(527, 101, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 3),
(528, 101, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(529, 101, 'IDEAc', 'IDEA: the complete RePEc database at your disposal. Working papers, journal articles, software components, author information, directory of institutions.', 'http://ideas.repec.org/', 'http://ideas.repec.org/cgi-bin/htsearch?restrict=http://ideas.repec.org/p/&config=htdig&restrict=&exclude=&sort=score&format=long&method=and&search_algorithm=exact:1&words={$formKeywords}', NULL, 5),
(530, 101, 'World Bank Group Documents & Reports', 'The World Bank Group makes more than 14,000 documents available through the Documents & Reports website. Documents include Project appraisal reports, Economic and Sector Works, Evaluation reports and studies and working papers.', 'http://www-wds.worldbank.org/', 'http://www-wds.worldbank.org/servlet/WDS_IBank_Servlet?all=&stype=AllWords&dname=&rc=&ss=&dt=&dr=range&bdt=&edt=&rno=&lno=&cno=&pid=&tno=&sortby=D&sortcat=D&psz=20&x=34&y=8&ptype=advSrch&pcont=results&auth={$formKeywords}', NULL, 6),
(531, 101, 'NBER', 'NBER (The National Bureau of Economic Research, Inc) is a private, nonprofit, nonpartisan research organization dedicated to promoting a greater understanding of how the economy works. Nearly 500 NBER Working papers are published each year, and many subsequently appear in scholarly journals.', 'http://papers.nber.org/', 'http://papers.nber.org/papers?module=search&action=query&default_conjunction=and&keywords={$formKeywords}', NULL, 7),
(532, 102, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(533, 102, 'Online Glossary of Research Economics', 'An online glossary of terms in research economics.', 'http://econterms.com/', 'http://econterms.com/glossary.cgi?query={$formKeywords}', NULL, 1),
(534, 102, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(535, 102, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(536, 102, 'AmosWeb GLOSS*arama', 'The AmosWEB GLOSS*arama, a glossary for principles students, is a searchable database of 1800 economic terms and concepts.', 'http://amosweb.com/gls/', 'http://amosweb.com/cgi-bin/gls.pl?fcd=dsp&key={$formKeywords}', NULL, 4),
(537, 102, 'Concise Encyclopedia of Economics (CEE)', 'Concise Encyclopedia of Economics (CEE) - tutorials on various economic topics', 'http://www.econlib.org/library/CEE.html', 'http://www.econlib.org/cgi-bin/search.pl?results=0&book=Encyclopedia&andor=and&sensitive=no&query={$formKeywords}', NULL, 5),
(538, 102, 'EH.Net Encyclopedia of Economic and Business History', 'Directed by a distinguished board, articles in this encyclopedia on both business and economic history "are written by experts, screened by a group of authorities, and carefully edited."', 'http://eh.net/encyclopedia/', 'http://eh.net/encyclopedia/search/?Search.x=37&Search.y=10& q={$formKeywords}', NULL, 6),
(539, 102, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 7),
(540, 102, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 8),
(541, 102, 'bizterms.net', 'Bizterms.net provides a comprehensive dictionary of business and financial terms. Start browsing for your financial term, either by search, most popular terms, random term or simply view terms by letter.', 'http://www.bizterms.net', 'http://www.bizterms.net/index.php', 'query={$formKeywords}', 9),
(542, 103, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(543, 103, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(544, 103, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(545, 103, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(546, 104, 'EconPapers', 'EconPapers use the RePEc bibliographic and author data, providing access to the largest collection of online Economics working papers and journal articles.  As of May 2006, there is a total of 375,364 searchable working papers, articles and software items with 273,186 items available on-line. \n\nThe majority of the full text files are freely available, but some (typically journal articles) require that you or your organization subscribe to the service providing the full text file.', 'http://econpapers.repec.org/about.htm', 'http://econpapers.repec.org/scripts/search.asp?ft={$formKeywords}', NULL, 0),
(547, 104, 'NBER', 'NBER (The National Bureau of Economic Research, Inc) is a private, nonprofit, nonpartisan research organization dedicated to promoting a greater understanding of how the economy works. Nearly 500 NBER Working papers are published each year, and many subsequently appear in scholarly journals.', 'http://papers.nber.org/', 'http://papers.nber.org/papers?module=search&action=query&default_conjunction=and&keywords={$formKeywords}', NULL, 1),
(548, 105, 'EDIRC', 'EDIRC: Economics Departments, Institutes and Research Centers in the World currently contains 6,321 institutions in 207 countries and territories.', 'http://edirc.repec.org/', 'http://edirc.repec.org/cgi-bin/search.cgi?boolean=AND&keyword1={$formKeywords}', NULL, 0),
(549, 105, 'Intute: Social Sciences', 'Intute is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 1),
(550, 105, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 2),
(551, 105, 'World Bank Group Documents & Reports', 'The World Bank Group makes more than 14,000 documents available through the Documents & Reports website. Documents include Project appraisal reports, Economic and Sector Works, Evaluation reports and studies and working papers.', 'http://www-wds.worldbank.org/', 'http://www-wds.worldbank.org/servlet/WDS_IBank_Servlet?stype=AllWords&ptype=sSrch&pcont=results&sortby=D&sortcat=D&x=17&y=3&all={$formKeywords}', NULL, 3),
(552, 106, 'WebEC: World Wide Web Resources in Economics', 'WebEC provides links to a variety of resources on economics. Topics include: economics and teaching; methodology and history; mathematical and quantitative methods; economics and computing; economics data; microeconomics; macroeconomics; international economics; financial economics; public economics; health, education and welfare; labor and demographics; law and economics; industrial organization; business economics; economic history; development, technological change and growth; economic systems; agriculture and natural resources; regional economics; and economics of networks.', 'http://www.helsinki.fi/WebEc/', 'http://www.google.com/search?hl=en&lr=&q=site%3Awww.helsinki.fi%2F WebEc%2F+{$formKeywords}', NULL, 0),
(553, 107, 'Office for National Statistics (UK)', 'National Statistics is the official UK statistics site. You can view and download a wealth of economic and social data free.', 'http://www.statistics.gov.uk/', 'http://www.statistics.gov.uk/CCI/SearchRes.asp?term={$formKeywords}', NULL, 0),
(554, 107, 'Statistics Canada', 'Statistics Canada is the official source for Canadian social and economic statistics and products.', 'http://www.statcan.ca/', 'http://www.statcan.ca:8081/english/clf/query.html?GO%21=GO%21&ht=0&qp=&qs=&qc=0&pw=100%25&la=en&qm=1&st=1&oq=&rq=0&si=0&rf=0&col=alle&qt={$formKeywords}', NULL, 1),
(555, 108, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(556, 108, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(557, 108, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(558, 108, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(559, 109, 'H-Net', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www2.h-net.msu.edu/lists/', 'http://www2.h-net.msu.edu/logsearch/index.cgi?type=keyword&list=All+lists&hitlimit=100&field=&nojg=on&smonth=00&syear=1989&emonth=11&eyear=2004&order=relevance&phrase={$formKeywords}', NULL, 0),
(560, 109, 'Intute: Social Sciences - Conferences and Events', 'Providing search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(561, 109, 'INOMICS', 'INOMICS provides searches in indexes of other Web pages related to Economics.', 'http://www.conference-board.org/', 'http://www.conference-board.org/cgi-bin/MsmFind.exe?AND_ON=N&ALLCATS=X&AGE_WGT=0&EN=X&ES=X&NO_DL=X&x=57&y=11&QUERY={$formKeywords}', NULL, 2),
(562, 110, 'Tutor 2U Economics', 'Tutor 2U Economics includes study resources, revision guides, relevant links, an updated dataroom, and a discussion forum.', 'http://www.tutor2u.com/', 'http://www.tutor2u.net/search.asp?func=search&tree=0&submit=Search+Tutor2u&myquery={$formKeywords}', NULL, 0),
(563, 110, 'biz/ed', 'Business Education on the Internet (biz/ed) is a free information service available via the World-Wide Web which allows users to search and retrieve targeted information about business and economics held on computers around the world. The service offers a one-stop information gateway for the one million economics, business and management students and staff as well as the general public in the UK and overseas.', 'http://www.bized.co.uk/', 'http://www.bized.co.uk/cgi-bin/htsearch?config=htdig&method=and&sort=score&format=builtin-long&restrict=&exclude=&words={$formKeywords}', NULL, 1),
(564, 110, 'EcEdWeb', 'Economic Education Website: The purpose of the Economic Education Website is to provide support for economic education in all forms and at all levels.', 'http://ecedweb.unomaha.edu/search.cfm', 'http://www.google.com/u/ecedweb?q={$formKeywords}', NULL, 2),
(565, 111, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(566, 111, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(567, 111, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(568, 111, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(569, 111, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(570, 111, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(571, 111, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(572, 111, 'The OECD (Organisation for Economic Co-operation and Development)', 'The OECD groups 30 member countries sharing a commitment to democratic government and the market economy. With active relationships with some 70 other countries, NGOs and civil society, it has a global reach. Best known for its publications and its statistics, its work covers economic and social issues from macroeconomics, to trade, education, development and science and innovation.', 'http://www.oecd.org/home/', 'http://www.oecd.org/searchResult/0,2665,en_2649_201185_1_1_1_1_1,00.html?fpSearchExact=3&fpSearchText={$formKeywords}', NULL, 7),
(573, 111, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 8),
(574, 111, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 9),
(575, 112, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(576, 112, 'The Economist', 'The Economist is the online version of the famous magazine with articles and a searchable archive.', 'http://www.economist.com/', 'http://www.economist.com/search/search.cfm?cb=46&area=1&page=index&keywords=1&frommonth=01&fromyear=1997&tomonth=02&toyear=2002&rv=2&qr={$formKeywords}', NULL, 1),
(577, 112, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(578, 112, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 3),
(579, 112, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 4),
(580, 112, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(581, 112, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 6),
(582, 112, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(583, 112, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(584, 112, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(585, 112, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 10),
(586, 113, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(587, 113, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(588, 113, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(589, 113, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(590, 114, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(591, 114, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://www.oaister.org/', 'http://quod.lib.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&rgn1=entire+record&rgn2=entire+record&rgn3=entire+record&c=oaister&sid=f4f5644c4d1d4282010da7f16b531fb9&searchfield=Entire+Record&op2=And&searchfield=Entire+Record&q2=&op3=And&searchfield=Entire+Record&q3=&op6=And&rgn6=norm&restype=all+types&sort=title&submit2=search&q1={$formKeywords}', NULL, 1),
(592, 114, 'SearchERIC', 'Tools to search the abstracts and Digests produced by the ERICSM system.', 'http://www.eric.ed.gov/', 'http://www.google.com/custom?domains=www.eric.ed.gov&sa=Google+Search&sitesearch=www.eric.ed.gov&q={$formKeywords}', NULL, 2),
(593, 114, 'ERIC - Education Resources Information Center', 'ERIC - the Education Resources Information Center - is an internet-based digital library of education research and information sponsored by the Institute of Education Sciences (IES) of the U.S. Department of Education. \n\nERIC provides access to bibliographic records of journal and non-journal literature indexed from 1966 to the present. \n\nThe ERIC collection includes bibliographic records (citations, abstracts, and other pertinent data) for more than 1.2 million items indexed since 1966, including journal articles, books,  research syntheses, conference papers, technical reports, \npolicy papers, and other education-related materials.\n\nERIC currently indexes more than 600 journals, the majority of which are indexed comprehensively â€” every article in each issue is included in ERIC. Some journals are indexed selectively â€” only those articles that are education-related are selected for indexing. \n\nIn addition, contributors have given ERIC permission to display more than 115,000 full-text materials in PDF format - at no charge. These materials are generally part of the recent "grey literature" such as conference papers and reports, rather than journal articles and books. Most materials published 2004 and forward include links to other sources, including publishers'' Web sites.', 'http://eric.ed.gov/', 'http://eric.ed.gov/ERICWebPortal/Home.portal?_nfpb=true&ERICExtSearch_Operator_2=and&ERICExtSearch_SearchType_0=au&ERICExtSearch_SearchValue_2=&ERICExtSearch_SearchValue_1=&ERICExtSearch_Operator_1=and&ERICExtSearch_SearchType_1=kw&ERICExtSearch_PubDate_To=2006&ERICExtSearch_SearchType_2=kw&ERICExtSearch_SearchCount=2&ERICExtSearch_PubDate_From=0&_pageLabel=ERICSearchResult&newSearch=true&rnd=1137305171346&searchtype=advanced&ERICExtSearch_SearchValue_0={$formKeywords}', NULL, 3);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(594, 114, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(595, 114, 'Education-Line: Electronic Texts in Education and Training', 'Education-Line: Electronic Texts in Education and Training (UK) is a searchable "electronic archive of ''gray'' (report, conference, working paper) and ''pre-print'' literature in the field of education and training." Provided by the British Education Index (BEI), this database provides access to over 1,000 papers presented at British research conferences and elsewhere. Provides links to searchable paper files from conferences sponsored by the British Educational Research Association, the European Conference on Educational Research, and others.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ=&AUTH={$formKeywords}', NULL, 5),
(596, 115, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(597, 115, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 1),
(598, 115, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 2),
(599, 115, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 3),
(600, 115, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 4),
(601, 116, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(602, 116, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(603, 116, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://67.118.51.201/bol/KeyWordSearch.cfm', 'RowCount=50&Searchquery={$formKeywords}', 2),
(604, 116, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(605, 117, 'Advancing Women in Leadership Journal [USA]', 'Advancing Women in Leadership represents the first on-line professional, refereed journal for women in leadership. The journal publishes manuscripts that report, synthesize, review, or analyze scholarly inquiry that focuses on women''s issues.', 'http://www.advancingwomen.com/awl/awl.html', 'http://www.google.com/search?&q=site%3Awww.advancingwomen.com+{$formKeywords}', NULL, 0),
(606, 117, 'Educause Review [USA]', 'EDUCAUSE Review is the general-interest, bimonthly magazine published by EDUCAUSE. The magazine takes a broad look at current developments and trends in information technology, what these mean for higher education, and how they may affect the college/university as a whole.', 'http://www.educause.edu/apps/er/index.asp', 'http://www.educause.edu/SearchResults/706?app=krc&output=xml_no_dtd&restrict=WWW_EDUCAUSE_EDU&client=my_collection&site=my_collection&getfields=*&filter=0&opid=644&app_section=&submit=Search&top_tax_id=&PRIMARYPUBS=&Control=&CARNEGIE=&FTE=&q={$formKeywords}', NULL, 1),
(607, 117, 'Teachers College Record [USA]', 'A peer-reviewed journal offering full-text articles from 1980-present. Thematic content collections, discussion groups, online learning modules, and book reviews.', 'http://www.tcrecord.org/About.asp', 'http://www.tcrecord.org/search.asp?x=34&y=18&kw={$formKeywords}', NULL, 2),
(608, 117, 'The Australian Electronic Journal of Nursing Education [Australia]', 'The AEJNE is committed to enhancing the teaching learning experience across a variety of nurse contexts. The journal will be a means by which nurses can share findings, insights, experience and advice to colleagues involved in all aspects of the educational process.', 'http://www.scu.edu.au/schools/nhcp/aejne/', 'http://www.scu.edu.au/cgi/htsearch/?submit=Search&method=boolean&format=builtin-short&words={$formKeywords}', NULL, 3),
(609, 117, 'Bilingual Research Journal [USA]', 'A peer-reviewed scholarly journal publishing research on bilingual education.', 'http://brj.asu.edu/', 'http://brj.asu.edu.master.com/texis/master/search/?s=SS&notq=&prox=&sufs=0&rorder=&rprox=&rdfreq=&rwfreq=&rlead=&q={$formKeywords}', NULL, 4),
(610, 117, 'Current Issues in Education [USA]', 'Current Issues in Comparative Education (CICE) is an online journal based at Teachers College, Columbia University, that publishes scholarly work from a variety of academic disciplines. CICE seeks clear and significant contributions that further debate on educational policies and comparative studies.', 'http://cie.ed.asu.edu/', 'http://www.google.com/search?q=site%3Acie.asu.edu+{$formKeywords}', NULL, 5),
(611, 117, 'Education-line [UK]', 'Education-line is a freely accessible database of the full text of conference papers, working papers and electronic literature which supports educational research, policy and practice.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&AUTH=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ={$formKeywords}', NULL, 6),
(612, 117, 'Education Policy Analysis Archives [USA & Mexico]', 'A peer-reviewed scholarly electronic journal publishing education policy analysis since 1993.', 'http://epaa.asu.edu/', 'http://epaa.asu.edu/cgi-bin/htsearch?method=boolean&format=builtin-long&sort=score&config=epaa.asu.edu&restrict=&exclude=&words={$formKeywords}', NULL, 7),
(613, 117, 'Educational Insights: Electronic Journal of Graduate Student Research [Canada]', 'Educational Insights is an innovative evocative provocative intertextual space for engaging in new dialogues of enRapturing con/texts and reimagined spaces of pedagogy, inquiry, and interdisciplinarity. Our intent is to encourage a community that honours difference and polyphony, while sharing a vision of pedagogy, education, inquiry as spaces of challenge and hopeful conversations.', 'http://ccfi.educ.ubc.ca/publication/insights/v09n02/us/index.html', 'http://sitelevel.whatuseek.com/query.go?B1=Search&crid=140f069465cde402&query={$formKeywords}', NULL, 8),
(614, 117, 'Educational Technology and Society [USA]', 'Educational Technology & Society seeks academic articles on the issues affecting the developers of educational systems and educators who implement and manage such systems.', 'http://www.ifets.info/index.php?http://www.ifets.info/aim.php', 'http://odysseus.ieee.org/query.html?col=wg&qp=url%3Aifets.ieee.org%2Fperiodical&qs=&qc=wg&ws=0&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 9),
(615, 117, 'First Monday [USA]', 'First Monday is one of the first peer-reviewed journals on the Internet, offering critical analysis of the Internet.', 'http://www.firstmonday.org/idea.html', 'http://www.firstmonday.org/fm.search?numdocs=20&query={$formKeywords}', NULL, 10),
(616, 117, 'Global Journal of Engineering Education [Australia]', 'Global Journal of Engineering Education (GJEE), providing the international engineering education community with a forum for discussion and the exchange of information on engineering education and industrial training at tertiary level.', 'http://www.eng.monash.edu.au/uicee/gjee/globalj.htm', 'http://ultraseek.its.monash.edu.au/query.html?rq=0&col=m0&qp=&qs=+AND+url%3Ahttp%3A%2F%2Fwww.eng.monash.edu.au%2Fuicee%2Fgjee&qc=&pw=100%25&ws=1&la=&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 11),
(617, 117, 'Journal of American Indian Education [USA]', 'The Journal of American Indian Education is a peer reviewed scholarly journal, which publishes papers specifically related to the education of American Indians and Alaska Natives. While the focus of the Journal is on basic applied research, manuscripts that are expository in nature and present an explicative or interpretive perspective are considered for publication as well. JAIE is particularly interested in publishing manuscripts that express the viewpoint of AI/AN and research that is initiated, conducted, and interpreted by natives.', 'http://jaie.asu.edu/', 'http://www.google.com/u/arizonastate?sa=Search&domains=jaie.asu.edu&sitesearch=jaie.asu.edu&hq=inurl%3Ajaie.asu.edu&q={$formKeywords}', NULL, 12),
(618, 117, 'Journal of Vocational and Technical Education [USA]', 'The Journal of Vocational and Technical Education (JVTE) is a non-profit, refereed national publication of Omicron Tau Theta, the national, graduate honorary society of vocational and technical education.', 'http://scholar.lib.vt.edu/ejournals/JVTE/', 'http://scholar.lib.vt.edu:8765/query.html?rq=0&qp=url%3Ahttp%3A%2F%2Fscholar.lib.vt.edu%2Fejournals%2F&col=ejournal&qp=&qs=&qc=&pw=100%25&ws=0&la=&qm=0&st=1&nh=10&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 13),
(619, 117, 'Kairos: A Journal for Teachers of Writing in Webbed Environments [USA]', 'Kairos is a refereed online journal exploring the intersections of rhetoric, technology, and pedagogy.', 'http://english.ttu.edu/kairos/', 'http://www.google.com/u/Kairos?hq=inurl%3Aenglish.ttu.edu%2Fkairos&btnG=Search+Kairos&q={$formKeywords}', NULL, 14),
(620, 117, 'Language, Learning, and Technology [USA]', 'Online journal devoted to technology and language education research for foreign and second language.', 'http://llt.msu.edu/', 'http://www.google.com/u/llt?q={$formKeywords}', NULL, 15),
(621, 117, 'Medical Education Online: An Electronic Journal [USA]', 'Medical Education Online (MEO) is a forum for disseminating information on educating physicians and other health professionals. Manuscripts on any aspect of the process of training health professionals will be considered for peer-reviewed publication in an electronic journal format. In addition MEO provides a repository for resources such as curricula, data sets, syllabi, software, and instructional material developers wish to make available to the health education community.', 'http://www.med-ed-online.org/', 'http://www.google.com/search?&q=site%3Awww.med-ed-online.org+{$formKeywords}', NULL, 16),
(622, 117, 'National CROSSTALK, The National Center for Public Policy and Higher Education [USA]', 'The Center publishes the National CROSSTALK to provide action-oriented analyses of state and federal policies affecting education beyond high school.', 'http://www.highereducation.org/crosstalk/index.html', 'http://www.google.com/search?&q=site%3Awww.highereducation.org%2Fcrosstalk%2F+{$formKeywords}', NULL, 17),
(623, 117, 'Philosophy of Education: Yearbook of the Philosophy of Education Society [USA]', 'Annual collections of some of the best work in the field of Educational Philosophy.', 'http://www.ed.uiuc.edu/EPS/PES-Yearbook/', 'http://www.googlesyndicatedsearch.com/u/pesyearbook?h1=en&hq=inurl%3Awww.ed.uiuc.edu%2Feps%2Fpes-yearbook&btnG=go&q={$formKeywords}', NULL, 18),
(624, 117, 'Practical Assessment, Research and Evaluation [USA]', 'Practical Assessment, Research and Evaluation (PARE) is an on-line journal published by the edresearch.org and the Department of Measurement, Statistics, and Evaluation at the University of Maryland, College Park. Its purpose is to provide education professionals access to refereed articles that can have a positive impact on assessment, research, evaluation, and teaching practice, especially at the local education agency (LEA) level.', 'http://pareonline.net/', 'http://www.google.com/custom?domains=pareonline.net%2Fgetvn.asp&sa=Google+Search&sitesearch=pareonline.net%2Fgetvn.asp&client=pub-8146434030680546&forid=1&channel=9117733086&ie=ISO-8859-1&oe=ISO-8859-1&flav=0000&sig=cmg6qt6VP1GSt2jo&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFDD%3BLBGC%3AFFFFDD%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A50%3BLW%3A341%3BL%3Ahttp%3A%2F%2Fpareonline.net%2Fprac3.gif%3BS%3Ahttp%3A%2F%2F%3BFORID%3A1%3B&hl=en&q={$formKeywords}', NULL, 19),
(625, 117, 'The Qualitative Report [USA]', 'The Qualitative Report (ISSN 1052-0147) is a peer-reviewed, on-line journal devoted to writing and discussion of and about qualitative, critical, action, and collaborative inquiry and research.', 'http://www.nova.edu/ssss/QR/index.html', 'http://www.nova.edu/bin/QR.pl?Search+Criteria={$formKeywords}', NULL, 20),
(626, 117, 'Reading Online: An Electronic Journal of the International Reading Association [USA]', 'A journal for literacy educators K-12; includes articles, commentaries, reviews, and discussion forums.', 'http://www.readingonline.org/', 'http://www.readingonline.org/search/search.asp?QueryForm=&sc=articles&sm=all&qu={$formKeywords}', NULL, 21),
(627, 117, 'Teaching English as a Second Language [USA]', 'TESL-EJ, Teaching English as a Second Language Electronic Journal, is a fully-refereed academic journal for the English as a Second Language, English as a Foreign Language.', 'http://www-writing.berkeley.edu/TESL-EJ/', 'http://www.google.com/u/berkeleywriting?sa=Google+Search&domains=www-writing.berkeley.edu%2FTESL-EJ%2F&sitesearch=www-writing.berkeley.edu&q={$formKeywords}', NULL, 22),
(628, 118, 'Education Theory', 'Educational Theory is a quarterly journal of philosophy of education and related disciplines.', 'http://www.ed.uiuc.edu/EPS/Educational-Theory/', 'http://www.google.com/search?&q=site%3Awww.ed.uiuc.edu%2FEPS%2FEducational-Theory %2F+{$formKeywords}', NULL, 0),
(629, 119, 'Education Research', 'RAND posts reports of its public policy research on education topics. Issues such as K-12 assessment and accountability, school reform, teachers and teaching, higher education, military education and training, and worker training are addressed.', 'http://www.rand.org/research_areas/education/', 'http://vivisimo.rand.org/vivisimo/cgi-bin/query-meta?v%3Aproject=pubs&input-form=simple&Go=Search&query={$formKeywords}', NULL, 0),
(630, 119, 'ERIC Digests', 'ERIC Digests include:  \n\n- short reports (1,000 - 1,500 words) on topics of prime current interest in education. There are a large variety of topics covered including teaching, learning, libraries, charter schools, special education, higher education, home schooling, and many more. \n\n- targeted specifically for teachers, administrators, policymakers, and other practitioners, but generally useful to the broad educational community.  \n\n- designed to provide an overview of information on a given topic, plus references to items providing more detailed information.  \n\n- produced by the former 16 subject-specialized ERIC Clearinghouses, and reviewed by experts and content specialists in the field.  \n\n- funded by the Office of Educational Research and Improvement (OERI), of the U.S. Department of Education (ED).  \n\n- The full-text ERIC Digest database contains over 3000 Digests with the latest updates being added to this site in July 2005.', 'http://www.ericdigests.org/', 'http://www.google.com/custom?domains=ericdigests.org&sitesearch=ericdigests.org&q={$formKeywords}', NULL, 1),
(631, 119, 'ED Pubs Online Ordering System', 'ED Pubs Online Ordering System is intended to help users identify and order U.S. Department of Education products. All publications are provided at no cost to the general public by the U.S. Department of Education. ', 'http://www.edpubs.org/webstore/Content/search.asp', 'http://www.edpubs.org/webstore/EdSearch/SearchResults.asp?Search=True&CQQUERYTYPE=2&CQFULLTEXT={$formKeywords}', NULL, 2),
(632, 119, 'Education-Line: Electronic Texts in Education and Training', 'Education-Line: Electronic Texts in Education and Training (UK) is a searchable "electronic archive of ''gray'' (report, conference, working paper) and ''pre-print'' literature in the field of education and training." Provided by the British Education Index (BEI), this database provides access to over 1,000 papers presented at British research conferences and elsewhere. Provides links to searchable paper files from conferences sponsored by the British Educational Research Association, the European Conference on Educational Research, and others.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&AUTH=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ={$formKeywords}', NULL, 3),
(633, 119, 'SearchERIC', 'Tools to search the abstracts and Digests produced by the ERICSM system.', 'http://www.eric.ed.gov/', 'http://www.google.com/custom?domains=www.eric.ed.gov&sa=Google+Search&sitesearch=www.eric.ed.gov&q={$formKeywords}', NULL, 4),
(634, 119, 'ERIC - Education Resources Information Center', 'ERIC - the Education Resources Information Center - is an internet-based digital library of education research and information sponsored by the Institute of Education Sciences (IES) of the U.S. Department of Education. \n\nERIC provides access to bibliographic records of journal and non-journal literature indexed from 1966 to the present. \n\nThe ERIC collection includes bibliographic records (citations, abstracts, and other pertinent data) for more than 1.2 million items indexed since 1966, including journal articles, books,  research syntheses, conference papers, technical reports, \npolicy papers, and other education-related materials.\n\nERIC currently indexes more than 600 journals, the majority of which are indexed comprehensively â€” every article in each issue is included in ERIC. Some journals are indexed selectively â€” only those articles that are education-related are selected for indexing. \n\nIn addition, contributors have given ERIC permission to display more than 115,000 full-text materials in PDF format - at no charge. These materials are generally part of the recent "grey literature" such as conference papers and reports, rather than journal articles and books. Most materials published 2004 and forward include links to other sources, including publishers'' Web sites.', 'http://eric.ed.gov/', 'http://eric.ed.gov/ERICWebPortal/Home.portal?_nfpb=true&ERICExtSearch_SearchType_0=kw&_pageLabel=ERICSearchResult&newSearch=true&rnd=1189800475852&searchtype=keyword&ERICExtSearch_SearchValue_0={$formKeywords}', NULL, 5),
(635, 119, 'Education Review (ER)', 'Education Review publishes reviews of recent books in education, covering the entire range of education scholarship and practice.', 'http://edrev.asu.edu/index.html', 'http://edrev.asu.edu/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=edrev.asu.edu&restrict=&exclude=&words={$formKeywords}', NULL, 6),
(636, 120, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingentaconnect.com/', 'http://www.ingentaconnect.com/search?form_name=advanced&title_type=tka&author=&journal=&journal_type=words&volume=&issue=&database=1&year_from=2002&year_to=2007&pageSize=20&x=42&y=13&title={$formKeywords}', NULL, 0),
(637, 120, 'ebrary', 'Independent researchers who do not have access to ebrary''s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(638, 120, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(639, 120, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(640, 121, 'H-Net, Humanities & Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www2.h-net.msu.edu/lists/', 'http://www2.h-net.msu.edu/logsearch/index.cgi?type=boolean&hitlimit=25&field=&nojg=on&smonth=00&syear=1989&emonth=11&eyear=2004&order=relevance&phrase={$formKeywords}', NULL, 0),
(641, 121, 'JISCmail', 'The National Academic Mailing List Service, known as ''JISCmail'', is one of a number of JANET services provided by JANET(UK) (www.ja.net) and funded by the JISC (www.jisc.ac.uk) to benefit learning, teaching and research communities. The Science and Technology Facilities Council (www.scitech.ac.uk) currently operates and develops the JISCmail service on behalf of JANET(UK).', 'http://www.jiscmail.ac.uk/index.htm', 'http://www.jiscmail.ac.uk/cgi-bin/listsearcher.cgi?', 'chk_wds=chk_wds&opt=listsearcher&thecriteria={$formKeywords}', 1),
(642, 122, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(643, 123, 'BBC Learning', 'BBC Online - Education BBC Education. Access to excellent learning resources for adults and children. Lots of subjects - history, science, languages, health, work skills, culture, technology, arts, literature, business, nature, life, leisure.', 'http://www.bbc.co.uk/learning', 'http://www.bbc.co.uk/cgi-bin/search/results.pl?go.x=0&go.y=0&go=go&uri=%2Flearning%2F&q={$formKeywords}', NULL, 0),
(644, 123, 'Educator''s Reference Desk', 'The people who created AskERIC announce a new service and name to access the resources you''ve come to depend on for over a decade. While the U.S. Department of Education will discontinue the AskERIC service December 19th, you will still have access to the resources you''ve come to depend upon. Through The Educator''s Reference Desk (http://www.eduref.org) you can access AskERIC''s 2,000+ lesson plans, 3,000+ links to online education information, and 200+ question archive responses. While the question answer service will no longer be active, The Educator''s Reference Desk provides a search interface to the ERIC Databases, providing access to over one million bibliographic records on educational research, theory, and practice.', 'http://www.eduref.org/', 'http://www.google.com/search?&q=site%3Awww.eduref.org+{$formKeywords}', NULL, 1),
(645, 123, 'Marco Polo', 'MarcoPolo: Internet Content for the Classroom is a nonprofit consortium of premier national and international education organizations and the MCI Foundation dedicated to providing the highest quality Internet content and professional development to teachers and students throughout the United States.', 'http://www.marcopolo-education.org/', 'http://www.marcopolosearch.org/mpsearch/Search_Results.asp?orgn_id=2&log_type=1&hdnFilter=&hdnPerPage=15&selUsing=all&txtSearchFor={$formKeywords}', NULL, 2),
(646, 123, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', NULL, 3),
(647, 123, 'Community Learning Network', 'Community Learning Network is designed to help K-12 teachers integrate technology into the classroom.', 'http://www.cln.org/', 'http://www.openschool.bc.ca/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=htdig_cln&restrict2=&submit2=Search&words={$formKeywords}', NULL, 4),
(648, 123, 'Educational Media Reviews Online', 'Educational Media Reviews Online is a database of video, DVD, and CD-ROM reviews on materials from major educational and documentary distributors. The reviews are written primarily by librarians and teaching faculty in institutions across the United States and Canada.', 'http://libweb.lib.buffalo.edu/emro/about.asp', 'http://libweb.lib.buffalo.edu/emro/EmroResults.asp?Title=&Subject=%25&Reviewer=&Year=%25&Rating=%25&Distributor=&Format=%25&Submit=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0&Keyword={$formKeywords}', NULL, 5),
(649, 123, 'Gateway to Educational Materials (GEM)', 'This site offers a one-stop educational resource to Internet lesson plans, curriculum units, and activities pertaining to all K-12 subjects. Users can browse sites by subject or keyword, desired grade or education level. They can also search by subject, keyword, title, and full-text of the site description. Sources include the AskERIC Virtual Library, the Eisenhower National Clearinghouse, Math Forum, Microsoft Encarta, the North Carolina Department of Public Instruction, and the US Department of Education.', 'http://www.thegateway.org/', 'http://64.119.44.148/portal_seamarksearch/makesearch?isliteral=yes&operator=contains&form.submitted=1&dimension=fulltext&ss=Go&value={$formKeywords}', NULL, 6),
(650, 123, 'Merlot', 'Merlot is a free and open resource designed primarily for faculty and students in higher education. With a continually growing collection of online learning materials, peer reviews and assignments, MERLOT helps faculty enhance instruction.', 'http://www.merlot.org/Home.po', 'http://www.merlot.org/merlot/materials.htm?keywords={$formKeywords}', NULL, 7),
(651, 123, 'SMETE', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/public/find/search_results.jhtml?_DARGS=/smete/home_body.jhtml&_D:/smete/forms/SimpleSearchForm.keyword=&/smete/forms/SimpleSearchForm.operation=simpleSearch&_D:/smete/forms/SimpleSearchForm.operation=&&/smete/forms/SimpleSearchForm.keyword={$formKeywords}', NULL, 8),
(652, 124, 'National Center for Education Statistics', 'The site of the Department of Education''s major statistical agency has a catalog of publications available, with text and tables from some of the publications.', 'http://nces.ed.gov/', 'http://search.nces.ed.gov/search?output=xml_no_dtd&client=nces&proxystylesheet=nces&site=nces&q={$formKeywords}', NULL, 0),
(653, 124, 'Federal Resources for Educational Excellence', 'Federal Resources For Educational Excellence: More than 30 Federal agencies formed a working group in 1997 to make hundreds of education resources supported by agencies across the U.S. Federal government easier to find. The result of that work is the FREE web site. Subjects include: Arts, Educational technology, Foreign languages, Health and Safety, Language arts, Mathematics, Physical education, Science, Social studies, and Vocational education.', 'http://free.ed.gov/template.cfm?template=About%20FREE', 'http://free.ed.gov/searchres.cfm', 'searchword={$formKeywords}', 1),
(654, 124, 'EdResearch Online', 'The EdResearch Online database hasover 12,000 online education research documents and articles. These form a subset of the Australian Education Index.', 'http://cunningham.acer.edu.au/dbtw-wpd/sample/edresearch.htm', 'http://cunningham.acer.edu.au/dbtw-wpd/exec/dbtwpub.dll', 'MF=&AC=QBE_QUERY&NP=2&RL=0&QF0=AUTHOR | CORPORATE AUTHOR | TITLE | SUBJECTS | ORGANISATIONS | ABSTRACT | GEOGRAPHICAL | ADDED AUTHORS | ADDED CORPORATE | IDENTIFIERS | JOURNAL TITLE | ISSN&TN=edresearchonline&DF=Web_Full&RF=Web_Brief&MR=50&DL=0&QI0={$formKeywords}', 2),
(655, 124, 'National Clearinghouse for Educational Facilities', 'This site''s resources include "free information about K-12 school planning, design, financing, construction, operations and maintenance." The Libraries/Media Centers section includes a bibliography of books and articles covering all aspects of construction management, architecture, and cost estimation. Disaster planning, health, and environmental issues receive consideration. Check the links for other professional organizations, government programs and agencies, research centers, products, and services. Click on Gallery to view project graphics. Searchable.', 'http://www.edfacilities.org/', 'http://www.edfacilities.org/search/index.cfm', 'RequestTimeout=300&SearchSortField1=NCEFDate&SearchSortOrder1=DESC&SearchScope=All&SearchLogic=AND&SearchKeywords={$formKeywords}', 3),
(656, 124, 'Education Development Center', 'The EDC is an international, non-profit organization with more than 335 continuing projects focused on the enhancement of eduThis site''s resources include "free information about K-12 school planning, design, financing, construction, operations and maintenance." The Libraries/Media Centers section includes a bibliography of books and articles covering all aspects of construction management, architecture, and cost estimation. Disaster planning, health, and environmental issues receive consideration. Check the links for other professional organizations, government programs and agencies, research centers, products, and services. Click on Gallery to view project graphics. Searchable.cational methods and initiatives.  The Center''s site includes information related the use of technology in education.', 'http://main.edc.org/', 'http://google2.edc.org/search?site=newsroom&client=edc_main&proxystylesheet=edc_main&output=xml_no_dtd&filter=0&q={$formKeywords}', NULL, 4),
(657, 124, 'ENC Online: Eisenhower National Clearinghouse for Mathematics and Science Education', 'Established in 1992 with funding from the U.S. Department of Education, the mission of the clearinghouse is to "acquire and catalog mathematics and science curriculum resources, creating the most comprehensive collection in the nation; provide the best selection of math and science education resources on the Internet; support teachers'' professional development in math, science, and the effective use of technology; serve all K-12 educators, parents, and students with free products and services."\n\nENC.ORG is now goENC.COM!', 'http://www.goenc.com/', 'http://www.goenc.com/search/default.asp?page=1&pagelength=10&grade=G0&resourceType=R0&go=Search&searchText={$formKeywords}', NULL, 5),
(658, 125, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(659, 125, 'Government of Canada homepage', 'This is the primary internet portal for information on the Government of Canada, its programmes, services, new initiatives and products, and for information about Canada. Among its features are three audience-based gateways that provide access to information and services for: Canadians, Non-Canadians, and Canadian business.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.collectionscanada.ca/fed/searchResults.jsp?SourceQuery=&ResultCount=5&PageNum=1&MaxDocs=-1&SortSpec=score+desc&Language=eng&Sources=amicus&Sources=mikan&Sources=web&QueryText.x=11&QueryText.y=13&QueryText={$formKeywords}', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=&kl=XX&op=a&q={$formKeywords}', 1),
(660, 125, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rt_versions`
--

CREATE TABLE IF NOT EXISTS `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(5) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `rt_versions`
--

INSERT INTO `rt_versions` (`version_id`, `journal_id`, `version_key`, `locale`, `title`, `description`) VALUES
(1, 1, 'Agriculture', 'en_US', 'Agriculture', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(2, 1, 'Art_Architecture', 'en_US', 'Art & Architecture', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(3, 1, 'Astrophysics', 'en_US', 'Astrophysics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(4, 1, 'Biology', 'en_US', 'Biology', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(5, 1, 'Business', 'en_US', 'Business', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(6, 1, 'Chemistry', 'en_US', 'Chemistry', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(7, 1, 'Cognitive_Science', 'en_US', 'Cognitive Science', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(8, 1, 'Computer_Science', 'en_US', 'Computer Science', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(9, 1, 'Economics', 'en_US', 'Economics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(10, 1, 'Education', 'en_US', 'Education', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.');

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('classes.tasks.OpenAccessNotification', '2015-03-25 11:12:19'),
('classes.tasks.ReviewReminder', '2015-03-25 11:12:19'),
('classes.tasks.SubscriptionExpiryReminder', '2015-03-25 11:12:19'),
('plugins.generic.pln.classes.tasks.Depositor', '2015-03-25 11:12:05'),
('plugins.generic.usageStats.UsageStatsLoader', '2015-03-25 11:12:06'),
('plugins.importexport.crossref.CrossrefInfoSender', '2015-03-25 11:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `hide_about` tinyint(4) NOT NULL DEFAULT '0',
  `disable_comments` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `hide_about`, `disable_comments`, `abstract_word_count`) VALUES
(1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `section_editors`
--

CREATE TABLE IF NOT EXISTS `section_editors` (
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `can_review` tinyint(4) NOT NULL DEFAULT '1',
  UNIQUE KEY `section_editors_pkey` (`journal_id`,`section_id`,`user_id`),
  KEY `section_editors_journal_id` (`journal_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE IF NOT EXISTS `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abbrev', 'ART', 'string'),
(1, 'en_US', 'identifyType', '', 'string'),
(1, 'en_US', 'policy', '', 'string'),
(1, 'en_US', 'title', 'Articles', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('805f6f6s3u80cheq6v0aof4k97', 3, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426751370, 1426914519, 0, 'username|s:6:"raches";userId|s:1:"3";', 'localhost'),
('9r46dcj2j1og58afrk708l4gc3', 3, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427177584, 1427178138, 0, 'userId|s:1:"3";username|s:6:"raches";', 'localhost'),
('c9ijmglabrp8j276horl1fdee7', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427285618, 1427341984, 0, '', 'localhost'),
('en1fc3fgjmtcm96jpkieveanr4', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427187767, 1427187767, 0, '', 'localhost'),
('f2mulqv5vukr2tk90c0aijmnu1', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426910635, 1426910635, 0, '', 'localhost'),
('g4j6703bc73jo1er770b6m7rn6', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427187770, 1427187770, 0, '', 'localhost'),
('gc16dtbjoojt2obcmfv7cidmj3', 3, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427109466, 1427160582, 0, 'username|s:6:"raches";userId|s:1:"3";', 'localhost'),
('l18ul52c71p8sflipr703vcvf1', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1427162070, 1427280167, 0, 'username|s:9:"destraaaa";enrolmentReferrer|a:1:{i:0;s:8:"managers";}', 'localhost'),
('lo78d1dgmj4srvvqo51e1kdc17', 1, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426914600, 1427160754, 0, 'username|s:9:"destraaaa";userId|s:1:"1";', 'localhost'),
('m2og7ukdao2a4ctc1fr830mt71', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426910632, 1426910632, 0, '', 'localhost'),
('qt1u1h8b0ltkgk1d992of5csb2', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426913366, 1426913366, 0, '', 'localhost'),
('ss6t3j44hf4jqjbncsq31ublp5', NULL, '::1', 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0', 1426913369, 1426913369, 0, '', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `signoffs`
--

CREATE TABLE IF NOT EXISTS `signoffs` (
  `signoff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(32) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `file_revision` bigint(20) DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_underway` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`signoff_id`),
  UNIQUE KEY `signoff_symbolic` (`assoc_type`,`assoc_id`,`symbolic`,`user_id`,`user_group_id`,`file_id`,`file_revision`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `signoffs`
--

INSERT INTO `signoffs` (`signoff_id`, `symbolic`, `assoc_type`, `assoc_id`, `user_id`, `file_id`, `file_revision`, `date_notified`, `date_underway`, `date_completed`, `date_acknowledged`, `user_group_id`) VALUES
(1, 'SIGNOFF_COPYEDITING_INITIAL', 257, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'SIGNOFF_COPYEDITING_FINAL', 257, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'SIGNOFF_LAYOUT', 257, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'SIGNOFF_COPYEDITING_INITIAL', 257, 2, 0, NULL, NULL, NULL, NULL, '2015-03-18 16:37:53', NULL, NULL),
(9, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'SIGNOFF_COPYEDITING_FINAL', 257, 2, 0, NULL, NULL, NULL, NULL, '2015-03-18 16:38:03', NULL, NULL),
(11, 'SIGNOFF_LAYOUT', 257, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'SIGNOFF_COPYEDITING_INITIAL', 257, 8, 0, NULL, NULL, NULL, NULL, '2015-03-20 09:20:10', NULL, NULL),
(16, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 8, 3, 12, 1, NULL, NULL, NULL, NULL, NULL),
(17, 'SIGNOFF_COPYEDITING_FINAL', 257, 8, 0, NULL, NULL, NULL, NULL, '2015-03-20 09:20:20', NULL, NULL),
(18, 'SIGNOFF_LAYOUT', 257, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'SIGNOFF_COPYEDITING_INITIAL', 257, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'SIGNOFF_COPYEDITING_FINAL', 257, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'SIGNOFF_LAYOUT', 257, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'SIGNOFF_COPYEDITING_INITIAL', 257, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'SIGNOFF_COPYEDITING_FINAL', 257, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'SIGNOFF_LAYOUT', 257, 20, 0, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'SIGNOFF_COPYEDITING_INITIAL', 257, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'SIGNOFF_COPYEDITING_AUTHOR', 257, 27, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'SIGNOFF_COPYEDITING_FINAL', 257, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'SIGNOFF_LAYOUT', 257, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'SIGNOFF_PROOFREADING_AUTHOR', 257, 27, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'SIGNOFF_PROOFREADING_PROOFREADER', 257, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'SIGNOFF_PROOFREADING_LAYOUT', 257, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(5) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(1, 'en_US', 6, 'id_ID:en_US', 'id_ID:en_US', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`, `setting_type`) VALUES
('contactEmail', 'en_US', 'rifkiafinaputri@gmail.com', 'string'),
('contactName', 'en_US', 'Open Journal Systems', 'string'),
('defaultMetricType', '', '', 'string'),
('oneStepReset', '', '0', 'bool'),
('preventManagerPluginManagement', '', '0', 'bool'),
('showDescription', '', '1', 'bool'),
('showThumbnail', '', '1', 'bool'),
('showTitle', '', '1', 'bool'),
('siteTheme', '', '', 'string'),
('title', 'en_US', 'WIMBA', 'string'),
('useAlphalist', '', '0', 'bool'),
('usePaging', '', '0', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`static_page_id`, `path`, `journal_id`) VALUES
(1, 'templates', 1),
(2, 'contact', 1),
(3, 'guide', 1),
(4, 'about', 1);

-- --------------------------------------------------------

--
-- Table structure for table `static_page_settings`
--

CREATE TABLE IF NOT EXISTS `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `static_page_settings`
--

INSERT INTO `static_page_settings` (`static_page_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'content', '<p>Di bawah ini adalah file-file yang digunakan untuk menjadi panduan pembuatan artikel.</p>\r\n<p><a href="/ojs-2.4.5/index.php/test/manager/files/templates/6thASCENT_ApplicationForm.docx">Template A</a></p>\r\n<p><a href="/ojs-2.4.5/index.php/test/manager/files/templates/6thASCENT_ApplicationForm.docx">Template B</a></p>', 'string'),
(1, 'en_US', 'title', 'Journal Template', 'string'),
(2, 'en_US', 'content', '<p>Halaman untuk contact us.</p>', 'string'),
(2, 'en_US', 'title', 'Contact Us', 'string'),
(3, 'en_US', 'content', '<p style="text-align: justify;"><strong>1. PENDAHULUAN</strong><br />Isi artikel Jurnal Wimba meliputi bidang Komunikasi Visual, seperti: bahasa rupa, ilustrasi, tipografi, fotografi, animasi, periklanan, <em>branding</em>, <em>corporate identity</em>, <em>sign system</em>, logo, desain kemasan, film atau game. Artikel agar ditulis dalam halaman genap tetapi tidak melebihi 40 halaman, termasuk abstrak, seluruh tabel dan gambar serta daftar referensi. Pedoman dalam tata letak artikel dapat dilihat dalam bentuk <em>template</em> Microsoft Word (docx) untuk informasi yang lebih detil.</p>\r\n<p style="text-align: justify;">Isi artikel adalah karya asli penulis yang belum pernah dipublikasikan di media cetak atau <em>online</em> lain. Artikel juga tidak sedang diajukan kepada jurnal yang lain, yang dibuktikan dengan pernyataan dari penulis.<br />Jenis artikel yang diterima oleh Jurnal Wimba terbagi atas:</p>\r\n<ol>\r\n<li style="text-align: justify;"><em>Original article</em> atau artikel orisinil, yaitu tulisan berdasarkan penelitian mandiri dan orisinil dari penulis. Jumlah halaman jenis artikel adalah antara 16 sampai 40 halaman.</li>\r\n<li style="text-align: justify;"><em>Review article</em> atau artikel review, yaitu tulisan yang merupakan tinjauan atas satu fenomena berdasarkan analisa literatur dan penelitian serupa terkait yang telah dilakukan sebelumnya, dengan jumlah halaman antara 16 sampai 24 halaman.</li>\r\n<li style="text-align: justify;"><em>Research report</em> atau laporan riset, yang berisi laporan dari suatu penelitian yang dilakukan oleh penulis, dengan jumlah halaman antara 16 sampai 24 halaman.</li>\r\n<li style="text-align: justify;"><em>Letter paper</em> yang berisi ajuan/ proposal penelitian yang akan/sedang dilakukan oleh penulis, dengan jumlah halaman antara 4 sampai 10 halaman.</li>\r\n<li style="text-align: justify;">Artikel lepas yang berisi tulisan/kajian mengenai satu tema dalam bidang desain komunikasi visual dengan format yang berbeda dengan format penulisan akademik. Jumlah halaman jenis artikel adalah antara 10 sampai 16 halaman.</li>\r\n</ol>\r\n<p><strong>2. PETUNJUK UNTUK PENULIS</strong><br /><strong>2.1. Penulisan Artikel</strong><br />Isi artikel untuk Jurnal terdiri dari bagian pendahuluan, isi, penutup dan referensi. Judul, sub judul (jika diperlukan), nama penulis, afiliasi dan alamat surat harus dicantumkan, diikuti oleh abstrak dan kata kunci.</p>\r\n<p>Abstrak ditulis dalam 200-300 kata dengan format Bahasa Inggris yang benar dan baku, baik untuk artikel dalam Bahasa Inggris maupun Bahasa Indonesia. Abstrak secara jelas merefleksikan konteks dan argumentasi<br />dari artikel. Jika artikel berdasarkan penelitian, abstrak perlu menjelaskan secara ringkas metodologi yang digunakan serta temuannya. Penulisan abstrak menggunakan huruf Calibri ukuran 11 <em>point</em>, spasi tunggal dan dilengkapi dengan kata kunci antara 3 &ndash; 5 kata. Abstrak agar menjelaskan isi artikel secara singkat dan jelas. Kata kunci dalam Bahasa Inggris ditulis menggunakan huruf miring (<em>italic</em>).</p>\r\n<p>Bagian isi/teks artikel dapat ditulis dalam Bahasa Indonesia atau Bahasa Inggris yang benar dan baku, serta disusun dalam format yang sesuai dengan ketentuan Jurnal Wimba dalam ukuran B5 (176mm X 250mm), dua kolom dengan huruf Calibri ukuran 11 <em>point</em> untuk seluruh teks dan keterangan, dengan metode rata pinggir (<em>justified</em>) untuk teks. Untuk artikel dalam Bahasa Indonesia, maka judul ditulis dalam Bahasa Indonesia dan abstrak termasuk kata kunci dalam Bahasa Inggris. Untuk artikel dalam Bahasa Inggris, maka seluruh penulisan menggunakan Bahasa Inggris.</p>\r\n<p><strong>2.1.1. Tata letak halaman</strong><br />Margin halaman ditentukan sebagai berikut: atas (20mm), bawah (20mm), kiri (15mm), kanan (20mm) dan jarak antar kolom (10mm). Halaman pertama artikel berisi keterangan jenis artikel yang ditulis pada bagian kiri atas dengan ukuran 10 <em>point</em>, <em>italic</em>. Judul dituliskan di bagian tengah (<em>centered</em>), 14 <em>point,</em> <em>bold</em>, spasi tunggal. Sub judul (bila ada) mengacu pada format judul, 12 <em>point</em>, <em>bold</em>. Nama seluruh penulis ditempatkan dengan jarak satu spasi ganda di bawah judul/sub judul, <em>centered</em>, 11 <em>point</em>, normal. Setiap nama penulis diikuti nomor urut yang dituliskan secara superscript sebagai rujukan afiliasi.</p>\r\n<p>Afiliasi dan alamat surat penulis ditempatkan dengan jarak satu spasi tunggal di bawah nama, <em>centered</em>, 9 <em>point</em>, <em>italic</em>, dengan urutan sesuai nomor. Afiliasi merujuk pada institusi resmi yang diwakili setiap penulis pada saat penulisan artikel. Pencantuman lebih dari satu afiliasi untuk tiap penulis diperbolehkan.</p>\r\n<p>Abstrak dalam Bahasa Inggris ditempatkan dengan jarak satu spasi ganda di bawah afiliasi dan alamat surat, dimulai dengan judul (<em>Abstract</em>), <em>centered</em>, 11 <em>point</em>, <em>bold</em>. Isi abstrak dituliskan langsung di bawah judul, <em>justified</em>, 11 <em>point</em>, normal, spasi tunggal. Kata kunci dalam Bahasa Inggris ditempatkan dengan jarak satu spasi tunggal di bawah abstrak, rata kiri, 11 <em>point</em>, <em>italic</em>.</p>\r\n<p>Isi artikel selalu dimulai di halaman dua. Seluruh bagian, kecuali abstrak harus diberi nomor secara berurutan dalam format 1., 2., 3., dan seterusnya. Seluruh sub bagian (jika diperlukan) juga diberi nomor berurutan dalam format 1.1., 1.2., 2.1., 2.2., dan seterusnya.</p>\r\n<p><strong>2.1.2. Judul bagian dan sub bagian</strong><br />Judul untuk bagian ditulis seluruhnya menggunakan huruf kapital. Judul untuk sub bagian pertama ditulis dengan huruf kapital di setiap awal kata (kecuali kata penghubung). Judul untuk sub bagian 2 dan seterusnya ditulis dengan huruf kapital di kata pertama saja. Seluruh judul untuk bagian dan sub bagian ditulis dengan huruf tebal (<em>bold</em>). Judul dan sub judul sebaiknya tidak lebih dari tiga tingkat/level.</p>\r\n<p><strong>2.2. Gambar dan Tabel</strong><br />Seluruh gambar termasuk foto diberi keterangan di bagian bawah gambar, sedangkan seluruh keterangan untuk tabel ditempatkan di atas tabel. Seluruh keterangan ditempatkan tepat di tengah (<em>centered</em>). Keterangan agar mengikuti format berikut: Gambar 1. Keterangan Gambar Jurnal Wimba, dan Tabel 1. Keterangan Tabel Jurnal Wimba, dan seterusnya. Seluruh gambar dan tabel agar diberi nomor berurutan sesuai kemunculan mereka di dalam artikel serta ditempatkan sedekat mungkin dengan isi artikel yang merujuk pada gambar dan/atau tabel tersebut. Setiap keterangan gambar agar dilengkapi dengan sumber atau rujukannya.</p>\r\n<p><strong>2.2.1. Penempatan gambar dan tabel</strong><br />Gambar dan tabel lebih disukai yang memiliki ukuran maksimal sama dengan lebar kolom antar margin (65,5mm) dengan letak tepat di tengah (centered).</p>\r\n<p style="text-align: center;">Tabel 1. Keterangan Tabel Jurnal</p>\r\n<table style="margin-left: auto; margin-right: auto;" border="0">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2">Questions</td>\r\n<td colspan="2">Responses</td>\r\n</tr>\r\n<tr>\r\n<td>M</td>\r\n<td>SD</td>\r\n</tr>\r\n<tr>\r\n<td>Q1. Camera-ready format</td>\r\n<td>5.35</td>\r\n<td>1.70</td>\r\n</tr>\r\n<tr>\r\n<td>Q2. Guide for authors</td>\r\n<td>4.37</td>\r\n<td>1.71</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Q3. Information on images and</p>\r\n<p>tables for Journal of Wimba</p>\r\n</td>\r\n<td>4.86</td>\r\n<td>1.54</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="text-align: center;">Gambar 1. Keterangan Gambar Jurnal<br />Sumber: Dokumentasi penulis</p>\r\n<p style="text-align: left;">Untuk gambar dan tabel yang memiliki lebar lebih agar ditempatkan di tengah-tengah (<em>centered</em>) lebar halaman, berikut keterangannya. Penempatan dua gambar yang berukuran kecil secara berdampingan diperbolehkan.</p>\r\n<p style="text-align: left;"><strong>2.2.2. Kualitas gambar</strong><br />Setiap gambar termasuk foto harus dalam kondisi baik dan layak cetak (berhubungan dengan kualitas dan resolusi gambar seperti ketajaman dan kualitas garis, dan sebagainya) dengan resolusi minimal 200 dpi serta tampilan hitam putih (<em>grey scale</em>). Hindari gambar dengan resolusi rendah 72 dpi dari internet, kecuali mampu meningkatkan kualitas gambarnya sehingga layak cetak.</p>\r\n<p style="text-align: left;">Gambar yang mengharuskan tampil berwarna penuh (<em>full color</em>) untuk versi cetak diperbolehkan dengan pembiayaan khusus yang dibebankan kepada penulis dan besarnya akan ditentukan kemudian oleh Redaksi. Sedangkan bagi penulis yang memilih untuk menampilkan gambar berwarna untuk edisi online dan hitam putih untuk edisi cetak tidak dikenakan biaya tambahan.</p>\r\n<p style="text-align: left;"><strong>3. KUTIPAN DAN REFERENSI</strong><br />Penulisan kutipan (<em>citation</em>) dalam Jurnal Wimba menggunakan sistem Vancouver. Rujukan referensi dalam teks dituliskan langsung mengikuti kutipannya dan diberi nomor urut sesuai kemunculannya yang ditempatkan dalam tanda kurung siku, seperti [1], [2], dan seterusnya. Referensi yang muncul secara berurutan dalam satu kutipan agar dituliskan secara gabungan dengan merunut nomor awal dan akhir dengan tanda hubung (-) di tengahnya, seperti [2-6] atau [4-8, 10, 16].</p>\r\n<p style="text-align: left;">Referensi dalam teks dikumpulkan di bagian akhir artikel. Seluruh referensi disusun berdasarkan urutan kemunculan-nya di dalam teks serta diberi nomor urut dalam tanda kurung siku, seperti [1], [2] dan seterusnya, diikuti keterangan referensi yang ditulis menggunakan sistem Vancouver. Beberapa contoh penulisan referensi dapat dilihat pada bagian akhir petunjuk ini.</p>\r\n<p style="text-align: left;"><strong>4. PROSES PENGAJUAN ARTIKEL JURNAL</strong><br />Artikel yang diajukan dalam bentuk <em>hard copy</em> terdiri atas satu cetakan asli (<em>original</em>) dan dua salinan (<em>copy</em>) di kertas ukuran A4, berikut formulir pengajuan artikel serta cover letter dimasukkan dalam satu amplop tertutup dan dialamatkan kepada:</p>\r\n<p style="text-align: left;"><strong>Redaksi Jurnal Wimba</strong><br />KK Komunikasi Visual dan Multimedia<br />Fakultas Seni Rupa dan Desain<br />Institut Teknologi Bandung<br />Gedung Desain Lt. 3<br />Jl. Ganesha 10, Bandung, Indonesia<br />Tel/Faks. (022) 251 6567</p>\r\n<p style="text-align: left;">Sedangkan untuk pengajuan secara digital dilakukan dengan mengirimkan satu <em>softcopy</em> artikel dalam format Microsoft Word (doc atau docx) atau PDF, beserta formulir pengajuan artikel serta cover letter ke alamat email Redaksi Jurnal Wimba:<br /><em>jurnal_wimba@yahoo.com</em></p>\r\n<p style="text-align: left;">Seluruh artikel yang masuk akan melalui proses review oleh Mitra Bestari Jurnal Wimba. Artikel yang dinyatakan diterima akan diterbitkan dalam satu edisi Jurnal Wimba versi cetak dan online, yang dijadualkan dipublikasikan dua kali dalam setahun.</p>\r\n<p style="text-align: left;"><strong>5. PERNYATAAN PENGHARGAAN (OPSIONAL)</strong><br />Penulis artikel dapat menyampaikan penghargaan pada penyandang dana riset atau narasumber yang berperan penting dalam penulisan artikel di bagian ini. Bagian pernyataan penghargaan (<em>acknowledgements</em>) ditempatkan di akhir artikel sebelum bagian referensi.</p>\r\n<p style="text-align: left;">6. REFERENSI<br />Penulisan refensi mengacu pada sistem Vancouver. Berikut ini adalah beberapa contohnya:<em></em></p>\r\n<p style="text-align: left;"><em>Buku dengan satu penulis:</em><br />[1] Tabrani P. Bahasa Rupa. Bandung: Penerbit ITB; 1990.</p>\r\n<p style="text-align: left;"><em>Buku dengan dua hingga enam penulis:</em><br />[2] Maddox R, Hogan H. The definition of Visual Communication Design. Jakarta: Level Publishing; 2007.</p>\r\n<p style="text-align: left;"><em>Bab dalam buku dengan editor:</em><br />[3] Baxter M. Psychology in Design. In: Carter O, Carter J, editors. Education for Visual Communicators. London: Academic Publishing, 2006; p. 369-380.</p>\r\n<p style="text-align: left;"><em>Prosiding seminar:</em><br />[4] Anderson HC. Current status of children&rsquo;s picture book. Paper presented at: IRSCE 2006. Proceedings of the 4th Congress of the International Research Society for Children Education; 2006 Sep 8-10; Queensland, Australia. Berlin: Springfield; 2006. p. 182-191.</p>\r\n<p style="text-align: left;"><em>Jurnal (edisi cetak):</em><br />[5] Dalton N. Role of design educators. Wimba Journal of Visual Communication Design. 2009;1(1):8-9.</p>\r\n<p style="text-align: left;"><em>Jurnal (edisi online):</em><br />[6] Mainaky R. Semiotika dalam perancangan desain grafis. Wimba Journal of Visual Communication Design [serial online]. 2009 [cited 2010 Mar 28];2(2):18-23. Available from: Wimba Journal of Visual Communication Design.</p>\r\n<p style="text-align: left;"><em>Film:</em><br />[7] Scorsese M, producer; Lonergan K, director. You can count on me [motion picture]. United States: Paramount Pictures; 2000.</p>', 'string'),
(3, 'en_US', 'title', 'Submission Guide', 'string'),
(4, 'en_US', 'content', '<p>About Journal Komunikasi Wimba.</p>', 'string'),
(4, 'en_US', 'title', 'About Wimba', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `date_reminded_before` datetime DEFAULT NULL,
  `date_reminded_after` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE IF NOT EXISTS `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type_settings`
--

CREATE TABLE IF NOT EXISTS `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE IF NOT EXISTS `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `theses`
--

CREATE TABLE IF NOT EXISTS `theses` (
  `thesis_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `degree` smallint(6) NOT NULL,
  `degree_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `university` varchar(255) NOT NULL,
  `date_approved` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` text,
  `abstract` text,
  `comment` text,
  `student_first_name` varchar(40) NOT NULL,
  `student_middle_name` varchar(40) DEFAULT NULL,
  `student_last_name` varchar(90) NOT NULL,
  `student_email` varchar(90) NOT NULL,
  `student_email_publish` tinyint(4) DEFAULT '0',
  `student_bio` text,
  `supervisor_first_name` varchar(40) NOT NULL,
  `supervisor_middle_name` varchar(40) DEFAULT NULL,
  `supervisor_last_name` varchar(90) NOT NULL,
  `supervisor_email` varchar(90) NOT NULL,
  `discipline` varchar(255) DEFAULT NULL,
  `subject_class` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `coverage_geo` varchar(255) DEFAULT NULL,
  `coverage_chron` varchar(255) DEFAULT NULL,
  `coverage_sample` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `date_submitted` datetime NOT NULL,
  PRIMARY KEY (`thesis_id`),
  KEY `theses_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usage_stats_temporary_records`
--

CREATE TABLE IF NOT EXISTS `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` smallint(6) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `entry_time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salutation` varchar(40) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `salutation`, `first_name`, `middle_name`, `last_name`, `suffix`, `gender`, `initials`, `email`, `url`, `phone`, `fax`, `mailing_address`, `billing_address`, `country`, `locales`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'destraaaa', '6cf764ffdaced82a112b03b1bc490565', NULL, 'destraaaa', NULL, '', NULL, NULL, NULL, 'destra.bintang.perkasa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2015-03-05 11:07:13', NULL, '2015-03-25 11:22:41', 0, NULL, NULL, 0, NULL, 0),
(2, 'destrabintangp', '7e5cdedeb7e3bc03187f0cd0ffd6cd1c', '', 'Destra Bintang', '', 'Perkasa', NULL, '', 'DBP', 'destra.b.p@gmail.com', '', '', '', '', NULL, '', 'en_US:id_ID', '2015-03-24 04:42:30', '2015-03-05 11:49:02', NULL, '2015-03-24 07:44:55', 0, NULL, NULL, 0, NULL, 0),
(3, 'raches', 'ae50d59c24566babf85d9b42cbb9a984', '', 'Rachmawaty', '', 'Rachmawaty', NULL, '', '', 'rachmawatyy@gmail.com', '', '', '', '', NULL, '', '', NULL, '2015-03-16 03:13:30', NULL, '2015-03-24 07:17:54', 0, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE IF NOT EXISTS `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`user_id`, `locale`, `setting_name`, `assoc_type`, `assoc_id`, `setting_value`, `setting_type`) VALUES
(2, 'en_US', 'biography', 0, 0, '', 'string'),
(2, 'en_US', 'signature', 0, 0, '', 'string'),
(2, 'en_US', 'affiliation', 0, 0, '', 'string'),
(2, '', 'orcid', 0, 0, '', 'string'),
(1, '', 'filterEditor', 256, 1, '0', 'int'),
(1, '', 'filterSection', 256, 1, '0', 'int'),
(3, 'en_US', 'biography', 0, 0, '', 'string'),
(3, 'en_US', 'signature', 0, 0, '', 'string'),
(3, 'en_US', 'affiliation', 0, 0, '', 'string'),
(3, '', 'orcid', 0, 0, '', 'string'),
(2, '', 'filterEditor', 256, 1, '0', 'int'),
(2, '', 'filterSection', 256, 1, '0', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.metadata', 'mods34', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.metadata', 'nlm30', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.metadata', 'openurl10', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.auth', 'ldap', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'authorBios', 'AuthorBiosBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'keywordCloud', 'KeywordCloudBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'navigation', 'NavigationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'notification', 'NotificationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'readingTools', 'ReadingToolsBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'relatedItems', 'RelatedItemsBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'role', 'RoleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'user', 'UserBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'donation', 'DonationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:20', 1, 'plugins.blocks', 'help', 'HelpBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.blocks', 'fontSize', 'FontSizeBlockPlugin', 1, 0),
(1, 1, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'abnt', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'apa', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'bibtex', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'cbe', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'endNote', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'mla', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'proCite', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'refMan', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'refWorks', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationFormats', 'turabian', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationLookup', 'crossref', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationLookup', 'isbndb', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationLookup', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationLookup', 'worldcat', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationOutput', 'abnt', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationOutput', 'apa', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationOutput', 'mla', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationOutput', 'vancouver', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationParser', 'freecite', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationParser', 'paracite', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationParser', 'parscit', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.citationParser', 'regex', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:21', 1, 'plugins.gateways', 'metsGateway', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 1, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'announcementFeed', 'AnnouncementFeedPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'backup', 'BackupPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'booksForReview', 'BooksForReviewPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'browse', 'BrowsePlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'coins', 'CoinsPlugin', 1, 0),
(1, 1, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'customLocale', 'CustomLocalePlugin', 1, 0),
(1, 1, 1, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'dataverse', 'DataversePlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'externalFeed', 'ExternalFeedPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'googleViewer', 'GoogleViewerPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'lucene', 'LucenePlugin', 1, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'objectsForReview', 'ObjectsForReviewPlugin', 1, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'openAds', 'OpenAdsPlugin', 1, 0),
(1, 1, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'openAIRE', 'OpenAIREPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'phpMyVisites', 'PhpMyVisitesPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'piwik', 'PiwikPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'pln', 'PLNPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'referral', 'ReferralPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'roundedCorners', 'RoundedCornersPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'sehl', 'SehlPlugin', 1, 0),
(1, 2, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'stopForumSpam', 'StopForumSpamPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'sword', 'SwordPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'thesis', 'ThesisPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'thesisFeed', 'ThesisFeedPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'translator', 'TranslatorPlugin', 1, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'usageEvent', 'UsageEventPlugin', 0, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'usageStats', 'UsageStatsPlugin', 0, 1),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.generic', 'xmlGalley', 'XmlGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:22', 1, 'plugins.implicitAuth', 'shibboleth', '', 0, 1),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'duracloud', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'erudit', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'medra', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'mets', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'pubIds', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'quickSubmit', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.oaiMetadataFormats', 'nlm', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'reviews', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'subscriptions', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'timedViewReport', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'blueSteel', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'classicBlue', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'classicBrown', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'classicGreen', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'classicNavy', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'classicRed', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'custom', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:23', 1, 'plugins.themes', 'desert', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'lilac', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'night', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'redbar', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'steel', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'uncommon', '', 0, 0),
(1, 0, 0, 0, '2015-03-05 11:07:24', 1, 'plugins.themes', 'vanilla', '', 0, 0),
(2, 4, 5, 0, '2015-03-05 11:06:41', 1, 'core', 'ojs2', '', 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
