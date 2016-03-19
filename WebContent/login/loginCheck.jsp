<%@page import="java.sql.*" import="java.util.*"
	import="java.security.MessageDigest"
	contentType="text/html;charset=gb2312"%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	String username = new String(request.getParameter("user"));
	String password = new String(request.getParameter("password"));
	String redirect = "";
	
	// verfiy User
	if (misc.Util.verfiyUser(username, password)) {
		session.setAttribute("username", username);
		redirect = "loginSuccess.jsp";
	}

	// verfiy code
	String rand = (String) session.getAttribute("rand");
	String input = request.getParameter("rand");
	System.out.println(rand + ":" + input);
	if (!rand.equals(input)) {
		redirect = "Error.jsp";
		System.out.println("verfiy code Error");
	}
	System.out.println(redirect);
	if (redirect.equals("")) {
		redirect = "index.jsp";
	}
	response.sendRedirect(redirect);
%>