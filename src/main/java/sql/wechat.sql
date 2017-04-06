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

-- 导出  表 wechatspringmvc.userinfo 结构
CREATE TABLE IF NOT EXISTS `userinfo` (
  `sex` tinyint(4) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL COMMENT '语言',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openId` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `unionId` varchar(255) DEFAULT NULL COMMENT '用户唯一unionId',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `phoneNum` varchar(20) DEFAULT NULL COMMENT '手机号',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `isSubscribe` tinyint(4) DEFAULT '0' COMMENT '0表示没有关注，1表示关注，默认为0',
  `isMember` tinyint(4) DEFAULT '0' COMMENT '1表示是，0表示否，默认为不是会员',
  `userPortrait` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
