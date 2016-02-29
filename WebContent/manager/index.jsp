<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String user = (String)session.getAttribute("username");
	ResultSet rs = stmt.executeQuery("select * from manager where username=" + "'" + user + "'");
%>
<%
if(rs.next()) {
	System.out.println(user + " find");
} else {
	System.out.println(user + " no find");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÏµÍ³¹ÜÀíÒ³Ãæ</title>
</head>
<body>

<div style="width:720px; margin:0px auto;">
</div>

<%
}
%>
</body>
</html>