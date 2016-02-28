-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 年 02 月 28 日 04:30
-- 服务器版本: 5.1.56
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wldc`
--
CREATE DATABASE `wldc` DEFAULT CHARACTER SET gb2312 COLLATE gb2312_chinese_ci;
USE `wldc`;

-- --------------------------------------------------------

--
-- 表的结构 `can_ting`
--

CREATE TABLE IF NOT EXISTS `can_ting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐厅id',
  `name` varchar(20) NOT NULL COMMENT '餐厅的名字',
  `addr` varchar(20) NOT NULL COMMENT '餐厅的位置',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312 COMMENT='餐厅信息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `can_ting`
--


-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT '#',
  `ip` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT '#',
  `qq` varchar(20) DEFAULT NULL,
  `sj` varchar(30) DEFAULT NULL,
  `content` text,
  `xm` varchar(20) DEFAULT 'none',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `url`, `ip`, `email`, `qq`, `sj`, `content`, `xm`) VALUES
(1, 'http://localhost/1', '0:0:0:0:0:0:0:1', 'a@b.com', '123456789', '2016年02月23日 11点17分', 'hi 大家好', '张三'),
(2, 'http://localhost:8080/onlineOrder/comments', '0:0:0:0:0:0:0:1', 'b@d.com', '2345', '2016年02月23日 22点43分', 'hi 我是李四', '李四'),
(3, 'baidu.com', '127.0.0.1', 'c@c.com', '3456', '2016年02月23日 22点09分', 'hi 我是王五', '王五'),
(4, 'www.google.com', '0:0:0:0:0:0:0:1', 'mazi@c.com', '98765423', '2016年02月24日 22点52分', 'hi，我是麻子', '麻子'),
(5, 'www.baidu.com', '0:0:0:0:0:0:0:1', 'xiaowang@c.com', '7898889090', '2016年02月24日 22点53分', 'hi 我是小王， 大王叫我来巡山', '小王');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `manager`
--


-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '菜名',
  `style` varchar(16) NOT NULL COMMENT '菜的类别',
  `price` float NOT NULL COMMENT '单价',
  `thumb` varchar(1024) NOT NULL DEFAULT 'thumb_001.jpg',
  `details` varchar(1024) NOT NULL COMMENT '菜单的详细说明，请注意填写',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `style`, `price`, `thumb`, `details`) VALUES
(1, '青椒土豆丝', '蔬菜', 0, 'thumb_001.jpg', '土豆和青椒 素菜');

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '添加日期',
  `data` mediumtext NOT NULL COMMENT '发布信息数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `news`
--


-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL COMMENT '下订单用户id',
  `menu_id` int(11) NOT NULL COMMENT '对应菜单的id是多少',
  `repeat` int(11) NOT NULL DEFAULT '1' COMMENT '需要多少份？',
  `spec` varchar(1024) NOT NULL COMMENT '有没有什么特殊要求说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `order`
--


-- --------------------------------------------------------

--
-- 表的结构 `pingjia`
--

CREATE TABLE IF NOT EXISTS `pingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `data` varchar(10240) NOT NULL,
  `score` int(11) NOT NULL COMMENT '评分等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `pingjia`
--

INSERT INTO `pingjia` (`id`, `menu_id`, `data`, `score`) VALUES
(1, 1, '这个还是很好吃的，我喜欢', 0);

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) DEFAULT NULL,
  `encrypt` tinyint(1) NOT NULL DEFAULT '1' COMMENT '密码是否加密了',
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`id`, `user`, `encrypt`, `password`) VALUES
(1, 'root', 0, 'password'),
(2, 'username', 1, 'password'),
(3, 'user', 1, 'ps'),
(12, 'test', 1, '098F6BCD4621D373CADE4E832627B4F6');
