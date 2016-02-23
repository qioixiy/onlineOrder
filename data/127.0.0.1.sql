-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 年 02 月 23 日 03:31
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
-- 表的结构 `liuyan`
--

CREATE TABLE IF NOT EXISTS `liuyan` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT '#',
  `ip` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT '#',
  `qq` varchar(20) DEFAULT NULL,
  `sj` varchar(30) DEFAULT NULL,
  `content` text,
  `xm` varchar(20) DEFAULT 'none',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=0 ;

--
-- 转存表中的数据 `liuyan`
--

INSERT INTO `liuyan` (`id`, `url`, `ip`, `email`, `qq`, `sj`, `content`, `xm`) VALUES
(1, 'http://localhost/1', '0:0:0:0:0:0:0:1', 'a@b.com', '123456789', '2016年02月23日 11点17分', 'hi 大家好', '张三');

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=0 ;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`id`, `user`, `password`) VALUES
(1, 'a', 'ps');
