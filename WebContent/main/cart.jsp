<%@page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	// 检查是否是正常登录中
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	// 创建数据库的连接
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();

	// 是否有search参数， 如果有就返回搜索的结果
	String search = request.getParameter("search");
	if (null != search) {
		// 将所有的编码统一为gb2312， 因为数据库使用了gb2312编码
		search = new String(search.getBytes("ISO-8859-1"), "gb2312");
	}
	System.out.println("search:" + search);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<!-- HTTP 1.1 -->
<meta http-equiv="pragma" content="no-cache">
	<!-- HTTP 1.0 -->
	<meta http-equiv="cache-control" content="no-cache">
		<!-- Prevent caching at the proxy server -->
		<meta http-equiv="expires" content="0">
			<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
			<link href="../css/main.css" rel="stylesheet" type="text/css"
				media="all" />
			<title>购物车</title> <script type="text/javascript"
				src="../js/ajax_get_url.js"></script>
</head>

<body><script src="../js/cart.js" type="text/javascript"></script>
    
	<div id="container">
		<div id="header">
			<div class="login_status">
				<%
				// 拿到当前session登录的用户名，根据用户名显示提示消息
					String username = (String) session.getAttribute("username");
					String status = "请登录";
					if (username != null) {
						status = "欢迎你" + session.getAttribute("username");
					}
				%>
				<p>
					<%=status%></p>
			</div>

			<div id="menu">
				<ul>
					<li><a href="../index.jsp">首页</a></li>
					<%
						String user_type = "user";
						{
							// 查询登录用户是否是管理员
							Statement stmt_manager = con.createStatement();
							String sql = "select * from manager where `username`='" + username + "'";
							System.out.println(sql);
							ResultSet rs = stmt.executeQuery(sql);
							if (rs.next()) {
								System.out.println("you are manager");
								user_type = "manager";
							} else {
								;
							}
						}
						String tt = null;
						String tt_href = null;
						if (user_type.equals("manager")) {
							tt = "系统管理";
							tt_href = "../manager/index.jsp";
						} else if (user_type.equals("user")) {
							tt = "我的信息";
							tt_href = "user_info.jsp";
						}
					%>
					<li><a href="<%=tt_href%>"><%=tt%></a></li>
					<li><a href="../liuyan/index.jsp">查看留言</a></li>
					<li><a href="../login/index.jsp">退出</a></li>
				</ul>
			</div>

			<div class="div-clear"></div>
			<form action="index.jsp" id="form_search" name="search" method="post">
				<div id="search-box">
					<input id="input_search" type="text" class="input-box" /> <input
						name="search" type="button" value="搜索" class="button"
						onclick="main_search()" />
				</div>
			</form>
			<div class="div-clear"></div>
		</div>
		<div id="main">
			<div class="content">
				<div class="navi">
					<div id="navi-menu">
						<ul>
							<li><a href="index.jsp?search=all">全部分类</a></li>
							<li><a href="index.jsp?search=jiachangcai">家常菜</a></li>
							<li><a href="index.jsp?search=huncai">荤菜</a></li>
							<li><a href="index.jsp?search=sucai">素菜</a></li>
						</ul>
					</div>
				</div>
				<div>
					<div id="cart" style="float:left;">
						<div id="Cart"
							style="line-height: 24px; font-size: 12px; background-color: #f0f0f0; border-top: 1px #ffffff solid；display:none;">
						</div>
						<div id="Info">
							总计：<strong><span id="total"
								style="color: #FF0000; font-size: 36px">0</span></strong>元</br> <input
								type="button" value="清空"
								onclick="clearOrder();WriteOrderInDiv();" /><input
								id="input_cart_status" type="button" value="总价"
								onclick="show('Cart')" style="display: none;" /> <input
								type="button" value="提交" onclick="submit_cart()" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>地址：浙江省宁波市北仑区振兴西路205号&nbsp;&nbsp;总机：0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;公安海警学院信息公开 2016</p>
		</div>
	</div>
	
    <script>
      WriteOrderInDiv();
    </script>
</body>
</html>
