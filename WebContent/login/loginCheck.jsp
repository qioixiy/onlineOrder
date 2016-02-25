<%@page import="java.sql.*" contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*"%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	String user = new String(request.getParameter("user"));
	String password = new String(request.getParameter("password"));

	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String sql = "select * from  userinfo where user='" + user + "';";
	ResultSet rs = stmt.executeQuery(sql);

	String redirect = "index.jsp";
	if (rs.next()) {
		String _password = new String(rs.getString("password"));

		if (_password.equals(password)) {
			session.setAttribute("user", user);
			redirect = "loginSuccess.jsp";
		}
	}
	response.sendRedirect(redirect);
%>