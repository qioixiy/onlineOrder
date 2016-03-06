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
<title>¶©µ¥¹ÜÀíÒ³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">¶©µ¥¹ÜÀíÒ³Ãæ</h1>
		</div>

		<div id="main">
			<div id="menu">
				<ul>
					<li><a href="#">²é¿´ËùÓÐµÄ¶©µ¥</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					Statement order_form_smt = con.createStatement();
					ResultSet order_form_rs = order_form_smt.executeQuery("select * from order_form order by id desc");
				%>
				<table id="table-userinfo" border="1" cellpadding="1"
					cellspacing="1">
					<%
						String bg_str = "#F0F0F0";
						int index = 0;
					%>
					<tr bgcolor="ccccc0">
						<strong>
						<td width=50>id</td>
						<td width=200>ÏÂµ¥¶©µ¥</td>
						<td width=150>ÏÂ¶©µ¥ÓÃ»§id</td>
						<td width=100>²Ëµ¥id</td>
						<td width=100>ÐèÒª¶àÉÙ·Ý</td>
						<td width=120>ÌØÊâÒªÇóËµÃ÷</td></strong>
					</tr>
					<%
						while (order_form_rs.next()) {
							if (0 == index++ % 2) {
								bg_str = "#F0F0F0";
							} else {
								bg_str = "#F2F272";
							}
							String _id = order_form_rs.getString("id");
							String _timestamp = order_form_rs.getString("timestamp");
							String _user_id = order_form_rs.getString("user_id");
							String _menu_id = order_form_rs.getString("menu_id");
							String _repeat = order_form_rs.getString("repeat");
							String _spec = order_form_rs.getString("spec");

							System.out.println("id:" + _id + ",_timestamp:" + _timestamp + ",_user_id:" + _user_id + ",_menu_id:" + _menu_id + "_repeat:"+_repeat+"_spec:"+_spec);
					%>
					<tr>
						<td bgcolor="<%=bg_str%>" width=50><%=_id%></td>
						<td bgcolor="<%=bg_str%>" width=200><%=_timestamp%></td>
						<td bgcolor="<%=bg_str%>" width=50><%=_user_id%></td>
						<td bgcolor="<%=bg_str%>" width=50><%=_menu_id%></td>
						<td bgcolor="<%=bg_str%>" width=50><%=_repeat%></td>
						<td bgcolor="<%=bg_str%>" width=50><%=_spec%></td>
						<td bgcolor="#ffffff" width=50 style="text-align: center;"><form
								action="user_manager_op.jsp">
								<input type=hidden name="type" value="del" /> <input
									type=hidden name="user_id" value="<%=_id%>" /> <input
									type="submit" value="É¾³ý" />
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