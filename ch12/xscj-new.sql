/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : xscj

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2018-06-03 22:17:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bj`
-- ----------------------------
DROP TABLE IF EXISTS `bj`;
CREATE TABLE `bj` (
  `CLno` char(3) NOT NULL DEFAULT '',
  `CLname` varchar(30) DEFAULT NULL,
  `Mname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CLno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bj
-- ----------------------------
INSERT INTO `bj` VALUES ('J01', '1班', '苏启帆');
INSERT INTO `bj` VALUES ('J02', '2班', '王凯');
INSERT INTO `bj` VALUES ('R01', '1班', '周莉');
INSERT INTO `bj` VALUES ('R02', '2班', '杜江');
INSERT INTO `bj` VALUES ('R03', '3班', null);
INSERT INTO `bj` VALUES ('R04', '4班', null);

-- ----------------------------
-- Table structure for `kc`
-- ----------------------------
DROP TABLE IF EXISTS `kc`;
CREATE TABLE `kc` (
  `Cno` char(3) NOT NULL,
  `CName` varchar(30) NOT NULL,
  `CTerm` char(1) NOT NULL,
  `CTime` decimal(3,0) DEFAULT NULL,
  `CCredits` int(11) DEFAULT '4',
  PRIMARY KEY (`Cno`),
  UNIQUE KEY `CName` (`CName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc
-- ----------------------------
INSERT INTO `kc` VALUES ('101', '计算机基础', '1', '72', '4');
INSERT INTO `kc` VALUES ('102', '程序设计语言', '2', '90', '5');
INSERT INTO `kc` VALUES ('206', '离散数学', '2', '54', '3');
INSERT INTO `kc` VALUES ('208', '数据结构', '3', '72', '4');
INSERT INTO `kc` VALUES ('209', '操作系统', '4', '54', '3');
INSERT INTO `kc` VALUES ('210', '计算机组成原理', '3', '54', '3');
INSERT INTO `kc` VALUES ('212', '数据库系统', '4', '54', '3');
INSERT INTO `kc` VALUES ('301', '计算机网络', '4', '36', '2');
INSERT INTO `kc` VALUES ('302', '人工智能', '4', '36', '2');

-- ----------------------------
-- Table structure for `xs`
-- ----------------------------
DROP TABLE IF EXISTS `xs`;
CREATE TABLE `xs` (
  `Sno` char(8) NOT NULL,
  `SName` varchar(10) NOT NULL,
  `PName` varchar(20) NOT NULL,
  `SSex` varchar(4) NOT NULL,
  `SBir` datetime DEFAULT NULL,
  `Scredits` int(11) NOT NULL DEFAULT '0',
  `CLno` char(3) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Scredits`),
  KEY `SName` (`SName`) USING BTREE,
  KEY `CLno` (`CLno`),
  CONSTRAINT `xs_ibfk_1` FOREIGN KEY (`CLno`) REFERENCES `bj` (`CLno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xs
-- ----------------------------
INSERT INTO `xs` VALUES ('16042101', '高扬', '计算机', '女', '1998-01-02 00:00:00', '50', 'J01');
INSERT INTO `xs` VALUES ('16042102', '贺娇', '计算机', '女', '1997-10-09 00:00:00', '50', 'J01');
INSERT INTO `xs` VALUES ('16042103', '胡山海', '计算机', '男', '1999-02-12 00:00:00', '50', 'J01');
INSERT INTO `xs` VALUES ('16042104', '黄李洁', '计算机', '女', '1998-01-10 00:00:00', '50', 'J01');
INSERT INTO `xs` VALUES ('16042105', '李茜', '计算机', '女', '1999-05-04 00:00:00', '50', 'J01');
INSERT INTO `xs` VALUES ('16042106', '李双龙', '计算机', '男', '2000-08-09 00:00:00', '54', 'J01');
INSERT INTO `xs` VALUES ('16042201', '秦琪', '计算机', '女', '1998-03-10 00:00:00', '52', 'J02');
INSERT INTO `xs` VALUES ('16042202', '邵阳', '计算机', '男', '1998-06-11 00:00:00', '50', 'J02');
INSERT INTO `xs` VALUES ('16042203', '王迪', '计算机', '男', '1998-09-12 00:00:00', '50', 'J02');
INSERT INTO `xs` VALUES ('16042204', '王杰', '计算机', '女', '1997-10-28 00:00:00', '54', 'J02');
INSERT INTO `xs` VALUES ('16042205', '王淑娟', '计算机', '女', '1998-10-04 00:00:00', '50', 'J02');
INSERT INTO `xs` VALUES ('16042208', '王园园', '计算机', '女', '1999-06-30 00:00:00', '54', 'J02');
INSERT INTO `xs` VALUES ('16044101', '王杰', '软件工程', '男', '1998-03-16 00:00:00', '48', 'R01');
INSERT INTO `xs` VALUES ('16044102', '王琳', '软件工程', '女', '1999-11-05 00:00:00', '42', 'R01');
INSERT INTO `xs` VALUES ('16044104', '马琳琳', '软件工程', '女', '1997-04-08 00:00:00', '40', 'R01');
INSERT INTO `xs` VALUES ('16044106', '张强', '软件工程', '男', '1999-05-19 00:00:00', '42', 'R01');
INSERT INTO `xs` VALUES ('16044110', '李洪庆', '软件工程', '男', '1998-07-10 00:00:00', '42', 'R01');
INSERT INTO `xs` VALUES ('16044116', '张亮', '软件工程', '男', '1999-06-26 00:00:00', '44', 'R01');
INSERT INTO `xs` VALUES ('16044118', '刘宏', '软件工程', '女', '1997-05-12 00:00:00', '42', 'R01');
INSERT INTO `xs` VALUES ('16044120', '张强民', '软件工程', '男', '1997-02-23 00:00:00', '42', 'R01');
INSERT INTO `xs` VALUES ('16044121', '周红', '软件工程', '女', '1999-11-14 00:00:00', '50', 'R01');
INSERT INTO `xs` VALUES ('16044208', '黄家焕', '软件工程', '男', '1999-02-03 00:00:00', '52', 'R02');
INSERT INTO `xs` VALUES ('16044209', '赵雯祺', '软件工程', '女', '1999-06-19 00:00:00', '48', 'R02');
INSERT INTO `xs` VALUES ('16044210', '王子安\r', '软件工程', '男', '1998-08-15 00:00:00', '48', 'R02');
INSERT INTO `xs` VALUES ('16044211', '魏成龙\r', '软件工程', '男', '1997-09-06 00:00:00', '47', 'R02');
INSERT INTO `xs` VALUES ('16044212', '孙文传\r', '软件工程', '男', '1998-08-26 00:00:00', '47', 'R02');
INSERT INTO `xs` VALUES ('16044213', '孙丽丹', '软件工程', '女', '1999-11-02 00:00:00', '47', 'R02');

-- ----------------------------
-- Table structure for `xs_kc`
-- ----------------------------
DROP TABLE IF EXISTS `xs_kc`;
CREATE TABLE `xs_kc` (
  `Sno` char(8) NOT NULL,
  `CNo` char(3) NOT NULL,
  `Score` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`CNo`),
  KEY `CNo` (`CNo`),
  CONSTRAINT `xs_kc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `xs` (`Sno`),
  CONSTRAINT `xs_kc_ibfk_2` FOREIGN KEY (`CNo`) REFERENCES `kc` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xs_kc
-- ----------------------------
INSERT INTO `xs_kc` VALUES ('16042101', '101', '80');
INSERT INTO `xs_kc` VALUES ('16042101', '102', '78');
INSERT INTO `xs_kc` VALUES ('16042101', '206', '76');
INSERT INTO `xs_kc` VALUES ('16042102', '102', '78');
INSERT INTO `xs_kc` VALUES ('16042102', '206', '42');
INSERT INTO `xs_kc` VALUES ('16042103', '101', '62');
INSERT INTO `xs_kc` VALUES ('16042103', '102', '70');
INSERT INTO `xs_kc` VALUES ('16042103', '206', '81');
INSERT INTO `xs_kc` VALUES ('16042104', '101', '90');
INSERT INTO `xs_kc` VALUES ('16042104', '102', '56');
INSERT INTO `xs_kc` VALUES ('16042104', '206', '65');
INSERT INTO `xs_kc` VALUES ('16042105', '101', '65');
INSERT INTO `xs_kc` VALUES ('16042105', '102', '71');
INSERT INTO `xs_kc` VALUES ('16042105', '206', '80');
INSERT INTO `xs_kc` VALUES ('16042201', '101', '78');
INSERT INTO `xs_kc` VALUES ('16042201', '102', '80');
INSERT INTO `xs_kc` VALUES ('16042201', '206', '68');
INSERT INTO `xs_kc` VALUES ('16042202', '101', '85');
INSERT INTO `xs_kc` VALUES ('16042202', '102', '64');
INSERT INTO `xs_kc` VALUES ('16042202', '206', '87');
INSERT INTO `xs_kc` VALUES ('16042203', '101', '53');
INSERT INTO `xs_kc` VALUES ('16042203', '102', '93');
INSERT INTO `xs_kc` VALUES ('16042203', '206', '70');
INSERT INTO `xs_kc` VALUES ('16042204', '101', '95');
INSERT INTO `xs_kc` VALUES ('16042204', '102', '90');
INSERT INTO `xs_kc` VALUES ('16042204', '206', '89');
INSERT INTO `xs_kc` VALUES ('16042208', '101', '70');
INSERT INTO `xs_kc` VALUES ('16042208', '102', '90');
INSERT INTO `xs_kc` VALUES ('16042208', '206', '76');
INSERT INTO `xs_kc` VALUES ('16044101', '101', '80');
INSERT INTO `xs_kc` VALUES ('16044102', '101', '65');
INSERT INTO `xs_kc` VALUES ('16044104', '101', '87');
INSERT INTO `xs_kc` VALUES ('16044106', '101', '91');
INSERT INTO `xs_kc` VALUES ('16044110', '101', '76');
INSERT INTO `xs_kc` VALUES ('16044116', '101', '52');
INSERT INTO `xs_kc` VALUES ('16044118', '101', '55');
INSERT INTO `xs_kc` VALUES ('16044120', '101', '82');
INSERT INTO `xs_kc` VALUES ('16044121', '101', '90');
INSERT INTO `xs_kc` VALUES ('16044210', '212', null);
INSERT INTO `xs_kc` VALUES ('16044211', '212', null);
