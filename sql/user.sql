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

 Date: 08/07/2019 21:32:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('07508f4f-4e28-476c-92e4-9ca2329944d2', '123456', '123', NULL, NULL, '1442132143@qq.com', '1562564497017.png');
INSERT INTO `user` VALUES ('1', 'cmj', 'cmj', NULL, NULL, NULL, '');
INSERT INTO `user` VALUES ('66c7a41d-5f1c-41db-a020-0b2786178e9d', 'admin', 'admin', '', '', '254153639@qq.com', NULL);
INSERT INTO `user` VALUES ('67d31d03-abd7-4a80-8770-6a4cf58b37f0', '123', '123', NULL, NULL, '1441368451@qq.com', '');

SET FOREIGN_KEY_CHECKS = 1;
