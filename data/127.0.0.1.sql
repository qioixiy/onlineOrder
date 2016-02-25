-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 年 02 月 25 日 01:24
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
(5, 'www.baidu.com', '0:0:0:0:0:0:0:1', 'xiaowang@c.com', '7898889090', '2016年02月24日 22点53分', 'hi 我是小王， 大王叫我来巡山', '小王'),
(6, 'www.google.com', '0:0:0:0:0:0:0:1', 'qio@gmail.com', '92956898', '2016年02月24日 23点03分', '一叶扁舟', '小周');

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`id`, `user`, `password`) VALUES
(1, 'a', 'ps'),
(2, 'username', 'password'),
(3, 'user', 'ps');
