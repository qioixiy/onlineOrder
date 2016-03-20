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
<title>²Ëµ¥¹ÜÀíÒ³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">²Ëµ¥¹ÜÀíÒ³Ãæ</h1>
		</div>

		<div id="main">
			<div id="menu-v">
				<ul>
					<li><a href="index.jsp">·µ»Ø¹ÜÀíÖ÷Ò³</a></li>
					<li><a href="menu_manager_op.jsp?op=add">Ìí¼ÓÐÂµÄ²ËÊ½</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					Statement menu_smt = con.createStatement();
					ResultSet meun_rs = menu_smt.executeQuery("select * from menu order by id desc");
				%>
				<table id="table-userinfo">
					<%
						String td_class = "td_class_1";
						int index = 0;
					%>
					<tr bgcolor="ccccc0">
						<strong>
							<td width=50>id</td>
							<td width=150>²ËÃû</td>
							<td width=150>²ËµÄÀà±ð</td>
							<td width=50>¼Û¸ñ</td>
							<td width=150>Ê±¼ä</td>
							<td width=150>¼ò½é¡¢ËµÃ÷</td>
							<td width=150>Í¼Æ¬</td>
						</strong>
					</tr>
					<%
						while (meun_rs.next()) {
							if (0 == index++ % 2) {
								td_class = "td_class_1";
							} else {
								td_class = "td_class_2";
							}
							String _id = meun_rs.getString("id");
							String _name = meun_rs.getString("name");
							String _style = meun_rs.getString("style");
							String _price = meun_rs.getString("price");
							String _thumb = meun_rs.getString("thumb");
							String _timestamp = meun_rs.getString("timestamp");
							String _details = meun_rs.getString("details");
					%>
					<tr>
						<td class="<%=td_class%>" width=50><%=_id%></td>
						<td class="<%=td_class%>" width=200><%=_name%></td>
						<td class="<%=td_class%>" width=50><%=_style%></td>
						<td class="<%=td_class%>" width=50><%=_price%></td>
						<td class="<%=td_class%>" width=50><%=_timestamp%></td>
						<td class="<%=td_class%>" width=50><%=_details%></td>
						<td class="<%=td_class%>" width=150> <img class="item-img" src="../images/thumb/<%=_thumb%>"></img></td>
						<td bgcolor="#ffffff" width=50 style="text-align: center;"><a
							href="menu_manager_op.jsp?op=del&menu_id=1">É¾³ý</a></td>
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