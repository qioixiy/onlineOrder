<%@page import="java.util.*" contentType="text/html; charset=gb2312"%>

<html>
<head>
<title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	login sucess
</title>
</head>
<body bgcolor="#ffffff">
	<h1>登录成功</h1>
	<%=session.getAttribute("user")%>
	<%
		session.setAttribute("login", "true");
		response.sendRedirect("../comments/");
	%>
</body>
</html>
