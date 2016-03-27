<%@page import="java.sql.*" import="java.util.*"
	import="java.security.MessageDigest"
	contentType="text/html;charset=gb2312"%>

<%
	String username = new String(request.getParameter("user"));
	String password = new String(request.getParameter("password"));
	System.out.println("username:" + username);
	System.out.println("password:" + password);
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
		redirect = "index.jsp?err=verfiy";
		System.out.println("verfiy code Error");
	}
	
	System.out.println(redirect);
	
	if (redirect.equals("")) {
		redirect = "index.jsp";
	}
	
	response.sendRedirect(redirect);
%>
