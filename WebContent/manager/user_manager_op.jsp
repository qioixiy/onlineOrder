<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();

	String type = request.getParameter("type");
	String user_id = request.getParameter("user_id");
	String user_name = request.getParameter("user_name");
	if (type == null || user_id == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	System.out.println("type:" + type + ",user_id:" + user_id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>��Ա����ҳ��</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">��Ա����ҳ��</h1>
		</div>

		<div id="main">

			<div id="content">
				<%
					Statement user_smt = con.createStatement();
					String sql = "";
					if (type.equals("del")) {
						sql = "delete from userinfo where id=" + user_id;
						user_smt.execute(sql);
					} else if (type.equals("set_as_manager")) {
						sql = "INSERT INTO `manager` ( `id` , `username` , `level`) VALUES (NULL , '" + user_name + "', '1')";
						user_smt.execute(sql);
					}
				%>
			</div>
			
			<a href="user_manager.jsp">���ع���ҳ��</a>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>