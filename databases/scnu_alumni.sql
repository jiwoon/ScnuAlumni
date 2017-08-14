/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : wechat_data

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-14 09:52:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chat_log`
-- ----------------------------
DROP TABLE IF EXISTS `chat_log`;
CREATE TABLE `chat_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`open_id`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`req_msg`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`resp_msg`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`chat_category`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of chat_log
-- ----------------------------
BEGIN;
INSERT INTO `chat_log` VALUES ('1', 'oA1Hcv9PfGShFQfsHXEdjQrPGPmQ', '1501916038', 'http://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdfead60d5e0dbcd6&redirect_uri=http%3A%2F%2Fzlgvgnb.hk1.mofasuidao.cn%2FWeChat%2FSignUpServlet&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect', '哎，我小学语文是体育老师教的，理解起来有点困难哦', '0'), ('2', 'oA1Hcv3WBD5x2oZd42nR3Ioq0dVs', '1502097009', '格格格咯', '要不我们聊点别的？', '0'), ('3', 'oA1Hcv3WBD5x2oZd42nR3Ioq0dVs', '1502097019', '聊鲁祖', '要不我们聊点别的？', '0'), ('4', 'oA1Hcv3WBD5x2oZd42nR3Ioq0dVs', '1502097034', '给人憋', '没有听懂你说的，能否换个说法？', '0');
COMMIT;

