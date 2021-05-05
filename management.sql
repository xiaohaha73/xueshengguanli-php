/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : management

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 04/05/2021 22:27:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员账号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员姓名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '王某人', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(0) NOT NULL COMMENT '班级id值',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '1班');
INSERT INTO `class` VALUES (2, '2班');
INSERT INTO `class` VALUES (3, '3班');
INSERT INTO `class` VALUES (4, '4班');
INSERT INTO `class` VALUES (5, '5班');
INSERT INTO `class` VALUES (6, '6班');
INSERT INTO `class` VALUES (7, '7班');
INSERT INTO `class` VALUES (8, '8班');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL COMMENT '课程id值',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '语文');
INSERT INTO `course` VALUES (2, '数学');
INSERT INTO `course` VALUES (3, '英语');
INSERT INTO `course` VALUES (4, '化学');
INSERT INTO `course` VALUES (5, '物理');
INSERT INTO `course` VALUES (6, '生物');
INSERT INTO `course` VALUES (7, '历史');
INSERT INTO `course` VALUES (8, '地理');
INSERT INTO `course` VALUES (9, '政治');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `a` int(0) NULL DEFAULT NULL,
  `b` int(0) NULL DEFAULT NULL,
  `c` int(0) NULL DEFAULT NULL,
  `d` int(0) NULL DEFAULT NULL,
  `e` int(0) NULL DEFAULT NULL,
  `f` int(0) NULL DEFAULT NULL,
  `g` int(0) NULL DEFAULT NULL,
  `h` int(0) NULL DEFAULT NULL,
  `i` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('123456', 99, 90, 85, 78, 88, 90, 87, 67, 66);
INSERT INTO `grade` VALUES ('s010001', 80, 90, 100, 60, 40, 100, 90, 60, 90);
INSERT INTO `grade` VALUES ('s010002', 70, 67, 67, 89, 27, 29, 67, 78, 75);
INSERT INTO `grade` VALUES ('s010004', 87, 77, 78, 90, 89, 78, 90, 88, 90);
INSERT INTO `grade` VALUES ('s010005', 67, 76, 78, 87, 77, 73, 78, 90, 93);
INSERT INTO `grade` VALUES ('s010006', 90, 98, 95, 94, 76, 94, 80, 83, 97);
INSERT INTO `grade` VALUES ('s010007', 85, 89, 90, 67, 86, 83, 94, 97, 74);
INSERT INTO `grade` VALUES ('s010008', 57, 78, 97, 74, 89, 89, 76, 78, 79);
INSERT INTO `grade` VALUES ('s010009', 67, 74, 73, 54, 63, 52, 55, 56, 55);
INSERT INTO `grade` VALUES ('s010010', 78, 90, 73, 72, 84, 85, 87, 89, 90);
INSERT INTO `grade` VALUES ('s010011', 99, 80, 89, 67, 89, 95, 80, 77, 85);

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `class_id` int(0) NOT NULL COMMENT '班级',
  `course_id` int(0) NOT NULL COMMENT '课程id值',
  `create_time` int(0) NULL DEFAULT NULL COMMENT '时间',
  `homework` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '作业内容'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES (1, 1, 1620099104, '课本12页第3、4题');
INSERT INTO `homework` VALUES (7, 1, 1620100389, '完成练习册12页第32题');
INSERT INTO `homework` VALUES (7, 1, 1620101359, '背诵《琵琶行》');

