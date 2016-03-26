<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="misc.Util"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
</head>

<body>
	<%
		String flag = request.getParameter("flag");

		if (flag != null) {
			if (misc.Util.loginCheck(session)) {
				response.sendRedirect("main/index.jsp");
			} else {
				response.sendRedirect("login/index.jsp");
			}
		} else {
			response.sendRedirect("login/index.jsp");
		}
	%>

</body>
</html>
