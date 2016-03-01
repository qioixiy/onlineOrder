<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	String func_id = request.getParameter("func_id");
	
	Connection con = jdbc_conn.getConn();
	Statement manager_smt = con.createStatement();
	String user = (String) session.getAttribute("username");
	
	ResultSet rs = manager_smt.executeQuery("select * from manager where username=" + "'" + user + "'");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css" media="all"/>
<title>ÏµÍ³¹ÜÀíÒ³Ãæ</title>
</head>

<body>

	<%
		if (rs.next()) {
			System.out.println(user + " find");
	%>

	<div id="container">
		<div id="header">
			<h1 id="h1-header">ÏµÍ³¹ÜÀíÒ³Ãæ</h1>
		</div>

		<div id="main">
			<div id="menu">
				<ul>
					<li><a href="#">»áÔ±¹ÜÀí</a></li>
					<li><a href="#">¶©µ¥¹ÜÀí</a></li>
					<li><a href="#">Ìí¼Ó²Ëµ¥ÐÅÏ¢</a></li>
					<li><a href="#">·¢²¼ÐÐÒµÐÅÏ¢¡¢ÐÂÎÅ</a></li>
				</ul>
			</div>
			
			<div id="content">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr align="center">
						<td >
							<a href="#">href</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="footer"></div>
	</div>

	<%
		} else {
			System.out.println(user + " no find");
	%>
	<h2 id="h2-err">Äã²»ÊÇÏµÍ³¹ÜÀíÔ±</h2>
	<a href="../">·µ»ØµÇÂ¼Ò³Ãæ</a>
	<%
		}
	%>

</body>
</html>