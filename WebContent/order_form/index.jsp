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
	ResultSet rs_menu = stmt.executeQuery("select * from menu where id=" + menu_id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>ÏÂµ¥Ò³Ãæ</title>
</head>

<body>
	<%
		if (rs_menu.next()) {
			String id = rs_menu.getString("id");
			String name = rs_menu.getString("name");
			String style = rs_menu.getString("style");
			String price = rs_menu.getString("price");
			String thumb = rs_menu.getString("thumb");
			String details = rs_menu.getString("details");
	%>

	<div id="container">
		<div id="header">
			<div class="login_status">
				<%
					String username = (String) session.getAttribute("username");
						String status = "ÇëµÇÂ¼";
						if (username != null) {
							status = "»¶Ó­Äã" + session.getAttribute("username");
						}
				%>
				<p>
					<%=status%></p>
			</div>
			<div id="menu">
				<ul>
					<li><a href="../index.jsp">Ê×Ò³</a></li>
					<li><a href="../main/index.jsp">·µ»ØÖ÷Ò³</a></li>
					<li><a href="../login/index.jsp">ÍË³ö</a></li>
				</ul>
			</div>
		</div>
		<div class="">
			<p>
				<strong>²ËÃû£º</strong><%=name%></p>
			<p>
				<strong>µ¥¼Û£º</strong><%=price%>
			</p>
			<p>
				<strong>ËµÃ÷£º</strong><%=details%>
			</p>
			<p>
				<strong>²ËËùÊôÀà±ð£º</strong><%=style%></p>
			<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
			<form action="commit.jsp">
				<p>
					ÇëÊäÈëÊýÁ¿ <input type="text" name="num" /> <input type=hidden
						name="menu_id" value="<%=request.getParameter("menu_id")%>" /> <input
						type="submit" value="Ìá½»" />
				</p>
			</form>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>µØÖ·£ºÕã½­Ê¡Äþ²¨ÊÐ±±ÂØÇøÕñÐËÎ÷Â·205ºÅ&nbsp;&nbsp;×Ü»ú£º0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;¹«°²º£¾¯Ñ§ÔºÐÅÏ¢¹«¿ª 2016</p>
		</div>
	</div>

	<%
		}
	%>

</body>
</html>