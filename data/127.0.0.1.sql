-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 年 03 月 01 日 03:59
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
  `date` varchar(30) DEFAULT NULL,
  `content` text,
  `xm` varchar(20) DEFAULT 'none',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `url`, `ip`, `email`, `qq`, `date`, `content`, `xm`) VALUES
(1, 'http://localhost/1', '0:0:0:0:0:0:0:1', 'a@localhost.com', '123456789', '2016年02月23日 11点17分', 'hi 大家好', '张三'),
(2, 'http://localhost:8080/onlineOrder/comments', '0:0:0:0:0:0:0:1', 'b@localhost.com', '123456789', '2016年02月23日 22点43分', 'hi 我是李四', '李四'),
(3, 'www.baidu.com', '127.0.0.1', 'c@localhost.com', '123456789', '2016年02月23日 22点09分', 'hi 我是王五', '王五'),
(4, 'www.google.com', '0:0:0:0:0:0:0:1', 'mazi@localhost.com', '98765423', '2016年02月24日 22点52分', 'hi，我是麻子', '麻子'),
(5, 'www.baidu.com', '0:0:0:0:0:0:0:1', 'xiaowang@localhost.com', '7898889090', '2016年02月24日 22点53分', 'hi 我是小王， 大王叫我来巡山', '小王'),
(7, 'www.zxy.com', '0:0:0:0:0:0:0:1', 'zxy@zxy.com', '9876554321', '2016年03月01日 10点04分', 'zxy到此留言', 'zxy');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `username`, `level`) VALUES
(1, 'root', 1);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '菜名',
  `style` varchar(16) NOT NULL COMMENT '菜的类别',
  `price` float NOT NULL COMMENT '单价',
  `thumb` varchar(1024) NOT NULL DEFAULT '001.jpg',
  `details` varchar(1024) NOT NULL COMMENT '菜单的详细说明，请注意填写',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `style`, `price`, `thumb`, `details`) VALUES
(1, '青椒土豆丝', '蔬菜', 1, '001.jpg', '土豆和青椒 素菜'),
(2, '红烧白菜', '蔬菜', 2, '002.jpg', '好吃的大白菜'),
(3, '菜名', '', 3, '003.jpg', ''),
(4, '菜名', '', 4, '004.jpg', ''),
(5, '菜名', '', 5, '005.jpg', ''),
(6, '菜名', '', 6, '006.jpg', ''),
(7, '菜名', '', 7, '007.jpg', ''),
(8, '菜名', '', 8, '008.jpg', ''),
(9, '菜名', '', 9, '009.jpg', ''),
(10, '菜名', '', 10, '010.jpg', ''),
(11, '菜名', '', 11, '011.jpg', ''),
(12, '菜名', '', 12, '012.jpg', ''),
(13, '菜名', '', 13, '013.jpg', ''),
(14, '菜名', '', 14, '014.jpg', ''),
(15, '菜名', '', 15, '015.jpg', '');

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `date` date NOT NULL COMMENT '添加日期',
  `data` mediumtext NOT NULL COMMENT '发布信息数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `title`, `date`, `data`) VALUES
