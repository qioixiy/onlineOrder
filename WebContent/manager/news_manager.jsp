<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>发布消息</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">发布消息页面</h1>
		</div>

		<div id="main">
			<div id="menu">
				<ul>
					<li><a href="#">返回主页</a></li>
				</ul>
			</div>

			<div id="content">
				
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>