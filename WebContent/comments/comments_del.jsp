<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>ɾ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<body>
	<%
		String login = (String) session.getAttribute("login");
		if (login == null) {
			out.println("�����ǹ���Ա������ɾ������");
		} else {
			Connection con = jdbc_conn.getConn();
			Statement stmt = con.createStatement();
			String id = request.getParameter("id");
			String sql = "delete from comments where id=" + id;
			stmt.executeUpdate(sql);
			try {
				stmt.close();
				con.close();
			} catch (Exception ex) {
			}
			response.sendRedirect("comments.jsp");
		}
	%>
</body>
</html>
