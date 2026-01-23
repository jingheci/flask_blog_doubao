/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50605
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_blog

 Target Server Type    : MySQL
 Target Server Version : 50605
 File Encoding         : 65001

 Date: 30/04/2025 23:19:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `keyword` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '文章所属分类的id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记(0-未删除;1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'Flask框架深度解析', 'Flask,Python,Web开发', '张三', '本文详细介绍了Flask框架的核心概念和最佳实践...', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (2, 'MySQL索引优化实战', 'MySQL,数据库,性能优化', '李四', '更新后的索引优化内容...', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (3, '东京旅行日记', '旅行,日本,生活', '王五', '上周去了东京塔和浅草寺，感受到了传统与现代的完美融合...', 2, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (4, '《百年孤独》读后感', '文学,读书,魔幻现实主义', '赵六', '马尔克斯用魔幻的笔触描绘了布恩迪亚家族的百年兴衰...', 3, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (5, '前端性能优化指南', 'Web性能,前端开发,优化', '张三', '从减少HTTP请求到使用CDN，全面解析前端性能优化方案...', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (6, '咖啡制作入门教程', '咖啡,手冲,教程', '李四', '从选豆到冲泡，手把手教你制作一杯完美的手冲咖啡...', 2, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (7, '2023年互联网趋势预测', '行业分析,互联网,趋势', NULL, '本文基于Gartner报告分析2023年互联网行业五大发展趋势...', 4, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (8, 'Python装饰器详解', 'Python,装饰器,进阶', '王五', '从函数装饰器到类装饰器，深度解析Python装饰器实现原理...', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 0);
INSERT INTO `article` VALUES (9, '已删除测试文章', '测试,删除', '系统', '这篇文章用于测试软删除功能', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '是否启用(0-未启用;1-启用)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '技术分享', '最新技术文章和开发教程', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45');
INSERT INTO `category` VALUES (2, '生活随笔', '日常生活中的点滴感悟', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45');
INSERT INTO `category` VALUES (3, '读书笔记', '书籍阅读心得与推荐', 1, '2025-04-28 16:54:45', '2025-04-28 16:54:45');
INSERT INTO `category` VALUES (4, '行业观察', '互联网行业趋势分析', 0, '2025-04-28 16:54:45', '2025-04-28 16:54:45');

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日记标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日记内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `mood` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '心情状态(如：开心、难过等)',
  `weather` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '天气情况',
  `is_private` tinyint(1) NULL DEFAULT 1 COMMENT '是否私密(1-私密 0-公开)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人日记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES (1, '美好周末', '今天和朋友们去了郊外野餐，阳光明媚，大家玩得很开心。', '2023-05-15 20:30:00', '2025-04-30 19:02:42', '开心', '晴朗', 0);
INSERT INTO `diary` VALUES (2, '项目完成', '终于完成了这个月的项目，虽然很累但很有成就感。', '2023-05-18 22:15:00', '2025-04-30 19:02:42', '满足', '多云', 1);
INSERT INTO `diary` VALUES (3, '雨日思绪', '窗外下着小雨，泡一杯热茶，读一本好书，难得的宁静时光。', '2023-05-20 15:45:00', '2025-04-30 19:02:42', '平静', '小雨', 0);
INSERT INTO `diary` VALUES (4, '健身打卡', '今天跑了5公里，虽然开始很艰难，但跑完后感觉整个人都轻松了。', '2023-05-22 19:00:00', '2025-04-30 19:02:42', '充实', '晴朗', 1);
INSERT INTO `diary` VALUES (5, '家庭聚餐', '全家人一起为妈妈庆祝生日，做了她最爱吃的菜，温馨的夜晚。', '2023-05-25 21:30:00', '2025-04-30 19:02:42', '幸福', '晴朗', 0);
INSERT INTO `diary` VALUES (6, 'Python学习', '今天学习了Flask框架，终于搞懂了蓝图的使用方法，收获颇丰。', '2023-05-28 23:10:00', '2025-04-30 19:02:42', '专注', '多云', 1);
INSERT INTO `diary` VALUES (7, '海边一日游', '去了附近的海滩，海水很蓝，沙滩很软，捡到了几个漂亮的贝壳。', '2023-06-02 18:45:00', '2025-04-30 19:02:42', '兴奋', '晴朗', 0);
INSERT INTO `diary` VALUES (8, '有点沮丧', '今天工作上遇到了一些挫折，感觉自己的能力还有待提高。', '2023-06-05 22:00:00', '2025-04-30 19:02:42', '沮丧', '阴天', 1);
INSERT INTO `diary` VALUES (9, '《活着》读后感', '读完余华的《活着》，感慨万千，更加珍惜现在的生活。', '2023-06-08 20:20:00', '2025-04-30 19:02:42', '深思', '多云', 0);
INSERT INTO `diary` VALUES (10, '自制披萨', '第一次尝试自己做披萨，虽然形状不太好看，但味道还不错！', '2023-06-12 19:30:00', '2025-04-30 19:02:42', '愉快', '晴朗', 1);
INSERT INTO `diary` VALUES (11, '猫咪趣事', '我家猫今天把毛线球缠得到处都是，又气又好笑。', '2023-06-15 21:00:00', '2025-04-30 19:02:42', '开心', '晴朗', 0);
INSERT INTO `diary` VALUES (12, '扭伤脚踝', '打篮球时不小心扭伤了脚踝，可能要休息几天了，真倒霉。', '2023-06-18 18:15:00', '2025-04-30 19:02:42', '痛苦', '晴朗', 1);
INSERT INTO `diary` VALUES (13, '端午节', '包了粽子，看了龙舟比赛，感受到了浓浓的节日氛围。', '2023-06-22 20:45:00', '2025-04-30 19:02:42', '欢乐', '晴朗', 0);
INSERT INTO `diary` VALUES (14, '《星际穿越》', '重温这部经典科幻片，依然被其中的父女情感动得热泪盈眶。', '2023-06-25 23:30:00', '2025-04-30 19:02:42', '感动', '小雨', 1);
INSERT INTO `diary` VALUES (15, '下半年目标', '制定了学习计划和健身目标，希望自己能坚持完成！', '2023-06-30 22:00:00', '2025-04-30 19:02:42', '期待', '多云', 0);

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `image_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES (1, '博客图片1', '爱情没有永远，地老天荒也走不完，生命终结1', '/static/home/images/2.jpg');
INSERT INTO `photo` VALUES (2, '博客图片2', '爱情没有永远，地老天荒也走不完，生命终结2', '/static/home/images/1.jpg');
INSERT INTO `photo` VALUES (3, '博客图片3', '爱情没有永远，地老天荒也走不完，生命终结3', '/static/home/images/3.jpg');
INSERT INTO `photo` VALUES (4, '博客图片4', '爱情没有永远，地老天荒也走不完，生命终结4', '/static/home/images/4.jpg');
INSERT INTO `photo` VALUES (5, '博客图片5', '爱情没有永远，地老天荒也走不完，生命终结5', '/static/home/images/5.jpg');
INSERT INTO `photo` VALUES (6, '博客图片6', '爱情没有永远，地老天荒也走不完，生命终结6', '/static/home/images/6.jpg');
INSERT INTO `photo` VALUES (7, '博客图片7', '爱情没有永远，地老天荒也走不完，生命终结7', '/static/home/images/7.jpg');
INSERT INTO `photo` VALUES (8, '博客图片8', '爱情没有永远，地老天荒也走不完，生命终结8', '/static/home/images/8.jpg');

SET FOREIGN_KEY_CHECKS = 1;
