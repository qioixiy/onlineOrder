<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String menu_id = request.getParameter("menu_id");
	String num = request.getParameter("num");
	String username = (String)session.getAttribute("username");
	String user_id = null;
	ResultSet rs_userinfo = stmt.executeQuery("select * from userinfo where user=" + "'" + username + "'");
	if (rs_userinfo.next()) {
		user_id = rs_userinfo.getString("id");
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
<title>ÏÂµ¥Ò³Ãæ</title>
</head>
<body>

<%
if(rs_menu.next()) {
	String name = rs_menu.getString("name");
	String thumb = rs_menu.getString("thumb");
	String price = rs_menu.getString("price");
%>

<div style="width:720px; margin:0px auto;">
	<h2><%=name%>(<%=menu_id%>)</h2>
	<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
<%
	try {
		Statement stmt_order = con.createStatement();
		String sql = "INSERT INTO `order_form` ( `id` , `user_id` , `menu_id` , `repeat` , `spec` ) VALUES (NULL , '" + user_id + "', '" + menu_id + "', '" + num + "', 'null')";
		System.out.println(sql);
		boolean result = stmt_order.execute(sql);
		System.out.println(result);
%>
	<p>ÏÂµ¥³É¹¦</p>
	<a href="../main/index.jsp">·µ»ØÖ÷Ò³</a>
<%
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
</div>

<%
}
%>

</body>
</html>