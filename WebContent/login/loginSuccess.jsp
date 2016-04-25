<%@page import="java.util.*" contentType="text/html; charset=gb2312"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff">
	<h1>登录成功</h1>
	<%=session.getAttribute("user")%>
	<%
		// 在验证通过后跳转到main页面
		session.setAttribute("login", "true");
		session.setMaxInactiveInterval(60 * 15);
		response.sendRedirect("../main/");
	%>
</body>
</html>
