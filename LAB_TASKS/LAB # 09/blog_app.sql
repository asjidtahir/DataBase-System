/* Script file for Blog Application DBMS			*/

DROP DATABASE IF EXISTS fb;

CREATE DATABASE fb;

USE fb;

CREATE TABLE `blog` (
`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`title` text,
`content` text,
`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
INDEX (deleted)
);


CREATE TABLE `audit` (
`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`blog_id` mediumint(8) unsigned NOT NULL,
`changetype` enum('NEW','EDIT','DELETE') NOT NULL,
`changetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE
CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
INDEX (`blog_id`),
INDEX (`changetype`),
INDEX (`changetime`),
CONSTRAINT `FK_audit_blog_id` FOREIGN KEY (`blog_id`) REFERENCES
`blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
