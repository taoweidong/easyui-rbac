/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2019-07-14 16:04:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crm_attachment
-- ----------------------------
DROP TABLE IF EXISTS `crm_attachment`;
CREATE TABLE `crm_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mo4u1f5i9c0uq531tkeqaw5kd` (`file_path`),
  KEY `FKmkoq53o6qwxpmiyerl1vm7vus` (`member_id`),
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_attachment
-- ----------------------------
INSERT INTO `crm_attachment` VALUES ('5', 'image/png', '/attachment/avatar\\2019\\07\\6452c561-8bf0-43fc-894b-f01f63e44b95.png', '68819', 'foot.png', 'png', 'AVATAR', '2019-07-14 13:25:03', '1');
INSERT INTO `crm_attachment` VALUES ('6', 'image/png', '/attachment/avatar\\2019\\07\\02bfe38c-2c70-4914-b163-497907cdb3d5.png', '68819', 'foot.png', 'png', 'AVATAR', '2019-07-14 13:26:09', '1');
INSERT INTO `crm_attachment` VALUES ('7', 'image/png', '/attachment/avatar\\2019\\07\\d264cfb2-2ea9-48fd-a7ae-8184b1a9a925.png', '68819', 'foot.png', 'png', 'AVATAR', '2019-07-14 13:26:31', '1');
INSERT INTO `crm_attachment` VALUES ('8', 'image/png', '/attachment/avatar\\2019\\07\\32056262-d10b-46cc-b841-86d3b36572e6.png', '68819', 'foot.png', 'png', 'AVATAR', '2019-07-14 13:28:19', '1');
INSERT INTO `crm_attachment` VALUES ('9', 'image/png', 'D:\\importFile\\avatar\\2019\\07\\5c3d4efe-97b2-45c5-8416-c79a9c374a2f.png', '68819', 'foot.png', 'png', 'AVATAR', '2019-07-14 13:34:12', '1');

-- ----------------------------
-- Table structure for crm_member
-- ----------------------------
DROP TABLE IF EXISTS `crm_member`;
CREATE TABLE `crm_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(256) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `gender` varchar(16) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `real_name` varchar(64) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `user_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_buu6wvc5p13mxal1lon5e5o1p` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_member
-- ----------------------------
INSERT INTO `crm_member` VALUES ('1', '/images/default.gif', 'admin@qq.com', 'BOY', '2019-07-13 00:00:00', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'Taowd0', '', 'admin', 'admin');
INSERT INTO `crm_member` VALUES ('2', '/images/default.gif', '54665542135@qq.com', 'BOY', '2019-07-09 00:00:00', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', '张三', '', '15769332532', 'zhangsan');

-- ----------------------------
-- Table structure for crm_member_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_member_role`;
CREATE TABLE `crm_member_role` (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`),
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`),
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `crm_member_role_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `crm_member_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_member_role
-- ----------------------------
INSERT INTO `crm_member_role` VALUES ('1', '8');
INSERT INTO `crm_member_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for crm_resource
-- ----------------------------
DROP TABLE IF EXISTS `crm_resource`;
CREATE TABLE `crm_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) DEFAULT NULL,
  `menu_url` varchar(128) DEFAULT NULL,
  `res_key` varchar(128) NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_type` varchar(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`),
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`),
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`),
  CONSTRAINT `crm_resource_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_resource
-- ----------------------------
INSERT INTO `crm_resource` VALUES ('1', '', '', 'system', '系统管理', 'MENU', '', null, '1');
INSERT INTO `crm_resource` VALUES ('3', '/system/member/list', '/system/member', 'system-member', '用户管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('10', '/system/role/list,/system/role/resource/tree', '/system/role', 'system-role', '角色管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('11', '/system/resource/list', '/system/resource', 'system-resource', '资源管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('12', '', '', 'role-create', '创建角色', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('13', '', '/system/role/delete', 'role-delete', '删除角色', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('14', '/system/role/update,/system/role/save', '', 'role-save', '保存编辑', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('17', '/system/role/resource/save', '', 'reole-resource-save', '分配资源', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('18', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-create', '创建资源', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('19', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-edit', '编辑', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('20', '/system/resource/delete', '', 'resource-delete', '删除', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('21', '/system/member/form,/system/member/save', '', 'member-create', '创建用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('22', '/system/member/delete', '', 'member-delete', '删除用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('23', '/system/member/form,/system/member/update', '', 'member-edit', '编辑用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('26', '/system/member/password/reset', '', 'member-reset-password', '重置密码', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('30', '', '', 'device', '设备管理', 'MENU', '', null, '0');

-- ----------------------------
-- Table structure for crm_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `role_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES ('1', '拥有一部分系统管理功能00', '管理员', '');
INSERT INTO `crm_role` VALUES ('2', '主要可以查看相关业务功能模块的权限', '普通用户', '');
INSERT INTO `crm_role` VALUES ('8', '拥有所有权限信息', '超级管理员', '');

-- ----------------------------
-- Table structure for crm_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_resource`;
CREATE TABLE `crm_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`),
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`),
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `crm_role_resource_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `crm_role_resource_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_role_resource
-- ----------------------------
INSERT INTO `crm_role_resource` VALUES ('2', '1');
INSERT INTO `crm_role_resource` VALUES ('2', '3');
INSERT INTO `crm_role_resource` VALUES ('2', '21');
INSERT INTO `crm_role_resource` VALUES ('2', '30');
