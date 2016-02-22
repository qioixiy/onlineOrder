需要修改的地方都有注释
你可以自行修改
主要有login.jsp和jdbc.java里面关系都数据库连接部分
jdbc你修改编译之后请放到WEB-INF\classes\wu目录下面

数据库采用的是mysql
建表语言是：
CREATE TABLE liuyan (
  id int(6) NOT NULL auto_increment,
  url varchar(100) default '#',
  ip varchar(20) default NULL,
  email varchar(50) default '#',
  qq varchar(20) default NULL,
  sj varchar(30) default NULL,
  content text,
  xm varchar(20) default '没有姓名',
  KEY id (id)
) TYPE=MyISAM;


本留言本可以自由传布，但是希望尊重作者的版权
有任何问题可以联系本站

http://www.china1024.com
email:webmaster@china1024.com