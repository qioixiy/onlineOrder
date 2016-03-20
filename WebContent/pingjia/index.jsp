<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String _menu_id = request.getParameter("menu_id");
	ResultSet rs_pingjia = stmt.executeQuery("select * from pingjia where menu_id=" + "'" + _menu_id + "'");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css" media="all" />
<title>ÆÀ¼ÛÒ³Ãæ</title>
</head>
<body>

<div style="width:720px; margin:0px auto;">

	<%

	Statement stmt_menu = con.createStatement();
	ResultSet rs_menu = stmt_menu.executeQuery("select * from menu where id=" + "'" + _menu_id + "'");
	if (rs_menu.next()) {
		String name = rs_menu.getString("name");
		String thumb = rs_menu.getString("thumb");
%>
<h2><%=name%>(<%=_menu_id%>)</h2>
<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
<%
	} else {
		;
	}

	if(rs_pingjia.next()) {
		System.out.println(_menu_id + " find");

		do {
			String _id = rs_pingjia.getString("id");
			String __menu_id = rs_pingjia.getString("menu_id");
			String _data = rs_pingjia.getString("data");
			String _score = rs_pingjia.getString("score");
			String _timestamp = rs_pingjia.getString("timestamp");
	%>
	<p><strong>ÆÀ¼ÛÄÚÈÝ:</strong><%=_data%></p>
	<p>·ÖÊý:<%=_score%></p>
	<p>Ê±¼ä:<%=_timestamp%></p>
	<%
		}while(rs_pingjia.next());
	} else {
		System.out.println(_menu_id + " no find");
	%>
		<h2>Ã»ÓÐÕÒµ½ÏàÓ¦µÄÆÀÂÛ</h2>;
	<%
	}
	%>
</div>
</body>
</html>