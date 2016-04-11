<%@page import="misc.SendMail"%>
<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String menu_id = request.getParameter("menu_id");
	String num = request.getParameter("num");
	String username = (String) session.getAttribute("username");
	String user_id = null;
	String user_email = null;
	ResultSet rs_userinfo = stmt.executeQuery("select * from userinfo where user=" + "'" + username + "'");
	if (rs_userinfo.next()) {
		user_id = rs_userinfo.getString("id");
		user_email = rs_userinfo.getString("email");
		System.out.println("username:" + username + ",user_id:" + user_id);
	} else {
		response.sendRedirect("../login/index.jsp");
		return;
	}
	ResultSet rs_menu = stmt.executeQuery("select * from menu where id=" + menu_id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>下单页面</title>
</head>
<body>

	<%
		if (rs_menu.next()) {
			String name = rs_menu.getString("name");
			String thumb = rs_menu.getString("thumb");
			String price = rs_menu.getString("price");
	%>

	<div id="container">
		<div id="header">
			<div id="menu">
				<ul>
					<li><a href="../index.jsp">首页</a></li>
					<li><a href="../main/index.jsp">返回主页</a></li>
					<li><a href="../login/index.jsp">退出</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
			<h2><%=name%>(<%=menu_id%>)
			</h2>
			<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
			<%
				try {
						Statement stmt_order = con.createStatement();
						String sql = "INSERT INTO `order_form` ( `id` , `user_id` , `menu_id` , `repeat` , `spec` ) VALUES (NULL , '"
								+ user_id + "', '" + menu_id + "', '" + num + "', 'null')";
						System.out.println(sql);
						boolean result = stmt_order.execute(sql);
						System.out.println(result);

						String mailTitle = "你提交新的订单";
						String mailContent = "菜名:" + name + ",份数:" + num + "份,单价:" + price + "元";
						SendMail.sendMailWithDefaultServer(user_email, mailTitle, mailContent);
			%>
			<p>下单成功</p>
			<a href="../main/index.jsp">返回主页</a>
			<%
				} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>地址：浙江省宁波市北仑区振兴西路205号&nbsp;&nbsp;总机：0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;公安海警学院信息公开 2016</p>
		</div>
	</div>

</body>
</html>