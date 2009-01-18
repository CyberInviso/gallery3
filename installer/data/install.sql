DROP TABLE IF EXISTS `sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `access_caches`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `access_caches` (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) default NULL,
  `view_full_1` tinyint(2) NOT NULL default '0',
  `edit_1` tinyint(2) NOT NULL default '0',
  `view_full_2` tinyint(2) NOT NULL default '0',
  `edit_2` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `access_caches` VALUES (1,1,1,0,1,1);
DROP TABLE IF EXISTS `access_intents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `access_intents` (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) default NULL,
  `view_1` tinyint(1) default NULL,
  `view_full_1` tinyint(1) default NULL,
  `edit_1` tinyint(1) default NULL,
  `view_2` tinyint(1) default NULL,
  `view_full_2` tinyint(1) default NULL,
  `edit_2` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `access_intents` VALUES (1,1,1,1,0,1,1,1);
DROP TABLE IF EXISTS `graphics_rules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graphics_rules` (
  `id` int(9) NOT NULL auto_increment,
  `priority` int(9) NOT NULL,
  `module_name` varchar(64) NOT NULL,
  `target` varchar(32) NOT NULL,
  `operation` varchar(64) NOT NULL,
  `args` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `graphics_rules` VALUES (1,100,'core','thumb','resize','a:3:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:6:\"master\";i:2;}'),(2,100,'core','resize','resize','a:3:{s:5:\"width\";i:640;s:6:\"height\";i:480;s:6:\"master\";i:2;}');
DROP TABLE IF EXISTS `incoming_translations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `incoming_translations` (
  `id` int(9) NOT NULL auto_increment,
  `key` binary(16) NOT NULL,
  `locale` char(10) NOT NULL,
  `message` text NOT NULL,
  `translation` text,
  `revision` int(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`,`locale`),
  KEY `locale_key` (`locale`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `items` (
  `album_cover_item_id` int(9) default NULL,
  `created` int(9) default NULL,
  `description` varchar(255) default NULL,
  `height` int(9) default NULL,
  `id` int(9) NOT NULL auto_increment,
  `left` int(9) NOT NULL,
  `level` int(9) NOT NULL,
  `mime_type` varchar(64) default NULL,
  `name` varchar(255) default NULL,
  `owner_id` int(9) default NULL,
  `parent_id` int(9) NOT NULL,
  `resize_height` int(9) default NULL,
  `resize_width` int(9) default NULL,
  `resize_dirty` tinyint(1) default '1',
  `right` int(9) NOT NULL,
  `thumb_height` int(9) default NULL,
  `thumb_width` int(9) default NULL,
  `thumb_dirty` tinyint(1) default '1',
  `title` varchar(255) default NULL,
  `type` varchar(32) NOT NULL,
  `updated` int(9) default NULL,
  `view_count` int(9) default '0',
  `width` int(9) default NULL,
  `view_1` tinyint(2) NOT NULL default '0',
  `view_2` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `items` VALUES (NULL,1232112015,'Welcome to your Gallery3',NULL,1,1,1,NULL,NULL,2,0,NULL,NULL,1,2,NULL,NULL,1,'Gallery','album',1232112015,5,NULL,1,1);
DROP TABLE IF EXISTS `logs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logs` (
  `id` int(9) NOT NULL auto_increment,
  `category` varchar(64) default NULL,
  `html` varchar(255) default NULL,
  `message` text,
  `referer` varchar(255) default NULL,
  `severity` int(9) default '0',
  `timestamp` int(9) default '0',
  `url` varchar(255) default NULL,
  `user_id` int(9) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `messages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `messages` (
  `id` int(9) NOT NULL auto_increment,
  `key` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  `severity` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `messages` VALUES (1,'akismet_config','Akismet is not quite ready!  Please provide an <a href=\"/gallery3/index.php/admin/akismet\">API Key</a>','3');
DROP TABLE IF EXISTS `modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `modules` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `version` int(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `modules` VALUES (1,'core',1),(2,'user',1),(3,'comment',1),(4,'akismet',1);
DROP TABLE IF EXISTS `permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permissions` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `display_name` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `permissions` VALUES (1,'view','View'),(2,'view_full','View Full Size'),(3,'edit','Edit');
DROP TABLE IF EXISTS `tasks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tasks` (
  `callback` varchar(128) default NULL,
  `context` text NOT NULL,
  `done` tinyint(1) default '0',
  `id` int(9) NOT NULL auto_increment,
  `updated` int(9) default NULL,
  `name` varchar(128) default NULL,
  `percent_complete` int(9) default '0',
  `state` varchar(32) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `themes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `themes` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `version` int(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `themes` VALUES (1,'default',1),(2,'admin_default',1);
DROP TABLE IF EXISTS `vars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vars` (
  `id` int(9) NOT NULL auto_increment,
  `module_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `module_name` (`module_name`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `vars` VALUES (1,'core','active_site_theme','default'),(2,'core','active_admin_theme','admin_default'),(3,'core','page_size','9'),(4,'core','thumb_size','200'),(5,'core','resize_size','640'),(6,'core','graphics_toolkit','imagemagick'),(7,'core','graphics_toolkit_path','/usr/bin'),(8,'core','dashboard_blocks','a:2:{s:7:\"sidebar\";a:3:{i:1897057832;a:2:{i:0;s:4:\"core\";i:1;s:5:\"stats\";}i:863091211;a:2:{i:0;s:4:\"core\";i:1;s:13:\"platform_info\";}i:1286303073;a:2:{i:0;s:4:\"core\";i:1;s:12:\"project_news\";}}s:4:\"main\";a:4:{i:1969666309;a:2:{i:0;s:4:\"core\";i:1;s:7:\"welcome\";}i:353682022;a:2:{i:0;s:4:\"core\";i:1;s:12:\"photo_stream\";}i:1636721943;a:2:{i:0;s:4:\"core\";i:1;s:11:\"log_entries\";}i:458629768;a:2:{i:0;s:7:\"comment\";i:1;s:15:\"recent_comments\";}}}'),(9,'core','version','3.0'),(10,'comment','spam_caught','0');
DROP TABLE IF EXISTS `comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comments` (
  `author_id` int(9) default NULL,
  `created` int(9) NOT NULL,
  `guest_email` varchar(128) default NULL,
  `guest_name` varchar(128) default NULL,
  `guest_url` varchar(255) default NULL,
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) NOT NULL,
  `server_http_accept_charset` varchar(64) default NULL,
  `server_http_accept_encoding` varchar(64) default NULL,
  `server_http_accept_language` varchar(64) default NULL,
  `server_http_accept` varchar(128) default NULL,
  `server_http_connection` varchar(64) default NULL,
  `server_http_host` varchar(64) default NULL,
  `server_http_referer` varchar(255) default NULL,
  `server_http_user_agent` varchar(128) default NULL,
  `server_query_string` varchar(64) default NULL,
  `server_remote_addr` varchar(32) default NULL,
  `server_remote_host` varchar(64) default NULL,
  `server_remote_port` varchar(16) default NULL,
  `state` char(15) default 'unpublished',
  `text` text,
  `updated` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groups` (
  `id` int(9) NOT NULL auto_increment,
  `name` char(64) default NULL,
  `special` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `groups` VALUES (1,'Everybody',1),(2,'Registered Users',1);
DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `login_count` int(10) unsigned NOT NULL default '0',
  `last_login` int(10) unsigned NOT NULL default '0',
  `email` varchar(64) default NULL,
  `admin` tinyint(1) default '0',
  `guest` tinyint(1) default '0',
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO `users` VALUES (1,'guest','Guest User','mP`hf6bf25b90e2765ffe2e65737b142dba5',0,0,NULL,0,1,NULL),(2,'admin','Gallery Administrator','SU]63326748b5026b4d7b5d5c8c83a266743',1,1232172351,NULL,1,0,NULL);