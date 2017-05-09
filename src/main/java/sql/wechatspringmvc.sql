-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.15-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 wechatspringmvc 的数据库结构
CREATE DATABASE IF NOT EXISTS `wechatspringmvc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wechatspringmvc`;

-- 导出  表 wechatspringmvc.article 结构
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` varchar(255) NOT NULL COMMENT '简介',
  `counts` int(11) NOT NULL DEFAULT '0' COMMENT '转载次数',
  `articleType` int(11) NOT NULL COMMENT '文章分类  1.首页  2.每日动态  3.产品介绍  4.玄灸图谱',
  `imgType` int(11) NOT NULL COMMENT '图片排版类型    1.大图    2.  侧位单图  3.下方三图',
  `imgPath` varchar(255) NOT NULL COMMENT '图片地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` longtext NOT NULL COMMENT '文章类容',
  `updateTime` datetime NOT NULL COMMENT '操作时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态   0禁用 1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- 数据导出被取消选择。
-- 导出  表 wechatspringmvc.banner 结构
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerPath` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0禁用，1发布',
  `link` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='banner图';

-- 数据导出被取消选择。
-- 导出  表 wechatspringmvc.iteminfo 结构
CREATE TABLE IF NOT EXISTS `iteminfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `body` varchar(255) DEFAULT NULL COMMENT '商品信息',
  `totalFee` float(11,2) DEFAULT NULL COMMENT '商品价格（现价）',
  `originalTotalFee` float(11,2) DEFAULT NULL COMMENT '商品原价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 wechatspringmvc.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `wechatID` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `total_fee` float(20,2) DEFAULT NULL,
  `vipTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 wechatspringmvc.placard 结构
CREATE TABLE IF NOT EXISTS `placard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL COMMENT '海报地址',
  `scaleAddress` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `pressWidth` int(11) DEFAULT '500' COMMENT '水印图片的宽，默认500*500',
  `pressHeight` int(11) DEFAULT '500',
  `imgX` int(11) DEFAULT '100' COMMENT '头像坐标',
  `imgY` int(11) DEFAULT '4000',
  `QRcodeX` int(11) DEFAULT '2700' COMMENT '二维码水印坐标',
  `QRcodeY` int(11) DEFAULT '4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 wechatspringmvc.userinfo 结构
CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openId` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `unionId` varchar(255) DEFAULT NULL COMMENT '用户唯一unionId',
  `sex` tinyint(4) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL COMMENT '语言',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `wechatID` varchar(255) DEFAULT NULL COMMENT '用户微信号',
  `phoneNum` varchar(20) DEFAULT NULL COMMENT '手机号',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `isSubscribe` tinyint(4) DEFAULT '0' COMMENT '0表示没有关注，1表示关注，默认为0',
  `isMember` tinyint(4) DEFAULT '0' COMMENT '1表示是，0表示否，默认为不是会员',
  `points` int(11) DEFAULT '0' COMMENT '积分',
  `registerTime` datetime DEFAULT NULL,
  `total_fee` float(11,2) DEFAULT NULL COMMENT '支付总金额',
  `vipTime` datetime DEFAULT NULL,
  `vipEndTime` datetime DEFAULT NULL COMMENT 'VIP到期时间',
  `userPortrait` varchar(255) DEFAULT NULL,
  `QRcode` varchar(255) DEFAULT '' COMMENT '二维码路径',
  `superior` varchar(255) DEFAULT NULL COMMENT '上级推广人',
  `shareQRcode` varchar(255) DEFAULT NULL COMMENT '分享宣传二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
