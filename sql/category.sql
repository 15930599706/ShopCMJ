/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : webprj

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 08/07/2019 21:32:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机');
INSERT INTO `category` VALUES ('2', '电脑');
INSERT INTO `category` VALUES ('3', '连衣裙');
INSERT INTO `category` VALUES ('4', '情侣装');
INSERT INTO `category` VALUES ('5', '口红');
INSERT INTO `category` VALUES ('6', '风衣');
INSERT INTO `category` VALUES ('7', 't恤');

SET FOREIGN_KEY_CHECKS = 1;
