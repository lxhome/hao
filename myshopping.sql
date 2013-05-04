-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: myshopping
-- ------------------------------------------------------
-- Server version	5.5.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `account` char(12) NOT NULL,
  `password` varchar(45) NOT NULL,
  `money` double NOT NULL DEFAULT '100',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('200930740213','200930740213',9981378,'2013-04-18 03:16:56');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `comm` varchar(1000) NOT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `com_1` (`goodsid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`name`) REFERENCES `users` (`name`),
  CONSTRAINT `com_1` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`GOODSID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (18,'1','测试通过',46,'2013-04-13 10:23:14'),(19,'1','再次测试通过',46,'2013-04-13 11:05:24'),(20,'1','调bug',52,'2013-04-14 16:04:49'),(21,'ceshi','123',50,'2013-04-23 15:32:11');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash`
--

DROP TABLE IF EXISTS `flash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `userName` varchar(45) NOT NULL,
  KEY `pk_5` (`userName`),
  CONSTRAINT `pk_5` FOREIGN KEY (`userName`) REFERENCES `users` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash`
--

LOCK TABLES `flash` WRITE;
/*!40000 ALTER TABLE `flash` DISABLE KEYS */;
INSERT INTO `flash` VALUES (46,'限量原版短袖T-Shirt',40,1,'root'),(57,'欧美女装蕾丝花边网纱半身中裙',149,16,'root'),(59,'男短袖衬衫',58.01,1,'root'),(46,'限量原版短袖T-Shirt',40,1,'1'),(55,'七匹狼男装正品半袖t恤男短袖',48,1,'ceshi'),(51,'Apple 苹果 iPhone 4S',4648,6,'ceshi');
/*!40000 ALTER TABLE `flash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `GOODSID` int(11) NOT NULL AUTO_INCREMENT,
  `G_NAME` varchar(50) NOT NULL,
  `G_PRICE` float NOT NULL DEFAULT '0',
  `G_INFOR` varchar(1000) NOT NULL,
  `G_AMOUNT` int(11) NOT NULL,
  `G_TYPE` varchar(50) NOT NULL,
  `G_IMAGES` varchar(50) NOT NULL,
  `G_SPECIFIC_CLASS` varchar(50) NOT NULL,
  `G_ADDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GOODSID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (46,'限量原版短袖T-Shirt',40,'商品尺寸: 24.6 x 20 x 2.8 cm  商品重量: 118 g',9988,'服饰','t_thirts.jpg','T恤','2013-04-18 03:16:56'),(47,'Justyle男士长裤',89,'型号: 男士休闲牛仔长裤   产地: 中国   适合人群:男式   品牌:Justyle   季节:春季',10000,'服饰','jeans001.jpg','长裤','2013-04-13 10:59:12'),(48,'诛仙1-6(套装共6册)',127.1,'网络奇幻文学的最高杰作，当代出版界的最大奇迹！全新十周年纪念版重装上阵，再战书市！迎接次世代。',10000,'文化玩乐','books001.jpg','小说','2013-04-13 10:59:12'),(49,'《诛仙》第二部',18,'著此书是超级畅销书《诛仙》时隔五年后推出的续集。故事紧接《诛仙第一部》，诸多读者关心的第一部未解之谜终将揭开鬼厉、碧瑶、陆雪琪、等将悉数登场。',10000,'文化玩乐','books002.jpg','小说','2013-04-13 10:59:12'),(50,'dv4-5004TX',4589,'处理器：英特尔® 酷睿™ i5-2450M 2.5 GHz    内存（标配)：4 GB 1600 MHz DDR3 (1 x 4 GB)',9997,'电子产品','hp001.jpg','电脑','2013-04-18 02:44:03'),(51,'Apple 苹果 iPhone 4S',4648,'手机CPU: 双核1G  运行内存RAM: 512M机身    内存ROM: 16g  摄像头: 800万',10000,'苹果/配件','iphone001.jpg','手机','2013-04-13 10:59:12'),(52,'Skyworth 创维 42E350D',2966,'屏幕尺寸: 42英寸  分辨率: 1920×1080   清晰度: 1080p(全高清)',10000,'电子产品','tv001.jpg','电视机','2013-04-13 10:59:12'),(53,'漫步者R101V',119,'声道: 2.1   箱体材质: 木质   售后服务: 全国联保  漫步者型号: R101V',10000,'电子产品','stereo001.jpg','音响','2013-04-13 10:59:12'),(54,'中国地图+世界地图',35,'2012中国地图+世界地图（两张）1.1米X0.75米（无折防水 ',10000,'文化玩乐','lin031.jpg','地图/地理','2013-04-13 10:59:12'),(55,'七匹狼男装正品半袖t恤男短袖',48,'袖长: 短袖（袖长<35cm）货号: 0022领型: 翻领颜色: 白色 黑色 蓝色 黄色尺码: L/165 XL/170 XXL/175 XXXL/180 XXXXL/185 板型偏小 建议买大一号面料分类: 纯色布款式细节: 其它工艺处理: 其它消费群体: 青年品牌: Septwolves/七匹狼09男装-风格: 商务休闲袖型: 常规袖男装图案: 动物男装质地（即将删除，勿编辑）: 纯棉男装-板型: 修身型',10000,'服饰','lin001.jpg','T恤','2013-04-13 10:59:12'),(56,'夏装短袖T恤',68.6,'袖长: 短袖（袖长<35cm）货号: 36103领型: 衬衫领颜色: 白色 墨绿 紫红色 灰色 黑色尺码: 165/(S) 170/(M) 175/(L) 180/(XL) 185/(XXL)面料分类: 针织布款式细节: 贴布装饰工艺处理: 免烫处理消费群体: 中年品牌: Septwolves/七匹狼09男装-风格: 商务休闲袖型: 常规袖男装质地（即将删除，勿编辑）: 棉 （棉97%以上）男装-板型: 宽松型 ',10000,'服饰','lin002.jpg','T恤','2013-04-13 10:59:12'),(57,'欧美女装蕾丝花边网纱半身中裙',149,'货源类别：现货品牌：ochaliye 货号：1123070070 面料：棉类混纺风格：欧美裙摆样式：百褶裙 裙型：宽松型 腰型：标准型 裙长：中裙 是否有腰带：无腰带 适合季节：夏季 是否库存：否 \n营销类别：新款 是否支持一件代发：支持 颜色：粉色20号左右出货 \n尺码：XS、S、M、L、XL  ',10000,'服饰','lin003.jpg','半身裙','2013-04-13 10:59:12'),(58,'大码包臀牛仔短裙',58.01,'品牌: 衣惠货号: 158裙型: 牛仔裙裙长: 中裙图案: 纯色流行元素/工艺: 铆钉 纽扣 拉链 树脂固色 明线装饰面料名称: 牛仔材质: 棉面料主成份含量: 71%-80%面料厚薄(克重): 适中(161-180克/平米)适合人群年龄段: 25-29岁上市年份/季节: 2012夏季价格区间: 71-120元颜色分类: 图色尺码: 26码 1尺9 现货 27码 2尺',10000,'服饰','lin004.jpg','半身裙','2013-04-13 10:59:12'),(59,'男短袖衬衫',58.01,'品牌: 衣惠货号: 158裙型: 牛仔裙裙长: 中裙图案: 纯色流行元素/工艺: 铆钉 纽扣 拉链 树脂固色 明线装饰面料名称: 牛仔材质: 棉面料主成份含量: 71%-80%面料厚薄(克重): 适中(161-180克/平米)适合人群年龄段: 25-29岁上市年份/季节: 2012夏季价格区间: 71-120元颜色分类: 图色尺码: 26码 1尺9 现货 27码 2尺',10000,'服饰','lin005.jpg','衬衫','2013-04-13 10:59:12'),(60,'男装2012夏季格子衬衣',59,'袖长: 短袖（袖长<35cm）衬衫板型: 修身型衬衫领型: 方领衬衫风格: 日韩个性颜色: 2012枚蓝色 2011深蓝色 2010蓝粉格 232红黑粗格 231黑红粗格 222红蓝粗格 221兰红粗格 220紫红粗格 219蓝黑粗格 218蓝黑色 217蓝灰格 216蓝红色 215咖啡 214红黑粗格 213红黑 209蓝灰细格 208紫黑色 207红黑色 206蓝绿色 205黑绿色 204黑玫 202蓝色 201蓝紫色尺码: M L XL XXL面料分类: 格子布消费群体: 青年品牌: Meters Bonwe/美特斯邦威面料花型: 格子',10000,'服饰','lin006.jpg','衬衫','2013-04-13 10:59:12'),(61,'男士休闲中裤',45,'裤长: 短裤（穿起至膝盖以上）货号: 0506裤型: 直筒型风格: 时尚休闲颜色: 黑色（送图片腰带） 军绿色（送图片腰带） 卡其色（送图片腰带） 灰色（送图片腰带）尺码: 29/160 30/165 31/170 32/175 33/180 34/185 36/190面料分类: 纯色布面料材质（即将删除，勿编辑）: 纯棉款式细节: 撞色工艺处理: 免烫处理适合人群: 青少年品牌: Meters Bonwe/美特斯邦威  ',10000,'服饰','lin007.jpg','短裤','2013-04-13 10:59:12'),(62,'女款时尚休闲牛仔短裤',39,'品牌: Semir/森马工艺: 水洗 翻边裤长: 短裤/热裤腰型: 中腰面料分类: 全棉牛仔布年份: 2012适合季节: 夏季价格区间: 31-70元牛仔颜色: 深色颜色分类: 深蓝色尺寸: 24-1尺7 25-1尺8 26-1尺9 27-2 ',10000,'服饰','lin008.jpg','短裤','2013-04-13 10:59:12'),(63,'牛仔衬衫连衣裙',69,'风格: 通勤通勤: 韩版组合形式: 单件裙长: 短裙(76-90厘米)款式: 其他款式袖长: 短袖女装领型: 翻领/POLO领袖型: 公主袖衣门襟: 单排扣腰型: 高腰裙摆样式: 其他裙摆样式图案: 纯色流行元素/工艺: 纽扣面料名称: 其他材质: 棉面料主成份含量: 96%及以上适合人群年龄段: 25-29岁上市年份/季节: 2012夏季颜色分类: 浅色 深色尺码: S（36） M（38） L（40）',10000,'服饰','lin009.jpg','连衣裙','2013-04-13 10:59:12'),(64,'男士连帽拉绒卫衣',68,'风格: 学院风格颜色: 红色 灰色 黑色 绿色尺码: S M L XL XXL面料分类: 拉绒卫衣适合人群: 青少年袖型: 常规袖品牌: 其他/other男装图案: 其它面料主材质: 棉质棉含量: 50%-69%',10000,'服饰','lin019.jpg','外套','2013-04-13 10:59:12'),(65,'正品宝马男装夹克',68,'货号: 6688领型: 立领风格: 运动风格颜色: 黑色 蓝色 浅灰色尺码: 165-170(L) 170-175(XL) 175-180(2XL) 180-185(3XL)面料分类: 格子布款式细节: 罗纹底摆工艺处理: 水洗适合人群: 青少年品牌: ABC季节: 春秋季袖型: 常规袖男装厚薄: 普通男装-板型: 修身型面料材质（即将删除，勿编辑）: 人造纤',10000,'服饰','lin020.jpg','外套','2013-04-13 10:59:12'),(66,'美特斯邦威男士西装',76,'板型: 修身型领型: 规则领型（领宽7-9cm）衣门襟: 三粒单排扣风格: 日韩个性颜色: 黑色【炫酷黑】尺码: 165/(S) 170/(M) 175/(L) 180/(XL) 185/(XXL)面料分类: 纯色布面料材质（即将删除，勿编辑）: 80%-99%棉款式细节: 无开衩适合群体: 青少年品牌: Meters Bonwe/美特斯邦威袖长: 长袖',10000,'服饰','lin021.jpg','小西装','2013-04-13 10:59:12'),(67,'双排扣翻领气质深蓝色女西装',89,'风格: 街头街头: 欧美衣长: 中长款(65cm<衣长≤80cm)袖长: 长袖衣门襟: 双排扣图案: 纯色价格: 71-120元颜色分类: 深蓝色尺码: S M',10000,'服饰','lin022.jpg','小西装','2013-04-13 10:59:12'),(68,'男式平角游泳裤均码男士泳装',12,'品牌: 银箭颜色分类: 【蓝色边纹/底色随机】裤 【白色边纹/底色随机】裤 【红色边纹/底色随机】裤货号: 09872男士泳衣款式: 平角泳裤运动服尺码(非必选): 均码/1.9~2.4尺腰围可穿泳衣材质: 涤纶',10000,'服饰','lin023.jpg','泳装','2013-04-13 10:59:12'),(69,'韩国小胸女式游泳衣',68,'产品名称：最新新款时尚泳装泳衣2361...品牌: 水若幽颜色分类: 蓝底白桃心 蓝圈圈 白底粉点 豹纹 西瓜红 七彩虹色 蓝海星 粉色货号: 2361-3分体泳衣款式: 裙式分体泳衣泳衣功能: 带胸垫无钢托运动服尺码(非必选): 均码(适合1.8-2.15尺腰泳衣材质: 锦纶 氨纶',10000,'服饰','lin024.jpg','泳装','2013-04-13 10:59:12');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(20) NOT NULL DEFAULT '0',
  `o_name` varchar(45) NOT NULL,
  PRIMARY KEY (`o_id`),
  KEY `pk_1` (`o_name`),
  CONSTRAINT `pk_1` FOREIGN KEY (`o_name`) REFERENCES `users` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21,'廖雄浩','1232','2013-04-13 10:20:42','15989192088','1'),(22,'廖雄浩','123','2013-04-13 10:22:53','15989192088','1'),(23,'林滨','打算打','2013-04-13 10:59:11','15989192028','1'),(24,'林旺宝','123','2013-04-13 11:04:59','15989192088','1'),(25,'廖雄浩','123','2013-04-17 17:06:14','15989192088','1'),(26,'廖雄浩','阿斯达','2013-04-17 17:45:46','15989192088','1'),(27,'廖雄浩','123','2013-04-18 02:44:03','15989192088','1'),(28,'廖雄浩','华南农业大学华山区24栋','2013-04-18 03:15:28','15989192088','1'),(29,'廖雄浩','王企鹅请问','2013-04-18 03:16:55','15989192088','1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `goodsid` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `s_no` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goodsid`,`o_id`),
  KEY `pk_2` (`o_id`),
  KEY `pk_3` (`o_id`),
  CONSTRAINT `pk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`GOODSID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_3` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (46,21,3),(46,22,3),(46,24,7),(46,25,1),(46,26,2),(46,28,1),(46,29,1),(48,28,1),(49,23,1),(50,27,3),(51,27,1);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `sex` varchar(10) DEFAULT '男',
  `power` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','1','1','1',1),('ceshi','ceshi','1039073559@qq.com','女',1),('root','root','184826998@qq.com','男',0),('root2','root2','184826998@qq.com','男',2),('root3','root3','184826998@qq.com','男',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-27 22:47:57
