<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="misc.Util"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
</head>

<body>
	<%
		String flag = request.getParameter("flag");

		// 根据url的flag参数进行跳转
		if (flag != null) {
			if (misc.Util.loginCheck(session)) {
				response.sendRedirect("main_new/index.jsp");
			} else {
				response.sendRedirect("login/index.jsp");
			}
		} else {
			response.sendRedirect("login/index.jsp");
		}
	%>

</body>
</html>
