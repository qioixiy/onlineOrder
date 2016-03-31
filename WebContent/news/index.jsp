<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String id = request.getParameter("id");
	ResultSet rs = stmt.executeQuery("select * from news where id=" + id);
%>
<%
	if (rs.next()) {
		String _title = rs.getString("title");
		String _date = rs.getString("date");
		String _data = rs.getString("data");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title><%=_title%></title>
</head>
<body>
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
		<div id="main" style="background-color: #fff; padding:20px;">
			<div style="width: 720px; margin: 0px auto;">
				<h2 style="text-align: center; margin-bottom:20px;"><%=_title%></h2>
				<p><%="&nbsp&nbsp&nbsp&nbsp" + _data%></p>
			</div>

			<%
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