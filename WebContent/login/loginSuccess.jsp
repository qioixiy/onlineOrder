<%@page import="java.util.*" contentType="text/html; charset=gb2312"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff">
	<h1>登录成功</h1>
	<%=session.getAttribute("user")%>
	<%
		session.setAttribute("login", "true");
		session.setMaxInactiveInterval(60 * 3);
		response.sendRedirect("../main/");
	%>
</body>
</html>