(1, '中国政府为何推出一系列楼市调控新政', '2016-02-29', '欧阳辉、常杰：近期中国政府为何推出一系列楼市调控新政？我们试着回顾美国和日本房地产市场去产能过剩的过程，希望对当前中国房地产业去库存有所启示。'),
(2, '房贷放松下的杠杆之痛 ', '2016-02-29', '作为全球最重要的“印钞者”之一，中国央行如需印钞，轻松如在空中打一个响指，方式有很多，不说降息降准等常规操作乃至PSL（抵押补充贷款）、 MLF (中期借贷便利操作)等花样动作，甚至一纸行政公文即可以搅动市场。\r\n\r\n2016年2月2日，中国央行在其网站发布一则通知，表示非限购城市首套房商贷最低首付比例可下调至20%。\r\n\r\n表面看起来，这只是为系列限贷政策“小心翼翼”地撕开一个口子??首先，非限购的城市意味着排除了五个主要城市（北上广深与三亚），而目前房地产的焦灼状态其实聚焦于一线城市；与此同时，首付两成对比海外而言并不算出格，毕竟海外一成首付的状况也很普遍。事实上首付比例不低，一直是人们相信中国房地产风险不高的重要原因。\r\n\r\n如果换一个角度，不是从购房者角度思考优惠几何、是否该出手等方面去看待这一政策，而是从银行角度来看这一政策就颇为耐人寻味。如果首付降低到20%，一套100万的房子，首付20万对于购房者是降低了压力，但是对于银行来说以前贷款是75万，如今变成80万，那么银行的杠杆其实是在加大，风险程度也对应上调。在极端情况下，假设房价下跌超过20%，银行就有可能面临止赎房的风险??毕竟，在理性计算之下，购房者此时放弃供房是更合算的行为。就中国而言，局部地区出现20%的房价波动并非不可想象的情形，如此一来，放大的杠杆也就意味着放大的波动性??这就是杠杆的力量，在刚刚过去的A股牛市及其崩溃中，我们正生动地目睹了它的运行原理。'),
(4, '周小川回答了什么与没回答什么 ', '2016-02-29', '2016春节未完，中国央行行长周小川接受了财新传媒专访，打破了此前的沉默。这位中国央行多年的掌舵人，试图给市场传递什么信号呢？\r\n\r\n中国央行资产负债表在2008金融危机之后一路扩张，一度成为名符其实的超级“印钞者”，去年却开始面对外汇储备下降的烦恼。至于周小川，其在海外声誉颇佳，也曾被评为“全球最佳央行行长”，可谓实至名归的荣誉“印钞者”。采访很长，值得一读，原文可以见链接。\r\n\r\n毋庸置疑，周小川的看法代表官方立场，不过这次采访态度总体诚恳开放，我比较欣赏是他说的一些大白话，也就是大家都能听得懂的实话。通读之后，我总结了个人觉得回答中最有含金量的三句话以及一些未解问题。\r\n\r\n第一句话，“当前中国国际收支状况良好，国际竞争力仍很强，跨境资本流动处于正常区间，人民币汇率对一篮子货币保持了基本稳定，还有所升值，不存在持续贬值的基础。”'),
(5, 'BAT大战：春节红包的洗礼 ', '2016-02-29', '春晚几乎成为中国人最后的春节共同体，每年春晚都是头条话题，猴年春晚除了提供更多吐槽之外，也为中国IT巨头们提供了新战场。\r\n\r\n阿里巴巴几乎以全集团之力支持支付宝，不仅以2.688亿元登录央视春晚，而且春节红包金额也高达八亿元，其官方数据揭示除夕夜支付宝参与次数达到3245亿次；作为支付宝的老对手，腾讯服务器甚至一度因红包而宕机，除夕4.2 亿人用上了微信红包，收发总量达到了 80.8 亿次，要红包才能看的朋友圈照片达到 2900万张。甚至，一向观战的百度在今年也加入了红包战团，百度表示截止初一中午12时，百度钱包福袋打开次数达112亿。（注：本文数据都来自各家公司公布数据）\r\n\r\n春节假期未完，双方各自宣布了自己的胜利。如此一来，中国科技界三大巨头BAT百度（Baidu）、阿里巴巴（Alibaba）与腾讯（Tencent）终于在小小红包上会师，甚至可以说达成了某种战略共识。国内科技界也开始大讨论，巨头花那么多钱是否值得？哪家公司会获得最终胜利，抑或只是“脑子进水了”？\r\n\r\n从阿里巴巴而言，为红包付出那么多，表示经理人认可这一价值，从事后来看，春节红包某种程度也实现了其自称的“诺曼底登陆”??从封锁严密的微信阵地中抢出了一块垂涎已久的社交“蛋糕”，官方数据表示当晚11亿对好友成为支付宝好友。类似的逻辑，如果说支付宝缺社交，微信缺少支付场景，那么百度则缺少金融??阿里巴巴以及腾讯各有一块银行牌照（网商银行与腾微众银行），百度借助百度钱包以及各类商户优惠券，不仅寄托未来金融想象，更有打通O2O（“线上到线下”）环节期待。'),
(6, '方星海说什么，不如港币重要', '2016-02-29', '金融市场充满信息，如何辨别信号以及噪音，是专业人士的主要技能。这并非易事，事实上，充斥媒体头条与人们大脑的，多数情况是噪音。\r\n\r\n新的一年对于中国颇为戏剧化，在熔断机制退出以及A股暴跌各类消息之下，中国成为世界关注要点。即使在冬季达沃斯论坛之上，中国官员方星海的发言也引发国内外诸多关注。\r\n\r\n方星海的身份，除了中国证监会副主席，大家更为看重其中央财经领导小组办公室（所谓中财办）成员身份，外媒更多将其视为领导核心的经济顾问。除此之外，英文流利、为人和善以及乐于沟通等因素，也使得方星海成为本次冬季达沃斯的明星，这也反应了外界对于中国经济政策加大透明度的渴望。尽管如此，就像拼命压榨一枚半干柠檬一样，方星海的发言即使再加诠释，其实信息量并无太多，过度解读也无助于厘清目前情况。比起官员们的清谈，市场已经释放了足够多的信息，例如近期香港市场的震荡。\r\n\r\n在专业投资圈内，香港近期的汇市、股市波动引发了颇多关注，但是在专业领域之外，公众仍旧追逐着财经明星的发言，对于近在咫尺的信号视而不见。'),
(7, '2016：中国最大的风险是什么？', '2016-02-29', '如墨菲定律所言，凡是可能出错的地方都会出错。\r\n\r\n中国A股开年交易刚4天，就出现四次熔断两次提前关闭，1月7日更出现了全天交易总时长14分钟即告终市，创下A股历史记录。中国证监会在一片愤怒指责之中，熔断机制在1月7日晚上暂停使用。\r\n\r\n在美剧《生活大爆炸》中，主角莱纳德要做一个手术，另一位主角，一贯令人头疼的谢尔顿觉得手术危险而有害，他赶在莱纳德手术之后第一时间见他，只是为了说一句“我早就告诉你了”（I told you so）。现实中，扮演谢尔顿的这样角色压力重大，我也讨厌以事后诸葛的姿态批判熔断机制，但是在熔断机制推出时刻，身边不少市场人士对于这一新规评价负面，但是因为中国股市在股灾救市之后已经变成比较敏感的话题，所以其中多数人选择沉默。而所谓中国式征求专家意见，不少情况下不外乎主管部门征求与自身意见一致的专家而已，走过程的意味浓烈。除了熔断机制本身，我们或许更应该反思，涉及公众利益的政策法规制定，如何得到有效讨论以及透明监督？更进一步，官方问责制如何落实？\r\n\r\n开年第一周的交易不能直接说人祸，但是庸人自扰的因素强烈，经济走低之下，A股今年胜算不大，但是多数市场机构此前预测是“慢牛”，在熔断机制添乱之后，这趋势有变为短期“疯熊”的趋势。');

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
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gb2312 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pingjia`
--

INSERT INTO `pingjia` (`id`, `menu_id`, `data`, `score`, `timestamp`) VALUES
(1, 1, '这个还是很好吃的，我喜欢', 0, '2016-02-28 00:00:00'),
(2, 1, '下次还来，不错', 4, '2016-02-29 00:00:00');

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
