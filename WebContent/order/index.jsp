<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String menu_id = request.getParameter("menu_id");
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
%>

<div style="width:720px; margin:0px auto;">
	<h2><%=name%>(<%=menu_id%>)</h2>
	<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
	<form action="commit.jsp">
		<p>ÊýÁ¿<input type="text" name="num" /></p>
		<input type=hidden name="menu_id" value="<%=request.getParameter("menu_id")%>"/>
  		<input type="submit" value="Ìá½»" />
	</form>
	
</div>

<%
}
%>

</body>
</html>