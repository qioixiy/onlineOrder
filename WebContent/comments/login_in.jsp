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
		//�����������������ĺ�̨�����û��������룺
		String _yhm = "����û���";
		String _yhmm = "����û�����";
		if (yhm.equals(_yhm) & yhmm.equals(_yhmm)) {
			session.setAttribute("login", "1");
			response.sendRedirect("ly.jsp");
		} else {
			out.println("�������");
		}
	%>
</body>
</html>
