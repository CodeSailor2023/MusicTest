/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24)
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24)
 File Encoding         : 65001

 Date: 20/08/2024 08:10:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for basic_plays
-- ----------------------------
DROP TABLE IF EXISTS `basic_plays`;
CREATE TABLE `basic_plays`  (
  `id` int(11) NOT NULL,
  `music_score_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `speed` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `link` int(11) NOT NULL COMMENT 'link表的逻辑外键',
  `site` int(11) NULL DEFAULT NULL COMMENT 'sites表的逻辑外键',
  PRIMARY KEY (`id`, `link`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_plays
-- ----------------------------
INSERT INTO `basic_plays` VALUES (285, '\\/game\\/rhythm\\/2020-4-28\\/1588056363265i3iKHY.json', 50, 1, 28, NULL);
INSERT INTO `basic_plays` VALUES (289, '\\/game\\/rhythm\\/2020-4-28\\/1588056546159ZFQbGc.json', 80, 1, 361, NULL);
INSERT INTO `basic_plays` VALUES (289, '\\/game\\/rhythm\\/2020-4-28\\/1588056546159ZFQbGc.json', 80, 1, 377, NULL);

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (2, '第一册', 2);
INSERT INTO `courses` VALUES (5, '第二册', 3);

-- ----------------------------
-- Table structure for lessons
-- ----------------------------
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `course` int(11) NULL DEFAULT NULL COMMENT 'courses表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lessons
-- ----------------------------
INSERT INTO `lessons` VALUES (3, '第一课', 1, 2);
INSERT INTO `lessons` VALUES (4, '第二课', 2, 2);
INSERT INTO `lessons` VALUES (43, '第一课', 1, 5);
INSERT INTO `lessons` VALUES (44, '第二课', 2, 5);

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `res_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link_type` int(11) UNSIGNED NULL DEFAULT NULL,
  `custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lesson` int(11) NULL DEFAULT NULL COMMENT 'lessons表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1088 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES (15, '欢迎', 1, '\\/game\\/2019-9-11\\/156821131678263QmjP.zip', 18, NULL, 3);
INSERT INTO `links` VALUES (16, '教学目标', 2, '\\/game\\/2020-4-7\\/1586243075775zEE6Xk.zip', 1, NULL, 3);
INSERT INTO `links` VALUES (17, '认识架子鼓', 3, '\\/game\\/2019-9-11\\/1568211332039B67mfa.zip', 16, NULL, 3);
INSERT INTO `links` VALUES (18, '正确的握槌方法', 4, '\\/game\\/2019-9-26\\/1569513050433D2nXFf.zip', 16, NULL, 3);
INSERT INTO `links` VALUES (19, '正确的坐姿', 5, '\\/game\\/2019-9-26\\/1569513072049FfnkQa.zip', 16, NULL, 3);
INSERT INTO `links` VALUES (20, '正确的击打方式', 6, '\\/game\\/2020-4-28\\/1588058466280pJ4NtY.zip', 16, NULL, 3);
INSERT INTO `links` VALUES (21, '节奏型练习', 7, '\\/game\\/2019-9-11\\/1568211367876EB3WGc.zip', 3, '\'measurePerLine\' : 8,\'jumpPrev\':12', 3);
INSERT INTO `links` VALUES (22, '教师示范', 8, '\\/game\\/2020-4-28\\/15880568202333WKYDF.txt', 11, NULL, 3);
INSERT INTO `links` VALUES (23, '节奏王者', 9, '\\/game\\/2019-9-11\\/1568211392887MFFHTN.zip', 15, '\'count\': 25', 3);
INSERT INTO `links` VALUES (24, '能力雷达图', 10, '\\/game\\/2019-9-11\\/15682114004434REJ4s.zip', 19, NULL, 3);
INSERT INTO `links` VALUES (25, '再见', 11, '\\/game\\/2020-7-6\\/1594030303848E4jcZS.zip', 20, NULL, 3);
INSERT INTO `links` VALUES (26, '欢迎', 1, '\\/game\\/2019-9-11\\/1568211431908i3kwTK.zip', 18, NULL, 4);
INSERT INTO `links` VALUES (27, '教学目标', 2, '\\/game\\/2020-4-28\\/1588058632153pYkBsQ.zip', 1, NULL, 4);
INSERT INTO `links` VALUES (28, '基本功练习', 3, '\\/game\\/2019-9-26\\/1569513212966B6ZwXb.zip', 25, NULL, 4);
INSERT INTO `links` VALUES (29, '乐理知识', 4, '\\/game\\/2019-9-26\\/1569513241400BceSaC.zip', 7, NULL, 4);
INSERT INTO `links` VALUES (30, '乐理知识', 5, '\\/game\\/2019-9-26\\/1569513258184jst7Ki.zip', 6, NULL, 4);
INSERT INTO `links` VALUES (31, '听力练习', 6, '\\/game\\/2020-7-6\\/1594030767797mfWKxQ.zip', 22, NULL, 4);
INSERT INTO `links` VALUES (32, '节奏型练习', 7, '\\/game\\/2019-9-11\\/1568211520121Rm3BCs.zip', 3, NULL, 4);
INSERT INTO `links` VALUES (33, '教师示范', 8, '\\/game\\/2020-4-28\\/1588056843983YwzmXz.txt', 11, NULL, 4);
INSERT INTO `links` VALUES (34, '节奏王者', 9, '\\/game\\/2019-9-11\\/1568211549203zCrRQQ.zip', 15, NULL, 4);
INSERT INTO `links` VALUES (35, '能力雷达图', 10, '\\/game\\/2019-9-11\\/1568211557033A6FFxN.zip', 19, NULL, 4);
INSERT INTO `links` VALUES (36, '再见', 11, '\\/game\\/2020-7-6\\/15940307782274jSS7e.zip', 20, NULL, 4);
INSERT INTO `links` VALUES (37, '竞速热身', 12, '\\/game\\/2020-4-28\\/1588058611609cxs6NR.zip', 31, NULL, 4);
INSERT INTO `links` VALUES (359, '欢迎', 1, '\\/game\\/2019-11-11\\/1573467199265ch8jiw.zip', 18, NULL, 43);
INSERT INTO `links` VALUES (360, '教学目标', 2, '\\/game\\/2020-4-7\\/1586243464800sKsEP6.zip', 1, NULL, 43);
INSERT INTO `links` VALUES (361, '基本功练习', 3, '\\/game\\/2019-11-11\\/1573467393636Q3fpnC.zip', 25, '\'jumpNext\':14', 43);
INSERT INTO `links` VALUES (362, '乐理知识', 4, '\\/game\\/2020-4-28\\/1588060927764PjX52a.zip', 7, NULL, 43);
INSERT INTO `links` VALUES (363, '乐理知识', 5, '\\/game\\/2019-11-11\\/1573467438373WmQFnY.zip', 7, NULL, 43);
INSERT INTO `links` VALUES (364, '乐理知识', 6, '\\/game\\/2019-11-11\\/15734674551588MfcDe.zip', 7, NULL, 43);
INSERT INTO `links` VALUES (365, '乐理知识', 7, '\\/game\\/2019-11-11\\/1573467481669SsGnZD.zip', 7, NULL, 43);
INSERT INTO `links` VALUES (366, '听力练习', 8, '\\/game\\/2019-11-11\\/1573467500619t48ZZ7.zip', 30, NULL, 43);
INSERT INTO `links` VALUES (370, '节奏型练习', 9, NULL, 3, '\'careHihat\':1', 43);
INSERT INTO `links` VALUES (371, '教师示范', 10, '\\/game\\/2020-4-28\\/1588057129113NZs5rf.txt', 11, NULL, 43);
INSERT INTO `links` VALUES (372, '节奏王者', 11, NULL, 15, NULL, 43);
INSERT INTO `links` VALUES (373, '雷达图', 12, '\\/game\\/2019-11-11\\/1573470024541KEN3pQ.zip', 19, NULL, 43);
INSERT INTO `links` VALUES (374, '再见', 13, '\\/game\\/2019-11-11\\/1573470042333m7Mwyw.zip', 20, NULL, 43);
INSERT INTO `links` VALUES (375, '欢迎', 1, '\\/game\\/2019-11-11\\/1573470089703Fz6ePH.zip', 18, NULL, 44);
INSERT INTO `links` VALUES (376, '教学目标', 2, '\\/game\\/2020-4-7\\/1586243479980YcDZCm.zip', 1, NULL, 44);
INSERT INTO `links` VALUES (377, '基本功', 3, '\\/game\\/2019-11-11\\/1573470154603DB7w4F.zip', 25, NULL, 44);
INSERT INTO `links` VALUES (378, '乐理', 4, '\\/game\\/2020-4-28\\/15880609452555iDZ4n.zip', 7, NULL, 44);
INSERT INTO `links` VALUES (379, '听力', 5, '\\/game\\/2019-11-11\\/15734701890468eKtmN.zip', 30, NULL, 44);
INSERT INTO `links` VALUES (380, '节奏型', 6, NULL, 3, '\'careHihat\':1', 44);
INSERT INTO `links` VALUES (381, '示范', 7, '\\/game\\/2020-4-28\\/1588057146318BaPxce.txt', 11, NULL, 44);
INSERT INTO `links` VALUES (382, '节奏王者', 8, NULL, 15, NULL, 44);
INSERT INTO `links` VALUES (383, '雷达图', 9, '\\/game\\/2019-11-11\\/1573470349740FsYyf6.zip', 19, NULL, 44);
INSERT INTO `links` VALUES (384, '再见', 10, '\\/game\\/2019-11-11\\/1573470365868PsaRKe.zip', 20, NULL, 44);
INSERT INTO `links` VALUES (1065, '竞速比赛', 12, '\\/game\\/2020-4-28\\/1588058446687DJPdEB.zip', 31, NULL, 3);
INSERT INTO `links` VALUES (1086, '竞速练习', 14, '\\/game\\/2020-4-28\\/1588060475425BSXzdf.zip', 31, NULL, 43);
INSERT INTO `links` VALUES (1087, '竞速练习', 11, '\\/game\\/2020-4-28\\/1588060492133Yi75hS.zip', 31, NULL, 44);

-- ----------------------------
-- Table structure for music_rhythm
-- ----------------------------
DROP TABLE IF EXISTS `music_rhythm`;
CREATE TABLE `music_rhythm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `music_id` int(11) NULL DEFAULT NULL,
  `rhythm_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music_rhythm
-- ----------------------------
INSERT INTO `music_rhythm` VALUES (1, 1, 4);
INSERT INTO `music_rhythm` VALUES (2, 2, 4);
INSERT INTO `music_rhythm` VALUES (3, 3, 4);
INSERT INTO `music_rhythm` VALUES (4, 5, 5);
INSERT INTO `music_rhythm` VALUES (5, 6, 5);
INSERT INTO `music_rhythm` VALUES (6, 7, 5);
INSERT INTO `music_rhythm` VALUES (7, 8, 6);
INSERT INTO `music_rhythm` VALUES (8, 9, 6);
INSERT INTO `music_rhythm` VALUES (9, 10, 6);
INSERT INTO `music_rhythm` VALUES (10, 11, 7);
INSERT INTO `music_rhythm` VALUES (11, 12, 7);
INSERT INTO `music_rhythm` VALUES (12, 13, 7);
INSERT INTO `music_rhythm` VALUES (13, 14, 8);
INSERT INTO `music_rhythm` VALUES (14, 15, 8);
INSERT INTO `music_rhythm` VALUES (15, 16, 8);
INSERT INTO `music_rhythm` VALUES (16, 18, 62);
INSERT INTO `music_rhythm` VALUES (17, 19, 62);
INSERT INTO `music_rhythm` VALUES (18, 20, 62);
INSERT INTO `music_rhythm` VALUES (19, 21, 63);
INSERT INTO `music_rhythm` VALUES (20, 22, 63);
INSERT INTO `music_rhythm` VALUES (21, 23, 63);
INSERT INTO `music_rhythm` VALUES (22, 24, 64);
INSERT INTO `music_rhythm` VALUES (23, 25, 64);
INSERT INTO `music_rhythm` VALUES (24, 26, 64);
INSERT INTO `music_rhythm` VALUES (25, 27, 65);
INSERT INTO `music_rhythm` VALUES (26, 28, 65);
INSERT INTO `music_rhythm` VALUES (27, 29, 65);
INSERT INTO `music_rhythm` VALUES (28, 30, 66);
INSERT INTO `music_rhythm` VALUES (29, 31, 66);
INSERT INTO `music_rhythm` VALUES (30, 32, 66);
INSERT INTO `music_rhythm` VALUES (31, 33, 67);
INSERT INTO `music_rhythm` VALUES (32, 34, 67);
INSERT INTO `music_rhythm` VALUES (33, 35, 67);
INSERT INTO `music_rhythm` VALUES (34, 36, 68);
INSERT INTO `music_rhythm` VALUES (35, 37, 68);
INSERT INTO `music_rhythm` VALUES (36, 38, 68);
INSERT INTO `music_rhythm` VALUES (37, 39, 69);
INSERT INTO `music_rhythm` VALUES (38, 40, 69);
INSERT INTO `music_rhythm` VALUES (39, 41, 69);
INSERT INTO `music_rhythm` VALUES (40, 43, 70);
INSERT INTO `music_rhythm` VALUES (41, 44, 70);
INSERT INTO `music_rhythm` VALUES (42, 45, 70);
INSERT INTO `music_rhythm` VALUES (43, 46, 71);
INSERT INTO `music_rhythm` VALUES (44, 47, 71);
INSERT INTO `music_rhythm` VALUES (45, 48, 71);
INSERT INTO `music_rhythm` VALUES (46, 49, 72);
INSERT INTO `music_rhythm` VALUES (47, 50, 72);
INSERT INTO `music_rhythm` VALUES (48, 51, 72);
INSERT INTO `music_rhythm` VALUES (49, 52, 73);
INSERT INTO `music_rhythm` VALUES (50, 53, 73);
INSERT INTO `music_rhythm` VALUES (51, 54, 73);
INSERT INTO `music_rhythm` VALUES (52, 55, 74);
INSERT INTO `music_rhythm` VALUES (53, 56, 74);
INSERT INTO `music_rhythm` VALUES (54, 57, 74);
INSERT INTO `music_rhythm` VALUES (55, 58, 75);
INSERT INTO `music_rhythm` VALUES (56, 59, 75);
INSERT INTO `music_rhythm` VALUES (57, 60, 75);
INSERT INTO `music_rhythm` VALUES (58, 61, 76);
INSERT INTO `music_rhythm` VALUES (59, 62, 76);
INSERT INTO `music_rhythm` VALUES (60, 63, 76);
INSERT INTO `music_rhythm` VALUES (61, 64, 77);
INSERT INTO `music_rhythm` VALUES (62, 65, 77);
INSERT INTO `music_rhythm` VALUES (63, 66, 77);

-- ----------------------------
-- Table structure for music_rhythmgame
-- ----------------------------
DROP TABLE IF EXISTS `music_rhythmgame`;
CREATE TABLE `music_rhythmgame`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `music_id` int(11) NULL DEFAULT NULL,
  `rhythm_game_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music_rhythmgame
-- ----------------------------
INSERT INTO `music_rhythmgame` VALUES (1, 4, 2);
INSERT INTO `music_rhythmgame` VALUES (2, 17, 3);
INSERT INTO `music_rhythmgame` VALUES (3, 42, 22);
INSERT INTO `music_rhythmgame` VALUES (4, 67, 23);

-- ----------------------------
-- Table structure for music_urls
-- ----------------------------
DROP TABLE IF EXISTS `music_urls`;
CREATE TABLE `music_urls`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `speed` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music_urls
-- ----------------------------
INSERT INTO `music_urls` VALUES (1, '\\/game\\/rhythm\\/2019-9-26\\/1569508483723b85XKn.mp3', 70);
INSERT INTO `music_urls` VALUES (2, '\\/game\\/rhythm\\/2019-9-26\\/1569508491672Z7DPTE.mp3', 90);
INSERT INTO `music_urls` VALUES (3, '\\/game\\/rhythm\\/2019-9-26\\/1569508502427pZrtmD.mp3', 110);
INSERT INTO `music_urls` VALUES (4, '\\/game\\/rhythm\\/2019-9-26\\/1569512297474dKRswx.json', 116);
INSERT INTO `music_urls` VALUES (5, '\\/game\\/rhythm\\/2019-9-26\\/1569508650879mzbTA3.mp3', 60);
INSERT INTO `music_urls` VALUES (6, '\\/game\\/rhythm\\/2019-9-26\\/1569508659448G2AEQj.mp3', 80);
INSERT INTO `music_urls` VALUES (7, '\\/game\\/rhythm\\/2019-9-26\\/1569508667653H6PcEz.mp3', 100);
INSERT INTO `music_urls` VALUES (8, '\\/game\\/rhythm\\/2019-9-26\\/1569508701650pemwea.mp3', 60);
INSERT INTO `music_urls` VALUES (9, '\\/game\\/rhythm\\/2019-9-26\\/1569508708689ZWABDx.mp3', 80);
INSERT INTO `music_urls` VALUES (10, '\\/game\\/rhythm\\/2019-9-26\\/1569508716576CC7rr3.mp3', 100);
INSERT INTO `music_urls` VALUES (11, '\\/game\\/rhythm\\/2019-9-26\\/1569508741636BC6JpX.mp3', 60);
INSERT INTO `music_urls` VALUES (12, '\\/game\\/rhythm\\/2019-9-26\\/1569508749802bPHGnT.mp3', 80);
INSERT INTO `music_urls` VALUES (13, '\\/game\\/rhythm\\/2019-9-26\\/1569508757061YCYFj8.mp3', 100);
INSERT INTO `music_urls` VALUES (14, '\\/game\\/rhythm\\/2019-9-26\\/1569508799184TJyJ5H.mp3', 60);
INSERT INTO `music_urls` VALUES (15, '\\/game\\/rhythm\\/2019-9-26\\/1569508806673pSerhy.mp3', 80);
INSERT INTO `music_urls` VALUES (16, '\\/game\\/rhythm\\/2019-9-26\\/1569508813936XxG6sx.mp3', 100);
INSERT INTO `music_urls` VALUES (17, '\\/game\\/rhythm\\/2019-9-26\\/1569512036437JS8NAZ.mp3', 116);
INSERT INTO `music_urls` VALUES (18, '\\/game\\/rhythm\\/2019-11-11\\/1573461769862Mr5CpG.mp3', 100);
INSERT INTO `music_urls` VALUES (19, '\\/game\\/rhythm\\/2019-11-11\\/15734617698628EZ72B.mp3', 80);
INSERT INTO `music_urls` VALUES (20, '\\/game\\/rhythm\\/2019-11-11\\/1573461769861csQiB6.mp3', 60);
INSERT INTO `music_urls` VALUES (21, '\\/game\\/rhythm\\/2019-11-11\\/1573461831290tCxaFG.mp3', 100);
INSERT INTO `music_urls` VALUES (22, '\\/game\\/rhythm\\/2019-11-11\\/1573461831290EXRYcs.mp3', 60);
INSERT INTO `music_urls` VALUES (23, '\\/game\\/rhythm\\/2019-11-11\\/15734618312917Cj6ps.mp3', 80);
INSERT INTO `music_urls` VALUES (24, '\\/game\\/rhythm\\/2019-11-11\\/15734618590588ZzEra.mp3', 100);
INSERT INTO `music_urls` VALUES (25, '\\/game\\/rhythm\\/2019-11-11\\/1573461859058z3Skzt.mp3', 80);
INSERT INTO `music_urls` VALUES (26, '\\/game\\/rhythm\\/2019-11-11\\/1573461859058atfS52.mp3', 60);
INSERT INTO `music_urls` VALUES (27, '\\/game\\/rhythm\\/2019-11-11\\/1573461888687YCx4bK.mp3', 100);
INSERT INTO `music_urls` VALUES (28, '\\/game\\/rhythm\\/2019-11-11\\/1573461888687AnRRZE.mp3', 80);
INSERT INTO `music_urls` VALUES (29, '\\/game\\/rhythm\\/2019-11-11\\/1573461888686b57MWX.mp3', 60);
INSERT INTO `music_urls` VALUES (30, '\\/game\\/rhythm\\/2019-11-11\\/1573461915525yWwjBk.mp3', 100);
INSERT INTO `music_urls` VALUES (31, '\\/game\\/rhythm\\/2019-11-11\\/157346191552545F2Kp.mp3', 80);
INSERT INTO `music_urls` VALUES (32, '\\/game\\/rhythm\\/2019-11-11\\/1573461915526pdQkT8.mp3', 60);
INSERT INTO `music_urls` VALUES (33, '\\/game\\/rhythm\\/2019-11-11\\/1573461941760Fcn8Cb.mp3', 60);
INSERT INTO `music_urls` VALUES (34, '\\/game\\/rhythm\\/2019-11-11\\/1573461941761PNRyef.mp3', 80);
INSERT INTO `music_urls` VALUES (35, '\\/game\\/rhythm\\/2019-11-11\\/1573461941760P4hppa.mp3', 100);
INSERT INTO `music_urls` VALUES (36, '\\/game\\/rhythm\\/2019-11-11\\/1573461969059RZQEMw.mp3', 100);
INSERT INTO `music_urls` VALUES (37, '\\/game\\/rhythm\\/2019-11-11\\/1573461969058mSrWw4.mp3', 60);
INSERT INTO `music_urls` VALUES (38, '\\/game\\/rhythm\\/2019-11-11\\/1573461969059fatR2a.mp3', 80);
INSERT INTO `music_urls` VALUES (39, '\\/game\\/rhythm\\/2019-11-11\\/1573461999450jkaRxW.mp3', 100);
INSERT INTO `music_urls` VALUES (40, '\\/game\\/rhythm\\/2019-11-11\\/1573461999451sprJGF.mp3', 80);
INSERT INTO `music_urls` VALUES (41, '\\/game\\/rhythm\\/2019-11-11\\/1573461999450w58ABz.mp3', 60);
INSERT INTO `music_urls` VALUES (42, '\\/game\\/rhythm\\/2019-11-25\\/1574687024559rcCrZm.mp3', 135);
INSERT INTO `music_urls` VALUES (43, '\\/game\\/rhythm\\/2019-11-11\\/1573462032873hxeb6A.mp3', 100);
INSERT INTO `music_urls` VALUES (44, '\\/game\\/rhythm\\/2019-11-11\\/1573462032873szcs5H.mp3', 80);
INSERT INTO `music_urls` VALUES (45, '\\/game\\/rhythm\\/2019-11-11\\/1573462032872MwAEeP.mp3', 60);
INSERT INTO `music_urls` VALUES (46, '\\/game\\/rhythm\\/2019-11-11\\/1573462083300jmccba.mp3', 100);
INSERT INTO `music_urls` VALUES (47, '\\/game\\/rhythm\\/2019-11-11\\/1573462083300zcfCbS.mp3', 80);
INSERT INTO `music_urls` VALUES (48, '\\/game\\/rhythm\\/2019-11-11\\/1573462083300CYwFzh.mp3', 60);
INSERT INTO `music_urls` VALUES (49, '\\/game\\/rhythm\\/2019-11-11\\/15734621120256hxs7k.mp3', 100);
INSERT INTO `music_urls` VALUES (50, '\\/game\\/rhythm\\/2019-11-11\\/1573462112026NTb4pz.mp3', 80);
INSERT INTO `music_urls` VALUES (51, '\\/game\\/rhythm\\/2019-11-11\\/1573462112025xYezfa.mp3', 60);
INSERT INTO `music_urls` VALUES (52, '\\/game\\/rhythm\\/2019-11-11\\/1573462139322Eny8Cb.mp3', 80);
INSERT INTO `music_urls` VALUES (53, '\\/game\\/rhythm\\/2019-11-11\\/1573462139321y7TmaZ.mp3', 60);
INSERT INTO `music_urls` VALUES (54, '\\/game\\/rhythm\\/2019-11-11\\/1573462139321HF3xrt.mp3', 100);
INSERT INTO `music_urls` VALUES (55, '\\/game\\/rhythm\\/2019-11-11\\/1573462177144j6b8CJ.mp3', 60);
INSERT INTO `music_urls` VALUES (56, '\\/game\\/rhythm\\/2019-11-11\\/1573462177145mx3JWw.mp3', 100);
INSERT INTO `music_urls` VALUES (57, '\\/game\\/rhythm\\/2019-11-11\\/1573462177145WiDGpk.mp3', 80);
INSERT INTO `music_urls` VALUES (58, '\\/game\\/rhythm\\/2019-11-11\\/1573462206574bX3iEG.mp3', 80);
INSERT INTO `music_urls` VALUES (59, '\\/game\\/rhythm\\/2019-11-11\\/1573462206574FdthEB.mp3', 100);
INSERT INTO `music_urls` VALUES (60, '\\/game\\/rhythm\\/2019-11-11\\/1573462206573x3BefT.mp3', 60);
INSERT INTO `music_urls` VALUES (61, '\\/game\\/rhythm\\/2019-11-11\\/1573462258427djEaBy.mp3', 60);
INSERT INTO `music_urls` VALUES (62, '\\/game\\/rhythm\\/2019-11-11\\/1573462258428kBpMMW.mp3', 80);
INSERT INTO `music_urls` VALUES (63, '\\/game\\/rhythm\\/2019-11-11\\/1573462258427n2QkrF.mp3', 100);
INSERT INTO `music_urls` VALUES (64, '\\/game\\/rhythm\\/2019-11-11\\/1573462286061Dn2Enk.mp3', 100);
INSERT INTO `music_urls` VALUES (65, '\\/game\\/rhythm\\/2019-11-11\\/1573462286061j5XTyx.mp3', 60);
INSERT INTO `music_urls` VALUES (66, '\\/game\\/rhythm\\/2019-11-11\\/1573462286062YWSPhz.mp3', 80);
INSERT INTO `music_urls` VALUES (67, '\\/game\\/rhythm\\/2019-11-25\\/1574687033607DJtZNx.mp3', 135);

-- ----------------------------
-- Table structure for play_videos
-- ----------------------------
DROP TABLE IF EXISTS `play_videos`;
CREATE TABLE `play_videos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `video_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `basic_play` int(11) NULL DEFAULT NULL COMMENT 'basic_plays表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play_videos
-- ----------------------------
INSERT INTO `play_videos` VALUES (1, '四分右手起', '\\/game\\/video\\/2019-9-26\\/15695110036155JnhBM.mp4', '\\/game\\/video\\/2019-9-26\\/15695110036155JnhBM.mp4', 1, '四分音符R', 285);
INSERT INTO `play_videos` VALUES (2, 'B2 Basic Ex1', '20191104_basic_1_1_48m.mp4', '\\/game\\/video\\/2019-11-11\\/1573455358019TNXQin.mp4', 1, 'B2 Basic Ex1', 289);

-- ----------------------------
-- Table structure for radarmaps
-- ----------------------------
DROP TABLE IF EXISTS `radarmaps`;
CREATE TABLE `radarmaps`  (
  `rhythm_pct` int(11) NULL DEFAULT NULL,
  `speed_pct` int(11) NULL DEFAULT NULL,
  `dynamics_pct` int(11) NULL DEFAULT NULL,
  `audition_pct` int(11) NULL DEFAULT NULL,
  `coordinate_pct` int(11) NULL DEFAULT NULL,
  `imitation_pct` int(11) NULL DEFAULT NULL,
  `lesson` int(11) NULL DEFAULT NULL COMMENT 'lessons表的逻辑外键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radarmaps
-- ----------------------------
INSERT INTO `radarmaps` VALUES (30, 10, 10, 15, 20, 15, 3);
INSERT INTO `radarmaps` VALUES (30, 10, 10, 15, 20, 15, 4);

-- ----------------------------
-- Table structure for rhythm_game_extends
-- ----------------------------
DROP TABLE IF EXISTS `rhythm_game_extends`;
CREATE TABLE `rhythm_game_extends`  (
  `id` int(11) NOT NULL,
  `rule_music_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `other_music_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `game_id` int(11) NULL DEFAULT NULL,
  `link` int(11) NULL DEFAULT NULL COMMENT 'links表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rhythm_game_extends
-- ----------------------------
INSERT INTO `rhythm_game_extends` VALUES (23, '\\/game\\/2019-9-26\\/1569513148439MFQWDp.mp3', NULL, NULL, 1, 23);
INSERT INTO `rhythm_game_extends` VALUES (34, '\\/game\\/2019-9-26\\/1569513344320kSmd2d.mp3', NULL, '', 1, 34);
INSERT INTO `rhythm_game_extends` VALUES (372, '\\/game\\/2019-11-11\\/1573477792977xRCb7T.mp3', NULL, '', 6, 372);
INSERT INTO `rhythm_game_extends` VALUES (382, '\\/game\\/2019-11-11\\/15734703148235N2Arn.mp3', NULL, '', 6, 382);

-- ----------------------------
-- Table structure for rhythm_games
-- ----------------------------
DROP TABLE IF EXISTS `rhythm_games`;
CREATE TABLE `rhythm_games`  (
  `id` int(11) NOT NULL,
  `music_score_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `speed` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `link` int(11) NULL DEFAULT NULL COMMENT 'links表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rhythm_games
-- ----------------------------
INSERT INTO `rhythm_games` VALUES (2, '\\/game\\/rhythm\\/2019-9-26\\/1569512297474dKRswx.json', 116, 1, 23);
INSERT INTO `rhythm_games` VALUES (3, '\\/game\\/rhythm\\/2020-4-28\\/1588062009217wTAbZ5.json', 116, 1, 34);
INSERT INTO `rhythm_games` VALUES (22, '\\/game\\/rhythm\\/2019-11-25\\/1574667239075ZNT4YW.json', 135, 1, 372);
INSERT INTO `rhythm_games` VALUES (23, '\\/game\\/rhythm\\/2019-11-25\\/1574667258547SDzWeD.json', 135, 1, 382);

-- ----------------------------
-- Table structure for rhythms
-- ----------------------------
DROP TABLE IF EXISTS `rhythms`;
CREATE TABLE `rhythms`  (
  `id` int(11) NOT NULL,
  `music_score_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `one_concert_score_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `two_concert_score_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `speed` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `site` int(11) NULL DEFAULT NULL COMMENT 'sites表的逻辑外键',
  `link` int(11) NULL DEFAULT NULL COMMENT 'links表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rhythms
-- ----------------------------
INSERT INTO `rhythms` VALUES (4, '\\/game\\/rhythm\\/2019-9-26\\/1569508537246SCWXZ2.json', NULL, NULL, 110, 'B1L1Ex1', 1, 1, 21);
INSERT INTO `rhythms` VALUES (5, '\\/game\\/rhythm\\/2019-9-26\\/1569508681791GJtTRh.json', NULL, NULL, 100, 'B1L2Ex1', 1, 1, 32);
INSERT INTO `rhythms` VALUES (6, '\\/game\\/rhythm\\/2019-9-26\\/1569508722744CfQHF3.json', NULL, NULL, 100, 'B1L2Ex2', 2, NULL, 32);
INSERT INTO `rhythms` VALUES (7, '\\/game\\/rhythm\\/2019-9-26\\/1569508762661ZTHA5n.json', NULL, NULL, 100, 'B1L2Ex3', 3, 1, 32);
INSERT INTO `rhythms` VALUES (8, '\\/game\\/rhythm\\/2019-9-26\\/1569508819418AymZCt.json', NULL, NULL, 100, 'B1L2Ex4', 4, 1, 32);
INSERT INTO `rhythms` VALUES (62, '\\/game\\/rhythm\\/2019-11-11\\/1573461801095JztajD.json', NULL, NULL, 80, 'B2L1Ex1', 1, 2, 370);
INSERT INTO `rhythms` VALUES (63, '\\/game\\/rhythm\\/2019-11-11\\/15734618448054NeM6K.json', NULL, NULL, 80, 'B2L1Ex2', 2, 2, 370);
INSERT INTO `rhythms` VALUES (64, '\\/game\\/rhythm\\/2019-11-11\\/1573461873594AWb7zr.json', NULL, NULL, 80, 'B2L1Ex3', 3, 2, 370);
INSERT INTO `rhythms` VALUES (65, '\\/game\\/rhythm\\/2019-11-11\\/1573461902493cDY5H7.json', NULL, NULL, 80, 'B2L1Ex4', 4, 2, 370);
INSERT INTO `rhythms` VALUES (66, '\\/game\\/rhythm\\/2019-11-11\\/1573461928638BMbyi8.json', NULL, NULL, 80, 'B2L1Ex5', 5, 2, 370);
INSERT INTO `rhythms` VALUES (67, '\\/game\\/rhythm\\/2019-11-11\\/1573461952634AWPc2Y.json', NULL, NULL, 80, 'B2L1Ex6', 6, 2, 370);
INSERT INTO `rhythms` VALUES (68, '\\/game\\/rhythm\\/2019-11-11\\/1573461982403nE5tij.json', NULL, NULL, 80, 'B2L1Ex7', 7, 2, 370);
INSERT INTO `rhythms` VALUES (69, '\\/game\\/rhythm\\/2019-11-11\\/1573462009369HeH4ix.json', NULL, NULL, 80, 'B2L1Ex8', 8, 2, 370);
INSERT INTO `rhythms` VALUES (70, '\\/game\\/rhythm\\/2019-11-11\\/1573462063048fbCE4z.json', NULL, NULL, 80, 'B2L2Ex1', 1, 2, 380);
INSERT INTO `rhythms` VALUES (71, '\\/game\\/rhythm\\/2019-11-11\\/1573462095834bkHCRy.json', NULL, NULL, 80, 'B2L2Ex2', 2, 2, 380);
INSERT INTO `rhythms` VALUES (72, '\\/game\\/rhythm\\/2019-11-11\\/1573462122747HhYfSH.json', NULL, NULL, 80, 'B2L2Ex3', 3, 2, 380);
INSERT INTO `rhythms` VALUES (73, '\\/game\\/rhythm\\/2019-12-20\\/1576837977305Z4tHHP.json', NULL, NULL, 80, 'B2L2Ex4', 4, 2, 380);
INSERT INTO `rhythms` VALUES (74, '\\/game\\/rhythm\\/2019-11-11\\/1573462188218rSXzMt.json', NULL, NULL, 80, 'B2L2Ex5', 5, 2, 380);
INSERT INTO `rhythms` VALUES (75, '\\/game\\/rhythm\\/2019-11-11\\/1573462217796Sj3YbX.json', NULL, NULL, 80, 'B2L2Ex6', 6, 2, 380);
INSERT INTO `rhythms` VALUES (76, '\\/game\\/rhythm\\/2019-11-11\\/15734622693305ZYXTc.json', NULL, NULL, 80, 'B2L2Ex7', 7, 2, 380);
INSERT INTO `rhythms` VALUES (77, '\\/game\\/rhythm\\/2019-11-11\\/1573462295857x3cRk5.json', NULL, NULL, 80, 'B2L2Ex8', 8, 2, 380);

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` int(11) NULL DEFAULT NULL COMMENT 'site的代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES (1, 2);
INSERT INTO `sites` VALUES (2, 6);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '课程介绍');
INSERT INTO `types` VALUES (2, '基本功练习');
INSERT INTO `types` VALUES (3, '节奏型练习');
INSERT INTO `types` VALUES (4, '曲目练习');
INSERT INTO `types` VALUES (5, '曲目欣赏');
INSERT INTO `types` VALUES (6, '乐理-音符介绍');
INSERT INTO `types` VALUES (7, '乐理-其他');
INSERT INTO `types` VALUES (8, '听力-选节奏型');
INSERT INTO `types` VALUES (9, '听力-选鼓');
INSERT INTO `types` VALUES (10, '考试-目录');
INSERT INTO `types` VALUES (11, '视频演示');
INSERT INTO `types` VALUES (12, '考试-选择题');
INSERT INTO `types` VALUES (13, '考试-判断题');
INSERT INTO `types` VALUES (14, '考试-结果');
INSERT INTO `types` VALUES (15, '节奏王者');
INSERT INTO `types` VALUES (16, '其他');
INSERT INTO `types` VALUES (17, '识谱');
INSERT INTO `types` VALUES (18, '欢迎');
INSERT INTO `types` VALUES (19, '能力雷达图');
INSERT INTO `types` VALUES (20, '再见');
INSERT INTO `types` VALUES (21, '分段解析');
INSERT INTO `types` VALUES (22, '听力-选时值');
INSERT INTO `types` VALUES (23, '得分');
INSERT INTO `types` VALUES (24, '抽奖');
INSERT INTO `types` VALUES (25, '基本功跑圈联系');
INSERT INTO `types` VALUES (26, '基本功协调练习');
INSERT INTO `types` VALUES (27, '乐理试听');
INSERT INTO `types` VALUES (28, '乐理盲打');
INSERT INTO `types` VALUES (29, '听力-开门');
INSERT INTO `types` VALUES (30, '听力-帽子');
INSERT INTO `types` VALUES (31, '基本功竞速练习');
INSERT INTO `types` VALUES (32, '基本功考试');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link` int(11) NULL DEFAULT NULL COMMENT 'links表的逻辑外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES (3, '\\/game\\/video\\/2019-9-26\\/1569508427137XAxHN4.mp4', 1, '体验课\\/B1L1 握槌', 'Stick', 18);
INSERT INTO `videos` VALUES (4, '\\/game\\/video\\/2019-9-26\\/1569508441627dcSwGD.mp4', 1, '体验课\\/B1L1 坐姿', 'Sit', 19);
INSERT INTO `videos` VALUES (6, '\\/game\\/video\\/2019-9-26\\/1569508661284JXQTX2.mp4', 1, 'B1L1 军鼓', '军鼓', 20);
INSERT INTO `videos` VALUES (7, '\\/game\\/video\\/2019-9-26\\/1569508685096jAdnat.mp4', 2, 'B1L1 底鼓', '底鼓', 20);
INSERT INTO `videos` VALUES (8, '\\/game\\/video\\/2019-9-26\\/1569508711929MtiMRP.mp4', 1, 'B1L1Ex1', 'B1L1Ex1', 22);
INSERT INTO `videos` VALUES (9, '\\/game\\/video\\/2019-9-26\\/15695087543738AWWFB.mp4', 1, 'B1L2 乐理入门', '乐理入门', 29);
INSERT INTO `videos` VALUES (10, '\\/game\\/video\\/2019-9-26\\/1569508774327fyQfeG.mp4', 2, 'B1L2 五线谱', '五线谱', 29);
INSERT INTO `videos` VALUES (11, '\\/game\\/video\\/2019-9-26\\/1569508803817Bjw4nQ.mp4', 3, 'B1L2 谱号', '谱号', 29);
INSERT INTO `videos` VALUES (12, '\\/game\\/video\\/2019-9-26\\/15695088129742DAkTd.mp4', 4, 'B1L2 拍号', '拍号', 29);
INSERT INTO `videos` VALUES (13, '\\/game\\/video\\/2019-9-26\\/1569508823103pytRQY.mp4', 5, 'B1L2 小节线', '小节线', 29);
INSERT INTO `videos` VALUES (14, '\\/game\\/video\\/2019-9-26\\/1569508834329mrPmMy.mp4', 6, 'B1L2 终止线', '终止线', 29);
INSERT INTO `videos` VALUES (15, '\\/game\\/video\\/2019-9-26\\/1569508843095H8BDfs.mp4', 7, 'B1L2 速度记号', '速度记号', 29);
INSERT INTO `videos` VALUES (16, '\\/game\\/video\\/2019-9-26\\/1569508882726TjPrpH.mp4', 1, 'B1L2 Theory', 'B1L2 Theory', 30);
INSERT INTO `videos` VALUES (17, '\\/game\\/video\\/2019-9-26\\/1569508943237Y8PSdB.mp4', 1, 'B1L2Ex1 R', 'Ex1 右手', 33);
INSERT INTO `videos` VALUES (18, '\\/game\\/video\\/2019-9-26\\/1569508977119zNfGBz.mp4', 2, 'B1L2Ex1 L', 'Ex1 左手', 33);
INSERT INTO `videos` VALUES (19, '\\/game\\/video\\/2019-9-26\\/15695089976408a4rmk.mp4', 3, 'B1L2Ex2', 'Ex2', 33);
INSERT INTO `videos` VALUES (20, '\\/game\\/video\\/2019-9-26\\/1569509034228YASbwz.mp4', 4, 'B1L2Ex3 R', 'Ex3 右手', 33);
INSERT INTO `videos` VALUES (21, '\\/game\\/video\\/2019-9-26\\/1569509027323iy4HzB.mp4', 5, 'B1L2Ex3 L', 'Ex3 左手', 33);
INSERT INTO `videos` VALUES (22, '\\/game\\/video\\/2019-9-26\\/1569509047495nBcwJh.mp4', 6, 'B1L2Ex4 R', 'Ex4 右手', 33);
INSERT INTO `videos` VALUES (23, '\\/game\\/video\\/2019-9-26\\/1569509060174ppn8PE.mp4', 7, 'B1L2Ex4 L', 'Ex4 左手', 33);
INSERT INTO `videos` VALUES (155, '\\/game\\/video\\/2019-11-11\\/1573455852291WZMWpE.mp4', 1, 'B2L1 Ex1 Do', 'Ex1', 371);
INSERT INTO `videos` VALUES (156, '\\/game\\/video\\/2019-11-11\\/15734558626513jRAh5.mp4', 2, 'B2L1 Ex2 Do', 'Ex2', 371);
INSERT INTO `videos` VALUES (157, '\\/game\\/video\\/2019-11-11\\/1573455871515Y7n4FW.mp4', 3, 'B2L1 Ex3 Do', 'Ex3', 371);
INSERT INTO `videos` VALUES (158, '\\/game\\/video\\/2019-11-11\\/1573455885209BpCpdD.mp4', 4, 'B2L1 Ex4 Do', 'Ex4', 371);
INSERT INTO `videos` VALUES (159, '\\/game\\/video\\/2019-11-11\\/1573455896629iBHywQ.mp4', 5, 'B2L1 Ex5 Do', 'Ex5', 371);
INSERT INTO `videos` VALUES (160, '\\/game\\/video\\/2019-11-11\\/1573455906949PYArwE.mp4', 6, 'B2L1 Ex6 Do', 'Ex6', 371);
INSERT INTO `videos` VALUES (161, '\\/game\\/video\\/2019-11-11\\/1573455916882AF8wt5.mp4', 7, 'B2L1 Ex7 Do', 'Ex7', 371);
INSERT INTO `videos` VALUES (162, '\\/game\\/video\\/2019-11-11\\/1573455946691tX3TTr.mp4', 1, 'B2L2 Ex1 Do', 'Ex1', 381);
INSERT INTO `videos` VALUES (163, '\\/game\\/video\\/2019-11-11\\/1573455970881dMRmBE.mp4', 2, 'B2L2 Ex2 Do', 'Ex2', 381);
INSERT INTO `videos` VALUES (164, '\\/game\\/video\\/2019-11-11\\/1573455983284j5XtHr.mp4', 3, 'B2L2 Ex3 Do', 'Ex3', 381);
INSERT INTO `videos` VALUES (165, '\\/game\\/video\\/2019-11-11\\/15734567562533t6tF5.mp4', 4, 'B2L2 Ex4 Do', 'Ex4', 381);
INSERT INTO `videos` VALUES (166, '\\/game\\/video\\/2019-11-11\\/1573456769141YRK2tZ.mp4', 5, 'B2L2 Ex5 Do', 'Ex5', 381);
INSERT INTO `videos` VALUES (167, '\\/game\\/video\\/2019-11-11\\/1573456825056KnpGtm.mp4', 6, 'B2L2 Ex6 Do', 'Ex6', 381);
INSERT INTO `videos` VALUES (168, '\\/game\\/video\\/2019-11-11\\/1573456853899nYtWjz.mp4', 7, 'B2L2 Ex7 Do', 'Ex7', 381);
INSERT INTO `videos` VALUES (169, '\\/game\\/video\\/2019-11-11\\/15734568668208bSfAh.mp4', 8, 'B2L2 Ex8 Do', 'Ex8', 381);
INSERT INTO `videos` VALUES (264, '\\/game\\/video\\/2019-11-11\\/15734600223503BX8w8.mp4', 8, 'B2L1 Ex8 Do', 'Ex8', 371);
INSERT INTO `videos` VALUES (265, '\\/game\\/video\\/2019-11-11\\/1573460065150hx38px.mp4', 1, 'B2L1 Ex1 Say', 'Ex1', 370);
INSERT INTO `videos` VALUES (266, '\\/game\\/video\\/2019-11-11\\/1573460088920AKmtta.mp4', 2, 'B2L1 Ex2 Say', 'Ex2', 370);
INSERT INTO `videos` VALUES (267, '\\/game\\/video\\/2019-11-11\\/1573460100457a4jpJj.mp4', 3, 'B2L1 Ex3 Say', 'Ex3', 370);
INSERT INTO `videos` VALUES (268, '\\/game\\/video\\/2019-11-11\\/1573460109840pN6eM7.mp4', 4, 'B2L1 Ex4 Say', 'Ex4', 370);
INSERT INTO `videos` VALUES (269, '\\/game\\/video\\/2019-11-11\\/1573460137759fMmdJ6.mp4', 1, 'B2L2 Ex1 Say', 'Ex1', 380);
INSERT INTO `videos` VALUES (270, '\\/game\\/video\\/2019-11-11\\/1573460150160msZHZd.mp4', 2, 'B2L2 Ex2 Say', 'Ex2', 380);
INSERT INTO `videos` VALUES (271, '\\/game\\/video\\/2019-11-11\\/1573460165434ReHMSY.mp4', 3, 'B2L2 Ex3 Say', 'Ex3', 380);
INSERT INTO `videos` VALUES (272, '\\/game\\/video\\/2019-11-11\\/1573460177742GHswY3.mp4', 4, 'B2L2 Ex4 Say', 'Ex4', 380);

SET FOREIGN_KEY_CHECKS = 1;
