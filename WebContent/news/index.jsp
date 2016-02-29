<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String id = request.getParameter("id");
	ResultSet rs = stmt.executeQuery("select * from news where id=" + id);
%>
<%
if(rs.next()) {
	String _title = rs.getString("title");
	String _date = rs.getString("date");
	String _data = rs.getString("data");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=_title%></title>
</head>
<body>

<div style="width:720px; margin:0px auto;">
	<h2 style="text-align: center;"><%=_title%></h2>
	<p><%="&nbsp&nbsp&nbsp&nbsp"+_data%></p>
</div>

<%
}
%>
</body>
</html>