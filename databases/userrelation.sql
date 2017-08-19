/*
Navicat MySQL Data Transfer

Source Server         : 微信数据库
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jason

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-19 08:41:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `userrelation`
-- ----------------------------
DROP TABLE IF EXISTS `userrelation`;
CREATE TABLE `userrelation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `qr_provider` char(50) NOT NULL,
  `qr_receiver` char(50) NOT NULL,
  `qr_ticket` char(100) NOT NULL,
  `qr_time` date DEFAULT NULL,
  `qr_provider_name` char(50) DEFAULT NULL,
  `qr_receiver_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrelation
-- ----------------------------
INSERT INTO `userrelation` VALUES ('1', 'oHOWfju_zEj7Zi5XYMKvchPtrOZ8', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'gQES8jwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVnZyNE5Gc0JhdmUxMDAwME0wN2MAAgS9gYFZAwQAAAAA', '2017-08-02', 'Cora', '我很欣赏你');
INSERT INTO `userrelation` VALUES ('2', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'oHOWfjh5qBiLbHJfDnMZfDubtj0g', 'gQHx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU9fcE1Wc0JhdmUxMDAwMGcwN1gAAgQILIFZAwQAAAAA', '2017-08-02', '我很欣赏你', '阿昌');
INSERT INTO `userrelation` VALUES ('3', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'oHOWfjtj8Ka-ETCmj_Wa_nvrpxaE', 'gQHx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU9fcE1Wc0JhdmUxMDAwMGcwN1gAAgQILIFZAwQAAAAA', '2017-08-02', '我很欣赏你', '__');
INSERT INTO `userrelation` VALUES ('13', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'gQHx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU9fcE1Wc0JhdmUxMDAwMGcwN1gAAgQILIFZAwQAAAAA', '2017-08-17', 'Jason', 'Jason');
INSERT INTO `userrelation` VALUES ('14', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'oHOWfjrIypM3EnIJ5Cd1EG8cwWmQ', 'gQHx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU9fcE1Wc0JhdmUxMDAwMGcwN1gAAgQILIFZAwQAAAAA', '2017-08-18', 'Jason', 'Jason');
