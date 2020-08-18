/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : meizu

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-08-14 21:35:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `gId` int(11) NOT NULL COMMENT '主键',
  `uId` int(11) NOT NULL COMMENT '外键',
  `gName` varchar(50) NOT NULL COMMENT '商品名称',
  `gPrice` int(10) NOT NULL COMMENT '商品价格',
  `gNumber` int(10) NOT NULL COMMENT '商品数量',
  `gTotal` int(50) NOT NULL COMMENT '总额',
  `gImg` varchar(50) DEFAULT NULL COMMENT '图片路径',
  `gStatus` int(1) unsigned zerofill DEFAULT '1' COMMENT '状态 1:可用, 0:删除',
  `gtime` varchar(0) DEFAULT NULL,
  `gDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `uId` (`uId`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `userinfo` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('40', '4', '23', '魅族 16T', '2499', '5', '2499', '/image/product/product4/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('41', '5', '23', '魅族 16s Pro', '2699', '1', '2699', '/image/product/product5/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('43', '1', '26', '魅族 17', '3699', '3', '3699', '/image/product/product1/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('44', '2', '26', '魅族 17 Pro', '4299', '4', '21495', '/image/product/product2/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('47', '6', '26', '魅族 16Xs', '1499', '4', '5996', '/image/product/product6/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('49', '2', '30', '魅族 17 Pro', '4299', '7', '8598', '/image/product/product2/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('50', '4', '30', '魅族 16T', '2499', '5', '2499', '/image/product/product4/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('51', '5', '30', '魅族 16s Pro', '2699', '9', '2699', '/image/product/product5/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');
INSERT INTO `carts` VALUES ('52', '18', '30', 'Pandaer 「17」系列 手机壳', '49', '3', '147', '/image/product/product18/thumb-pic.png', '1', null, '全网通公开版AG星际灰8+128GB');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `artid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '匿名用户', '2018-07-15 14:49:11', '1', '0', '2');
INSERT INTO `comments` VALUES ('2', '匿名用户', '2018-07-15 14:49:13', '2', '0', '2');
INSERT INTO `comments` VALUES ('3', '匿名用户', '2018-07-15 14:49:15', '3', '0', '2');
INSERT INTO `comments` VALUES ('4', '匿名用户', '2018-07-15 14:49:16', '4', '0', '2');
INSERT INTO `comments` VALUES ('5', '匿名用户', '2018-07-15 16:13:48', 'ssss', '0', '12');
INSERT INTO `comments` VALUES ('6', '匿名用户', '2018-07-15 16:13:51', 'ssss', '0', '12');
INSERT INTO `comments` VALUES ('7', '匿名用户', '2018-07-15 16:14:00', '11', '0', '12');
INSERT INTO `comments` VALUES ('8', '匿名用户', '2018-07-15 16:36:55', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('9', '匿名用户', '2018-07-15 18:14:19', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('10', '匿名用户', '2018-07-15 18:14:23', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('11', '匿名用户', '2018-07-15 18:14:24', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('12', '匿名用户', '2018-07-15 19:35:54', '2222', '0', '1');
INSERT INTO `comments` VALUES ('13', '匿名用户', '2018-07-15 19:35:56', 'ddddd', '0', '1');
INSERT INTO `comments` VALUES ('14', '匿名用户', '2018-07-15 19:35:59', 'ssss', '0', '1');
INSERT INTO `comments` VALUES ('15', '匿名用户', '2019-05-24 00:21:29', '牛逼', '0', '2');
INSERT INTO `comments` VALUES ('16', '匿名用户', '2019-05-24 09:16:25', '牛逼', '0', '1');
INSERT INTO `comments` VALUES ('17', '匿名用户', '2019-08-03 08:51:47', 'sddddd', '0', '7');
INSERT INTO `comments` VALUES ('18', '匿名用户', '2019-08-03 08:51:53', 'dddddd', '0', '7');
INSERT INTO `comments` VALUES ('19', '匿名用户', '2019-11-05 19:30:19', 'dddddd', '0', '1');
INSERT INTO `comments` VALUES ('20', '匿名用户', '2019-11-05 19:30:40', 'ygy', '0', '1');
INSERT INTO `comments` VALUES ('21', '匿名用户', '2019-11-05 19:33:57', 'dfdsfaafagafd', '0', '1');
INSERT INTO `comments` VALUES ('22', '匿名用户', '2019-11-06 09:06:18', 'ddddd', '0', '1');
INSERT INTO `comments` VALUES ('23', '匿名用户', '2019-11-06 09:06:21', 'ssssss', '0', '1');
INSERT INTO `comments` VALUES ('24', '匿名用户', '2019-11-06 09:09:00', 'sssss', '0', '1');
INSERT INTO `comments` VALUES ('25', '匿名用户', '2019-11-06 09:09:37', 'ddssss', '0', '1');
INSERT INTO `comments` VALUES ('26', '匿名用户', '2019-11-06 09:20:03', '', '0', '3');
INSERT INTO `comments` VALUES ('27', '匿名用户', '2019-11-06 09:20:04', '', '0', '3');
INSERT INTO `comments` VALUES ('28', '匿名用户', '2019-11-06 09:20:05', '', '0', '3');
INSERT INTO `comments` VALUES ('29', '匿名用户', '2019-11-06 09:20:14', '', '0', '1');

-- ----------------------------
-- Table structure for girds
-- ----------------------------
DROP TABLE IF EXISTS `girds`;
CREATE TABLE `girds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of girds
-- ----------------------------
INSERT INTO `girds` VALUES ('1', '/home/newslist', '新闻资讯', '/home/gird/menu1.png', '0');
INSERT INTO `girds` VALUES ('2', '/home/photolist', '图片分享', '/home/gird/menu2.png', '0');
INSERT INTO `girds` VALUES ('3', '/home/goodslist', '商品购买', '/home/gird/menu3.png', '0');
INSERT INTO `girds` VALUES ('4', '/home/newslist', '留言反馈', '/home/gird/menu4.png', '0');
INSERT INTO `girds` VALUES ('5', '/home/newslist', '视频区域', '/home/gird/menu5.png', '0');
INSERT INTO `girds` VALUES ('6', '/home/newslist', '联系我们', '/home/gird/menu6.png', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `purchased` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `thumbnail_img` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,0) DEFAULT NULL,
  `stock_quantity` varchar(255) DEFAULT NULL,
  `waptitle` varchar(255) DEFAULT NULL,
  `classify` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '魅族 17', '2020-08-06 17:22:12', '【购魅族17赠全新壳膜套装 限时领券至高立省300】【老用户专享18个月超长延保】【学生购机享精美礼品】高通骁龙 865 + UFS 3.1 高速闪存', '满3699减200 | 满3999减300', '另加29元起，即可换购超值商品', '[\"魅族 17\",\"魅族 17 Pro\",\"【17Pro老用户专享】\",\"【魅族17老用户专享】\",\"【12期免息套餐】\"]', '[\"松深入墨\",\"十七度灰\",\"AG梦幻独角兽\",\"AG星际灰\",\"AG原野绿\"]', '/image/product/product1/thumb-pic.png', '/image/product/product1/', '3699', '60', '限时领券至高立省300元 限时赠壳膜套装', '1', '0', '1');
INSERT INTO `goods` VALUES ('2', '魅族 17 Pro', '2020-08-06 17:15:17', '【购17Pro赠全新壳膜套装】【老用户专享 18个月超长保修】【学生购机享精美礼品】高通骁龙 865 + UFS 3.1 + LPDDR5 | 6400W 全场景 AR 专业影像系统 ', null, '另加29元起，即可换购超值商品\r\n', '[\"魅族 17 Pro\",\" 魅族 17\",\"【魅族17老用户专享】\",\"【17Pro老用户专享】\"]', '[\"乌金\",\"定白\",\"天青\",\"月白天青\"]', '/image/product/product2/thumb-pic.png', '/image/product/product2/', '4299', '60', '限时赠全新壳膜套装', '1', '0', '2');
INSERT INTO `goods` VALUES ('3', '魅族 17 Pro 晓芳窑艺术典藏版', '2020-08-06 17:15:17', '这艺术 科技极了', null, '', '[\"晓芳窑艺术典藏版\",\"魅族17航母限定版\"]', '[\"天青\"]', '/image/product/product3/thumb-pic.png', '/image/product/product3/', '9999', '60', '18个月超长保修', '1', '0', '3');
INSERT INTO `goods` VALUES ('4', '魅族 16T', '2020-08-06 17:15:17', '6.5英寸极边全面屏 | 骁龙855旗舰处理器 | 4500mAh续航怪兽 | UFS 3.0 高速闪存 | 「双」·立体声扬声器 | 超广角 AI 三摄 | 线性振动马达 | 全球频段', null, '另加29元起，即可换购超值商品\r\n', '[\"魅族 16T\",\"魅族 16s Pro\",\"魅族 17\",\"魅族 17 Pro\",\"魅族16thPlus\",\"魅族 16Xs\"]', '[\"鲸跃蓝\",\"湖光绿\",\"日光橙\"]', '/image/product/product4/thumb-pic.png', '/image/product/product4/', '2499', '60', '18个月超长保修', '1', '0', '4');
INSERT INTO `goods` VALUES ('5', '魅族 16s Pro', '2020-08-06 17:15:17', '高通骁龙 855 Plus | 索尼 4800W 像素超广角 AI 三摄 | 极边全面屏 | Flyme8 尝鲜体验 | 极速屏下指纹 | 全功能NFC', null, '另加29元起，即可换购超值商品\r\n', '[\"魅族 16T\",\"魅族 16s Pro\",\"魅族 17\",\"魅族 17 Pro\",\"魅族16thPlus\",\"魅族 16Xs\"]', '[\"黑之谧镜\",\"梦幻独角兽\",\"暮光森林\",\"白色物语\"]', '/image/product/product5/thumb-pic.png', '/image/product/product5/', '2699', '60', '至高立省635元', '1', '0', '5');
INSERT INTO `goods` VALUES ('6', '魅族 16Xs', '2020-08-06 19:54:38', '极边全面屏 | 4800W AI三摄 | 疾速屏下指纹 | 4000mAh大电池 | 高通骁龙675 | Onemind 3.0 | 绚丽多彩新色系', null, '68', '[\"魅族 16T\",\"魅族 16s Pro\",\"魅族 17\",\"魅族 17 Pro\",\"魅族16thPlus\",\"魅族 16Xs\"]', '[\"骑士黑\",\"亚特兰蒂斯\",\"珊瑚橙\",\"冰丝白\"]', '/image/product/product6/thumb-pic.png', '/image/product/product6/', '1499', '60', '绚丽多彩新色系', '1', '0', '6');
INSERT INTO `goods` VALUES ('7', '魅族 17', '2020-08-06 17:22:12', '【购魅族17赠全新壳膜套装 限时领券至高立省300】【老用户专享18个月超长延保】【学生购机享精美礼品】高通骁龙 865 + UFS 3.1 高速闪存', '满3699减200 | 满3999减300', '另加29元起，即可换购超值商品', '[\"魅族 17\",\"魅族 17 Pro\",\"【17Pro老用户专享】\",\"【魅族17老用户专享】\",\"【12期免息套餐】\"]', '[\"松深入墨\",\"十七度灰\",\"AG梦幻独角兽\",\"AG星际灰\",\"AG原野绿\"]', '/image/product/product7/thumb-pic.png', '/image/product/product7/', '3699', '60', '限时领券至高立省300元 限时赠壳膜套装', '1', '0', '7');
INSERT INTO `goods` VALUES ('8', '魅族 17 Pro', '2020-08-06 17:15:17', '【购17Pro赠全新壳膜套装】【老用户专享 18个月超长保修】【学生购机享精美礼品】高通骁龙 865 + UFS 3.1 + LPDDR5 | 6400W 全场景 AR 专业影像系统 ', '', '另加29元起，即可换购超值商品\r\n', '[\"魅族 17 Pro\",\" 魅族 17\",\"【魅族17老用户专享】\",\"【17Pro老用户专享】\"]', '[\"乌金\",\"定白\",\"天青\",\"月白天青\"]', '/image/product/product8/thumb-pic.png', '/image/product/product8/', '4299', '60', '限时赠全新壳膜套装', '1', '0', '8');
INSERT INTO `goods` VALUES ('9', '魅族 HD60 降噪耳机', '2020-08-13 17:05:17', '索尼主动降噪芯片 | 40mm镀铍振膜 | 触控操作 | USB - C 快充 | 轻奢品质', '\r\n满399减100', null, '[\"魅族 HD60 降噪耳机\",\"夏日特惠\",\"老用户专享\",\"HD60头戴式蓝牙耳机\"]', '[\"雾银黑\"]', '/image/product/product9/thumb-pic.png', '/image/product/product9/', '1099', '60', '夏日限时特惠999元', '2', '0', '9');
INSERT INTO `goods` VALUES ('10', '魅族 POP2 真无线蓝牙耳机', '2020-08-13 17:09:49', '蓝牙5.0 | 单次8H续航 | 石墨烯振膜 | 双耳通话 | 轻触操作 | 轻盈舒适', '\r\n满299减70', null, '[\"POP2\",\"夏日特惠\",\"EP52 Lite\",\"HALO\",\"HD60\",\"EP63NC\"]', '[\"皓月白\"]', '/image/product/product10/thumb-pic.png', '/image/product/product10/', '399', '60', '夏日限时特惠329元', '2', '0', '10');
INSERT INTO `goods` VALUES ('11', '魅族 HIFI 解码耳放\r\n魅族 HIFI 解码耳放\r\n魅族 HIFI 解码耳放\r\n', '2020-08-13 17:09:52', '高性能DAC芯片 | 纯净HiFi音质 | 600Ω高阻抗推力 | Type-C 转接线 | 音乐发烧友必备', '\r\n满169减50', null, '[\"HIFI 解码耳放\",\"夏日特惠\",\" LIVE 四单元动铁耳机\"]', '[\"黑色\"]', '/image/product/product11/thumb-pic.png', '/image/product/product11/', '169', '60', '夏日限时特惠119元', '2', '0', '11');
INSERT INTO `goods` VALUES ('12', '魅族 EP3C 耳机', '2020-08-13 17:09:54', 'Hi-Res 认证高解析音质 | Type-C数字接口 | 高保真生物纤维振膜', '\r\n满129减30', null, '[\"EP3C\",\"夏日特惠\",\"EP21\",\"EP2X\",\"LIVE\"]', '[\"白色\"]', '/image/product/product12/thumb-pic.png', '/image/product/product12/', '129', '60', '夏日限时特惠99元', '2', '0', '12');
INSERT INTO `goods` VALUES ('13', '魅族 EP63NC 无线降噪耳机', '2020-08-13 17:09:57', 'AMS 芯片智能降噪 | Qualcomm apt-X™ 高清音质 | 蓝牙一拖二连接 | 11小时超长续航 | 快充15分钟畅听3小时', '\r\n满399减100', null, '[\"EP63NC\",\"夏日特惠\",\"POP2\",\"EP52 Lite\",\"HALO\",\"HD60\"]', '[\"玄武灰\"]', '/image/product/product13/thumb-pic.png', '/image/product/product13/', '399', '60', '夏日限时特惠299元', '2', '0', '13');
INSERT INTO `goods` VALUES ('14', '魅族 HD60 头戴式蓝牙耳机', '2020-08-13 17:09:59', '40mm生物振膜 | Type-C充电 | 触控操作 | 蓝牙5.0 | 轻奢品质', '满299减70', null, '[\"HD60\",\"夏日特惠\",\"老用户专享\",\"HD60（降噪）\",\"EP63NC\",\"POP2\"]', '[\"雾银黑色\",\"热带橙色\"]', '/image/product/product14/thumb-pic.png', '/image/product/product14/', '499', '60', '夏日特惠429元', '2', '0', '14');
INSERT INTO `goods` VALUES ('15', '魅族 EP21耳机', '2020-08-13 17:10:02', '三键一体式线控 | 3.5mm接口', null, null, '[\"EP21\",\"EP21-HD\",\"EP2X\",\"EP2C\",\"EP3C\",\"LIVE\"]', '[\"白色\"]', '/image/product/product15/thumb-pic.png', '/image/product/product15/', '89', '60', null, '2', '0', '15');
INSERT INTO `goods` VALUES ('16', '魅族 HALO 激光蓝牙耳机', '2020-08-13 17:10:04', '炫酷夜跑神器 随性张扬', null, null, '[\"HALO\",\"EP63NC\",\"POP2\",\"HD60\",\"EP52 Lite\"]', '[\"蓝色\",\"红色\"]', '/image/product/product16/thumb-pic.png', '/image/product/product16/', '499', '60', null, '2', '0', '16');
INSERT INTO `goods` VALUES ('17', '魅族无线超充板\r\n魅族无线超充板\r\n', '2020-08-13 20:09:05', '魅族 17 Pro 适用 | 27W 无线快充 | 主动散热 | 智能静音 | 玉润设计', null, null, '[\"魅族无线超充板\",\"老用户专享\",\"GaN 三口充电器\",\"双 USB-C 快充线\",\"Type-C 数据线\",\"Type-C 游戏专用线\"]', '[\"白色\"]', '/image/product/product17/thumb-pic.png', '/image/product/product17/', '169', '60', null, '3', '0', '17');
INSERT INTO `goods` VALUES ('18', 'Pandaer 「17」系列 手机壳', '2020-08-13 20:09:08', '魅族 17 / 魅族 17 Pro 适用 | Pandaer 家族 | 潮趣个性 | 官方适配', null, null, '[\"Pandaer 17系列手机壳\",\"魅族17系列液态硅胶壳\"]', '[\"太空漫游\",\"赛博熊\",\"黑色引力\",\"一只熊\"]', '/image/product/product18/thumb-pic.png', '/image/product/product18/', '49', '60', 'APP积分兑换10元优惠券', '3', '0', '18');
INSERT INTO `goods` VALUES ('19', '魅族 17 系列 液态硅胶壳', '2020-08-13 20:09:11', '魅族 17 / 魅族 17 Pro 适用 | 官方适配 | 魅族手感 | 柔韧保护', null, null, '[\"魅族17系列液态硅胶壳\",\"Pandaer 17系列手机壳\"]', '[\"象牙白\",\"刷新绿\"]', '/image/product/product19/thumb-pic.png', '/image/product/product19/', '89', '60', null, '3', '0', '19');
INSERT INTO `goods` VALUES ('20', '魅族 Type-C 数据线', '2020-08-13 20:09:15', '5A 大电流 | Type-C 接口 | 更快更方便', null, null, '[\"魅族 Type-C 数据线\",\"中国红 Type-C 编织线\",\"Type-C 游戏专用线\",\"Lifeme PD 快充线\",\"双 USB-C 快充线\",\"快充电源适配器\"]', '[\"白色\"]', '/image/product/product20/thumb-pic.png', '/image/product/product20/', '49', '60', null, '3', '0', '20');
INSERT INTO `goods` VALUES ('21', '魅族 Type-C 游戏专用线', '2020-08-13 20:09:18', 'Type-C 接口 | 5A大电流 | 弯头专为游戏设计 | 耐磨编织材料', null, null, '[\"Type-C 游戏专用线\",\"中国红 Type-C 编织线\",\"魅族 Type-C 数据线\",\"快充电源适配器\",\"Lifeme PD 快充线\",\"双 USB-C 快充线\"]', '[\"红色\"]', '/image/product/product21/thumb-pic.png', '/image/product/product21/', '49', '60', null, '3', '0', '21');
INSERT INTO `goods` VALUES ('22', '魅族中国红 Type-C 金属编织线', '2020-08-13 20:09:21', 'Type-C 接口 | 3A大电流 | 耐磨编织材料', null, null, '[\"中国红 Type-C 编织线\",\"魅族 Type-C 数据线\",\"Type-C 游戏专用线\",\"快充电源适配器\",\"双 USB-C 快充线\",\"Lifeme PD 快充线\"]', '[\"红色\"]', '/image/product/product22/thumb-pic.png', '/image/product/product22/', '39', '60', null, '3', '0', '22');
INSERT INTO `goods` VALUES ('23', '魅族移动电源3', '2020-08-13 20:09:23', '10000mAh | 18W双向快充 | 12重安全防护', null, null, '[\"魅族移动电源3\",\"中国红 Type-C 编织线\",\"快充电源适配器\",\"Type-C 游戏专用线\",\"Type-C 数据线\"]', '[\"静谧黑\",\"简约白\"]', '/image/product/product23/thumb-pic.png', '/image/product/product23/', '79', '60', null, '3', '0', '23');
INSERT INTO `goods` VALUES ('24', '快充电源适配器（UP0830S）', '2020-08-13 20:40:44', '快速充电 安全无忧', null, null, '[\"快充电源适配器\",\"中国红 Type-C 编织线\",\"移动电源3\"]', '[\"白色\"]', '/image/product/product24/thumb-pic.png', '/image/product/product24/', '89', '60', null, '3', '0', '24');
INSERT INTO `goods` VALUES ('25', 'Lifeme 双肩包', '2020-08-13 20:45:47', '创新外观设计 | 扩容超大容量 | 人体工学背负 | 轻盈减负重量 | 颜值安全插扣 | 相机包新搭配', '满299减40', '另加99元起，即可换购超值商品', '[\"Lifeme 双肩包\",\"夏日特惠\",\"魅族极简都市双肩包\",\"Lifeme 相机包\",\"Lifeme 梨木伞\"]', '[\"森林\",\"曜石\",\"雪山\"]', '/image/product/product25/thumb-pic.png', '/image/product/product25/', '299', '60', '夏日限时特惠259元', '4', '0', '25');
INSERT INTO `goods` VALUES ('26', 'Pandaer 「17」系列 T恤', '2020-08-13 20:45:51', '潮酷印花 | 丝绸手感 | 100％长绒棉', '\r\n满269减120', '\r\n另加69元起，即可换购超值商品', '[\"Pandaer 系列 T恤\",\"夏日特惠\",\"Pandaer readnap T恤\",\"Pandaer 魔术师帽衫\",\"Flyme 8 暗夜流光卫衣\",\"Pandaer 系列 果冻包\"]', '[\"黑色 赛博熊\",\"白色 太空漫游\",\"黑色 宇航员\"]', '/image/product/product26/thumb-pic.png', '/image/product/product26/', '269', '60', '8月13日APP限时抢购109元 夏日限时特惠149元', '4', '0', '26');
INSERT INTO `goods` VALUES ('27', 'Pandaer 「17」系列 果冻包', '2020-08-13 20:45:54', '潮酷印花 | 超大容量 | 透亮设计', '满99减20', null, '[\"Pandaer 系列 果冻包\",\"Pandaer 系列 T恤\"]', '[\"蓝色\",\"透明\"]', '/image/product/product27/thumb-pic.png', '/image/product/product27/', '99', '60', 'APP积分兑换40元优惠券 夏日特惠79元', '4', '0', '27');
INSERT INTO `goods` VALUES ('28', 'Lifeme 相机包', '2020-08-13 20:45:56', '相机包新搭配 | 一机两镜超大容量 | 加厚防冲击材料', null, null, '[\"Lifeme 相机包\",\"Lifeme 双肩包\",\"Lifeme 梨木伞\"]', '[\"灰黑\"]', '/image/product/product28/thumb-pic.png', '/image/product/product28/', '129', '60', null, '4', '0', '28');
INSERT INTO `goods` VALUES ('29', '魅族防飞溅声波电动牙刷', '2020-08-13 20:45:59', '智能压感防飞溅 | 超强震动清洁 | FDA 杜邦软毛 | 30天超长续航 | IPX7 级防水全身防霉防污垢 | 四种模式全面呵护', '\r\n满299减70', null, '[\"防飞溅声波电动牙刷\",\"夏日特惠\",\"老用户专享\",\"声波电动牙刷刷头\"]', '[\"白色”]', '/image/product/product29/thumb-pic.png', '/image/product/product29/', '299', '60', '8月13日APP限时抢购199元 夏日限时特惠229元', '4', '0', '29');
INSERT INTO `goods` VALUES ('30', '魅族极简都市双肩包', '2020-08-13 20:46:01', '650D高耐磨牛津布 | 人体工学减负设计 | 大容量多功能收纳 | 生活防泼溅', '\r\n满169减50\r\n\r\n\r\n满169减50\r\n\r\n\r\n满169减50\r\n\r\n满169减50', null, '[\"魅族极简都市双肩包\",\"夏日特惠\",\"Lifeme 双肩包\"]', '[\"理性黑\",\"朴素灰\"]', '/image/product/product30/thumb-pic.png', '/image/product/product30/', '179', '60', '夏日限时特惠129元', '4', '0', '30');
INSERT INTO `goods` VALUES ('31', 'Pandaer readnap T恤', '2020-08-13 20:46:03', '潮趣设计 | 100％精织纯棉 | 多重潮流工艺 | Mixcolor混色搭配 | 情侣装', null, null, '[\"Pandaer readnap T恤\",\"Pandaer 系列 T恤\",\"Pandaer 魔术师帽衫\",\"Flyme 8 暗夜流光卫衣\",\"Pandaer 鼠年圆领卫衣\"]', '[\"黑色\"]', '/image/product/product31/thumb-pic.png', '/image/product/product31/', '199', '60', null, '4', '0', '31');
INSERT INTO `goods` VALUES ('32', 'Pandaer 魔术师帽衫', '2020-08-13 20:46:06', 'Magic Pandaer前卫设计 | 100％精梳棉纱 | 潮流款式 挺括有型 | 亲肤内衬 柔顺舒适 | 情侣装', null, null, '[\"Pandaer 魔术师帽衫\",\"Pandaer readnap T恤\",\"Pandaer 鼠年圆领卫衣\",\"Flyme 8 暗夜流光卫衣\"]', '[\"藏青色\"]', '/image/product/product32/thumb-pic.png', '/image/product/product32/', '399', '60', null, '4', '0', '32');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `sell_price` decimal(10,0) DEFAULT NULL,
  `market_price` decimal(10,0) DEFAULT NULL,
  `stock_quantity` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `goods_no` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('1', '魅族 17', '2020-08-06 19:57:18', '3699', '3899', '60', '0', 'SD3345678902', '1');
INSERT INTO `goods_info` VALUES ('2', '魅族 17 Pro', '2020-08-06 19:59:31', '4299', '4399', '60', '0', 'SD3345678903', '2');
INSERT INTO `goods_info` VALUES ('3', '魅族 17 Pro 晓芳窑艺术典藏版', '2020-08-06 19:59:33', '9999', '9999', '60', '0', 'SD3345678904', '3');
INSERT INTO `goods_info` VALUES ('4', '魅族 16T', '2020-08-06 19:59:35', '2499', '2599', '60', '0', 'SD3345678905', '4');
INSERT INTO `goods_info` VALUES ('5', '魅族 16s Pro', '2020-08-06 19:59:38', '2699', '2899', '60', '0', 'SD3345678906', '5');
INSERT INTO `goods_info` VALUES ('6', '魅族 16Xs', '2020-08-06 19:59:40', '1699', '1899', '60', '0', 'SD3345678907', '6');

-- ----------------------------
-- Table structure for good_desc
-- ----------------------------
DROP TABLE IF EXISTS `good_desc`;
CREATE TABLE `good_desc` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `desc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_desc
-- ----------------------------
INSERT INTO `good_desc` VALUES ('0', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '限时下单立减100，到手价2499元，赠荣耀耳机+运动臂带，享双倍积分，晒单赢499元美食卡，现货速发！', '0', '101');

-- ----------------------------
-- Table structure for imgs_class
-- ----------------------------
DROP TABLE IF EXISTS `imgs_class`;
CREATE TABLE `imgs_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_class
-- ----------------------------
INSERT INTO `imgs_class` VALUES ('1', '美女', '0');
INSERT INTO `imgs_class` VALUES ('2', '宠物', '0');
INSERT INTO `imgs_class` VALUES ('3', '家具', '0');
INSERT INTO `imgs_class` VALUES ('4', '运动', '0');
INSERT INTO `imgs_class` VALUES ('5', '数码', '0');
INSERT INTO `imgs_class` VALUES ('6', '乐器', '0');
INSERT INTO `imgs_class` VALUES ('7', '游戏', '0');

-- ----------------------------
-- Table structure for imgs_data
-- ----------------------------
DROP TABLE IF EXISTS `imgs_data`;
CREATE TABLE `imgs_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `class_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_data
-- ----------------------------
INSERT INTO `imgs_data` VALUES ('1', '教师节快乐', '/share/images/1.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('2', '教师节快乐', '/share/images/2.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('3', '教师节快乐', '/share/images/3.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('4', '教师节快乐', '/share/images/4.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('5', '教师节快乐', '/share/images/5.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('6', '教师节快乐', '/share/images/6.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('7', '教师节快乐', '/share/images/7.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('8', '教师节快乐', '/share/images/8.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('9', '教师节快乐', '/share/images/9.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('10', '教师节快乐', '/share/images/10.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('11', '教师节快乐', '/share/images/11.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('12', '教师节快乐', '/share/images/12.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('13', '教师节快乐', '/share/images/13.jpg', '好好学习，天天向上', '0', '3');
INSERT INTO `imgs_data` VALUES ('14', '教师节快乐', 'http://localhost:5000/share/images/14.jpg', '好好学习，天天向上', '0', '3');

-- ----------------------------
-- Table structure for imgs_info
-- ----------------------------
DROP TABLE IF EXISTS `imgs_info`;
CREATE TABLE `imgs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(255) DEFAULT NULL,
  `info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_info
-- ----------------------------
INSERT INTO `imgs_info` VALUES ('1', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '2');
INSERT INTO `imgs_info` VALUES ('2', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '1');
INSERT INTO `imgs_info` VALUES ('3', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '3');

-- ----------------------------
-- Table structure for imgs_thumbs
-- ----------------------------
DROP TABLE IF EXISTS `imgs_thumbs`;
CREATE TABLE `imgs_thumbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `thumbs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_thumbs
-- ----------------------------
INSERT INTO `imgs_thumbs` VALUES ('1', '/share/images/1.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('2', '/share/images/2.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('3', '/share/images/3.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('4', '/share/images/4.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('5', '/share/images/5.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('6', '/share/images/6.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('7', '/share/ithumbs/images/5.jpg', '0', '3');
INSERT INTO `imgs_thumbs` VALUES ('8', '/share/ithumbs/images/6.jpg', '0', '101');
INSERT INTO `imgs_thumbs` VALUES ('9', '/share/ithumbs/images/7.jpg', '0', '101');
INSERT INTO `imgs_thumbs` VALUES ('10', '/share/ithumbs/images/8.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('11', '/share/ithumbs/images/9.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('12', '/share/ithumbs/images/10.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('13', '/share/ithumbs/images/11.jpg', '0', '103');
INSERT INTO `imgs_thumbs` VALUES ('14', '/share/ithumbs/images/12.jpg', '0', '103');
INSERT INTO `imgs_thumbs` VALUES ('15', '/share/ithumbs/images/13.jpg', '0', '103');

-- ----------------------------
-- Table structure for lunbo
-- ----------------------------
DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE `lunbo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbo
-- ----------------------------
INSERT INTO `lunbo` VALUES ('1', '/home/lunbo/1.jpg', '0');
INSERT INTO `lunbo` VALUES ('2', '/home/lunbo/2.jpg', '0');
INSERT INTO `lunbo` VALUES ('3', '/home/lunbo/3.jpg', '0');
INSERT INTO `lunbo` VALUES ('4', '/home/lunbo/4.jpg', '0');
INSERT INTO `lunbo` VALUES ('5', '/home/lunbo/5.jpg', '0');
INSERT INTO `lunbo` VALUES ('6', '/home/lunbo/6.jpg', '0');
INSERT INTO `lunbo` VALUES ('7', '/home/lunbo/7.jpg', '0');
INSERT INTO `lunbo` VALUES ('8', '/home/lunbo/8.jpg', '0');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:46', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/1.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');
INSERT INTO `news` VALUES ('2', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:47', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/2.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');
INSERT INTO `news` VALUES ('3', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:48', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/3.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `isdel` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '奥迪', '2018-07-10 14:01:12', '0');
INSERT INTO `product` VALUES ('2', '宝马', '2018-07-10 14:01:19', '0');
INSERT INTO `product` VALUES ('3', '大众', '2018-07-10 14:01:43', '0');
INSERT INTO `product` VALUES ('4', '宝马x5', '2019-10-29 10:33:24', '0');
INSERT INTO `product` VALUES ('5', '宝马xxx', '2019-10-29 10:46:22', '1');
INSERT INTO `product` VALUES ('6', '五菱宏光', '2019-10-29 11:22:51', '0');
INSERT INTO `product` VALUES ('7', '特斯拉', '2019-10-29 11:23:24', '0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(50) NOT NULL,
  `uPwd` varchar(50) NOT NULL,
  `uPhone` varchar(11) NOT NULL,
  `uSex` varchar(1) DEFAULT '男',
  `uStatus` varchar(1) DEFAULT '1' COMMENT '默认1,1能用,0禁用',
  `uType` varchar(1) DEFAULT '1' COMMENT '默认1 ,0管理员,1普通用户,2vip',
  `uData` datetime DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`uId`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('23', 'admin', '123', '13812345678', '男', '1', '1', null);
INSERT INTO `userinfo` VALUES ('26', 'qwer', '123', '123', '男', '1', '1', null);
INSERT INTO `userinfo` VALUES ('30', 'qwe', '123', '123', '男', '1', '1', null);
