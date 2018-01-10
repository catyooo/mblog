/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost
 Source Database       : db_mblog

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : utf-8

 Date: 09/29/2017 17:34:11 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `mto_attachs`
-- ----------------------------
DROP TABLE IF EXISTS `mto_attachs`;
CREATE TABLE `mto_attachs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `height` int(11) NOT NULL,
  `original` varchar(255) DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mto_auth_menu`;
CREATE TABLE `mto_auth_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fynq2bfwabynqmnauw69b7ulc` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_auth_menu`
-- ----------------------------
BEGIN;
INSERT INTO `mto_auth_menu` VALUES ('1', '根目录', '', '', '1', '/', '0', null), ('2', '后台管理', null, 'admin', '1', 'admin', '1', null), ('4', '文章管理', null, 'posts:view', '2', 'admin/posts/list', '2', 'fa fa-clone icon-xlarge'), ('5', '文章修改', null, 'posts:edit', '1', null, '4', null), ('6', '文章查看', null, 'posts:view', '1', '', '4', null), ('8', '评论管理', null, 'comments:view', '4', 'admin/comments/list', '2', 'fa fa-comments-o icon-xlarge'), ('9', '删除评论', null, 'comments:edit', '1', null, '8', null), ('10', '评论查看', null, 'comments:view', '1', '', '8', null), ('11', '栏目管理', null, 'group:view', '5', 'admin/group/list', '2', 'fa fa-tags icon-xlarge'), ('12', '删除栏目', null, 'group:edit', '1', null, '11', null), ('13', '修改栏目', null, 'group:edit', '2', null, '11', null), ('15', '系统配置', null, 'config:view', '6', 'admin/config/', '2', 'fa fa-sun-o icon-xlarge'), ('16', '修改配置', null, 'config:edit', '1', null, '15', null), ('17', '用户管理', null, 'users:view', '3', 'admin/users/list', '2', 'fa fa-user icon-xlarge'), ('18', '禁用用户', null, 'users:edit', '1', '', '17', null), ('19', '修改密码', null, 'users:edit', '1', null, '17', null), ('20', '用户查看', null, 'users:view', '1', '', '17', null), ('35', '角色管理', null, 'roles:view', '7', 'admin/roles/list', '2', 'fa fa fa-registered icon-xlarge'), ('36', '角色修改', null, 'roles:edit', '0', null, '35', null), ('37', '角色查看', null, 'roles:view', '1', '', '35', null), ('41', '菜单管理', null, 'authMenus:view', '8', 'admin/authMenus/list', '2', 'fa fa-reorder icon-xlarge'), ('42', '菜单修改', null, 'authMenus:edit', '0', '', '41', null), ('43', '菜单查看', null, 'authMenus:view', '1', '', '41', null), ('45', '友情链接', null, 'friendLink:view', '8', 'admin/friendLink/list', '2', 'fa fa-link'), ('46', '友情链接修改', null, 'friendLink:edit', '0', '', '45', null), ('47', '友情链接查看', null, 'friendLink:view', '0', '', '45', null);
COMMIT;

-- ----------------------------
--  Table structure for `mto_comments`
-- ----------------------------
DROP TABLE IF EXISTS `mto_comments`;
CREATE TABLE `mto_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_config`
-- ----------------------------
DROP TABLE IF EXISTS `mto_config`;
CREATE TABLE `mto_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_99vo6d7ci4wlxruo3gd0q2jq8` (`key_`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_config`
-- ----------------------------
BEGIN;
INSERT INTO `mto_config` VALUES ('1', 'site_name', '0', 'Mtons'), ('2', 'site_welcomes', '0', 'Mtons, 轻松分享你的兴趣'), ('3', 'site_domain', '0', 'http://mtons.com'), ('4', 'site_keywords', '0', 'mtons,博客,社区,摄影,旅游,艺术,娱乐'), ('5', 'site_description', '0', 'Mtons, 轻松分享你的兴趣. 便捷的文字、图片发布,扁平化的响应式设计,美观、大气,是您记录生活的最佳选择'), ('6', 'site_editor', '1', 'ueditor'), ('7', 'site_metas', '0', ''), ('8', 'site_copyright', '0', ''), ('9', 'site_icp', '0', ''), ('10', 'site_advs_right', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `mto_favors`
-- ----------------------------
DROP TABLE IF EXISTS `mto_favors`;
CREATE TABLE `mto_favors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_feeds`
-- ----------------------------
DROP TABLE IF EXISTS `mto_feeds`;
CREATE TABLE `mto_feeds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_follows`
-- ----------------------------
DROP TABLE IF EXISTS `mto_follows`;
CREATE TABLE `mto_follows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `follow_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t38um6ivtsbk34xph98levx4x` (`follow_id`),
  KEY `FK_3grh3868ek909r524m0kphmux` (`user_id`),
  CONSTRAINT `FK_3grh3868ek909r524m0kphmux` FOREIGN KEY (`user_id`) REFERENCES `mto_users` (`id`),
  CONSTRAINT `FK_t38um6ivtsbk34xph98levx4x` FOREIGN KEY (`follow_id`) REFERENCES `mto_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `mto_friend_link`;
CREATE TABLE `mto_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_group`
-- ----------------------------
DROP TABLE IF EXISTS `mto_group`;
CREATE TABLE `mto_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2s863lts1h6m7c30152262cvj` (`key_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_group`
-- ----------------------------
BEGIN;
INSERT INTO `mto_group` VALUES ('1', 'blog', '博文', '0'), ('2', 'web', 'WEB', '0'), ('3', 'tutorial', '教程', '0');
COMMIT;

-- ----------------------------
--  Table structure for `mto_logs`
-- ----------------------------
DROP TABLE IF EXISTS `mto_logs`;
CREATE TABLE `mto_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mto_menu`;
CREATE TABLE `mto_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `target` varchar(18) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_notify`
-- ----------------------------
DROP TABLE IF EXISTS `mto_notify`;
CREATE TABLE `mto_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `event` int(11) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_posts`
-- ----------------------------
DROP TABLE IF EXISTS `mto_posts`;
CREATE TABLE `mto_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `favors` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `group_` int(11) DEFAULT NULL,
  `images` int(11) NOT NULL,
  `last_image_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_posts_attach`
-- ----------------------------
DROP TABLE IF EXISTS `mto_posts_attach`;
CREATE TABLE `mto_posts_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `height` int(11) NOT NULL,
  `original` varchar(255) DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_posts_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `mto_posts_attribute`;
CREATE TABLE `mto_posts_attribute` (
  `id` bigint(20) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_role`
-- ----------------------------
DROP TABLE IF EXISTS `mto_role`;
CREATE TABLE `mto_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_role`
-- ----------------------------
BEGIN;
INSERT INTO `mto_role` VALUES ('1', '管理员'), ('2', '普通用户'), ('3', '半个管理员');
COMMIT;

-- ----------------------------
--  Table structure for `mto_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mto_role_menu`;
CREATE TABLE `mto_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  KEY `FK_td8ih8aorlkpyop3gemfqxmbt` (`menu_id`),
  KEY `FK_5o5vaxfyg0d1qa0142dnkruiv` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `mto_role_menu` VALUES ('1', '1'), ('1', '2'), ('1', '4'), ('1', '8'), ('1', '11'), ('1', '15'), ('1', '17'), ('1', '35'), ('1', '41'), ('1', '45'), ('1', '5'), ('1', '6'), ('1', '9'), ('1', '10'), ('1', '12'), ('1', '13'), ('1', '16'), ('1', '18'), ('1', '19'), ('1', '20'), ('1', '36'), ('1', '37'), ('1', '42'), ('1', '43'), ('1', '46'), ('1', '47');
COMMIT;

-- ----------------------------
--  Table structure for `mto_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `mto_user_role`;
CREATE TABLE `mto_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK_fhtla2vc199mv0ru2r2kvakha` (`role_id`),
  KEY `FK_b4m7ef0uvkr4efrscf8r1ehy2` (`user_id`),
  CONSTRAINT `FK_b4m7ef0uvkr4efrscf8r1ehy2` FOREIGN KEY (`user_id`) REFERENCES `mto_users` (`id`),
  CONSTRAINT `FK_fhtla2vc199mv0ru2r2kvakha` FOREIGN KEY (`role_id`) REFERENCES `mto_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `mto_user_role` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `mto_users`
-- ----------------------------
DROP TABLE IF EXISTS `mto_users`;
CREATE TABLE `mto_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT '/assets/images/ava/default.png',
  `updated` datetime DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `source` int(11) NOT NULL,
  `active_email` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `fans` int(11) NOT NULL,
  `favors` int(11) NOT NULL,
  `follows` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mto_users`
-- ----------------------------
BEGIN;
INSERT INTO `mto_users` VALUES ('1', '2015-08-06 17:52:41', 'admin@mtons.com', '2017-09-29 17:25:22', null, '3TGCQF25BLHU9R7IQUITN0FCC5', '0', 'admin', '小豆丁', '/assets/images/ava/default.png', '2015-07-26 11:08:36', '0', '1', '0', '1', '0', '0', '0', '0', '4', null);
COMMIT;

-- ----------------------------
--  Table structure for `mto_users_open_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `mto_users_open_oauth`;
CREATE TABLE `mto_users_open_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `expire_in` varchar(255) DEFAULT NULL,
  `oauth_code` varchar(255) DEFAULT NULL,
  `oauth_type` int(11) DEFAULT NULL,
  `oauth_user_id` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mto_verify`
-- ----------------------------
DROP TABLE IF EXISTS `mto_verify`;
CREATE TABLE `mto_verify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  `target` varchar(96) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m7p0b526c4xlgjn787t22om2g` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