-- ----------------------------
-- Table structure for `joke`
-- ----------------------------
DROP TABLE IF EXISTS `joke`;
CREATE TABLE `joke` (
`joke_id`  int(11) NOT NULL AUTO_INCREMENT ,
`joke_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`joke_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of joke
-- ----------------------------
BEGIN;
INSERT INTO `joke` VALUES ('1', '一日一醉汉酒后打车回家，伸手拦一辆 110 巡警车，并且嚷嚷道:\" 就算你是每公里1块1，也没必要写那么大嘛!\"'), ('2', '公共汽车上老太太怕坐过站,逢站必问。汽车到一站,她一个劲地用雨伞捅司机:\"这是展览中心吗?\" \"不是这是排骨!\"'), ('3', '课堂上老师点名:\"刘华!\"结果下面一孩子大声回道:\"yeah!\" 老师很生气:\" 为什么不说 \' 到 \' ? \" 孩子说 :\" 那个字念 \' 烨 \'......\"'), ('4', '昨天被公司美女同事莫名地亲了一口，心里各种的爽。后来才知道人家玩真心话大冒险，是叫亲一个公司最丑的，最丑的!'), ('5', '有个人第一次在集市上卖冰棍，不好意思叫卖，旁边有一个人正高声喊 \"卖冰棍\"，他只好喊道:\"我也是!\"');
COMMIT;

-- ----------------------------
-- Table structure for `knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`question`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`answer`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`category`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=20

;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
BEGIN;
INSERT INTO `knowledge` VALUES ('1', '我不开心，难受，心烦', ' ', '1'), ('2', '哈哈,嘻嘻,嘿嘿,呵呵', ' ', '1'), ('3', '你知道的真多，好聪明', ' ', '1'), ('4', '给我讲个笑话', ' ', '2'), ('5', '继续', '我们聊到哪了？', '3'), ('6', '再来一个', '那你再给点掌声吧', '3'), ('7', '还有吗?', '你是指什么呢?', '3'), ('8', 'Hi,Hello,嗨,你好?', '你好,很高兴认识你。', '1'), ('9', '你的主人/老板/发明者是谁？', '我老板是阿昌。', '1'), ('10', '你觉得我帅吗？', '还行吧,比我还差那么一点点。', '1'), ('11', '你在干什么呢？', '我在专心和你聊天呀。', '1'), ('12', '你喜欢我吗？', '你叫什么名字呀？', '1'), ('13', '梁,糠糠', '喜欢呀。', '1'), ('14', '明天又要上班了', '好好工作哦，加油！', '1'), ('15', '我好饿', '想吃点啥呢？我请你呀！', '1'), ('16', '什么是幸福？', '幸福是一种感觉。', '1'), ('17', '你是机器人吗？', '是啊，很智能的那种哦[害羞]', '1'), ('18', '唉,哎', '怎么了,叹什么气呢?', '1'), ('19', '谁最美？', '糠糠最美呀!', '1');
COMMIT;

-- ----------------------------
-- Table structure for `knowledge_sub`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_sub`;
CREATE TABLE `knowledge_sub` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`pid`  int(11) NOT NULL ,
`answer`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of knowledge_sub
-- ----------------------------
BEGIN;
INSERT INTO `knowledge_sub` VALUES ('1', '1', '看到我你就开心了'), ('2', '1', '有什么不开心的说来听听'), ('3', '1', '那我陪你聊聊天吧'), ('4', '1', '别难过了，我会一直陪着你的。'), ('5', '2', '看来你今天心情不错啊。'), ('6', '2', '嘿嘿。'), ('7', '2', '哈哈。'), ('8', '2', '嘻嘻。'), ('9', '2', '有什么事这么好笑呀。'), ('10', '3', '我也为你说的很有道理。'), ('11', '3', '因为我是聪明的机器人呀。'), ('12', '3', '这是天生的，没办法，哈哈。[Yeah!]');
COMMIT;

-- ----------------------------
-- Table structure for `signed_users`
-- ----------------------------
DROP TABLE IF EXISTS `signed_users`;
CREATE TABLE `signed_users` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`openId`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`headImgUrl`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`college`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userClass`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`QQ`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`eMail`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`city`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`industry`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`hobby`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`profession`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sex`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of signed_users
-- ----------------------------
BEGIN;
INSERT INTO `signed_users` VALUES ('2', 'oA1HcvwuqMAZgdi6l8hdKV48OCJE', 'http://wx.qlogo.cn/mmopen/751l3K45Dt2RzAhaxKrh2nLjiaS4MKqoznLKG5iaicYdkZnmSsxAb42E1upIicdVSwlTQuBVzxicreM71ljOA5ticnKU8ibHg2OrLNs/0', '李哈哈', '看见了', '东西', '12345678901', '1234567', '123459@QQ.com', '广西壮族自治区 南宁市 西乡塘区', '看见了', '哈哈哈', '摩的', '男'), ('3', 'oA1Hcv4orBPlF9zbMU30YwU9mCKk', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBf2GghXL6DL5QGJD89MYfia3OI3PY2JgEibMLRK4s9JMtEQmGicUN2F1Z9hO6iaoiahkqbWZltnSsgwdSnyZboKMZdic4UnFMicLJdxc/0', '李剑雄', '计算机学院', '2班', '15767973390', '1194353393', '1194353393@qq.com', '北京 北京市 东城区', 'IT', '运动', '工程师', '男'), ('7', 'oA1Hcv9PfGShFQfsHXEdjQrPGPmQ', 'http://wx.qlogo.cn/mmopen/68gBkGFy9oGE04Zmz9AUuMmLiaaViaib7muOm7icDic1DfNtuiadE3J41xwORubVaUy44549lmRAKDSojvqbRKkUKQkrt3MwB45nBR/0', '梁国昌', '物理与电信工程学院', '7班', '12345678901', '1231584648', '13454@163.com', '澳门特别行政区 澳门半岛 圣安多尼堂区', '南宁市', '基本在不在', '继续你不懂', '男');
COMMIT;

-- ----------------------------
-- Table structure for `user_location`
-- ----------------------------
DROP TABLE IF EXISTS `user_location`;
CREATE TABLE `user_location` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`open_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lng`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lat`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`bd09_lng`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`bd09_lat`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of user_location
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user_location_event`
-- ----------------------------
DROP TABLE IF EXISTS `user_location_event`;
CREATE TABLE `user_location_event` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`openId`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_time`  bigint(20) NOT NULL ,
`latitude`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`longitude`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`precision`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of user_location_event
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for `chat_log`
-- ----------------------------
ALTER TABLE `chat_log` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `joke`
-- ----------------------------
ALTER TABLE `joke` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `knowledge`
-- ----------------------------
ALTER TABLE `knowledge` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for `knowledge_sub`
-- ----------------------------
ALTER TABLE `knowledge_sub` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `signed_users`
-- ----------------------------
ALTER TABLE `signed_users` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `user_location`
-- ----------------------------
ALTER TABLE `user_location` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `user_location_event`
-- ----------------------------
ALTER TABLE `user_location_event` AUTO_INCREMENT=1;
