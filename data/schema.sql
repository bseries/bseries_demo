# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.0.32-MariaDB-0+deb8u1)
# Datenbank: bseries_demo
# Erstellt am: 2017-11-10 15:54:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `checksum` char(32) DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unique index set on user_id+checksum instead of user_id+dirn';



# Export von Tabelle media_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_attachments`;

CREATE TABLE `media_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(11) unsigned NOT NULL,
  `model` varchar(50) NOT NULL,
  `foreign_key` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poly` (`model`,`foreign_key`),
  KEY `media_file` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle media_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_versions`;

CREATE TABLE `media_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(11) unsigned NOT NULL,
  `url` varchar(250) NOT NULL DEFAULT '',
  `version` varchar(10) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `checksum` char(32) DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'unknown',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`media_id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unique index set on user_id+checksum instead of user_id+dirn';



# Export von Tabelle posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) unsigned NOT NULL,
  `site` varchar(50) DEFAULT NULL,
  `cover_media_id` int(11) DEFAULT NULL,
  `authors` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT '',
  `teaser` text,
  `body` text,
  `tags` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `is_promoted` tinyint(1) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '0',
  `published` date NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_published` (`is_published`),
  KEY `is_promoted` (`is_promoted`),
  KEY `published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle social_stream
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_stream`;

CREATE TABLE `social_stream` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `foreign_key` varchar(100) NOT NULL,
  `cover_media_id` int(11) unsigned DEFAULT NULL,
  `search` varchar(100) NOT NULL DEFAULT 'default',
  `author` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `body` text NOT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `raw` text NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_promoted` tinyint(1) NOT NULL DEFAULT '0',
  `published` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` text,
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `number` varchar(100) NOT NULL DEFAULT '',
  `session_key` varchar(250) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `auth_token` varchar(250) DEFAULT NULL,
  `reset_answer` varchar(250) DEFAULT NULL,
  `reset_token` varchar(250) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `locale` varchar(5) DEFAULT 'de',
  `timezone` varchar(100) NOT NULL DEFAULT 'UTC',
  `country` char(2) DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_notified` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `number` (`number`),
  KEY `session_key` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
