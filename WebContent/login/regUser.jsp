
<%@ page contentType="text/html;charset=gb2312" pageEncoding="gb2312"
	import="db.*" import="utils.*" import="java.security.MessageDigest"%>
<jsp:useBean id="userBean" class="db.UserBean" scope="request">
	<jsp:setProperty name="userBean" property="*" />
</jsp:useBean>
<jsp:useBean id="regist" class="db.UserRegister" scope="request" />
<html>
<head>
<title>用户信息注册页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>

	<%
		String user = request.getParameter("user");
		String orig_password = request.getParameter("password");

		String password = orig_password;

		final char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

		try {
			byte[] btInput = orig_password.getBytes();
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			password = new String(str);

			userBean.setUser(user);
			userBean.setPassword(password);
			System.out.println(user + ":" + password);

			try {
				regist.setUserBean(userBean);
				regist.regist();
				out.println("注册成功");
				response.sendRedirect("..");
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	%>
</body>
</html>