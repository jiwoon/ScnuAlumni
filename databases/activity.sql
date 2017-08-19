/*
Navicat MySQL Data Transfer

Source Server         : 微信数据库
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jason

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-19 08:41:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `activity_name` varchar(20) NOT NULL COMMENT '活动名称',
  `activity_address` varchar(50) NOT NULL COMMENT '活动地点',
  `start_time` varchar(50) NOT NULL COMMENT '活动时间',
  `end_time` varchar(50) NOT NULL,
  `activity_intro` varchar(100) NOT NULL COMMENT '活动介绍',
  `activity_holder` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '活动发起人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('110', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', '羽毛球比赛', '体育馆一号场', '2017-09-14 13:35', '2017-09-14 15:37', '非常精彩，小伙伴快来啊！666', 'Jason');
INSERT INTO `activity` VALUES ('114', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', '篮球', '体育馆', '2017-08-17 19:41', '2017-08-17 19:45', '精彩无极限！你电话试试，就是睡觉觉，就是绝对不会，就是你手机，就是九点半。', 'Jason');
INSERT INTO `activity` VALUES ('117', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', '足球运动', '清华大学田径场', '2017-08-18 15:00', '2017-08-18 17:00', '2013年年底的时候，我看到了网上流传的一个叫做《Java面试题大全》的东西，认真的阅读了以后发现里面的很多题目是重复且没有价值的题目，还有不少的参考答案也是错误的，', 'Jason');
