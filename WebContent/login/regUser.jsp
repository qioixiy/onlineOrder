<%@ page contentType="text/html;charset=gb2312" pageEncoding="gb2312"
	import="onlineOrder.*"%>
<jsp:useBean id="userBean" class="onlineOrder.UserBean" scope="request">
	<jsp:setProperty name="userBean" property="*" />
</jsp:useBean>
<jsp:useBean id="regist" class="onlineOrder.UserRegister"
	scope="request" />
<html>
<head>
<title>用户信息注册页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>

	<%
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		userBean.setUser(user);
		userBean.setPassword(password);
		System.out.println(user + ":" + password);
	%>
	<%
		try {
			regist.setUserBean(userBean);
			regist.regist();
			out.println("注册成功");
			response.sendRedirect("..");
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
	<br>
	<a href="index.jsp">返回</a>
</body>
</html>