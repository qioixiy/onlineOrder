<%@page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	String func_id = request.getParameter("func_id");

	Connection con = jdbc_conn.getConn();
	Statement manager_smt = con.createStatement();
	String user = (String) session.getAttribute("username");
	if (user != null) {
		ResultSet rs = manager_smt.executeQuery("select * from manager where username=" + "'" + user + "'");
		if (rs.next()) {
			System.out.println("find manager " + user);
		}
	}
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- HTTP 1.1 -->
<meta http-equiv="pragma" content="no-cache">
<!-- HTTP 1.0 -->
<meta http-equiv="cache-control" content="no-cache">
<!-- Prevent caching at the proxy server -->
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<title>后台管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="../js/ajax_get_url.js"></script>
<script type="text/javascript" src="../js/ajax_upload.js"></script>
<script type="text/javascript" src="../js/ajax_api.js"></script>
</head>

<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">后台管理</div>
		<div class="navigation">
			<ul>
				<li>欢迎您！</li>
				<%
					String href_name = "请登录";
					String href_link = "";
					if (null != user) {
						href_name = user;
					} else {
						href_link = "../login/index.jsp";
					}
				%>
				<li><a href="<%=href_link%>"><%=href_name%></a></li>
				<li><a href="../main/">返回主页</a></li>
				<li><a href="../login/">退出</a></li>
			</ul>
		</div>
	</div>

	<div id="content">
		<div class="left_menu">
			<ul id="nav_dot">
				<li>
					<h4 class="M1">
						<span></span>会员管理
					</h4>
					<div class="list-item none">
						<a href='#' onclick="get_url('user_manager.jsp')">查看所有会员</a>
						<a href='#' onclick="get_url('user_add.jsp')">添加会员</a>
					</div>
				</li>
				<li>
					<h4 class="M2">
						<span></span>订单查看
					</h4>
					<div class="list-item none">
						<a href='#' onclick="get_url('order.jsp')">查看所有订单</a>
						<a href='#'
							onclick="get_url('order.jsp?status=null')">未处理订单</a>
						<a href='#'
							onclick="get_url('order.jsp?status=handing')">处理中订单</a>
						<a href='#'
							onclick="get_url('order.jsp?status=completed')">已完成订单</a>
					</div>
				</li>
				<li>
					<h4 class="M3">
						<span></span>菜单管理
					</h4>
					<div class="list-item none">
						<a href='#' onclick="get_url('menu_list.jsp')">查看所有</a><a
							href='#' onclick="get_url('menu_add.jsp')">添加新的菜式</a>
					</div>
				</li>
				<li>
					<h4 class="M5">
						<span></span>消息管理
					</h4>
					<div class="list-item none">
						<a href='#' onclick="get_url('news.jsp?func_id=list_all')">查看所有消息</a>
						<a href='#' onclick="get_url('news.jsp?func_id=add_news')">添加新的消息</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li><span> </span></li>
				</ul>
			</div>
			<div class="main">
				<div class="inner-html" id="inner-html-1"></div>
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<div id="footer">
		<p>Copyright© 2016</p>
	</div>
	<script>
		navList(12);
	</script>
</body>
</html>