-- ----------------------------
-- Table structure for schedulecard
-- ----------------------------
DROP TABLE IF EXISTS `schedulecard`;
CREATE TABLE `schedulecard`  (
  `classid` int(0) NOT NULL COMMENT '班级id',
  `row_num` int(0) NULL DEFAULT NULL COMMENT '第几节课',
  `date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课时间，上午还是下午',
  `a` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期一',
  `b` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期二',
  `c` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期三',
  `d` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期四',
  `e` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期五'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedulecard
-- ----------------------------
INSERT INTO `schedulecard` VALUES (1, 0, '上午', '英语', '英语', '数学', '数学', '数学');
INSERT INTO `schedulecard` VALUES (1, 1, '上午', '英语', '数学', '语文', '数学', '英语');
INSERT INTO `schedulecard` VALUES (1, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (1, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (1, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (1, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (1, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (1, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 0, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 1, '上午', '英语', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (2, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 0, '上午', '英语', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 1, '上午', '英语', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (3, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 0, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 1, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (4, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 0, '上午', '政治', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 1, '上午', '政治', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (5, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 0, '上午', '历史', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 1, '上午', '历史', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (6, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 0, '上午', '地理', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 1, '上午', '地理', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (7, 7, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 0, '上午', '政治', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 1, '上午', '政治', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 2, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 3, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 4, '上午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 5, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 6, '下午', '语文', '数学', '语文', '语文', '英语');
INSERT INTO `schedulecard` VALUES (8, 7, '下午', '语文', '数学', '语文', '语文', '英语');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名字',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `sex` int(0) NOT NULL DEFAULT 1 COMMENT '性别',
  `classid` int(0) NOT NULL COMMENT '所在班级',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('123456', '王某某', 'e10adc3949ba59abbe56e057f20f883e', 1, 3);
INSERT INTO `students` VALUES ('s010001', '张三', 'e10adc3949ba59abbe56e057f20f883e', 1, 1);
INSERT INTO `students` VALUES ('s010002', '李四', 'e10adc3949ba59abbe56e057f20f883e', 0, 2);
INSERT INTO `students` VALUES ('s010003', '王某人', 'e10adc3949ba59abbe56e057f20f883e', 1, 3);
INSERT INTO `students` VALUES ('s010004', '王某', 'e10adc3949ba59abbe56e057f20f883e', 1, 4);
INSERT INTO `students` VALUES ('s010005', '王二毛', 'e10adc3949ba59abbe56e057f20f883e', 0, 5);
INSERT INTO `students` VALUES ('s010006', '张某人', 'e10adc3949ba59abbe56e057f20f883e', 1, 6);
INSERT INTO `students` VALUES ('s010007', '张二某', 'e10adc3949ba59abbe56e057f20f883e', 0, 7);
INSERT INTO `students` VALUES ('s010008', '李某人', 'e10adc3949ba59abbe56e057f20f883e', 1, 8);
INSERT INTO `students` VALUES ('s010009', '马保国', 'e10adc3949ba59abbe56e057f20f883e', 1, 8);
INSERT INTO `students` VALUES ('s010010', '王小明', 'e10adc3949ba59abbe56e057f20f883e', 1, 4);
INSERT INTO `students` VALUES ('s010011', '周杰伦', 'e10adc3949ba59abbe56e057f20f883e', 1, 1);

-- ----------------------------
-- Table structure for teach
-- ----------------------------
DROP TABLE IF EXISTS `teach`;
CREATE TABLE `teach`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '授课表id',
  `t_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '授课老师id',
  `class_id` int(0) NULL DEFAULT NULL COMMENT '上课的班级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_account`(`t_account`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teach
-- ----------------------------
INSERT INTO `teach` VALUES (248, 't0101001', 7);
INSERT INTO `teach` VALUES (249, 't0202003', 7);
INSERT INTO `teach` VALUES (250, 't0202020', 7);
INSERT INTO `teach` VALUES (251, 't0303006', 7);
INSERT INTO `teach` VALUES (252, 't0404008', 7);
INSERT INTO `teach` VALUES (253, 't0303021', 7);
INSERT INTO `teach` VALUES (254, 't0505010', 7);
INSERT INTO `teach` VALUES (255, 't0606011', 7);
INSERT INTO `teach` VALUES (256, 't0909027', 7);
INSERT INTO `teach` VALUES (266, 't0101002', 4);
INSERT INTO `teach` VALUES (267, 't0202003', 4);
INSERT INTO `teach` VALUES (268, 't0202020', 4);
INSERT INTO `teach` VALUES (269, 't0303006', 4);
INSERT INTO `teach` VALUES (270, 't0404007', 4);
INSERT INTO `teach` VALUES (271, 't123456', 4);
INSERT INTO `teach` VALUES (272, 't0505010', 4);
INSERT INTO `teach` VALUES (273, 't0505023', 4);
INSERT INTO `teach` VALUES (274, 't0909027', 4);
INSERT INTO `teach` VALUES (275, 't0101002', 2);
INSERT INTO `teach` VALUES (276, 't0202003', 2);
INSERT INTO `teach` VALUES (277, 't0202020', 2);
INSERT INTO `teach` VALUES (278, 't0303005', 2);
INSERT INTO `teach` VALUES (279, 't0404007', 2);
INSERT INTO `teach` VALUES (280, 't0404008', 2);
INSERT INTO `teach` VALUES (281, 't0505010', 2);
INSERT INTO `teach` VALUES (282, 't0909018', 2);
INSERT INTO `teach` VALUES (283, 't0606012', 2);
INSERT INTO `teach` VALUES (302, 't0707014', 8);
INSERT INTO `teach` VALUES (303, 't0707013', 8);
INSERT INTO `teach` VALUES (304, 't0202004', 8);
INSERT INTO `teach` VALUES (305, 't0303006', 8);
INSERT INTO `teach` VALUES (306, 't0404007', 8);
INSERT INTO `teach` VALUES (307, 't0808026', 8);
INSERT INTO `teach` VALUES (308, 't0505010', 8);
INSERT INTO `teach` VALUES (309, 't0606011', 8);
INSERT INTO `teach` VALUES (310, 't0909027', 8);
INSERT INTO `teach` VALUES (320, 't0101002', 5);
INSERT INTO `teach` VALUES (321, 't0202003', 5);
INSERT INTO `teach` VALUES (322, 't0707025', 5);
INSERT INTO `teach` VALUES (323, 't0303006', 5);
INSERT INTO `teach` VALUES (324, 't0303021', 5);
INSERT INTO `teach` VALUES (325, 't0808026', 5);
INSERT INTO `teach` VALUES (326, 't0505009', 5);
INSERT INTO `teach` VALUES (327, 't0606011', 5);
INSERT INTO `teach` VALUES (328, 't0606012', 5);
INSERT INTO `teach` VALUES (329, 't0101002', 6);
INSERT INTO `teach` VALUES (330, 't0707013', 6);
INSERT INTO `teach` VALUES (331, 't0707025', 6);
INSERT INTO `teach` VALUES (332, 't0303005', 6);
INSERT INTO `teach` VALUES (333, 't0808026', 6);
INSERT INTO `teach` VALUES (334, 't0404007', 6);
INSERT INTO `teach` VALUES (335, 't0505010', 6);
INSERT INTO `teach` VALUES (336, 't0505023', 6);
INSERT INTO `teach` VALUES (337, 't0606024', 6);
INSERT INTO `teach` VALUES (338, 't0101001', 1);
INSERT INTO `teach` VALUES (339, 't0202003', 1);
INSERT INTO `teach` VALUES (340, 't0202004', 1);
INSERT INTO `teach` VALUES (341, 't0303006', 1);
INSERT INTO `teach` VALUES (342, 't0404022', 1);
INSERT INTO `teach` VALUES (343, 't0404007', 1);
INSERT INTO `teach` VALUES (344, 't0505010', 1);
INSERT INTO `teach` VALUES (345, 't0606011', 1);
INSERT INTO `teach` VALUES (346, 't0606012', 1);
INSERT INTO `teach` VALUES (347, 't0707014', 3);
INSERT INTO `teach` VALUES (348, 't0707013', 3);
INSERT INTO `teach` VALUES (349, 't0202004', 3);
INSERT INTO `teach` VALUES (350, 't0303006', 3);
INSERT INTO `teach` VALUES (351, 't0404008', 3);
INSERT INTO `teach` VALUES (352, 't0404007', 3);
INSERT INTO `teach` VALUES (353, 't0505010', 3);
INSERT INTO `teach` VALUES (354, 't0606011', 3);
INSERT INTO `teach` VALUES (355, 't0606024', 3);

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `sex` int(0) NOT NULL DEFAULT 0 COMMENT '性别',
  `courseid` int(0) NOT NULL COMMENT '课程id',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('t0101001', 'e10adc3949ba59abbe56e057f20f883e', '陈平', 0, 1);
INSERT INTO `teachers` VALUES ('t0101002', 'e10adc3949ba59abbe56e057f20f883e', '陈阳', 1, 1);
INSERT INTO `teachers` VALUES ('t0101019', 'e10adc3949ba59abbe56e057f20f883e', '孙玉明', 0, 2);
INSERT INTO `teachers` VALUES ('t0202003', 'e10adc3949ba59abbe56e057f20f883e', '杨欣', 0, 2);
INSERT INTO `teachers` VALUES ('t0202004', 'e10adc3949ba59abbe56e057f20f883e', '蒋顾安', 1, 3);
INSERT INTO `teachers` VALUES ('t0202020', 'e10adc3949ba59abbe56e057f20f883e', '李强', 1, 3);
INSERT INTO `teachers` VALUES ('t0303005', 'e10adc3949ba59abbe56e057f20f883e', '张正', 1, 4);
INSERT INTO `teachers` VALUES ('t0303006', 'e10adc3949ba59abbe56e057f20f883e', '王丽娜', 0, 4);
INSERT INTO `teachers` VALUES ('t0303021', 'e10adc3949ba59abbe56e057f20f883e', '周海平', 1, 5);
INSERT INTO `teachers` VALUES ('t0404007', 'e10adc3949ba59abbe56e057f20f883e', '玉林', 1, 5);
INSERT INTO `teachers` VALUES ('t0404008', 'e10adc3949ba59abbe56e057f20f883e', '刘明', 1, 6);
INSERT INTO `teachers` VALUES ('t0404022', 'e10adc3949ba59abbe56e057f20f883e', '曹植锅', 0, 6);
INSERT INTO `teachers` VALUES ('t0505009', 'e10adc3949ba59abbe56e057f20f883e', '齐小涵', 0, 7);
INSERT INTO `teachers` VALUES ('t0505010', 'e10adc3949ba59abbe56e057f20f883e', '王陆军', 1, 7);
INSERT INTO `teachers` VALUES ('t0505023', 'e10adc3949ba59abbe56e057f20f883e', '王小平', 1, 8);
INSERT INTO `teachers` VALUES ('t0606011', 'e10adc3949ba59abbe56e057f20f883e', '赵云鹤', 1, 8);
INSERT INTO `teachers` VALUES ('t0606012', 'e10adc3949ba59abbe56e057f20f883e', '赵森', 0, 9);
INSERT INTO `teachers` VALUES ('t0606024', 'e10adc3949ba59abbe56e057f20f883e', '从光', 0, 9);
INSERT INTO `teachers` VALUES ('t0707013', 'e10adc3949ba59abbe56e057f20f883e', '王万里', 1, 2);
INSERT INTO `teachers` VALUES ('t0707014', 'e10adc3949ba59abbe56e057f20f883e', '凉爽', 1, 1);
INSERT INTO `teachers` VALUES ('t0707025', 'e10adc3949ba59abbe56e057f20f883e', '周明', 1, 3);
INSERT INTO `teachers` VALUES ('t0808015', 'e10adc3949ba59abbe56e057f20f883e', '屈兵', 0, 4);
INSERT INTO `teachers` VALUES ('t0808016', 'e10adc3949ba59abbe56e057f20f883e', '王卫兵', 1, 5);
INSERT INTO `teachers` VALUES ('t0808026', 'e10adc3949ba59abbe56e057f20f883e', '张强', 1, 6);
INSERT INTO `teachers` VALUES ('t0909017', 'e10adc3949ba59abbe56e057f20f883e', '陈保亚', 0, 7);
INSERT INTO `teachers` VALUES ('t0909018', 'e10adc3949ba59abbe56e057f20f883e', '孙玉萍', 0, 8);
INSERT INTO `teachers` VALUES ('t0909027', 'e10adc3949ba59abbe56e057f20f883e', '陈梦', 0, 9);
INSERT INTO `teachers` VALUES ('t123456', 'e10adc3949ba59abbe56e057f20f883e', '隔壁老王', 0, 6);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('123456', '霞飞路', '2021-05-02T16:00:00.000Z', '2556920917@qq.com', '13099890048');
INSERT INTO `user_info` VALUES ('s010001', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010002', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010003', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010004', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010005', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010006', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010007', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010008', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010009', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010010', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('s010011', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0101001', '成华大道', '2021-05-03T16:00:00.000Z', 'sadfdf@sina.cn', '13099890048');
INSERT INTO `user_info` VALUES ('t0101002', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0101019', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0202003', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0202004', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0202020', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0303005', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0303006', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0303021', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0404007', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0404008', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0404022', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0505009', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0505010', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0505023', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0606011', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0606012', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0606024', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0707013', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0707014', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0707025', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0808015', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0808016', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0808026', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0909017', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0909018', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t0909027', NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('t123456', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
