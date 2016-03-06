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
<link href="../css/manager.css" rel="stylesheet" type="text/css"
	media="all" />
<title>»áÔ±¹ÜÀíÒ³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">»áÔ±¹ÜÀíÒ³Ãæ</h1>
		</div>

		<div id="main">
			<div id="menu">
				<ul>
					<li><a href="user_manager.jsp">²é¿´ËùÓÐ</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					Statement user_smt = con.createStatement();
					ResultSet user_rs = user_smt.executeQuery("select * from userinfo order by id desc");
				%>
				<table id="table-userinfo" border="1" cellpadding="1"
					cellspacing="1">
					<%
						String bg_str = "#F0F0F0";
						int index = 0;
					%>
					<tr bgcolor="ccccc0">
						<td width=50>id</td>
						<td width=100>ÓÃ»§Ãû</td>
						<td width=50>encrypt?</td>
					</tr>
					<%
						while (user_rs.next()) {
							if (0 == index++ % 2) {
								bg_str = "#F0F0F0";
							} else {
								bg_str = "#F2F272";
							}
							String _id = user_rs.getString("id");
							String _user = user_rs.getString("user");
							String _encrypt = user_rs.getString("encrypt");

							System.out.println("id:" + _id + ",user:" + _user + ",encrypt:" + _encrypt);
					%>
					<tr>
						<td bgcolor="<%=bg_str%>" width=50><%=_id%></td>
						<td bgcolor="<%=bg_str%>" width=200><%=_user%></td>
						<td bgcolor="<%=bg_str%>" width=50><%=_encrypt%></td>
						<td bgcolor="#ffffff" width=50 style="text-align: center;"><form
								action="user_manager_op.jsp">
								<input type=hidden name="type" value="del" /> <input
									type=hidden name="user_id" value="<%=_id%>" /> <input
									type="submit" value="É¾³ý" />
							</form></td>
						<td bgcolor="#ffffff" style="text-align: center;"><form
								action="user_manager_op.jsp">
								<input type=hidden name="type" value="set_as_manager" /> <input
									type=hidden name="user_id" value="<%=_id%>" /> <input
									type=hidden name="type" value="set_as_manager" /> <input
									type=hidden name="user_name" value="<%=_user%>" /> <input
									type="submit" value="ÉèÖÃÎª¹ÜÀíÔ±" />
							</form></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>