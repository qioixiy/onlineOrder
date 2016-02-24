<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>删除留言</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="jdbc_conn" scope="page" class="comments.jdbc" />
<body>
	<%
		String login = (String) session.getAttribute("login");
		if (login == null) {
			out.println("您不是管理员！不能登陆删除");
		} else {
			Connection con = jdbc_conn.getConn();
			Statement stmt = con.createStatement();
			String id = request.getParameter("id");
			String sql = "delete from liuyan where id=" + id;
			stmt.executeUpdate(sql);
			try {
				stmt.close();
				con.close();
			} catch (Exception ex) {
			}
			response.sendRedirect("ly.jsp");
		}
	%>
</body>
</html>
