<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	String op = (String) session.getAttribute("op");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css"
	media="all" />
<title>²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</h1>
		</div>

		<div id="main">
			<div id="content">
				<%
					Statement menu_smt = con.createStatement();
					ResultSet meun_rs = menu_smt.executeQuery("select * from menu order by id desc");
				%>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>