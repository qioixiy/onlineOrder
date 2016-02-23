<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
	<%
		String yhm = request.getParameter("yhm");
		String yhmm = request.getParameter("yhmm");
		//在这里你可以设置你的后台管理用户名和密码：
		String _yhm = "你的用户名";
		String _yhmm = "你的用户密码";
		if (yhm.equals(_yhm) & yhmm.equals(_yhmm)) {
			session.setAttribute("login", "1");
			response.sendRedirect("ly.jsp");
		} else {
			out.println("密码错误");
		}
	%>
</body>
</html>
