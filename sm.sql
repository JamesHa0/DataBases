/*
Navicat MySQL Data Transfer

Source Server         : hxm
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : sm

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2019-07-01 17:43:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CNo` char(5) NOT NULL,
  `CName` varchar(30) NOT NULL,
  `CPno` char(5) default NULL,
  `CTime` decimal(3,0) default NULL,
  `CCredits` int(11) default '4',
  `CTerm` char(1) NOT NULL,
  PRIMARY KEY  (`CNo`),
  UNIQUE KEY `CName` (`CName`),
  KEY `CPno` (`CPno`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`CPno`) REFERENCES `course` (`CNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('00001', '数据结构', '00005', '72', '5', '3');
INSERT INTO `course` VALUES ('00002', '英语2', '00009', '36', '3', '2');
INSERT INTO `course` VALUES ('00003', 'C++', null, '54', '4', '3');
INSERT INTO `course` VALUES ('00004', '数据库系统', '00001', '54', '4', '4');
INSERT INTO `course` VALUES ('00005', 'C语言', null, '72', '5', '2');
INSERT INTO `course` VALUES ('00006', '信息系统', '00004', '72', '5', '7');
INSERT INTO `course` VALUES ('00007', '操作系统', '00001', '72', '5', '5');
INSERT INTO `course` VALUES ('00008', '高等数学', null, '72', '5', '1');
INSERT INTO `course` VALUES ('00009', '英语1', null, '54', '4', '1');

-- ----------------------------
-- Table structure for `fstu`
-- ----------------------------
DROP TABLE IF EXISTS `fstu`;
CREATE TABLE `fstu` (
  `Sno` char(8) NOT NULL,
  `Sname` varchar(8) NOT NULL,
  `SSex` enum('女','男') default NULL,
  `SBir` datetime default NULL,
  `Scredits` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fstu
-- ----------------------------
INSERT INTO `fstu` VALUES ('16041102', '王华', '女', '1997-10-09 00:00:00', '4');
INSERT INTO `fstu` VALUES ('16041104', '赵丽', '女', '1998-01-10 00:00:00', '4');
INSERT INTO `fstu` VALUES ('16041105', '郝枚', '女', '1999-05-04 00:00:00', '7');
INSERT INTO `fstu` VALUES ('16041201', '刘宏', '女', '2000-08-09 00:00:00', null);
INSERT INTO `fstu` VALUES ('16041203', '周红', '女', '1997-10-26 00:00:00', '4');
INSERT INTO `fstu` VALUES ('17042209', '侯煦萌', '女', '1999-02-26 00:00:00', '11');
INSERT INTO `fstu` VALUES ('17042209', '侯煦萌', '女', '1999-02-26 00:00:00', '11');

-- ----------------------------
-- Table structure for `sc`
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `SNo` char(8) NOT NULL default '',
  `CNo` char(5) NOT NULL default '',
  `Score` decimal(3,1) default NULL,
  PRIMARY KEY  (`SNo`,`CNo`),
  KEY `CNo` (`CNo`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`SNo`) REFERENCES `student` (`Sno`),
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`CNo`) REFERENCES `course` (`CNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('16041101', '00001', null);
INSERT INTO `sc` VALUES ('16041101', '00005', '62.0');
INSERT INTO `sc` VALUES ('16041101', '00008', '79.0');
INSERT INTO `sc` VALUES ('16041101', '00009', '65.0');
INSERT INTO `sc` VALUES ('16041102', '00001', null);
INSERT INTO `sc` VALUES ('16041102', '00005', '36.0');
INSERT INTO `sc` VALUES ('16041102', '00008', '94.0');
INSERT INTO `sc` VALUES ('16041102', '00009', '36.0');
INSERT INTO `sc` VALUES ('16041103', '00001', null);
INSERT INTO `sc` VALUES ('16041103', '00005', '86.0');
INSERT INTO `sc` VALUES ('16041103', '00008', '65.0');
INSERT INTO `sc` VALUES ('16041103', '00009', '93.0');
INSERT INTO `sc` VALUES ('16041104', '00005', '94.0');
INSERT INTO `sc` VALUES ('16041104', '00008', '35.0');
INSERT INTO `sc` VALUES ('16041104', '00009', '28.0');
INSERT INTO `sc` VALUES ('16041202', '00001', '70.0');
INSERT INTO `sc` VALUES ('16041202', '00005', null);
INSERT INTO `sc` VALUES ('16041202', '00009', '72.0');
INSERT INTO `sc` VALUES ('16041203', '00001', '82.0');
INSERT INTO `sc` VALUES ('16041203', '00005', null);

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Sno` char(8) NOT NULL,
  `Sname` varchar(8) NOT NULL,
  `SSex` enum('女','男') default NULL,
  `SBir` datetime default NULL,
  `Scredits` int(11) default NULL,
  PRIMARY KEY  (`Sno`),
  UNIQUE KEY `Sname` (`Sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('16041101', '李刚', '男', '1998-01-02 00:00:18', '11');
INSERT INTO `student` VALUES ('16041102', '王华', '女', '1997-10-09 00:00:00', '4');
INSERT INTO `student` VALUES ('16041103', '张强', '男', '1999-02-12 00:00:00', '11');
INSERT INTO `student` VALUES ('16041104', '赵丽', '女', '1998-01-10 00:00:00', '4');
INSERT INTO `student` VALUES ('16041105', '郝枚', '女', '1999-05-04 00:00:00', '7');
INSERT INTO `student` VALUES ('16041201', '刘宏', '女', '2000-08-09 00:00:00', null);
INSERT INTO `student` VALUES ('16041202', '梁栋', '男', '1998-10-10 00:00:00', null);
INSERT INTO `student` VALUES ('16041203', '周红', '女', '1997-10-26 00:00:00', '4');
INSERT INTO `student` VALUES ('17042204', '陈晓艺', '女', '1999-02-28 00:00:00', '10');
INSERT INTO `student` VALUES ('17042209', '侯萌萌', '女', '1999-02-26 00:00:00', '11');
INSERT INTO `student` VALUES ('17042217', '刘晶晶', '女', '1999-06-01 00:00:00', '9');
INSERT INTO `student` VALUES ('17042223', '王白杰', '女', null, null);

-- ----------------------------
-- View structure for `h1_hxm`
-- ----------------------------
DROP VIEW IF EXISTS `h1_hxm`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `h1_hxm` AS select `student`.`Sno` AS `sno`,`student`.`Sname` AS `sname`,(`student`.`Scredits` * 1.1) AS `SCredits` from `student`;

-- ----------------------------
-- View structure for `h1_hxm2`
-- ----------------------------
DROP VIEW IF EXISTS `h1_hxm2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `h1_hxm2` AS select `sc`.`SNo` AS `sno`,avg(`sc`.`Score`) AS `Gavg` from `sc` group by `sc`.`SNo`;

-- ----------------------------
-- View structure for `h1_stu1`
-- ----------------------------
DROP VIEW IF EXISTS `h1_stu1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `h1_stu1` AS select `student`.`Sno` AS `sno`,`student`.`Sname` AS `sname`,`sc`.`CNo` AS `cno`,`sc`.`Score` AS `score` from (`student` join `sc`) where ((`student`.`Sno` = `sc`.`SNo`) and (`sc`.`CNo` = _utf8'00001') and (`sc`.`Score` > 50));

-- ----------------------------
-- View structure for `h1_student`
-- ----------------------------
DROP VIEW IF EXISTS `h1_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `h1_student` AS select `student`.`Sno` AS `sno`,`student`.`Sname` AS `sname`,`student`.`SSex` AS `ssex` from `student` where (`student`.`SSex` = _utf8'女') WITH CASCADED CHECK OPTION;

-- ----------------------------
-- View structure for `v2_student`
-- ----------------------------
DROP VIEW IF EXISTS `v2_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2_student` AS select `student`.`Sno` AS `sno`,`student`.`Sname` AS `sname`,`student`.`SSex` AS `ssex` from `student` where (`student`.`SSex` = _utf8'女') WITH CASCADED CHECK OPTION;
